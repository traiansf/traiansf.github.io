(async function () {
  const query = new URLSearchParams(location.search);
  const room = query.get('room');
  const follower = query.has('follow');
  const receiver = query.has('receiver'); // Speaker-view previews must never open synchronization sockets.
  const status = document.getElementById('connection-status');
  const showStatus = text => { status.textContent = text; status.hidden = !text; };
  document.querySelectorAll('section.transition').forEach(s => s.dataset.backgroundColor = '#0a2145');
  if (follower) document.querySelectorAll('aside.notes').forEach(n => n.remove());
  await Reveal.initialize({
    width:1280, height:720, margin:0.025, hash:true, slideNumber:'c/t',
    transition:'none', backgroundTransition:'none', center:true,
    controls:!follower, keyboard:!follower, touch:!follower,
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
