import { readFile, writeFile, mkdir, cp } from 'node:fs/promises';
import { resolve, dirname, basename } from 'node:path';
import { fileURLToPath } from 'node:url';
import { execFileSync } from 'node:child_process';

const here = dirname(fileURLToPath(import.meta.url));
const root = resolve(here, '..');
const out = resolve(here, 'dist');
await mkdir(resolve(out, 'decks'), { recursive: true });
await cp(resolve(here, 'node_modules/reveal.js/dist'), resolve(out, 'vendor/reveal'), { recursive: true });
await cp(resolve(here, 'node_modules/reveal.js/LICENSE'), resolve(out, 'vendor/reveal/LICENSE'));
for (const file of ['theme.css', 'presentation.js', 'index.html', 'launcher.js']) {
  await cp(resolve(here, file), resolve(out, file));
}
const released = (await readFile(resolve(root, 'RELEASED'), 'utf8')).split(/\r?\n/)
  .map(s => s.trim()).filter(s => /^(curs|lab)\//.test(s) && s !== 'lab/00-pregatire');
const manifest = [];
for (const key of released) {
  const source = resolve(root, key + '.md');
  const name = key.replace('/', '-') + '.html';
  execFileSync('pandoc', [basename(source), '--standalone', '--embed-resources', '-t', 'revealjs',
    '--slide-level=1', '--wrap=none', '--lua-filter=' + resolve(root, 'diagram/diagram.lua'),
    '--lua-filter=' + resolve(root, 'theme/amss.lua'),
    '--metadata-file=' + resolve(root, 'theme/course.yaml'),
    '--highlight-style=' + resolve(root, 'theme/code.theme'),
    '--template=' + resolve(here, 'template.html'),
    '-V', 'logo-path=' + resolve(root, 'static/assets/amss-2026-logo-480.webp'),
    '-o', resolve(out, 'decks', name)], {
    cwd: dirname(source), stdio: 'inherit', env: {
      ...process.env,
      ...(process.platform === 'win32' ? { MERMAID_BIN: 'mmdc.cmd', PLANTUML_BIN: 'plantuml.cmd' } : {})
    }
  });
  const md = await readFile(source, 'utf8');
  manifest.push({ file: name, title: md.match(/^title:\s*"(.*)"/m)?.[1] || key });
  console.log('Generat: ' + key);
}
// The server serves only this manifest; old outputs cannot expose unreleased decks.
await writeFile(resolve(out, 'decks.json'), JSON.stringify(manifest, null, 2));
