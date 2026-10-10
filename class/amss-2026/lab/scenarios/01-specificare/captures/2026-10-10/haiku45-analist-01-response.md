# Analiza pilotului de programare a mașinilor de spălat

## Concepte fundamentale

Pilotul permite locatarilor cu identitate verificată să rezerve intervale de timp pe două mașini (Albastra, Verdea) într-o zi D, între 08:00–22:00. Regula de bază: **două programări confirmate pe aceeași mașină nu se pot suprapune**, dar o poate începe exact când se termină cealaltă. Dacă două cereri simultane pe mașina liberă se suprapun, una se confirmă (cu cod de programare), cealaltă se respinge pentru conflict. Doar titularul unei programări o poate anula înainte de start, eliberând intervalul.

## Rezultatele scenariilor

**S2 — Radu cere Albastra 10:30–11:30 (cu Ioana 10:00–11:00 deja confirmată)**
- Rezultat: **RESPINGERE** (conflict pe aceeași mașină)
- Sursa: F4 — intervalele se suprapun în perioada 10:30–11:00

**S3 — Radu cere Albastra 11:00–12:00 (cu Ioana 10:00–11:00 deja confirmată)**
- Rezultat: **CONFIRMARE**
- Sursa: F4 — „o programare poate începe exact când se termină alta"

**S5 — Ioana și Radu cer simultan Albastra 13:00–14:00 (liberă)**
- Rezultat: **Una se confirmă, una se respinge** (care? nedecis)
- Sursa: F5 — ambele cereri sunt valide, mașina e liberă, dar regulile de prioritate nu sunt convenite
- **Întrebare deschisă: Q1 pe care dintre cereri are prioritate?**

**S8 — Ioana cere Verdea 10:30–11:30 (cu programarea ei Albastra 10:00–11:00 confirmată)**
- Mașini diferite: F4 nu se aplică (nu privește aceeași mașină)
- Rezultat: **Depinde de răspunsul la Q1**
- **Întrebare deschisă: Q1 — poate un locatar avea programări suprapuse pe mașini diferite?**

## Regulile convenite vs. întrebări deschise

**Convenite:** Non-suprapunere pe aceeași mașină (F4), conflict la cereri simultane (F5), anulare de titular (F6), validare orar și interval (F3).

**Deschise:**
- **Q1:** Suprapunere pe mașini diferite pentru același locatar
- **Q2:** Anulare la/după ora de început
- **Q3:** Limite viitoare (durată max, număr de programări, avans)

Beneficiarul trebuie să decidă asupra Q1 înainte ca S8 și S5 să aibă rezultate garantate.