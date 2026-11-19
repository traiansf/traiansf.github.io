Descrie conceptele arhivei fotografice de mai jos, relațiile dintre ele și cardinalitatea fiecărei relații. Răspunde în română, în maximum 300 de cuvinte.

CONTEXT

# Arhiva fotografică

O arhivistă catalogează fotografii și versiunile rezultate din editare. Vrea să poată schimba legenda și să compare editări fără să piardă originalul.

## Reguli convenite

- **R1 — Fotografie:** fiecare fotografie are un identificator stabil și o legendă modificabilă. Fotografii distincte pot avea aceeași legendă. Schimbarea legendei nu creează o altă fotografie.
- **R2 — Versiune:** fiecare versiune are un identificator propriu și aparține exact unei fotografii. O fotografie catalogată are cel puțin o versiune. Conținutul unei versiuni existente nu se suprascrie prin editare.
- **R3 — Original:** la catalogarea unei fotografii se creează versiunea sa originală. Fiecare fotografie are exact un original, care se păstrează. Originalul nu are o versiune-sursă în arhivă.
- **R4 — Editare:** editarea oricărei versiuni existente creează o versiune nouă a aceleiași fotografii și îi păstrează asocierea cu versiunea-sursă. Fiecare versiune derivată are exact o sursă, din aceeași fotografie. Putem edita de două ori originalul, obținând două derivate distincte cu aceeași sursă; nu este obligatoriu un lanț liniar sau editarea ultimei versiuni. Sursa trebuie să existe înaintea noii versiuni.
- **R5 — Păstrare:** o editare păstrează legenda fotografiei și, pentru versiunile existente, conținutul, identitatea, apartenența și sursa. Fotografia capătă o versiune nouă, iar versiunea editată devine sursa acesteia. Schimbarea legendei nu modifică versiunile sau relațiile dintre ele. Operațiile sunt tratate pe rând.

## Date și scenarii

Inițial există F1 și F2, ambele cu legenda „Curte”. F1 are doar originalul V1; F2 are doar originalul V2. V1 și V2 au conținuturi diferite. Versiunile sunt numerotate în ordinea creării, în toată arhiva, nu pentru fiecare fotografie.

- **S1:** legenda lui F1 devine „Dimineață”. F2 rămâne „Curte”; fotografiile și versiunile își păstrează identitatea.
- **S2:** pornind din nou din starea inițială, din V1 se creează V3 printr-o editare. Conținutul lui V1 și legenda „Curte” a lui F1 se păstrează; V3 aparține lui F1 și are sursa V1.
- **S3:** după S2, o altă editare a lui V1 creează V4. V3 și V4 au aceeași sursă V1, sunt distincte și aparțin lui F1.
- **S4:** cineva propune o versiune V5 a lui F2, cu sursa V1 a lui F1. R4 nu permite această asociere.
