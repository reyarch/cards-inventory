$ErrorActionPreference = 'Stop'

$products = @(
  @{ Name = 'Blazing Fist [GD07]'; Code = 'GD07'; Category = 'BOOSTER PACK'; Url = 'gd07.html' }
  @{ Name = 'Stardust Trails [GD06]'; Code = 'GD06'; Category = 'BOOSTER PACK'; Url = 'gd06.html' }
  @{ Name = 'Aquatic Assault [ST11]'; Code = 'ST11'; Category = 'STARTER DECK'; Url = 'st11.html' }
  @{ Name = 'Heavy Dominion [ST14]'; Code = 'ST14'; Category = 'STARTER DECK'; Url = 'st14.html' }
  @{ Name = 'Silent Barrage [ST13]'; Code = 'ST13'; Category = 'STARTER DECK'; Url = 'st13.html' }
  @{ Name = 'Raging Onslaught [ST12]'; Code = 'ST12'; Category = 'STARTER DECK'; Url = 'st12.html' }
  @{ Name = 'GUNDAM CARD GAME 1st Anniversary Set'; Code = 'PB03'; Category = 'PREMIUM BANDAI'; Url = 'pb03.html' }
  @{ Name = 'Freedom Ascension [GD05]'; Code = 'GD05'; Category = 'BOOSTER PACK'; Url = 'gd05.html' }
  @{ Name = 'Deck Build Box Freedom Ascension [SC01]'; Code = 'SC01'; Category = 'ACCESSORIES'; Url = 'deck-build-box.html' }
  @{ Name = 'Official Card Case Set 02'; Code = 'CARD-CASE-02'; Category = 'ACCESSORIES'; Url = 'deck-case02.html' }
  @{ Name = 'Official Card Sleeves 02'; Code = 'SLEEVES-02'; Category = 'ACCESSORIES'; Url = 'sleeve03.html' }
  @{ Name = 'Generation Pulse [ST10]'; Code = 'ST10'; Category = 'STARTER DECK'; Url = 'st10.html' }
  @{ Name = 'Eternal Nexus [EB01]'; Code = 'EB01'; Category = 'BOOSTER PACK'; Url = 'eb01.html' }
  @{ Name = 'Official Matte Sleeves EX02 [EVX06]'; Code = 'EVX06'; Category = 'ACCESSORIES'; Url = 'evx06.html' }
  @{ Name = 'Storage Box & Resource Card Set [EVX07]'; Code = 'EVX07'; Category = 'ACCESSORIES'; Url = 'evx07.html' }
  @{ Name = 'Phantom Aria [GD04]'; Code = 'GD04'; Category = 'BOOSTER PACK'; Url = 'gd04.html' }
  @{ Name = 'Destiny Ignition [ST09]'; Code = 'ST09'; Category = 'STARTER DECK'; Url = 'st09.html' }
  @{ Name = 'Premium Card Collection GUNDAM ASSEMBLE Set -Mobile Suit Gundam GQuuuuuuX- [PC02A]'; Code = 'PC02A'; Category = 'OTHER'; Url = 'pc02a.html' }
  @{ Name = 'Premium Card Collection GUNDAM ASSEMBLE Set -Mobile Suit Gundam IRON-BLOODED ORPHANS- [PC01A]'; Code = 'PC01A'; Category = 'OTHER'; Url = 'pc01a.html' }
  @{ Name = 'Steel Requiem [GD03]'; Code = 'GD03'; Category = 'BOOSTER PACK'; Url = 'gd03.html' }
  @{ Name = 'PREMIUM GOODS SET -Mobile Suit Gundam Wing- [PB01]'; Code = 'PB01'; Category = 'PREMIUM BANDAI'; Url = 'pb01.html' }
  @{ Name = 'Celestial Drive [ST07]'; Code = 'ST07'; Category = 'STARTER DECK'; Url = 'st07.html' }
  @{ Name = 'Flash of Radiance [ST08]'; Code = 'ST08'; Category = 'STARTER DECK'; Url = 'st08.html' }
  @{ Name = 'GUNDAM CARD GAME Premium Card Collection 01 [EVX05]'; Code = 'EVX05'; Category = 'OTHER'; Url = 'evx05.html' }
  @{ Name = 'Premium Accessory Set -Mobile Suit Gundam IRON-BLOODED ORPHANS- [PB02]'; Code = 'PB02'; Category = 'PREMIUM BANDAI'; Url = 'pb02.html' }
  @{ Name = 'Dual Impact [GD02]'; Code = 'GD02'; Category = 'BOOSTER PACK'; Url = 'gd02.html' }
  @{ Name = 'Clan Unity [ST06]'; Code = 'ST06'; Category = 'STARTER DECK'; Url = 'st06.html' }
  @{ Name = 'Official Matte Sleeves EX'; Code = 'SLEEVES-EX'; Category = 'ACCESSORIES'; Url = 'sleeve02.html' }
  @{ Name = 'Iron Bloom [ST05]'; Code = 'ST05'; Category = 'STARTER DECK'; Url = 'st05.html' }
  @{ Name = 'Official Playmat and Card Set Suletta & Miorine [EVX02]'; Code = 'EVX02'; Category = 'ACCESSORIES'; Url = 'ev02.html' }
  @{ Name = 'Official Card Sleeves EX [EVX03]'; Code = 'EVX03'; Category = 'ACCESSORIES'; Url = 'ev03.html' }
  @{ Name = 'OFFICIAL GOODS SET 01 FIRST COMBAT'; Code = 'GOODSSET01'; Category = 'ACCESSORIES'; Url = 'goodsset01.html' }
  @{ Name = 'Newtype Rising [GD01]'; Code = 'GD01'; Category = 'BOOSTER PACK'; Url = 'gd01.html' }
  @{ Name = 'Official Damage Counter Dice 01'; Code = 'DICE01'; Category = 'ACCESSORIES'; Url = 'dice01.html' }
  @{ Name = 'Official Card Sleeves 01'; Code = 'SLEEVES-01'; Category = 'ACCESSORIES'; Url = 'sleeve01.html' }
  @{ Name = 'Official Card Case Set 01'; Code = 'CARD-CASE-01'; Category = 'ACCESSORIES'; Url = 'deck-case01.html' }
  @{ Name = "Heroic Beginnings [ST01]"; Code = 'ST01'; Category = 'STARTER DECK'; Url = 'st01.html' }
  @{ Name = "Zeon's Rush [ST03]"; Code = 'ST03'; Category = 'STARTER DECK'; Url = 'st03.html' }
  @{ Name = 'SEED Strike [ST04]'; Code = 'ST04'; Category = 'STARTER DECK'; Url = 'st04.html' }
  @{ Name = 'Wings of Advance [ST02]'; Code = 'ST02'; Category = 'STARTER DECK'; Url = 'st02.html' }
  @{ Name = 'GUNDAM CARD GAME LIMITED BOX Ver.β'; Code = 'LIMITEDBOX-BETA'; Category = 'ACCESSORIES'; Url = 'limitedbox-beta.html' }
  @{ Name = 'Official Playmat & Card Set Athrun & Cagalli [EVX11]'; Code = 'EVX11'; Category = 'ACCESSORIES'; Url = 'evx11.html' }
  @{ Name = 'PREMIUM CARD COLLECTION 02 [EVX13]'; Code = 'EVX13'; Category = 'OTHER'; Url = 'evx13.html' }
  @{ Name = 'Official Matte Sleeves 03 [EVX12]'; Code = 'EVX12'; Category = 'ACCESSORIES'; Url = 'evx12.html' }
  @{ Name = 'Official Playmat & Card Set -Mobile Suit Gundam 00-'; Code = 'PLAYMAT01'; Category = 'ACCESSORIES'; Url = 'playmat01.html' }
)

