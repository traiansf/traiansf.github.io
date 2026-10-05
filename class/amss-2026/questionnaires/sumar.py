#!/usr/bin/env python3
"""Rezumă răspunsurile exportate din Google Forms pentru chestionarele AMSS.

Utilizare:
    python3 questionnaires/sumar.py initial <export.csv>
    python3 questionnaires/sumar.py final <export.csv>

Exportul (File → Download → CSV în foaia de răspunsuri) are pe prima linie
textul întrebărilor; coloanele se potrivesc după acest text cu definiția
formularului din `initial.csv` sau `final.csv`, iar identificatorii vin din
`mapping.json`. Scriptul afișează, în Markdown, distribuțiile pe categorii și
numărul de răspunsuri pentru fiecare întrebare. Nu afișează răspunsurile
libere: acelea se citesc separat și se rezumă pe teme, fără citate care ar
putea identifica un student. Exportul brut nu se publică și nu se adaugă în
repository.
"""

import csv
import json
import os
import statistics
import sys

AICI = os.path.dirname(os.path.abspath(__file__))

# Formularul publicat poate folosi altă formulare decât definiția din CSV
# (de exemplu, treapta „independent” a scalei K1–K6). Orice valoare care
# conține cheia este numărată la opțiunea definită care conține aceeași cheie.
ALIASURI = ["independent"]

# Răspunsul de referință al scenariilor D1–D3 (vezi README.md): indexul
# opțiunii, de la 0.
REFERINTA = {"D1": 1, "D2": 1, "D3": 2}

# Scalele ordonate: opțiunile de la prima la penultima sunt trepte crescătoare,
# ultima („Nu pot aprecia”) nu intră în mediană.
SCALE = {"K1", "K2", "K3", "K4", "K5", "K6"}


def citeste_definitia(nume):
    cale = os.path.join(AICI, nume + ".csv")
    with open(cale, newline="", encoding="utf-8-sig") as f:
        randuri = list(csv.reader(f))
    with open(os.path.join(AICI, "mapping.json"), encoding="utf-8") as f:
        ids = json.load(f)[nume]
    intrebari = []
    for ident, r in zip(ids, randuri[1:]):
        text, _desc, tip = r[0], r[1], r[2]
        optiuni = [o for o in r[4:] if o.strip()]
        intrebari.append((ident, text, tip, optiuni))
    return intrebari


def citeste_exportul(cale):
    with open(cale, newline="", encoding="utf-8-sig") as f:
        randuri = list(csv.reader(f))
    antet = [h.strip() for h in randuri[0]]
    return antet, randuri[1:]


def potriveste(valoare, optiuni):
    """Opțiunea definită căreia îi corespunde o valoare din export."""
    valoare = valoare.strip()
    if valoare in optiuni:
        return valoare
    for cheie in ALIASURI:
        if cheie in valoare:
            for o in optiuni:
                if cheie in o:
                    return o
    return None


def desparte(valoare, optiuni):
    """Desparte o selecție multiplă exportată ca „a, b, c”.

    Opțiunile pot conține virgule, de aceea se consumă textul potrivind
    întâi opțiunile cele mai lungi."""
    rest = valoare.strip()
    alese = []
    while rest:
        for o in sorted(optiuni, key=len, reverse=True):
            if rest.startswith(o):
                alese.append(o)
                rest = rest[len(o):].lstrip(", ").strip()
                break
        else:
            alese.append("(nerecunoscut) " + rest)
            break
    return alese


def rezuma(nume, cale):
    intrebari = citeste_definitia(nume)
    antet, date = citeste_exportul(cale)
    n = len(date)
    print(f"# Chestionarul {nume}: {n} răspunsuri\n")
    print(f"Export: `{os.path.basename(cale)}`. Omisiunile nu sunt răspunsuri greșite.\n")
    for ident, text, tip, optiuni in intrebari:
        if text not in antet:
            print(f"## {ident} — {text}\n\nColoana lipsește din export.\n")
            continue
        col = antet.index(text)
        valori = [r[col] if col < len(r) else "" for r in date]
        raspunse = [v for v in valori if v.strip()]
        print(f"## {ident} — {text}\n")
        if tip == "PARAGRAPH":
            print(f"Răspuns liber: {len(raspunse)} din {n} au răspuns. Se rezumă separat, pe teme.\n")
            continue
        numar = {o: 0 for o in optiuni}
        nerecunoscute = []
        pe_respondent = []
        for v in raspunse:
            alese = desparte(v, optiuni) if tip == "CHECKBOX" else [v]
            pe_respondent.append(len(alese))
            for a in alese:
                o = potriveste(a, optiuni)
                if o is None:
                    nerecunoscute.append(a)
                else:
                    numar[o] += 1
        print(f"Au răspuns: {len(raspunse)} din {n}.", end="")
        if tip == "CHECKBOX" and pe_respondent:
            print(f" Selecții pe respondent: {min(pe_respondent)}–{max(pe_respondent)}.", end="")
        print("\n")
        print("| Opțiune | Răspunsuri |\n|---|---:|")
        for i, o in enumerate(optiuni):
            semn = " *(referință)*" if REFERINTA.get(ident) == i else ""
            print(f"| {o}{semn} | {numar[o]} |")
        if nerecunoscute:
            print(f"| (valori nerecunoscute) | {len(nerecunoscute)} |")
        if ident in SCALE:
            trepte = optiuni[:-1]
            niveluri = [trepte.index(potriveste(v, optiuni)) for v in raspunse
                        if potriveste(v, optiuni) in trepte]
            if niveluri:
                med = statistics.median(niveluri)
                print(f"\nTrepte 0–{len(trepte) - 1} (prima opțiune = 0); mediana {med:g}; "
                      f"la treapta „independent” sau peste: {sum(x >= 3 for x in niveluri)} din {len(niveluri)}.")
        if nerecunoscute:
            print("\nValori nerecunoscute (verificați formularea din formular):")
            for v in sorted(set(nerecunoscute)):
                print(f"- {v}")
        print()


def main():
    if len(sys.argv) != 3 or sys.argv[1] not in ("initial", "final"):
        print(__doc__)
        sys.exit(2)
    rezuma(sys.argv[1], sys.argv[2])


if __name__ == "__main__":
    main()
