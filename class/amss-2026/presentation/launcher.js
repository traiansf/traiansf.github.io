(async function () {
  const select = document.getElementById('deck');
  const message = document.getElementById('message');
  try {
    const response = await fetch('decks.json');
    if (!response.ok) throw new Error('Nu se poate încărca lista prezentărilor.');
    for (const deck of await response.json()) select.add(new Option(deck.title, deck.file));
  } catch (error) { message.textContent = error.message; }
  document.getElementById('local').onclick = () => window.open('decks/' + select.value, '_blank');
  document.getElementById('remote').onsubmit = async event => {
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
      url.searchParams.set('follow', '1');
      document.getElementById('audience').href = url.href;
      document.getElementById('audience-url').value = url.href;
      document.getElementById('links').hidden = false;
      document.getElementById('password').value = '';
      message.textContent = 'Sesiune pregătită. Linkul de proiecție permite numai urmărirea prezentării.';
    } catch (error) { message.textContent = error.message; }
  };
})();
