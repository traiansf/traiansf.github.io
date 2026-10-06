import http from 'node:http';
import { readFile } from 'node:fs/promises';
import { resolve, dirname, extname } from 'node:path';
import { fileURLToPath, pathToFileURL } from 'node:url';
import { randomBytes, timingSafeEqual } from 'node:crypto';
import { Server } from 'socket.io';

const here = dirname(fileURLToPath(import.meta.url));
const token = () => randomBytes(24).toString('hex');
const equal = (a, b) => typeof a === 'string' && typeof b === 'string'
  && Buffer.byteLength(a) === Buffer.byteLength(b) && timingSafeEqual(Buffer.from(a), Buffer.from(b));
const types = { '.html':'text/html; charset=utf-8', '.js':'text/javascript; charset=utf-8', '.css':'text/css; charset=utf-8', '.json':'application/json', '.map':'application/json' };

export async function createPresentationServer({ dist = resolve(here, 'dist'), password, ttl = 8*60*60*1000, basePath = '' } = {}) {
  if (!password) throw new Error('Lipsește parola serviciului.');
  basePath = basePath.replace(/\/$/, '');
  if (basePath && (!/^\/[A-Za-z0-9_~/-]+$/.test(basePath) || basePath.includes('//'))) throw new Error('BASE_PATH invalid.');
  const manifest = JSON.parse(await readFile(resolve(dist, 'decks.json'), 'utf8'));
  const decks = new Set(manifest.map(d => d.file));
  const rooms = new Map();
  const attempts = new Map();
  const json = (res, code, body) => { res.writeHead(code, { 'Content-Type':'application/json', 'Cache-Control':'no-store' }); res.end(JSON.stringify(body)); };
  const server = http.createServer(async (req, res) => {
    try {
      const url = new URL(req.url, 'http://localhost');
      if (basePath && url.pathname === basePath) {
        res.writeHead(308, { Location:basePath + '/' + url.search });
        return res.end();
      }
      if (basePath && !url.pathname.startsWith(basePath + '/')) return json(res, 404, { error:'Fișier inexistent.' });
      url.pathname = url.pathname.slice(basePath.length);
      if (url.pathname === '/health') return json(res, 200, { ok:true });
      if (req.method === 'POST' && url.pathname === '/api/sessions') {
        const ip = req.socket.remoteAddress;
        const now = Date.now();
        for (const [k,v] of attempts) if (now-v.since > 60000) attempts.delete(k);
        const attempt = attempts.get(ip) || { count:0, since:now };
        attempts.set(ip, attempt);
        if (++attempt.count > 20) return json(res, 429, { error:'Prea multe încercări.' });
        if (!equal(req.headers.authorization, 'Bearer ' + password)) return json(res, 401, { error:'Parolă incorectă.' });
        let body = '';
        for await (const chunk of req) {
          body += chunk;
          if (body.length > 4096) return json(res, 413, { error:'Cerere prea mare.' });
        }
        let data;
        try { data = JSON.parse(body); } catch { return json(res, 400, { error:'Cerere invalidă.' }); }
        if (!decks.has(data.deck)) return json(res, 400, { error:'Prezentare necunoscută.' });
        if (rooms.size >= 1000) return json(res, 503, { error:'Prea multe sesiuni.' });
        const room = token(), key = token();
        rooms.set(room, { key, deck:data.deck, expires:now+ttl, state:null });
        return json(res, 201, { room, key });
      }
      if (req.method !== 'GET' && req.method !== 'HEAD') return json(res, 405, { error:'Metodă nepermisă.' });
      const path = decodeURIComponent(url.pathname);
      const relative = path === '/' ? 'index.html' : path.slice(1);
      const allowed = ['index.html','theme.css','presentation.js','launcher.js','decks.json'].includes(relative)
        || (relative.startsWith('decks/') && decks.has(relative.slice(6)))
        || /^vendor\/(reveal|notes)\/[a-zA-Z0-9_./-]+$/.test(relative);
      if (!allowed || relative.split('/').includes('..')) return json(res, 404, { error:'Fișier inexistent.' });
      let content = await readFile(resolve(dist, relative));
      if (relative.startsWith('decks/') && url.searchParams.has('follow')) {
        content = Buffer.from(content.toString('utf8').replace(/<aside\b[^>]*class="notes"[^>]*>[\s\S]*?<\/aside>/g, ''));
      }
      res.writeHead(200, { 'Content-Type':types[extname(relative)] || 'application/octet-stream',
        'Cache-Control':'no-store', 'X-Content-Type-Options':'nosniff', 'Referrer-Policy':'no-referrer' });
      res.end(req.method === 'HEAD' ? undefined : content);
    } catch (error) {
      if (!res.headersSent) json(res, error.code === 'ENOENT' ? 404 : 400, { error:'Cererea nu poate fi procesată.' });
      else res.end();
    }
  });
  const io = new Server(server, { path:basePath + '/socket.io', maxHttpBufferSize:8192 });
  io.use((socket, next) => {
    const { room, key, follower, deck } = socket.handshake.auth;
    const session = rooms.get(room);
    if (!session || session.expires < Date.now()) return next(new Error('Sesiune inexistentă sau expirată.'));
    if (session.deck !== deck) return next(new Error('Prezentarea nu corespunde sesiunii.'));
    if (follower !== true && !equal(key, session.key)) return next(new Error('Control neautorizat.'));
    socket.data = { room, follower:follower === true };
    next();
  });
  io.on('connection', socket => {
    const { room, follower } = socket.data;
    socket.join(room);
    const session = rooms.get(room);
    if (follower && session.state) socket.emit('state', session.state);
    socket.on('state', raw => {
      if (follower || !raw || session.expires < Date.now()) return;
      if (![raw.indexh,raw.indexv].every(n => Number.isInteger(n) && n >= 0 && n < 10000)) return;
      const indexf = raw.indexf ?? -1;
      if (!Number.isInteger(indexf) || indexf < -1 || indexf > 10000) return;
      session.state = { indexh:raw.indexh, indexv:raw.indexv, indexf, paused:raw.paused === true, overview:false };
      socket.to(room).emit('state', session.state);
    });
  });
  const cleanup = setInterval(() => {
    for (const [id,session] of rooms) {
      if (session.expires < Date.now()) { io.in(id).disconnectSockets(); rooms.delete(id); }
    }
  }, 60000);
  cleanup.unref();
  server.on('close', () => clearInterval(cleanup));
  return { server, io };
}

if (process.argv[1] && import.meta.url === pathToFileURL(resolve(process.argv[1])).href) {
  const host = process.env.HOST || '127.0.0.1';
  if (host !== '127.0.0.1' && host !== 'localhost' && !process.env.PRESENTATION_PASSWORD) {
    throw new Error('Setați PRESENTATION_PASSWORD înainte de a permite accesul din rețea.');
  }
  const password = process.env.PRESENTATION_PASSWORD || token();
  const basePath = process.env.BASE_PATH || '';
  const { server } = await createPresentationServer({ password, basePath });
  server.listen(Number(process.env.PORT || 3000), host, () => {
    console.log('Prezentări: http://' + host + ':' + server.address().port + basePath + '/');
    if (!process.env.PRESENTATION_PASSWORD) console.log('Parolă temporară pentru testarea sincronizării: ' + password);
  });
}
