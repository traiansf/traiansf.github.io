"""Modelul cu trei lucrări și trei aparate folosit la secțiunea AI a Cursului 9.

X are nevoie de M și C, Y de C și L, Z de M și L; fiecare ocupă aparatele în
ordinea dată și le păstrează până la încheiere (ai/context-trei-lucrari.md).
Utilizare: python trei_lucrari.py            (ordinea din enunț: MC, CL, ML)
           python trei_lucrari.py MC CL LM   (altă ordine pentru fiecare lucrare)
"""
import sys
from collections import deque

ordine = dict(zip('XYZ', sys.argv[1:4] if len(sys.argv) > 3 else ['MC', 'CL', 'ML']))
I0 = (0, 0, 0)          # 0 Neîncepută, 1 Pregătită, 2 În lucru, 3 Încheiată


def ocupate(s):
    """Lista tuturor aparatelor ocupate, cu repetiții dacă P1 ar fi încălcată."""
    lista = []
    for l, k in zip('XYZ', s):
        if k in (1, 2):
            lista += ordine[l][:k]
    return lista


def evenimente(s):
    rez = []
    for i, l in enumerate('XYZ'):
        if s[i] in (0, 1) and ordine[l][s[i]] not in ocupate(s):
            rez.append((f'ocupă({l}, {ordine[l][s[i]]})', s[:i] + (s[i] + 1,) + s[i + 1:]))
        elif s[i] == 2:
            rez.append((f'încheie({l})', s[:i] + (3,) + s[i + 1:]))
    return rez


parinte, coada, tranzitii = {I0: None}, deque([I0]), 0
while coada:
    s = coada.popleft()
    for ev, t in evenimente(s):
        tranzitii += 1
        if t not in parinte:
            parinte[t] = (ev, s)
            coada.append(t)


def secventa(s):
    pasi = []
    while parinte[s]:
        ev, s = parinte[s]
        pasi.append(ev)
    return ', '.join(reversed(pasi))


print('Ordinea:', ordine, '-', len(parinte), 'stări accesibile,', tranzitii, 'tranziții')
print('  P1:', 'respectată' if all(len(ocupate(s)) == len(set(ocupate(s))) for s in parinte) else 'încălcată')
print('  P2:', 'respectată' if (3, 3, 3) in parinte else 'încălcată')
blocaje = [s for s in parinte if s != (3, 3, 3) and not evenimente(s)]
print('  P3:', 'încălcată, prin ' + secventa(blocaje[0]) if blocaje else 'respectată')
