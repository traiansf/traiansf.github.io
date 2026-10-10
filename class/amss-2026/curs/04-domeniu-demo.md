# Cursul 4 — ghid de predare și capturi pregătite

Prezentarea [04-domeniu.md](04-domeniu.md) are **30 de slide-uri cu tot cu copertă** și un plan de **100 de minute**. Se poate preda integral din slide-uri: fără instrument AI, browser suplimentar, execuție de cod sau fișe pentru studenți. Studenții lucrează pe hârtie și discută cu colegii. Nu revenim la estimarea uniformă de două minute pe slide.

## Parcurs

| Minute | Activitate | Spațiu protejat pentru studenți |
|---|---|---|
| 0–15 | Ce selectăm din domeniu; aceeași legendă, două fotografii. | 7 min: reflecție, pereche, discuție. |
| 15–35 | Identitate, fotografie și versiune; prima editare. | 8 min pentru schiță și comparație. |
| 35–60 | Vocabular, relații, cardinalități, ramuri și limite. | 8 min pentru reeditarea originalului. |
| 60–90 | Prompturi, analiză AI, revizuire, corecție și reprezentări. | 5 + 5 min pe fragmentele analistului AI; 4 + 4 min pe revizuire și decizie. |
| 90–100 | Transfer la piesă–reprezentație și încheiere. | 7 min exercițiu, 3 min sinteză. |

Începuturile etapelor sunt 0, 15, 35, 60 și 90; notele au marcaje de ritm. Duratele exercițiilor includ răspunsurile în plen. Dacă o discuție depășește timpul, comprimați explicațiile repetitive despre vocabular și reprezentare, nu exercițiul final; nu adăugați o excursie despre tipurile de grafuri.

## Pregătire

Citiți [enunțul](scenarios/04-fotografii/brief.md) și [referința](scenarios/04-fotografii/reference.md). Regulile sunt didactice; nu reprezintă observații despre un produs real. Cazurile S1–S4 sunt redate pe slide-uri înaintea capturilor. Toate datele necesare exercițiilor sunt pe slide-ul lăsat pe ecran. Diagrama ilustrează instanțe; tabelul de cardinalități exprimă modelul general.

Prompturile și răspunsurile provin din [rulări reale Claude Haiku 4.5 din 10.10.2026](scenarios/04-fotografii/captures/2026-10-10/README.md). Modelul este declarat de instrument, fără a pretinde un identificator de versiune mai precis. Se păstrează cinci încercări: două analize și trei revizuiri. Primele două revizuiri au avut diacriticele instrucțiunii deteriorate la transmiterea prin shell; sunt arhivate, dar nu selectate pentru prezentare. Revizuirea 03 folosește instrucțiunea corectă și include explicit și sarcina analistului AI.

## Capturile din prezentare

Numerotarea include coperta. Slide-ul 20 arată instrucțiunea exactă a analistului AI și identifică contextul; slide-urile 21–22 arată fragmente din analistul AI 02. Primul fragment este corect, al doilea generalizează excesiv de la ramuri la orice DAG. Cerem verdict, exemplu și regulă înainte de a arăta revizuirea.

Slide-ul 23 arată instrucțiunea exactă a evaluatorului (agent AI de revizuire), iar 24 un fragment din rularea 03. Revizuirea recunoaște cele două ramuri pornite din V1. Studenții verifică observația și limita de o sursă. Slide-ul 25 este explicit analiza profesorului; 26 compară două reprezentări ale modelului corectat. Aceste slide-uri nu sunt output AI.

În răspunsurile integrale există și observații secundare; nu este necesar să le citiți în timpul cursului. Nu transformați greșelile de limbă în obiectul demonstrației. Registrul `excerpts.json` indică sursa fiecărui fragment, iar README explică selecția și limitele capturilor.

## Repere pentru discuție

- La două legende egale, cereți să fie identificate ambele fotografii după schimbarea uneia dintre legende.
- La prima editare, cereți să fie arătate conținutul păstrat și relația nouă, nu un nume de clasă.
- La reeditarea originalului, întrebați de ce V4 nu trebuie să provină din V3.
- La „orice DAG”, folosiți doar cazul unei derivate cu două surse; nu deduceți că analistul AI a greșit toate relațiile.
- În transferul final, piesa are zero sau mai multe reprezentații, fiecare reprezentație exact o piesă. Nu transferăm relația de sursă: nu există în noul enunț.

După predare, notați unde discuția a avut nevoie de mai mult timp și ce idei au cerut reluare. Ajustăm selecția ideilor, fără a înghesui mai mult text în cele 30 de slide-uri.
