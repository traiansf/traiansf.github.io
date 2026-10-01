// AMSS slide decks: the one-slide-at-a-time view for theme/deck.html.
// theme/deck.css lays the slides out as a flowing column of cards; this script
// adds the bar, the outline and the paged view (html.paged), in which the
// current slide fills the window and its text shrinks until it fits.
(function () {
  'use strict';

  var root = document.documentElement;
  var slides = Array.prototype.slice.call(document.querySelectorAll('.slide'));
  if (!slides.length) return;

  var text = /^ro\b/i.test(root.lang || '') ? {
    bar: 'Navigare în prezentare',
    home: 'Pagina cursului',
    prev: 'Diapozitivul anterior',
    next: 'Diapozitivul următor',
    toc: 'Cuprins',
    position: function (n, total) { return 'Diapozitivul ' + n + ' din ' + total; },
    all: 'Toate diapozitivele',
    one: 'Câte un diapozitiv',
    keys: 'Navigare: săgețile ← și →, Page Up și Page Down sau Spațiu.',
    pdf: 'PDF'
  } : {
    bar: 'Slide navigation',
    home: 'Course page',
    prev: 'Previous slide',
    next: 'Next slide',
    toc: 'Contents',
    position: function (n, total) { return 'Slide ' + n + ' of ' + total; },
    all: 'All slides',
    one: 'One slide at a time',
    keys: 'Navigation: the ← and → arrows, Page Up and Page Down, or Space.',
    pdf: 'PDF'
  };

  var STORE = 'amss-deck-view';
  var MIN_FIT = 0.72;
  var index = 0;
  var paged = root.classList.contains('paged');

  function make(tag, className, content) {
    var node = document.createElement(tag);
    if (className) node.className = className;
    if (content) node.textContent = content;
    return node;
  }

  function titleOf(slide, i) {
    var heading = slide.querySelector('.headline') || slide.querySelector('h1');
    var title = heading && heading.textContent.replace(/\s+/g, ' ').trim();
    return title || text.position(i + 1, slides.length);
  }

  // Everything after the title goes into one block, so the paged view can
  // place it between the title and the bottom of the window.
  slides.forEach(function (slide) {
    if (slide.classList.contains('titlepage')) return;
    var heading = slide.firstElementChild;
    if (!heading || heading.tagName !== 'H1') heading = null;
    var body = make('div', 'slide-body');
    Array.prototype.slice.call(slide.childNodes).forEach(function (node) {
      if (node !== heading) body.appendChild(node);
    });
    slide.appendChild(body);
  });

  // ---------- bar ----------

  var bar = make('nav', 'deck-bar');
  bar.setAttribute('aria-label', text.bar);

  var data = document.body.dataset;
  if (data.home) {
    var home = make('a', 'deck-home', data.course || text.home);
    home.href = data.home;
    home.title = text.home;
    bar.appendChild(home);
  }
  bar.appendChild(make('span', 'deck-gap'));

  var prev = make('button', 'deck-step deck-paged-only', '‹');
  prev.type = 'button';
  prev.setAttribute('aria-label', text.prev);
  prev.title = text.prev + ' (←)';
  var count = make('button', 'deck-count');
  count.type = 'button';
  count.title = text.toc;
  var next = make('button', 'deck-step deck-paged-only', '›');
  next.type = 'button';
  next.setAttribute('aria-label', text.next);
  next.title = text.next + ' (→)';
  bar.appendChild(prev);
  bar.appendChild(count);
  bar.appendChild(next);
  bar.appendChild(make('span', 'deck-gap'));

  var view = make('button', 'deck-view');
  view.type = 'button';
  bar.appendChild(view);
  if (data.pdf) {
    var pdf = make('a', 'deck-pdf', text.pdf);
    pdf.href = data.pdf;
    bar.appendChild(pdf);
  }

  var status = make('span', 'deck-sr');
  status.setAttribute('aria-live', 'polite');
  bar.appendChild(status);
  document.body.appendChild(bar);

  // ---------- outline ----------

  var toc = make('dialog', 'deck-toc');
  var tocLinks = [];
  if (typeof toc.showModal === 'function') {
    var tocBody = make('div', 'deck-toc-body');
    var list = make('ol');
    tocBody.appendChild(make('h2', '', text.toc));
    slides.forEach(function (slide, i) {
      var link = make('a', '', titleOf(slide, i));
      link.href = '#' + (i + 1);
      link.addEventListener('click', function (event) {
        event.preventDefault();
        toc.close();
        go(i);
      });
      tocLinks.push(link);
      list.appendChild(make('li')).appendChild(link);
    });
    tocBody.appendChild(list);
    tocBody.appendChild(make('p', 'deck-keys deck-paged-only', text.keys));
    toc.appendChild(tocBody);
    toc.addEventListener('click', function (event) {
      if (event.target === toc) toc.close();
    });
    document.body.appendChild(toc);
    count.addEventListener('click', function () {
      tocLinks.forEach(function (link, i) {
        if (i === index) link.setAttribute('aria-current', 'true');
        else link.removeAttribute('aria-current');
      });
      toc.showModal();
      tocLinks[index].focus();
    });
  } else {
    count.disabled = true;
  }

  // ---------- paged view ----------

  function fit() {
    var slide = slides[index];
    slide.style.removeProperty('--fit');
    if (!paged) return;
    var room = window.innerHeight - bar.offsetHeight + 1;
    for (var scale = 1; slide.offsetHeight > room && scale > MIN_FIT; ) {
      scale = Math.max(MIN_FIT, scale - 0.04);
      slide.style.setProperty('--fit', scale.toFixed(2));
    }
  }

  function show(i) {
    slides[index].classList.remove('current');
    slides[index].style.removeProperty('--fit');
    index = Math.max(0, Math.min(slides.length - 1, i));
    slides[index].classList.add('current');

    var position = text.position(index + 1, slides.length);
    count.textContent = paged ? (index + 1) + ' / ' + slides.length : text.toc;
    count.setAttribute('aria-label', paged ? text.toc + ' (' + position + ')' : text.toc);
    prev.disabled = index === 0;
    next.disabled = index === slides.length - 1;
    bar.style.setProperty('--progress',
      (paged && slides.length > 1 ? 100 * index / (slides.length - 1) : 0) + '%');

    if (paged) {
      fit();
      window.scrollTo(0, 0);
      status.textContent = position + ': ' + titleOf(slides[index], index);
      try {
        history.replaceState(null, '', index ? '#' + (index + 1) : location.pathname + location.search);
      } catch (error) { /* sandboxed document */ }
    }
  }

  function go(i) {
    show(i);
    if (!paged) slides[index].scrollIntoView();
  }

  // With soft steps (Space, Page Up/Down), a slide taller than the window is
  // scrolled through before the deck moves on.
  function step(direction, soft) {
    if (soft) {
      var limit = root.scrollHeight - window.innerHeight;
      var jump = 0.8 * window.innerHeight;
      if (direction > 0 && window.scrollY < limit - 4) return window.scrollBy(0, jump);
      if (direction < 0 && window.scrollY > 4) return window.scrollBy(0, -jump);
    }
    show(index + direction);
  }

  function firstVisible() {
    for (var i = 0; i < slides.length; i++) {
      if (slides[i].getBoundingClientRect().bottom > 96) return i;
    }
    return slides.length - 1;
  }

  function setPaged(on) {
    var at = paged ? index : firstVisible();
    paged = on;
    root.classList.toggle('paged', on);
    view.textContent = on ? text.all : text.one;
    go(at);
  }

  function fromHash() {
    var hash;
    try { hash = decodeURIComponent(location.hash.slice(1)); } catch (error) { return -1; }
    var number = /^\(?(\d+)\)?$/.exec(hash);  // "#5", or "#(5)" from the earlier Slidy decks
    if (number) return Math.min(slides.length, Math.max(1, Number(number[1]))) - 1;
    var target = hash && document.getElementById(hash);
    var slide = target && target.closest('.slide');
    return slide ? slides.indexOf(slide) : -1;
  }

  prev.addEventListener('click', function () { step(-1); });
  next.addEventListener('click', function () { step(1); });
  view.addEventListener('click', function () {
    setPaged(!paged);
    try { localStorage.setItem(STORE, paged ? 'paged' : 'flow'); } catch (error) { /* private mode */ }
  });

  document.addEventListener('keydown', function (event) {
    if (!paged || toc.open || event.defaultPrevented) return;
    if (event.altKey || event.ctrlKey || event.metaKey) return;
    var onControl = event.target.closest && event.target.closest('a, button, input, select, textarea, summary');
    var code = event.target.closest && event.target.closest('pre, div.sourceCode');
    if (code && code.scrollWidth > code.clientWidth && /^Arrow/.test(event.key)) return;
    switch (event.key) {
      case 'ArrowRight': step(1); break;
      case 'ArrowLeft': step(-1); break;
      case 'PageDown': step(1, true); break;
      case 'PageUp': step(-1, true); break;
      case ' ': if (onControl) return; step(event.shiftKey ? -1 : 1, true); break;
      case 'Home': show(0); break;
      case 'End': show(slides.length - 1); break;
      default: return;
    }
    event.preventDefault();
  });

  var touch = null;
  document.addEventListener('touchstart', function (event) {
    var inScroller = event.target.closest && event.target.closest('pre, div.sourceCode, .deck-bar, .deck-toc');
    touch = event.touches.length === 1 && !inScroller ? event.touches[0] : null;
  }, { passive: true });
  document.addEventListener('touchend', function (event) {
    if (!paged || !touch) return;
    var dx = event.changedTouches[0].clientX - touch.clientX;
    var dy = event.changedTouches[0].clientY - touch.clientY;
    touch = null;
    if (Math.abs(dx) > 60 && Math.abs(dx) > 2 * Math.abs(dy)) step(dx < 0 ? 1 : -1);
  }, { passive: true });

  var pending = 0;
  window.addEventListener('resize', function () {
    cancelAnimationFrame(pending);
    pending = requestAnimationFrame(fit);
  });
  window.addEventListener('load', fit);
  window.addEventListener('hashchange', function () {
    var i = fromHash();
    if (i >= 0) go(i);
  });

  view.textContent = paged ? text.all : text.one;
  var start = fromHash();
  show(Math.max(0, start));
  if (!paged && start > 0) slides[index].scrollIntoView();
})();
