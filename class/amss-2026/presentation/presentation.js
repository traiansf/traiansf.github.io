(async function () {
  const query = new URLSearchParams(location.search);
  const room = query.get('room');
  const follower = query.has('follow');
  const receiver = query.has('receiver'); // Speaker-view previews must never open synchronization sockets.
  const mobileScreen = matchMedia('(pointer: coarse), (max-width: 600px)');
  const mobileController = () => !follower && !receiver && mobileScreen.matches;
  const status = document.getElementById('connection-status');
  const showStatus = text => { status.textContent = text; status.hidden = !text; };
  document.querySelectorAll('section.transition').forEach(s => s.dataset.backgroundColor = '#0a2145');
  if (follower) document.querySelectorAll('aside.notes').forEach(n => n.remove());
  let panel;
  if (!follower && !receiver) {
    panel = document.createElement('div');
    panel.id = 'mobile-presenter';
    panel.hidden = !mobileController();
    panel.innerHTML = `<nav aria-label="Controlul prezentării">
      <button type="button" id="previous-slide">Înapoi</button>
      <button type="button" id="mobile-timer" role="timer" title="Atingeți pentru a reporni cronometrul">0:00</button>
      <button type="button" id="next-slide">Înainte</button>
      <span id="mobile-pace" hidden></span>
    </nav><section id="mobile-notes" aria-label="Notele profesorului" tabindex="0">
      <div id="mobile-notes-content"></div></section>`;
    document.body.append(panel);
  }
  document.body.classList.toggle('mobile-controller', mobileController());
  await Reveal.initialize({
    width:1280, height:720, margin:0.025, hash:true, slideNumber:'c/t',
    transition:'none', backgroundTransition:'none', center:true,
    controls:!follower && !mobileController(), keyboard:!follower, touch:!follower,
    embedded:mobileController(), scrollActivationWidth:0,
    overview:!follower, progress:true, plugins:follower ? [] : [RevealNotes]
  });
  // Scale only dense slides; headings, diagrams and tables retain their proportions.
  for (const slide of Reveal.getSlides()) {
    if (slide.classList.contains('titlepage') || slide.classList.contains('transition')) continue;
    const oldDisplay = slide.style.display;
    slide.style.display = 'block';
    for (let size=28; size>=22; size--) {
      slide.style.fontSize = size + 'px';
      if (slide.scrollHeight <= 680) break;
    }
    slide.style.display = oldDisplay;
  }
  Reveal.layout();
  // Hidden pacing markers in the notes: []{.pace at=25} is the planned start minute of a slide,
  // []{.pace min=8} its planned duration, of=100 the planned total. Unmarked slides share the rest evenly.
  const slides = Reveal.getSlides();
  const at = [], min = [];
  let total;
  slides.forEach((slide, i) => {
    for (const mark of slide.querySelectorAll('aside.notes .pace')) {
      if (mark.dataset.at) at[i] = Number(mark.dataset.at);
      if (mark.dataset.min) min[i] = Number(mark.dataset.min);
      if (mark.dataset.of) total = Number(mark.dataset.of);
      const parent = mark.parentElement;
      mark.remove();
      if (parent.matches('p') && !parent.textContent.trim() && !parent.children.length) parent.remove();
    }
  });
  let plan; // plan[i] is the minute at which slide i should start; plan[slides.length] is the end.
  if (total !== undefined) {
    const anchors = at[0] === undefined ? [[0, 0]] : [];
    at.forEach((minute, i) => anchors.push([i, minute]));
    anchors.push([slides.length, total]);
    plan = [];
    for (let k = 0; k + 1 < anchors.length; k++) {
      const [a, from] = anchors[k], [b, to] = anchors[k + 1];
      const span = Math.max(0, to - from);
      let fixed = 0, free = 0;
      for (let i = a; i < b; i++) min[i] === undefined ? free++ : fixed += min[i];
      const share = free ? Math.max(0, span - fixed) / free : 0;
      const scale = fixed > span ? span / fixed : 1;
      for (let i = a, t = from; i < b; i++) {
        plan[i] = t;
        t += min[i] === undefined ? share : min[i] * scale;
      }
    }
    plan[slides.length] = total;
  }
  if (panel) {
    const previous = document.getElementById('previous-slide');
    const next = document.getElementById('next-slide');
    const notes = document.getElementById('mobile-notes');
    let lastSlide;
    const updatePanel = () => {
      const slide = Reveal.getCurrentSlide();
      const fragments = Reveal.availableFragments();
      previous.disabled = Reveal.isFirstSlide() && !fragments.prev;
      next.disabled = Reveal.isLastSlide() && !fragments.next;
      if (slide !== lastSlide) {
        document.getElementById('mobile-notes-content').innerHTML = Reveal.getSlideNotes(slide) || '<p>Acest slide nu are note.</p>';
        notes.scrollTop = 0;
        lastSlide = slide;
      }
      updatePace();
    };
    // Elapsed time survives reloads of the same tab; tapping the timer restarts it when the lecture begins.
    const timer = document.getElementById('mobile-timer');
    const timerKey = 'amss-timer-' + (room || location.pathname);
    const storage = { get:() => { try { return Number(sessionStorage.getItem(timerKey)); } catch { return 0; } },
      set:value => { try { sessionStorage.setItem(timerKey, value); } catch {} } };
    let started = storage.get() || Date.now();
    storage.set(started);
    // Minutes and quarter minutes, matching the minute checkpoints in the notes.
    const updateTimer = () => {
      const seconds = Math.max(0, Math.floor((Date.now() - started) / 1000));
      timer.textContent = Math.floor(seconds / 60) + ':' + String(seconds % 60 - seconds % 15).padStart(2, '0');
      timer.setAttribute('aria-label', 'Timp scurs: ' + timer.textContent);
      updatePace();
    };
    // Compares the elapsed time with the current slide's planned interval, allowing two minutes either way.
    const pace = document.getElementById('mobile-pace');
    function updatePace() {
      if (!plan) return;
      const i = slides.indexOf(Reveal.getCurrentSlide());
      const elapsed = (Date.now() - started) / 60000;
      const early = plan[i] - elapsed, late = elapsed - plan[i + 1];
      const [state, text] = late > 2 ? ['faster', 'mai repede (+' + Math.round(late) + ' min)']
        : early > 2 ? ['slower', 'mai încet (−' + Math.round(early) + ' min)'] : ['on-time', 'în ritm'];
      pace.dataset.pace = state;
      pace.textContent = text;
      pace.hidden = false;
    }
    timer.onclick = () => {
      if (!confirm('Reporniți cronometrul de la 0:00?')) return;
      started = Date.now();
      storage.set(started);
      updateTimer();
    };
    updateTimer();
    setInterval(updateTimer, 1000);
    previous.onclick = () => Reveal.prev();
    next.onclick = () => Reveal.next();
    for (const event of ['slidechanged', 'fragmentshown', 'fragmenthidden']) Reveal.on(event, updatePanel);
    updatePanel();
    mobileScreen.addEventListener('change', () => {
      const mobile = mobileController();
      document.body.classList.toggle('mobile-controller', mobile);
      panel.hidden = !mobile;
      Reveal.configure({ embedded:mobile, controls:!mobile });
      Reveal.layout();
    });
  }
  if (!room || receiver) return;
  const key = follower ? undefined : sessionStorage.getItem('amss-room-' + room);
  if (!follower && !key) { showStatus('Controlul sesiunii lipsește. Porniți o sesiune din pagina principală.'); return; }
  const socket = io({ path:new URL('../socket.io', location.href).pathname,
    auth:{ room, key, follower, deck:location.pathname.split('/').pop() } });
  let applying = false;
  const publish = () => {
    if (!follower && !applying && socket.connected) socket.emit('state', Reveal.getState());
  };
  socket.on('connect', () => { showStatus(''); publish(); });
  socket.on('disconnect', () => showStatus('Sincronizare întreruptă. Se încearcă reconectarea…'));
  socket.on('connect_error', error => showStatus('Sincronizare indisponibilă: ' + error.message));
  socket.on('state', state => {
    if (!follower) return;
    applying = true;
    Reveal.setState(state);
    applying = false;
  });
  for (const event of ['slidechanged','fragmentshown','fragmenthidden','paused','resumed']) Reveal.on(event, publish);
})();
