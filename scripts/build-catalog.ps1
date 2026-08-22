$ErrorActionPreference = 'Stop'

$root = Split-Path -Parent $PSScriptRoot
$productsRoot = Join-Path $root 'assets\gcg_products'
$indexPath = Join-Path $root 'index.html'
$sectionOrder = @('latest-products', 'upcoming-products', 'booster-decks', 'individual-cards', 'unassigned')
$sectionTitles = @{
  'latest-products' = 'Latest Products'
  'upcoming-products' = 'Upcoming Products'
  'booster-decks' = 'Booster Boxes / Decks'
  'individual-cards' = 'Individual Cards'
  'unassigned' = 'Unassigned Inventory'
}
$defaultSections = @{}
1..9 | ForEach-Object { $defaultSections[('ST{0:D2}' -f $_)] = 'latest-products' }
$defaultSections['SC01'] = 'booster-decks'

function Escape-Html([string]$value) {
  if ($null -eq $value) { return '' }
  return [System.Net.WebUtility]::HtmlEncode($value)
}

$products = @()
Get-ChildItem $productsRoot -Directory | ForEach-Object {
  $metadataFile = Get-ChildItem $_.FullName -Filter '*_metadata.json' | Select-Object -First 1
  if (-not $metadataFile) { return }
  $metadata = Get-Content $metadataFile.FullName -Raw | ConvertFrom-Json
  $sections = @($metadata.sections | Where-Object { $_ })
  $code = ([string]$metadata.product_code).ToUpperInvariant()
  if ($sections.Count -eq 0 -and $defaultSections.ContainsKey($code)) {
    $sections = @($defaultSections[$code])
    $metadata.sections = $sections
    $metadata | ConvertTo-Json -Depth 5 | Set-Content -Encoding UTF8 $metadataFile.FullName
  }
  $imageFile = Get-ChildItem $_.FullName -Filter '*.jpg' | Select-Object -First 1
  $products += [pscustomobject]@{
    Name = [string]$metadata.product_name
    Code = $code
    Category = [string]$metadata.category
    Description = [string]$metadata.description
    Price = $metadata.price_php
    Sections = $sections
    Folder = $_.Name
    Image = if ($imageFile) { $imageFile.Name } else { $null }
    Source = [string]$metadata.source_url
  }
}
$products = $products | Sort-Object Name

function Render-Card($product, $section) {
  $search = Escape-Html (($product.Name + ' ' + $product.Code + ' ' + $product.Category + ' ' + $product.Description).ToLowerInvariant())
  $image = if ($product.Image) { "./assets/gcg_products/$($product.Folder)/$($product.Image)" } else { '' }
  $price = if ($null -ne $product.Price -and "$($product.Price)" -ne '') { "PHP $($product.Price)" } else { 'Price pending' }
  $link = if ($product.Source) { Escape-Html $product.Source } else { '#' }
  $imageMarkup = if ($image) { '<img src="' + (Escape-Html $image) + '" alt="' + (Escape-Html $product.Name) + '" loading="lazy">' } else { '<span>No image</span>' }
  return @"
          <article class="catalog-card" data-catalog-card data-section="$section" data-search="$search">
            <div class="catalog-card-image">$imageMarkup</div>
            <div class="catalog-card-body">
              <p class="catalog-card-code">$(Escape-Html $product.Category) / $(Escape-Html $product.Code)</p>
              <h3>$(Escape-Html $product.Name)</h3>
              <p class="catalog-card-description">$(Escape-Html $product.Description)</p>
              <div class="catalog-card-footer"><strong class="catalog-price">$(Escape-Html $price)</strong><a class="catalog-link" href="$link" target="_blank" rel="noreferrer">Source <ion-icon name="open-outline"></ion-icon></a></div>
            </div>
          </article>
"@
}

$sectionsHtml = ''
foreach ($section in $sectionOrder) {
  $sectionProducts = if ($section -eq 'unassigned') { @($products | Where-Object { @($_.Sections).Count -eq 0 }) } else { @($products | Where-Object { $section -in @($_.Sections) }) }
  if ($sectionProducts.Count -eq 0) { continue }
  $cards = ($sectionProducts | ForEach-Object { Render-Card $_ $section }) -join ''
  $sectionsHtml += @"
      <section class="catalog-section" id="$section">
        <div class="catalog-section-heading"><div><p class="inventory-kicker">$('{0:D2}' -f ($sectionOrder.IndexOf($section) + 1)) / CATALOG</p><h2>$($sectionTitles[$section])</h2></div><p class="catalog-section-count">$($sectionProducts.Count) item$(if ($sectionProducts.Count -ne 1) { 's' })</p></div>
        <div class="catalog-grid">$cards</div>
      </section>
"@
}

$generated = @"
      <div class="catalog-shell">
        <header class="catalog-masthead">
          <div><p class="inventory-kicker">GUNDAM CARD GAME / ARCHIVE</p><h1>Every product.<br><span>One archive.</span></h1><p class="catalog-intro">A complete product index built from the collection metadata. Browse sealed releases, accessories, and every unassigned item in one focused workspace.</p></div>
          <div class="catalog-stat"><strong>$($products.Count)</strong><span>cataloged products</span></div>
        </header>
        <div class="catalog-toolbar"><input class="catalog-search" type="search" placeholder="Search products, codes, or categories" aria-label="Search products" data-catalog-search><select class="catalog-select" aria-label="Filter by section" data-catalog-filter><option value="all">All sections</option><option value="latest-products">Latest Products</option><option value="upcoming-products">Upcoming Products</option><option value="booster-decks">Booster Boxes / Decks</option><option value="individual-cards">Individual Cards</option><option value="unassigned">Unassigned Inventory</option></select></div>
$sectionsHtml
        <p class="catalog-no-results" data-catalog-no-results hidden>No products match this search.</p>
      </div>
"@

$html = Get-Content $indexPath -Raw
$pattern = '(?s)<!-- CATALOG_START -->.*?<!-- CATALOG_END -->'
$replacement = "<!-- CATALOG_START -->`r`n$generated        <!-- CATALOG_END -->"
$updated = [regex]::Replace($html, $pattern, $replacement, 1)
if ($updated -eq $html) { throw 'Catalog markers were not found in index.html.' }
Set-Content -Path $indexPath -Value $updated -Encoding UTF8
Write-Host "Built $($products.Count) products into index.html"
