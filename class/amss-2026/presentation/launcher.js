(async function () {
  const select = document.getElementById('deck');
  const message = document.getElementById('message');
  const form = document.getElementById('remote');
  const newSession = document.getElementById('new-session');
  try {
    const response = await fetch('decks.json');
    if (!response.ok) throw new Error('Nu se poate încărca lista prezentărilor.');
    const decks = await response.json();
    for (const deck of decks) select.add(new Option(deck.title, deck.file));
    // Preselect the latest released lecture (highest curs-NN), not a lab.
    const lectures = decks.map(d => d.file).filter(f => /^curs-\d+/.test(f));
    if (lectures.length) select.value = lectures.reduce((a, b) => parseInt(b.slice(5)) > parseInt(a.slice(5)) ? b : a);
  } catch (error) { message.textContent = error.message; }
  document.getElementById('local').onclick = () => window.open('decks/' + select.value, '_blank');
  newSession.onclick = () => {
    form.hidden = false;
    newSession.hidden = true;
    document.getElementById('links').hidden = true;
    message.textContent = '';
    document.getElementById('password').focus();
  };
  form.onsubmit = async event => {
    event.preventDefault();
    message.textContent = '';
    try {
      const response = await fetch('api/sessions', { method:'POST',
        headers:{ 'Content-Type':'application/json', Authorization:'Bearer ' + document.getElementById('password').value },
        body:JSON.stringify({ deck:select.value }) });
      if (!response.ok) throw new Error(response.status === 401 ? 'Parolă incorectă.' : 'Sesiunea nu poate fi pornită.');
      const { room, key } = await response.json();
      sessionStorage.setItem('amss-room-' + room, key);
      const url = new URL('decks/' + select.value, location.href);
      url.searchParams.set('room', room);
      document.getElementById('presenter').href = url.href;
      const audienceUrl = new URL('now', location.href).href;
      document.getElementById('audience').href = audienceUrl;
      document.getElementById('audience-url').value = audienceUrl;
      document.getElementById('links').hidden = false;
      // A successful AJAX login hides the form without clearing its credentials,
      // allowing password managers to detect success and offer to save them.
      form.hidden = true;
      newSession.hidden = false;
      message.textContent = 'Sesiune pregătită. Linkul de proiecție permite numai urmărirea prezentării.';
    } catch (error) { message.textContent = error.message; }
  };
})();
