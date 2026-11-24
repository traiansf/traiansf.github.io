"""Explorarea exhaustivă a modelului din Cursul 9 (microscopul și camera).

Utilizare: python explorare.py [V0|V1|V2|V3]   (fără argument: toate variantele)
Nu are dependențe; modelul este finit, iar fiecare rulare dă același rezultat.

O stare a modelului este o pereche (x, y): ce are fiecare lucrare.
  '-'     nimic (Neîncepută)
  'M','C' un singur aparat (Pregătită)
  'MC'    ambele aparate (În lucru)
  'gata'  lucrare încheiată (Încheiată), fără aparate
"""
import sys
from collections import deque

I0 = ('-', '-')
ORDINE = {           # ordinea în care fiecare lucrare își ocupă aparatele
    'V0': ('MC', 'CM'),  # ordini diferite: X începe cu M, Y începe cu C
    'V1': ('MC', 'MC'),  # ordine comună: microscopul întâi
    'V2': None,          # ambele aparate deodată
    'V3': ('MC', 'CM'),  # ca V0, plus renunțare la aparatul ocupat
}


def aparate(s):
    return set() if s in ('-', 'gata') else set(s)


def evenimente(varianta, stare):
    """Întoarce lista (eveniment, stare următoare) a evenimentelor permise."""
    rezultat = []
    for i, nume in enumerate('XY'):
        a_mea, cealalta = stare[i], stare[1 - i]
        ocupate = aparate(cealalta)

        def pune(valoare):
            noua = list(stare)
            noua[i] = valoare
            return tuple(noua)

        if a_mea == 'MC':
            rezultat.append((f'încheie({nume})', pune('gata')))
        elif a_mea != 'gata':
            if varianta == 'V2':
                if a_mea == '-' and not ocupate:
                    rezultat.append((f'ocupă ambele({nume})', pune('MC')))
                continue
            urmatorul = next(a for a in ORDINE[varianta][i] if a not in aparate(a_mea))
            if urmatorul not in ocupate:
                noua = 'MC' if a_mea != '-' else urmatorul
                rezultat.append((f'ocupă({nume}, {urmatorul})', pune(noua)))
            elif varianta == 'V3' and a_mea != '-':
                rezultat.append((f'renunță({nume})', pune('-')))
    return rezultat


def finala(stare):
    return stare == ('gata', 'gata')


def exclusiv(stare):                       # P1
    return not (aparate(stare[0]) & aparate(stare[1]))


def exploreaza(varianta):
    """Parcurge în lățime toate stările accesibile din I0."""
    parinte = {I0: None}
    coada = deque([I0])
    tranzitii = {}
    while coada:
        s = coada.popleft()
        tranzitii[s] = evenimente(varianta, s)
        for ev, t in tranzitii[s]:
            if t not in parinte:
                parinte[t] = (ev, s)
                coada.append(t)
    return parinte, tranzitii


def secventa(parinte, s):
    pasi = []
    while parinte[s]:
        ev, s = parinte[s]
        pasi.append(ev)
    return list(reversed(pasi))


def are_ciclu(tranzitii):
    culoare = {}

    def vizita(s):
        culoare[s] = 1
        for _, t in tranzitii[s]:
            if culoare.get(t) == 1 or (t not in culoare and vizita(t)):
                return True
        culoare[s] = 2
        return False
    return vizita(I0)


def ciclu(tranzitii):
    """Un ciclu: cea mai scurtă secvență care se întoarce într-o stare accesibilă."""
    cel_mai_scurt = None
    for start in tranzitii:
        parinte = {}
        coada = deque([start])
        gasit = False
        while coada and not gasit:
            s = coada.popleft()
            for ev, t in tranzitii[s]:
                if t == start:
                    pasi = [ev]
                    while s != start:
                        ev2, s = parinte[s]
                        pasi.append(ev2)
                    pasi.reverse()
                    if cel_mai_scurt is None or len(pasi) < len(cel_mai_scurt[1]):
                        cel_mai_scurt = (start, pasi)
                    gasit = True
                    break
                if t not in parinte and t != start:
                    parinte[t] = (ev, s)
                    coada.append(t)
    return cel_mai_scurt


def raport(varianta):
    parinte, tranzitii = exploreaza(varianta)
    print(f'Varianta {varianta}: {len(parinte)} stări accesibile, '
          f'{sum(len(v) for v in tranzitii.values())} tranziții')
    rele = [s for s in parinte if not exclusiv(s)]
    print('  P1 (exclusivitate):', 'respectată în toate stările' if not rele else f'încălcată în {rele[0]}')
    atinsa = [s for s in parinte if finala(s)]
    print('  P2 (ambele Încheiate, accesibil):',
          'da, prin ' + ', '.join(secventa(parinte, atinsa[0])) if atinsa else 'nu')
    blocaje = [s for s in parinte if not tranzitii[s] and not finala(s)]
    if blocaje:
        for s in blocaje:
            print(f'  P3 (fără blocaj): încălcată în ({s[0]}, {s[1]}), prin', ', '.join(secventa(parinte, s)))
    else:
        print('  P3 (fără blocaj): respectată în toate stările')
    if are_ciclu(tranzitii):
        start, pasi = ciclu(tranzitii)
        print(f'  ciclu: din ({start[0]}, {start[1]}) prin', ', '.join(pasi))
    else:
        print('  ciclu: niciunul')
    return parinte, tranzitii


if __name__ == '__main__':
    for v in (sys.argv[1:] or ['V0', 'V1', 'V2', 'V3']):
        parinte, tranzitii = raport(v)
        if len(sys.argv) > 1:
            for s, ev in tranzitii.items():
                print(f'    ({s[0]}, {s[1]}):', '; '.join(f'{e} -> ({t[0]}, {t[1]})' for e, t in ev) or '—')
