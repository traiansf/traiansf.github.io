Propune un model de domeniu pentru regulile de mai jos: concepte, identități, relații și restricții. Explică prin S1–S4 cum susține modelul regulile. Separă alegerile de reprezentare de cerințe. Nu scrie cod și nu impune o notație. Răspunde în română, în maximum 450 de cuvinte.

CONTEXТ

# Arhiva fotografică — enunț pentru Cursul 4

Scenariu didactic. O arhivistă dorește să catalogheze fotografii și versiunile rezultate din editare. Vrea să poată schimba legenda și să compare editări fără să piardă originalul. Modelăm informația relevantă, nu programul de prelucrare a imaginilor.

## Reguli convenite

- **R1 — Fotografie:** fiecare fotografie are un identificator stabil și o legendă modificabilă. Fotografii distincte pot avea aceeași legendă. Schimbarea legendei nu creează o altă fotografie.
- **R2 — Versiune:** fiecare versiune are un identificator propriu și aparține exact unei fotografii. O fotografie catalogată are cel puțin o versiune. Conținutul unei versiuni existente nu se suprascrie prin editare.
- **R3 — Original:** la catalogarea unei fotografii se creează versiunea sa originală. Fiecare fotografie are exact un original, care se păstrează. Originalul nu are o versiune-sursă în arhivă.
- **R4 — Editare:** editarea oricărei versiuni existente creează o versiune nouă a aceleiași fotografii și îi păstrează legătura cu versiunea-sursă. Fiecare versiune derivată are exact o sursă, din aceeași fotografie. Putem edita de două ori originalul, obținând două variante independente; nu este obligatoriu un lanț liniar sau editarea ultimei versiuni. Sursa trebuie să existe înaintea noii versiuni.
- **R5 — Păstrare:** o editare nu mută versiuni între fotografii, nu schimbă legenda și nu modifică versiunile existente. Schimbarea legendei nu modifică identificatorii sau conținutul versiunilor. Operațiile sunt tratate pe rând.
- **R6 — Limite:** sunt excluse ștergerea, albumele, drepturile de acces, formatul fișierelor, stocarea fizică, detectarea fișierelor identice și algoritmii de editare. Identificatorii sunt deja disponibili; nu proiectăm generarea lor. Nu cerem clase, tabele de baze de date sau o notație anume.

## Date și situații

Inițial există F1 și F2, ambele cu legenda „Curte”. F1 are doar originalul V1; F2 are doar originalul V2. V1 și V2 au conținuturi diferite. Fiecare situație pornește independent de aici, dacă nu se precizează altfel.

- **S1:** legenda lui F1 devine „Dimineață”. F2 rămâne „Curte”; fotografiile și versiunile își păstrează identitatea.
- **S2:** din V1 se creează V3 printr-o editare. V1 se păstrează; V3 aparține lui F1 și are sursa V1.
- **S3:** după S2, o altă editare a lui V1 creează V4. V3 și V4 au aceeași sursă V1, sunt distincte și aparțin lui F1.
- **S4:** cineva propune o versiune V5 a lui F2, cu sursa V1 a lui F1. R4 nu permite această asociere.
- **S5:** se importă din nou același fișier. Comportamentul importului repetat nu este convenit prin aceste reguli; nu deducem identitatea fotografiei din egalitatea fișierelor.

Pentru discuție distingem identitatea, atributele, relațiile și restricțiile asupra lor. Un model de domeniu selectează conceptele care explică regulile; nu este automat proiectarea claselor sau a bazei de date.
