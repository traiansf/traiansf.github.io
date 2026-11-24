"""Capturează o conversație reală Claude Code în mai multe mesaje, fără unelte.

Utilizare: python conversatie.py <identificator> <prompt-1> <prompt-2> ...
Primul mesaj pornește un context nou; următoarele continuă aceeași sesiune prin
--resume, din același director temporar gol. Refuză suprascrierea unei încercări.
"""
from pathlib import Path
import datetime as dt, hashlib, json, shutil, subprocess, sys, tempfile

HERE = Path(__file__).resolve().parent
name, *prompts = sys.argv[1:]
meta_path = HERE / f'{name}-metadata.json'
if meta_path.exists():
    raise SystemExit('Încercarea există deja; alegeți un identificator nou.')
cli = shutil.which('claude')
version = subprocess.check_output([cli, '--version'], text=True, encoding='utf-8').strip()
workdir = tempfile.mkdtemp(prefix=f'amss-conversatie-{name}-')
base = [cli, '-p', '--model', 'claude-haiku-4-5', '--safe-mode', '--setting-sources', '',
        '--tools', '', '--strict-mcp-config', '--disable-slash-commands', '--no-chrome',
        '--output-format', 'json']
meta = {'run': name, 'tool': version, 'model_requested': 'claude-haiku-4-5', 'argv': base,
        'working_directory': workdir, 'fresh_context': True, 'tools': [], 'user_project_settings': False,
        'system_prompt': 'Implicit Claude Code; safe-mode, fără unelte sau contextul proiectului.',
        'temperature': 'not reported', 'effort': 'not explicitly set',
        'started_utc': dt.datetime.now(dt.timezone.utc).isoformat(), 'messages': []}
session = None
for i, prompt_name in enumerate(prompts, 1):
    p = HERE / prompt_name
    args = base + (['--resume', session] if session else [])
    r = subprocess.run(args, input=p.read_text(encoding='utf-8'), text=True, encoding='utf-8',
                       capture_output=True, cwd=workdir, timeout=240)
    data = json.loads(r.stdout)
    session = data.get('session_id')
    out = HERE / f'{name}-mesaj-{i}-response.md'
    out.write_text(data.get('result', ''), encoding='utf-8', newline='\n')
    meta['messages'].append({'prompt_file': prompt_name, 'prompt_sha256': hashlib.sha256(p.read_bytes()).hexdigest(),
                             'response_file': out.name, 'response_sha256': hashlib.sha256(out.read_bytes()).hexdigest(),
                             'exit_code': r.returncode,
                             **{k: data.get(k) for k in ['session_id', 'is_error', 'subtype', 'duration_ms', 'total_cost_usd', 'usage']},
                             'model_reported': list(data.get('modelUsage', {}))})
    if r.returncode or data.get('is_error'):
        break
meta['finished_utc'] = dt.datetime.now(dt.timezone.utc).isoformat()
meta['status'] = 'success' if len(meta['messages']) == len(prompts) and not meta['messages'][-1]['is_error'] else 'error'
meta_path.write_text(json.dumps(meta, ensure_ascii=False, indent=2) + '\n', encoding='utf-8', newline='\n')
print(name, meta['status'])
