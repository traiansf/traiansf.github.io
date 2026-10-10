E?ti evaluator (agent AI de revizuire). Verific? propunerea de mai jos exclusiv fa?? de contextul furnizat. Identific? afirma?iile sus?inute, contradic?iile, omisiunile relevante ?i alegerile prezentate ca cerin?e. Pentru fiecare observa?ie, indic? fragmentul ?i regula sau scenariul relevant. Nu presupune c? trebuie s? existe gre?eli; dac? o afirma?ie este corect?, explic? de ce. Nu scrie cod. R?spunde ?n rom?n?, ?n maximum 400 de cuvinte.

CONTEXT

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


PROPUNERE DE VERIFICAT

# Model de domeniu pentru arhiva fotografică

## Concepte și identități

Modelul se construiește pe două entități cu identitate stabilă:

1. **Fotografie** – identificator immutable (F1, F2) care persistă de-a lungul ciclului vieții unui bun fotografic.
2. **Versiune** – identificator immutable (V1, V2, V3) care marchează o stare a conținutului la un moment dat.

Un atribut modificabil, **Legenda**, aparține numai Fotografiei, nu versiunilor. Legenda se poate schimba fără să afecteze versiunile sau identitatea fotografiei.

## Relații și structură

**Relația fotografie–versiune**: Fiecare Versiune aparține exact unei Fotografii (N:1). Fiecare Fotografie are cel puțin o Versiune (invariant din R2).

**Relația de derivare (sursă)**: Fiecare Versiune are zero sau o Sursă (relație recursivă). Originalul (sursa nulă) este unica Versiune creată la catalogare; pentru fiecare Fotografie există exact un original (R3). O Versiune derivată are o Sursă din aceeași Fotografie (R4).

**Rezultat structural**: Fiecare Fotografie definește o pădure de versiuni cu rădăcina în original. Doi copaci independenți (V3 și V4 din V1) nu sunt definiți; modelul permite orice orice configurație DAG cu original ca sursă indirectă.

## Restricții fundamentale

- **Stabilitate identificatori**: Schimbarea Legendei nu modifică F, V sau relații de derivare.
- **Unicitatea originalului**: Fiecare Fotografie are exact o Versiune fără Sursă.
- **Izolarea versiunilor**: O Versiune nouă nu rescrie existente; editarea creează entitate distinctă.
- **Coerență fotografie**: Sursa unei Versiuni trebuie să aparțină aceleiași Fotografii.

## Explicația scenariilor

**S1** (legenda F1 → „Dimineață"): Legenda este atribut al Fotografiei, separat de Versiuni. F1, V1 rămân nemodificate. ✓

**S2** (V1 → V3): Creez o Versiune nouă V3 cu Sursă=V1, ambele în Fotografia F1. Conținutul lui V1 nu se schimbă. ✓

**S3** (V1 → V4 după S2): Ambele V3 și V4 au Sursă=V1, aparțin lui F1, sunt distincte (identificatori diferiți). Relația recursivă permite multiple derivări din aceeași sursă. ✓

**S4** (V5 pentru F2, Sursă=V1 din F1): Restricția coerență fotografie interzice: V5.fotografie (F2) ≠ V1.fotografie (F1). ✗

## Alegeri de reprezentare vs. cerințe

**Cerință**: O Fotografie are exact un original.
- *Alegere 1*: Flag boolean `esOriginal` pe Versiune.
- *Alegere 2*: Relație dedicată Fotografie→OriginalVersion.
- Ambele satisfac cerința; modelul nu prescrie.

**Cerință**: Legenda se modă fără impact pe versiuni.
- *Alegere*: Legenda e atribut simplu, nu entitate.

**Cerință**: Versiuni derivate formează structuri complexe.
- *Alegere 1*: Sursă ca pointer simplu (V→V).
- *Alegere 2*: Mulțime de derivări (V→{V}).
- Modelul susține ambele; S3 NU cere ordin liniar.

Modelul este independent de persistență (baze de date, fișiere, structuri de date în memorie). Satisface toate regulile fără să prefieze reprezentări concrete.