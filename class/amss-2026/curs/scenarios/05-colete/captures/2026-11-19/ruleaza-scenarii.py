"""Rulează, înainte de curs, funcțiile capturate pe aceleași intrări.

Utilizare: python ruleaza-scenarii.py  (cere python și node în PATH)
Extrage blocul de cod din fiecare răspuns, nemodificat, și scrie tabelul în scenarii-executie.md.
"""
from pathlib import Path
import json, re, subprocess, sys

HERE = Path(__file__).resolve().parent
INTRARI = [('1000', 'plic'), ('1001', 'plic'), ('1001', 'cutie'), ('0', 'cutie'),
           ('5000', 'cutie'), ('5001', 'cutie'), ('1500', 'plic'),
           ('1000,5', 'plic'), ('1000 g', 'plic'), ('1000.0', 'plic'), ('500', 'Plic')]

def cod(path):
    text = path.read_text(encoding='utf-8')
    return re.search(r'```\w*\n(.*?)```', text, re.S).group(1)

def ruleaza_js(src):
    nume = re.search(r'function\s+(\S+?)\s*\(', src).group(1)
    prog = src + f"\nconst I={json.dumps(INTRARI)};\nconsole.log(JSON.stringify(I.map(([m,a])=>{{try{{return {nume}(m,a)}}catch(e){{return 'EXCEPȚIE: '+e.message}}}})));"
    return json.loads(subprocess.check_output(['node', '-e', prog], text=True, encoding='utf-8'))

def ruleaza_py(src):
    nume = re.search(r'def\s+(\w+)\s*\(', src).group(1)
    prog = src + f"""
import json
I = {INTRARI!r}
out = []
for m, a in I:
    try: out.append({nume}(m, a))
    except Exception as e: out.append('EXCEPȚIE: ' + type(e).__name__ + ': ' + str(e))
print(json.dumps(out))
"""
    return json.loads(subprocess.check_output([sys.executable, '-I', '-c', prog], text=True, encoding='utf-8'))

rows = []
for f in sorted(HERE.glob('haiku45-*-response.md')):
    src = cod(f)
    rez = ruleaza_js(src) if 'function' in src else ruleaza_py(src)
    rows.append((f.name.removesuffix('-response.md'), rez))

out = ['# Execuția funcțiilor capturate pe aceleași intrări', '',
       'Generat de `ruleaza-scenarii.py` (codul din răspunsuri, nemodificat; masa trimisă ca text). '
       'Ghișeul 02 și 03 așteaptă o masă numerică: pe intrări text, Python ridică excepții de tip; '
       'rezultatele lor arată doar că funcția nu interpretează textul.', '',
       '| Rulare | ' + ' | '.join(f'{a} „{m}”' for m, a in INTRARI) + ' |',
       '|---|' + '---|' * len(INTRARI)]
for name, rez in rows:
    out.append(f'| {name} | ' + ' | '.join(str(r).replace('|', '\|') for r in rez) + ' |')
(HERE / 'scenarii-executie.md').write_text('\n'.join(out) + '\n', encoding='utf-8')
print('scenarii-executie.md scris')
