"""Variantele V1-V3 ale exportului din Cursul 10, rulate pe raportul D.

Utilizare: python export.py
Nu are dependențe; ieșirea este aceeași la fiecare rulare. V1 conține
intenționat o abatere de la R2 (ascundere), căutată de studenți pe slide.
"""
from dataclasses import dataclass


@dataclass
class Raport:
    campuri: list
    ascunse: set
    inregistrari: list


D = Raport(
    campuri=['voluntar', 'activitate', 'ore', 'telefon'],
    ascunse={'telefon'},
    inregistrari=[
        {'voluntar': 'Ana', 'activitate': 'sortare, etichetare', 'ore': '3', 'telefon': '0700001'},
        {'voluntar': 'Dan', 'activitate': 'atelier "Stejarul"', 'ore': '2', 'telefon': '0700002'},
    ])


def citat(valoare):
    if ',' in valoare or '"' in valoare:
        return '"' + valoare.replace('"', '""') + '"'
    return valoare


# V1: condiție pe format; fiecare ramură ascunde câmpurile
def exporta_v1(r, format):
    if format == 'text':
        linii = ['; '.join(f'{c}: {i[c]}' for c in r.campuri if c not in r.ascunse)
                 for i in r.inregistrari]
    else:
        linii = [','.join(r.campuri)]
        linii += [','.join(citat(i[c]) for c in r.campuri if c not in r.ascunse)
                  for i in r.inregistrari]
    return '\n'.join(linii)


# Comun lui V2 și V3: R2 (ascundere), o singură dată
def vizibil(r):
    campuri = [c for c in r.campuri if c not in r.ascunse]
    return campuri, [[i[c] for c in campuri] for i in r.inregistrari]


def text(v):
    campuri, randuri = v
    return '\n'.join('; '.join(f'{c}: {x}' for c, x in zip(campuri, rand)) for rand in randuri)


def csv(v):
    campuri, randuri = v
    return '\n'.join(','.join(citat(x) for x in rand) for rand in [campuri] + randuri)


# V2: operații separate, alese printr-o condiție
def exporta_v2(r, format):
    v = vizibil(r)
    if format == 'text':
        return text(v)
    return csv(v)


# V3: interfața Formator, cu o realizare pentru fiecare format
class FormatorText:
    def formateaza(self, v):
        return text(v)


class FormatorCSV:
    def formateaza(self, v):
        return csv(v)


def exporta_v3(r, formator):
    v = vizibil(r)
    return formator.formateaza(v)


if __name__ == '__main__':
    for nume, f in [('V1, text', lambda: exporta_v1(D, 'text')), ('V1, csv', lambda: exporta_v1(D, 'csv')),
                    ('V2, text', lambda: exporta_v2(D, 'text')), ('V2, csv', lambda: exporta_v2(D, 'csv')),
                    ('V3, text', lambda: exporta_v3(D, FormatorText())),
                    ('V3, csv', lambda: exporta_v3(D, FormatorCSV()))]:
        print('---', nume)
        print(f())
