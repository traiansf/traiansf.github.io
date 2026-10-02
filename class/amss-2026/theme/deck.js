// AMSS slide decks: the one-slide-at-a-time view for theme/deck.html.
// theme/deck.css lays the slides out as a flowing column of cards; this script
// adds the bar, the outline and the paged view (html.paged), in which the
// current slide fills the window and its text shrinks until it fits.
(function () {
  'use strict';

  var root = document.documentElement;
  try {
    start();
  } catch (error) {
    // Without this script every slide is still readable in the flowing view.
    root.classList.remove('paged');
    throw error;
  }

  function start() {
    var slides = Array.prototype.slice.call(document.querySelectorAll('.slide'));
    if (!slides.length) return;

    var text = /^ro\b/i.test(root.lang || '') ? {
      bar: 'Navigare în prezentare',
      home: 'Pagina cursului',
      prev: 'Diapozitivul anterior',
      next: 'Diapozitivul următor',
      toc: 'Cuprins',
      close: 'Închide',
      position: function (n, total) { return 'Diapozitivul ' + n + ' din ' + total; },
      all: 'Toate diapozitivele',
      allShort: 'Toate',
      one: 'Câte un diapozitiv',
      oneShort: 'Câte unul',
      keys: 'Navigare: săgețile ← și →, Page Up și Page Down sau Spațiu.',
      pdf: 'PDF'
    } : {
      bar: 'Slide navigation',
      home: 'Course page',
      prev: 'Previous slide',
      next: 'Next slide',
      toc: 'Contents',
      close: 'Close',
      position: function (n, total) { return 'Slide ' + n + ' of ' + total; },
      all: 'All slides',
      allShort: 'All',
      one: 'One slide at a time',
      oneShort: 'One by one',
      keys: 'Navigation: the ← and → arrows, Page Up and Page Down, or Space.',
      pdf: 'PDF'
    };

    var STORE = 'amss-deck-view';
    var MIN_FIT = 0.72;
    var index = 0;
    var paged = root.classList.contains('paged');
    var waiting = [];   // parts of the current slide that a pause still hides

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

    // In the outline, a range such as (16–26) stays on one line, as on the
    // slides: word joiners around the dash of a short word.
    function unbroken(title) {
      return title.replace(/\S+/g, function (word) {
        return word.length > 24 ? word : word.replace(/([^–])–(?=[^–])/g, '$1\u2060–\u2060');
      });
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
      // "AMSS 2026/2027": a phone shows only the first word (see deck.css).
      var label = data.course || text.home;
      var cut = label.indexOf(' ');
      var home = make('a', 'deck-home', cut < 0 ? label : label.slice(0, cut));
      if (cut >= 0) home.appendChild(make('span', 'deck-more', label.slice(cut)));
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
    // The switch names the other view; a phone shows the short form (deck.css).
    function labelView() {
      view.textContent = '';
      view.title = paged ? text.all : text.one;
      view.appendChild(make('span', 'deck-long', paged ? text.all : text.one));
      view.appendChild(make('span', 'deck-short', paged ? text.allShort : text.oneShort));
    }
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
      var tocHead = make('div', 'deck-toc-head');
      var tocTitle = make('h2', '', text.toc);
      tocTitle.id = 'deck-toc-title';
      toc.setAttribute('aria-labelledby', tocTitle.id);
      var close = make('button', 'deck-close', '×');
      close.type = 'button';
      close.setAttribute('aria-label', text.close);
      close.title = text.close;
      close.addEventListener('click', function () { toc.close(); });
      tocHead.appendChild(tocTitle);
      tocHead.appendChild(close);
      tocBody.appendChild(tocHead);
      var list = make('ol');
      slides.forEach(function (slide, i) {
        var link = make('a', '', unbroken(titleOf(slide, i)));
        link.href = '#' + (i + 1);
        link.addEventListener('click', function (event) {
          event.preventDefault();
          toc.close();
          go(i);
          // Closing the dialog returns the focus to the counter, where Space
          // would open the outline again; put it on the chosen slide instead.
          slides[index].setAttribute('tabindex', '-1');
          slides[index].focus({ preventScroll: true });
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
      var byPointer = false;   // the outline was opened with a click or a tap
      toc.addEventListener('close', function () {
        // Closing returns the focus to the counter, where Space would open
        // the outline again; after a pointer click the counter gives the
        // focus up, like the other buttons in the bar.
        if (byPointer && document.activeElement === count) count.blur();
      });
      count.addEventListener('click', function (event) {
        byPointer = event.detail > 0;
        var here = paged ? index : firstVisible();
        tocLinks.forEach(function (link, i) {
          if (i === here) link.setAttribute('aria-current', 'true');
          else link.removeAttribute('aria-current');
        });
        toc.showModal();
        tocLinks[here].focus();
        tocLinks[here].scrollIntoView({ block: 'nearest' });
      });
    } else {
      count.disabled = true;
    }

    // ---------- paged view ----------

    // What waits for a step when a slide is reached with "next", as in the
    // PDF: everything after a pause (". . .") and the items of an incremental
    // list, except a first item with no pause before it. theme/amss.lua
    // leaves a .deck-pause marker where the source has a pause. Returns the
    // steps in order, each a list of elements shown together.
    function stepsOf(slide) {
      var body = slide.querySelector('.slide-body') || slide;
      var parts = [];
      var states = [];   // the state in which parts[i] appears; 1 is the arrival
      var state = 1;
      function claim(el, at) {
        if (el.classList.contains('deck-pause')) return;   // nothing to show: no step of its own
        var i = parts.indexOf(el);
        if (i < 0) { parts.push(el); states.push(at); }
        else states[i] = Math.max(states[i], at);   // the last pause before it decides
      }
      var marks = slide.querySelectorAll(
        '.deck-pause, .incremental > li, .incremental > dt, .incremental > dd');
      Array.prototype.forEach.call(marks, function (el) {
        if (el.classList.contains('deck-pause')) {
          state++;
          for (var node = el; node && node !== body; node = node.parentNode) {
            for (var later = node.nextElementSibling; later; later = later.nextElementSibling) claim(later, state);
          }
        } else if (el.tagName === 'DD') {
          var term = el.previousElementSibling;   // a definition appears with its term
          while (term && term.tagName !== 'DT') term = term.previousElementSibling;
          claim(el, term ? states[parts.indexOf(term)] : state);
        } else {
          claim(el, state++);
        }
      });
      var steps = [];
      parts.forEach(function (el, i) {
        if (states[i] > 1) (steps[states[i]] = steps[states[i]] || []).push(el);
      });
      return steps.filter(Boolean);   // in order, without the states nothing appears in
    }

    function reveal(group) {
      group.forEach(function (el) { el.classList.remove('deck-wait'); });
    }

    function revealAll() {
      waiting.forEach(reveal);
      waiting = [];
    }

    // aria-disabled rather than disabled: a disabled button that holds the
    // focus can swallow the next key press.
    function updateSteps() {
      prev.setAttribute('aria-disabled', index === 0 ? 'true' : 'false');
      next.setAttribute('aria-disabled', index === slides.length - 1 && !waiting.length ? 'true' : 'false');
    }

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

    // stepwise: arriving by "next", so pauses on the slide are honoured.
    function show(i, stepwise) {
      revealAll();
      slides[index].classList.remove('current');
      slides[index].style.removeProperty('--fit');
      index = Math.max(0, Math.min(slides.length - 1, i));
      slides[index].classList.add('current');
      if (paged && stepwise) {
        waiting = stepsOf(slides[index]);
        waiting.forEach(function (group) {
          group.forEach(function (el) { el.classList.add('deck-wait'); });
        });
      }

      var position = text.position(index + 1, slides.length);
      count.textContent = paged ? (index + 1) + ' / ' + slides.length : text.toc;
      count.setAttribute('aria-label', paged ? text.toc + ' (' + position + ')' : text.toc);
      updateSteps();
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
    // scrolled through before the deck moves on. What waits for a step is
    // shown where it can be seen: a soft step scrolls down to it first, any
    // other step brings it into the window.
    function step(direction, soft) {
      var limit = root.scrollHeight - window.innerHeight;
      var jump = 0.8 * window.innerHeight;
      if (direction > 0 && waiting.length) {
        // Above the bar, with room for a line of text (which grows with the window).
        var fold = window.innerHeight - bar.offsetHeight -
          2 * parseFloat(getComputedStyle(slides[index]).fontSize);
        var part = waiting[0][0];
        if (soft && part.getBoundingClientRect().top > fold && window.scrollY < limit - 4) {
          return window.scrollBy(0, jump);
        }
        reveal(waiting.shift());
        updateSteps();
        var top = part.getBoundingClientRect().top;
        if (top < 0 || top > fold) window.scrollBy(0, top - 0.25 * window.innerHeight);
        return;
      }
      if (soft) {
        if (direction > 0 && window.scrollY < limit - 4) return window.scrollBy(0, jump);
        if (direction < 0 && window.scrollY > 4) return window.scrollBy(0, -jump);
      }
      if (index + direction < 0 || index + direction >= slides.length) return;
      show(index + direction, direction > 0);
    }

    function inView(i) {
      var box = slides[i].getBoundingClientRect();
      return box.bottom > 96 && box.top < window.innerHeight - 96;
    }

    function firstVisible() {
      for (var i = 0; i < slides.length; i++) {
        if (slides[i].getBoundingClientRect().bottom > 96) return i;
      }
      return slides.length - 1;
    }

    function setPaged(on) {
      var at = paged || inView(index) ? index : firstVisible();
      revealAll();
      paged = on;
      root.classList.toggle('paged', on);
      labelView();
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

    // After a pointer click the button gives up the focus, so that Space keeps
    // meaning "next slide" and no focus ring is left in the bar.
    function release(event) {
      if (event.detail) event.currentTarget.blur();
    }
    prev.addEventListener('click', function (event) { step(-1); release(event); });
    next.addEventListener('click', function (event) { step(1); release(event); });
    view.addEventListener('click', function (event) {
      setPaged(!paged);
      release(event);
      // For this tab only: the next deck opened in class starts paged again.
      try { sessionStorage.setItem(STORE, paged ? 'paged' : 'flow'); } catch (error) { /* private mode */ }
    });

    document.addEventListener('keydown', function (event) {
      if (!paged || toc.open || event.defaultPrevented) return;
      if (event.altKey || event.ctrlKey || event.metaKey) return;
      var target = event.target.closest ? event.target : document.body;
      // A ticked task-list box keeps the focus; only Space means something to it.
      var checkbox = target.tagName === 'INPUT' && target.type === 'checkbox';
      if (target.isContentEditable || (/^(INPUT|TEXTAREA|SELECT)$/.test(target.tagName) && !checkbox)) return;
      var space = event.key === ' ';
      if (event.shiftKey && !space) return;                    // Shift+arrows extend a selection
      if (space && (checkbox || target.closest('button, summary'))) return;  // Space activates these
      var scroller = target.closest('pre, div.sourceCode, .table-wrap');
      if (scroller && scroller.scrollWidth > scroller.clientWidth && /^Arrow/.test(event.key)) return;
      switch (event.key) {
        case 'ArrowRight': step(1); break;
        case 'ArrowLeft': step(-1); break;
        case 'PageDown': step(1, true); break;
        case 'PageUp': step(-1, true); break;
        case ' ': step(event.shiftKey ? -1 : 1, true); break;
        case 'Home': show(0); break;
        case 'End': show(slides.length - 1); break;
        default: return;
      }
      event.preventDefault();
    });

    var touch = null;
    document.addEventListener('touchstart', function (event) {
      var inScroller = event.target.closest &&
        event.target.closest('pre, div.sourceCode, .table-wrap, .deck-bar, .deck-toc');
      touch = event.touches.length === 1 && !inScroller
        ? { x: event.touches[0].clientX, y: event.touches[0].clientY } : null;
    }, { passive: true });
    document.addEventListener('touchend', function (event) {
      if (!paged || !touch) return;
      var dx = event.changedTouches[0].clientX - touch.x;
      var dy = event.changedTouches[0].clientY - touch.y;
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
      var i = location.hash ? fromHash() : 0;   // Back to the bare address is slide 1
      if (i >= 0) go(i);
    });

    labelView();
    var first = fromHash();
    show(Math.max(0, first));
    if (!paged && first > 0) slides[index].scrollIntoView();
  }
})();
