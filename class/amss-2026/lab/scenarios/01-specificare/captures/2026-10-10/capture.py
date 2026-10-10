"""Capturează răspunsuri reale Claude Code, fără unelte sau context de proiect.

Utilizare: python capture.py <identificator> <fisier-prompt>
Fiecare execuție pornește un context nou; refuză suprascrierea unei încercări.
"""
from pathlib import Path
import datetime as dt
import hashlib
import json
import shutil
import subprocess
import sys
import tempfile

HERE = Path(__file__).resolve().parent
name, prompt_name = sys.argv[1:]
if not name.replace('-', '').isalnum():
    raise SystemExit('Identificator invalid')
prompt_path = (HERE / prompt_name).resolve()
prompt = prompt_path.read_text(encoding='utf-8')
response_path = HERE / f'{name}-response.md'
metadata_path = HERE / f'{name}-metadata.json'
if response_path.exists() or metadata_path.exists():
    raise SystemExit('Încercarea există deja; alegeți un identificator nou.')
cli = shutil.which('claude')
if not cli:
    raise SystemExit('Claude Code nu este disponibil.')
version = subprocess.check_output([cli, '--version'], text=True, encoding='utf-8').strip()
workdir = tempfile.mkdtemp(prefix=f'amss-l1-{name}-')
args = [cli, '-p', '--model', 'claude-haiku-4-5', '--safe-mode',
        '--setting-sources', '', '--tools', '', '--strict-mcp-config',
        '--disable-slash-commands', '--no-chrome', '--no-session-persistence',
        '--output-format', 'json']
started = dt.datetime.now(dt.timezone.utc).isoformat()
metadata = {
    'run': name, 'tool': version, 'model_requested': 'claude-haiku-4-5',
    'started_utc': started, 'working_directory': workdir, 'argv': args,
    'prompt_file': prompt_path.name,
    'prompt_sha256': hashlib.sha256(prompt_path.read_bytes()).hexdigest(),
    'fresh_context': True, 'tools': [], 'user_project_settings': False,
    'system_prompt': 'Implicit Claude Code; safe-mode, fără unelte sau contextul proiectului.',
    'temperature': 'not reported', 'effort': 'not explicitly set',
}
metadata_path.write_text(json.dumps(metadata, ensure_ascii=False, indent=2)+'\n', encoding='utf-8')
try:
    result = subprocess.run(args, input=prompt, text=True, encoding='utf-8',
                            capture_output=True, cwd=workdir, timeout=240)
except subprocess.TimeoutExpired as error:
    metadata.update({'status': 'timeout', 'timeout_seconds': 240})
    for channel in ('stdout', 'stderr'):
        raw = getattr(error, channel)
        if raw:
            if isinstance(raw, bytes): raw = raw.decode('utf-8', errors='replace')
            (HERE / f'{name}-{channel}.txt').write_text(raw, encoding='utf-8')
    metadata_path.write_text(json.dumps(metadata, ensure_ascii=False, indent=2)+'\n', encoding='utf-8')
    raise
metadata.update({'finished_utc': dt.datetime.now(dt.timezone.utc).isoformat(),
                 'exit_code': result.returncode})
if result.stderr:
    (HERE / f'{name}-stderr.txt').write_text(result.stderr, encoding='utf-8')
try:
    data = json.loads(result.stdout)
except json.JSONDecodeError:
    (HERE / f'{name}-stdout.txt').write_text(result.stdout, encoding='utf-8')
    metadata['status'] = 'invalid_json'
else:
    (HERE / f'{name}-result.json').write_text(json.dumps(data, ensure_ascii=False, indent=2)+'\n', encoding='utf-8')
    metadata.update({key: data.get(key) for key in ['session_id', 'is_error', 'subtype', 'duration_ms', 'duration_api_ms', 'num_turns', 'total_cost_usd', 'usage', 'modelUsage', 'permission_denials']})
    metadata['model_reported'] = list(data.get('modelUsage', {}))
    response = data.get('result', '')
    response_path.write_text(response, encoding='utf-8')
    metadata['response_sha256'] = hashlib.sha256(response_path.read_bytes()).hexdigest()
    metadata['status'] = 'success' if result.returncode == 0 and not data.get('is_error') else 'error'
metadata_path.write_text(json.dumps(metadata, ensure_ascii=False, indent=2)+'\n', encoding='utf-8')
print(json.dumps({key: metadata.get(key) for key in ['run', 'status', 'model_reported', 'duration_ms', 'total_cost_usd']}, ensure_ascii=False), flush=True)
if metadata['status'] != 'success':
    raise SystemExit(1)
