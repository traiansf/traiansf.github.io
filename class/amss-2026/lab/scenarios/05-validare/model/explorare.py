"""Explorarea modelului din Laboratorul 5 (biletele de ordine de la secretariat).

Utilizare: python explorare.py [regula] [capacitate]
  regula: sosire | prioritari | doi_la_rand | limita   (fără argument: toate)
  capacitate: câte bilete pot aștepta simultan (implicit 3)
Nu are dependențe; fiecare rulare dă același rezultat.

O stare a modelului: biletele care așteaptă, în ordinea sosirii, fiecare cu
felul lui (o = obișnuit, p = prioritar) și numărul de depășiri, oprit la 3
(„3 sau mai multe”), plus câți prioritari au fost chemați la rând (numai
pentru regulile din CU_SERIE).
Evenimente: sosește(o), sosește(p) când mai este loc; cheamă() când așteaptă
cel puțin un bilet. Un bilet este depășit când este chemat un bilet sosit
după el.
Proprietatea A3: niciun bilet nu este depășit de mai mult de două ori.
"""
import sys
from collections import deque

LIMITA = 2


def prioritar_intai(coada):
    for i, (fel, _) in enumerate(coada):
        if fel == 'p':
            return i
    return 0


def sosire(coada, serie):
    return 0


def prioritari(coada, serie):
    return prioritar_intai(coada)


def doi_la_rand(coada, serie):
    """Cel mult doi prioritari la rând, apoi un obișnuit, dacă așteaptă vreunul."""
    if serie >= 2:
        for i, (fel, _) in enumerate(coada):
            if fel == 'o':
                return i
    return prioritar_intai(coada)


def limita(coada, serie):
    """Registrul aplică limita: cel mai vechi bilet, depășit de două ori, trece întâi."""
    if coada[0][1] >= LIMITA:
        return 0
    return prioritar_intai(coada)


REGULI = {'sosire': sosire, 'prioritari': prioritari, 'doi_la_rand': doi_la_rand, 'limita': limita}
# Regulile care folosesc argumentul serie (câți prioritari au fost chemați la rând).
CU_SERIE = {'doi_la_rand'}


def evenimente(regula, stare, capacitate):
    """Întoarce lista (eveniment, stare următoare) a evenimentelor permise."""
    coada, serie = stare
    rezultat = []
    if len(coada) < capacitate:
        for fel in 'op':
            rezultat.append((f'sosește({fel})', (coada + ((fel, 0),), serie)))
    if coada:
        i = REGULI[regula](coada, serie)
        fel = coada[i][0]
        noua = tuple((f, min(d + 1, LIMITA + 1)) if j < i else (f, d)
                     for j, (f, d) in enumerate(coada) if j != i)
        serie_noua = 0
        if regula in CU_SERIE:
            serie_noua = min(serie + 1, 2) if fel == 'p' else 0
        rezultat.append((f'cheamă()={fel}', (noua, serie_noua)))
    return rezultat


def exploreaza(regula, capacitate):
    """Parcurge în lățime toate stările accesibile din coada goală."""
    start = ((), 0)
    parinte = {start: None}
    coada = deque([start])
    tranzitii = 0
    while coada:
        s = coada.popleft()
        for ev, t in evenimente(regula, s, capacitate):
            tranzitii += 1
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


def raport(regula, capacitate):
    parinte, tranzitii = exploreaza(regula, capacitate)
    print(f'{regula}, cel mult {capacitate} bilete: {len(parinte)} stări accesibile, {tranzitii} tranziții')
    rele = [s for s in parinte if any(d > LIMITA for _, d in s[0])]
    if rele:
        print('  A3 (așteptare limitată): încălcată, prin', ', '.join(secventa(parinte, rele[0])))
        print('    rămân:', ', '.join(f'{f} depășit de {d}' for f, d in rele[0][0]))
    else:
        print('  A3 (așteptare limitată): respectată; depășiri maxime:',
              max((d for s in parinte for _, d in s[0]), default=0))


if __name__ == '__main__':
    reguli = [sys.argv[1]] if len(sys.argv) > 1 else list(REGULI)
    capacitate = int(sys.argv[2]) if len(sys.argv) > 2 else 3
    for r in reguli:
        raport(r, capacitate)
