"""Extrage codul din răspunsurile capturate și îl rulează separat, înainte de curs.

Codul este copiat neschimbat în rulari/<încercare>.py (primul bloc ```python sau
parametrul content/file_text al apelului scris ca text), citit de om, apoi rulat
cu `python -I`; ieșirea se păstrează în rulari/<încercare>.txt.
"""
from pathlib import Path
import re, subprocess, sys, platform
HERE = Path(__file__).resolve().parent
OUT = HERE / 'rulari'
OUT.mkdir(exist_ok=True)
for md in sorted(HERE.glob('haiku45-explorator-*-response.md')):
    text = md.read_text(encoding='utf-8')
    m = re.search(r'```python\n(.*?)```', text, re.S) or \
        re.search(r'<parameter name="(?:content|file_text)">(.*?)</parameter>', text, re.S)
    name = md.name.replace('-response.md', '')
    code = OUT / f'{name}.py'
    code.write_text(m.group(1), encoding='utf-8', newline='\n')
    r = subprocess.run([sys.executable, '-I', '-X', 'utf8', code.name], cwd=OUT, capture_output=True,
                       text=True, encoding='utf-8', timeout=60)
    report = f'$ python -I -X utf8 {code.name}   (Python {platform.python_version()})\n{r.stdout}'
    if r.stderr: report += r.stderr
    report += f'[cod de ieșire {r.returncode}]\n'
    (OUT / f'{name}.txt').write_text(report, encoding='utf-8', newline='\n')
    print('=====', name); print(report[:1800])
