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
      <div id="mobile-status"><span id="mobile-position" aria-live="polite"></span>
        <button type="button" id="mobile-timer" role="timer" title="Atingeți pentru a reporni cronometrul">0:00</button></div>
      <button type="button" id="next-slide">Înainte</button>
    </nav><section id="mobile-notes" aria-label="Notele profesorului" tabindex="0">
      <h2>Notele profesorului</h2><div id="mobile-notes-content"></div></section>`;
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
      document.getElementById('mobile-position').textContent = (Reveal.getSlides().indexOf(slide) + 1) + ' / ' + Reveal.getTotalSlides();
      if (slide !== lastSlide) {
        document.getElementById('mobile-notes-content').innerHTML = Reveal.getSlideNotes(slide) || '<p>Acest slide nu are note.</p>';
        notes.scrollTop = 0;
        lastSlide = slide;
      }
    };
    // Elapsed time survives reloads of the same tab; tapping the timer restarts it when the lecture begins.
    const timer = document.getElementById('mobile-timer');
    const timerKey = 'amss-timer-' + (room || location.pathname);
    const storage = { get:() => { try { return Number(sessionStorage.getItem(timerKey)); } catch { return 0; } },
      set:value => { try { sessionStorage.setItem(timerKey, value); } catch {} } };
    let started = storage.get() || Date.now();
    storage.set(started);
    const two = n => String(n).padStart(2, '0');
    const updateTimer = () => {
      const seconds = Math.max(0, Math.floor((Date.now() - started) / 1000));
      const h = Math.floor(seconds / 3600), m = Math.floor(seconds / 60) % 60, s = seconds % 60;
      timer.textContent = h ? h + ':' + two(m) + ':' + two(s) : m + ':' + two(s);
      timer.setAttribute('aria-label', 'Timp scurs: ' + timer.textContent);
    };
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
