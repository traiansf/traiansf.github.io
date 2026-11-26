"""Modelul exercițiului de transfer al Cursului 9: grupuri care trec prin două săli.

Fiecare grup are un traseu de două săli (de exemplu AB: intră prin A, trece în
B, apoi iese). `intră(g, s)` este permis numai dacă sala s este liberă; grupul
eliberează atunci sala în care era. Ieșirea din a doua sală este mereu permisă.
Utilizare: python muzeu.py          (trasee opuse: G1 prin A și B, G2 prin B și A)
           python muzeu.py AB AB    (sens unic: ambele grupuri intră prin A)
"""
import sys
from collections import deque

trasee = sys.argv[1:] or ['AB', 'BA']
I0 = (0,) * len(trasee)       # 0 afară, 1 în prima sală, 2 în a doua sală, 3 a ieșit
FINALA = (3,) * len(trasee)


def ocupate(s):
    return {trasee[g][k - 1] for g, k in enumerate(s) if k in (1, 2)}


def evenimente(s):
    rez = []
    for g, k in enumerate(s):
        if k in (0, 1) and trasee[g][k] not in ocupate(s):
            rez.append((f'intră(G{g + 1}, {trasee[g][k]})', s[:g] + (k + 1,) + s[g + 1:]))
        elif k == 2:
            rez.append((f'iese(G{g + 1})', s[:g] + (3,) + s[g + 1:]))
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


print('Trasee:', ', '.join(trasee), '-', len(parinte), 'stări accesibile,', tranzitii, 'tranziții')
print('  toate grupurile au ieșit, accesibil:', 'da, prin ' + secventa(FINALA) if FINALA in parinte else 'nu')
blocaje = [s for s in parinte if s != FINALA and not evenimente(s)]
print('  fără blocaj:', 'încălcată, prin ' + secventa(blocaje[0]) if blocaje else 'respectată')
