import test from 'node:test';
import assert from 'node:assert/strict';
import { once } from 'node:events';
import { io as connect } from 'socket.io-client';
import { createPresentationServer } from '../server.mjs';

for (const basePath of ['', '/~tserbanuta/amss']) {
test('adresa scurtă: așteptare, ultima sesiune, expirare: ' + (basePath || '/'), { timeout:15000 }, async t => {
  const { server, io } = await createPresentationServer({ password:'test-only', basePath, ttl:1000 });
  server.listen(0, '127.0.0.1');
  await once(server, 'listening');
  t.after(() => new Promise(resolve => io.close(resolve)));
  const url = 'http://127.0.0.1:' + server.address().port + basePath;
  const now = () => fetch(url + '/now', { redirect:'manual' });
  const waiting = await now();
  assert.equal(waiting.status, 200);
  assert.match(await waiting.text(), /http-equiv="refresh"/);
  const create = async (deck, password = 'test-only') => fetch(url + '/api/sessions', {
    method:'POST', headers:{ Authorization:'Bearer ' + password, 'Content-Type':'application/json' }, body:JSON.stringify({ deck })
  });
  const first = await (await create('curs-01-organizare.html')).json();
  assert.match((await now()).headers.get('location'), new RegExp(first.room));
  const latest = await (await create('curs-02-intelegere.html')).json();
  assert.equal((await create('curs-01-organizare.html', 'wrong')).status, 401);
  const redirect = await now();
  assert.equal(redirect.status, 302);
  assert.equal(redirect.headers.get('cache-control'), 'no-store');
  assert.equal(redirect.headers.get('location'), basePath + '/decks/curs-02-intelegere.html?room=' + latest.room + '&follow=1');
  assert.ok(!redirect.headers.get('location').includes(latest.key));
  const html = await (await fetch(url + '/now')).text();
  assert.doesNotMatch(html, /<aside class="notes"/);
  const head = await fetch(url + '/now/', { method:'HEAD', redirect:'manual' });
  assert.equal(head.status, 302);
  assert.equal(await head.text(), '');
  await new Promise(resolve => setTimeout(resolve, 1100));
  const expired = await now();
  assert.equal(expired.status, 200);
  assert.equal(expired.headers.get('location'), null);
  assert.match(await expired.text(), /http-equiv="refresh"/);
});
test('control, izolare, fragmente, reconectare: ' + (basePath || '/'), { timeout:15000 }, async t => {
  const { server, io } = await createPresentationServer({ password:'test-only', basePath });
  server.listen(0, '127.0.0.1');
  await once(server, 'listening');
  const origin = 'http://127.0.0.1:' + server.address().port;
  const url = origin + basePath;
  const sockets = [];
  t.after(async () => { sockets.forEach(s => s.disconnect()); await new Promise(resolve => io.close(resolve)); });
  const deck = 'curs-02-intelegere.html';
  const create = async (password = 'test-only') => fetch(url + '/api/sessions', {
    method:'POST', headers:{ Authorization:'Bearer '+password, 'Content-Type':'application/json' }, body:JSON.stringify({ deck })
  });
  assert.equal((await create('wrong')).status, 401);
  const room = await (await create()).json();
  const otherRoom = await (await create()).json();
  const socket = auth => { const s = connect(origin, { path:basePath + '/socket.io', auth:{ deck, ...auth }, reconnection:false }); sockets.push(s); return s; };
  const denied = socket({ room:room.room, key:'wrong' });
  assert.match((await once(denied, 'connect_error'))[0].message, /neautorizat/);
  const wrongDeck = socket({ room:room.room, follower:true, deck:'curs-01-organizare.html' });
  assert.match((await once(wrongDeck, 'connect_error'))[0].message, /corespunde/);
  const master = socket(room);
  await once(master, 'connect');
  const follower = socket({ room:room.room, follower:true });
  await once(follower, 'connect');
  const isolated = socket({ room:otherRoom.room, follower:true });
  await once(isolated, 'connect');
  let leaked = false;
  isolated.on('state', () => { leaked = true; });
  const expected = { indexh:12, indexv:0, indexf:2, paused:false, overview:false };
  let state = once(follower, 'state');
  master.emit('state', expected);
  assert.deepEqual((await state)[0], expected);
  follower.emit('state', { ...expected, indexh:999 });
  // A new client receives retained master state, never follower input.
  const late = socket({ room:room.room, follower:true });
  assert.deepEqual((await once(late, 'state'))[0], expected);
  follower.disconnect();
  state = once(late, 'state');
  master.emit('state', { ...expected, indexh:13, indexf:-1, paused:true });
  const latest = (await state)[0];
  state = once(follower, 'state');
  follower.connect();
  assert.deepEqual((await state)[0], latest);
  assert.equal(leaked, false);
  const publicHtml = await (await fetch(url + '/decks/' + deck + '?follow=1')).text();
  assert.doesNotMatch(publicHtml, /<aside class="notes"/);
  assert.match(await (await fetch(url + '/decks/' + deck)).text(), /<aside class="notes"/);
  assert.equal((await fetch(url + '/server.mjs')).status, 404);
  assert.equal((await fetch(url + '/decks/unreleased.html')).status, 404);
  assert.equal((await fetch(url + '/socket.io/socket.io.js')).status, 200);
  if (basePath) {
    const redirect = await fetch(url, { redirect:'manual' });
    assert.equal(redirect.status, 308);
    assert.equal(redirect.headers.get('location'), basePath + '/');
    assert.equal((await fetch(origin + '/health')).status, 404);
  }
});
}
