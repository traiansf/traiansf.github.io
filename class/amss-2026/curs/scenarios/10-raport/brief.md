# Enunț — raportul asociației

Exemplu didactic pentru Cursul 10, versiunea 24 noiembrie 2026. O asociație de voluntari exportă periodic raportul activităților. Registrul de activități, componenta pe care o proiectăm, oferă operația `exportă`.

## Reguli convenite

- **R1 — context:** raportul este o listă de înregistrări cu aceleași câmpuri, în aceeași ordine: voluntar, activitate, ore, telefon. Nu modelăm păstrarea datelor, trimiterea raportului sau valori pe mai multe rânduri.
- **R2 — ascundere:** coordonatorul poate marca unele câmpuri ca ascunse. Un câmp ascuns nu apare în niciun format: nici valoarea, nici numele lui.
- **R3 — text:** câte un rând pentru fiecare înregistrare, cu `nume: valoare` pentru fiecare câmp, separate prin `; `.
- **R4 — CSV:** primul rând conține numele câmpurilor, apoi câte un rând pentru fiecare înregistrare; valorile sunt separate prin virgulă; o valoare care conține virgulă sau ghilimele se scrie între ghilimele, iar ghilimelele din ea se dublează.
- **R5 — conținut comun:** toate formatele arată aceleași înregistrări și aceleași câmpuri vizibile, în aceeași ordine.

Beneficiarul a cerut numai formatele text și CSV; nu a anunțat altele.

## Variante de proiectare

- **V1 — condiție pe format:** o singură operație `exportă(raport, format)`, cu o condiție pe format; fiecare ramură ascunde câmpurile și scrie formatul ei. Exemplul de pe slide conține intenționat o abatere de la R2.
- **V2 — operații separate:** `vizibil(raport)` aplică ascunderea o singură dată; `text(v)` și `csv(v)` primesc numai conținutul vizibil; `exportă` alege între ele printr-o condiție.
- **V3 — interfață:** ca V2, dar `text` și `csv` sunt realizări ale interfeței Formator, cu operația `formatează(v)`; apelantul dă formatorul, iar `exportă(raport, f)` îl apelează.
- **V3′ — interfață cu raportul întreg:** `formatează(raport)` primește tot raportul și lista câmpurilor ascunse.

## Raportul D

Câmpul telefon este ascuns.

| voluntar | activitate | ore | telefon |
|---|---|---|---|
| Ana | sortare, etichetare | 3 | 0700001 |
| Dan | atelier "Stejarul" | 2 | 0700002 |

## Schimbări

- **C1 — format nou:** raportul se exportă și ca tabel Markdown.
- **C2 — ascundere parțială:** la câmpurile marcate „parțial” apar numai ultimele trei caractere ale valorii.
- **C3 — total:** la sfârșitul fiecărui format apare totalul orelor.