$baseUrl = 'https://www.gundam-gcg.com/asia-en/products/'
$outputRoot = Join-Path (Get-Location) 'gcg_products'
New-Item -ItemType Directory -Force -Path $outputRoot | Out-Null

function ConvertTo-Slug($value) {
  $slug = $value.ToLowerInvariant() -replace '[^a-z0-9]+', '_'
  return $slug.Trim('_')
}

function Strip-Html($value) {
  return (($value -replace '<br\s*/?>', ' ' -replace '<[^>]+>', ' ' -replace '&amp;', '&' -replace '&nbsp;', ' ' -replace '\s+', ' ').Trim())
}

$index = 0
foreach ($product in $products) {
  $index++
  $pageUrl = $baseUrl + $product.Url
  $html = (Invoke-WebRequest -UseBasicParsing -Uri $pageUrl).Content
  $safeCode = ConvertTo-Slug $product.Code
  $folderName = $safeCode
  $assetBaseName = $safeCode
  $folder = Join-Path $outputRoot $folderName
  New-Item -ItemType Directory -Force -Path $folder | Out-Null

  $titleMatch = [regex]::Match($html, '<h2[^>]*>(.*?)</h2>', 'Singleline')
  $sourceName = if ($titleMatch.Success) { Strip-Html $titleMatch.Groups[1].Value } else { $product.Name }
  $paragraphs = [regex]::Matches($html, '<p[^>]*>(.*?)</p>', 'Singleline') | ForEach-Object { Strip-Html $_.Groups[1].Value } | Where-Object { $_ -and $_ -notmatch '^Release Date:' }
  $description = ($paragraphs | Select-Object -First 3) -join ' '
  if (-not $description) { $description = "Official $($product.Category.ToLowerInvariant()) product listed in the Gundam Card Game catalog." }

  $imageMatches = [regex]::Matches($html, '<img[^>]+src=["'']([^"'']+)["''][^>]*>', 'Singleline')
  $imageUrl = $null
  foreach ($match in $imageMatches) {
    $candidate = [uri]::new([uri]$pageUrl, $match.Groups[1].Value).AbsoluteUri
    if ($candidate -match 'thumbnail' -or $candidate -match [regex]::Escape($product.Code)) { $imageUrl = $candidate; break }
  }
  if (-not $imageUrl -and $imageMatches.Count -gt 0) { $imageUrl = [uri]::new([uri]$pageUrl, $imageMatches[0].Groups[1].Value).AbsoluteUri }

  $jpgPath = Join-Path $folder "$assetBaseName.jpg"
  if ($imageUrl) {
    $tempPath = Join-Path $env:TEMP "$folderName-source"
    try {
      Invoke-WebRequest -UseBasicParsing -Uri $imageUrl -OutFile $tempPath
      Add-Type -AssemblyName System.Drawing
      $sourceImage = [System.Drawing.Image]::FromFile($tempPath)
      $sourceImage.Save($jpgPath, [System.Drawing.Imaging.ImageFormat]::Jpeg)
      $sourceImage.Dispose()
    } catch {
      if (Test-Path $tempPath) { Copy-Item $tempPath $jpgPath -Force }
    }
    if (Test-Path $tempPath) { Remove-Item $tempPath -Force }
  }

  $metadata = [ordered]@{
    product_name = $sourceName
    product_code = $product.Code
    category = $product.Category
    price = 'PHP 9,999.99'
    sections = @()
    description = $description
    source_url = $pageUrl
    image_source_url = $imageUrl
  }
  $metadata | ConvertTo-Json -Depth 4 | Set-Content -Encoding UTF8 (Join-Path $folder "$assetBaseName`_metadata.json")
}

Write-Host "Created $index products in $outputRoot"