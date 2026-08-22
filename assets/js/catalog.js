'use strict';

const catalogSearch = document.querySelector('[data-catalog-search]');
const catalogFilter = document.querySelector('[data-catalog-filter]');
const catalogCards = [...document.querySelectorAll('[data-catalog-card]')];
const catalogEmpty = document.querySelector('[data-catalog-no-results]');

function filterCatalog() {
  const query = (catalogSearch?.value || '').trim().toLowerCase();
  const section = catalogFilter?.value || 'all';
  let visible = 0;

  catalogCards.forEach((card) => {
    const matchesQuery = !query || card.dataset.search.includes(query);
    const matchesSection = section === 'all' || card.dataset.section === section;
    const isVisible = matchesQuery && matchesSection;
    card.hidden = !isVisible;
    if (isVisible) visible += 1;
  });

  if (catalogEmpty) catalogEmpty.hidden = visible !== 0;
}

catalogSearch?.addEventListener('input', filterCatalog);
catalogFilter?.addEventListener('change', filterCatalog);
