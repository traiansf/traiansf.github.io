# Cursul 4 — ghid de predare și capturi pregătite

Prezentarea [04-domeniu.md](04-domeniu.md) are **30 de slide-uri cu tot cu copertă** și un plan de **100 de minute**. Se poate preda integral din slide-uri: fără instrument AI, browser suplimentar, execuție de cod sau fișe pentru studenți. Studenții lucrează pe hârtie și discută cu colegii. Nu revenim la estimarea uniformă de două minute pe slide.

## Parcurs

| Minute | Activitate | Spațiu protejat pentru studenți |
|---|---|---|
| 0–10 | Ce selectăm din domeniu; aceeași legendă, două fotografii. | 2 min: întrebare către clasă. |
| 10–35 | Identitate, fotografie și versiune; prima editare. | 8 min pentru schiță și comparație. |
| 35–60 | Vocabular, relații, ramuri, cardinalități și limite. | 8 min pentru reeditarea originalului. |
| 60–90 | Prompturi, analiză AI, revizuire, corecție și reprezentări. | 5 + 5 min pe fragmentele analistului AI; 4 + 4 min pe revizuire și decizie. |
| 90–100 | Transfer la piesă–reprezentație și încheiere. | 7 min exercițiu, 3 min sinteză. |

Începuturile etapelor sunt 0, 10, 35, 60 și 90; notele au marcaje de ritm, iar în etapa 60–90 fiecare slide are durata precizată, astfel încât ceasul de pe telefon să urmeze exact planul de mai sus. Duratele exercițiilor includ răspunsurile în plen. Dacă o discuție depășește timpul, comprimați explicațiile repetitive despre vocabular și reprezentare, nu exercițiul final; nu adăugați o excursie despre tipurile de grafuri.

## Pregătire

Citiți [enunțul](scenarios/04-fotografii/brief.md) și [referința](scenarios/04-fotografii/reference.md). Regulile sunt didactice; nu reprezintă observații despre un produs real. În tipologia cerințelor din cursul 3, R1–R5 sunt reguli ale domeniului, iar R6 este o limită a exercițiului, nu o cerință; S5 este o întrebare deschisă în sensul celor cinci tipuri de afirmații. Cazurile S1–S5 sunt etichetate pe slide-uri la prima apariție, înaintea capturilor. Versiunile sunt numerotate în toată arhiva, în ordinea creării; slide-ul 3 o spune, ca V2 să nu fie citit drept „a doua versiune a lui F1”. Identificatorii nu se schimbă: capturile AI proiectate folosesc aceleași nume. S2 reia explicit situația inițială, independent de schimbarea legendei din S1; S3 continuă S2. Toate datele necesare exercițiilor sunt pe slide-ul lăsat pe ecran. Diagrama ilustrează instanțe; tabelul de cardinalități exprimă modelul general.

Prompturile și răspunsurile provin din [rulări reale Claude Haiku 4.5 din 10.10.2026](scenarios/04-fotografii/captures/2026-10-10/README.md). Modelul este declarat de instrument, fără a pretinde un identificator de versiune mai precis. Se păstrează cinci încercări: două analize și trei revizuiri. Primele două revizuiri au avut diacriticele instrucțiunii deteriorate la transmiterea prin shell; sunt arhivate, dar nu selectate pentru prezentare. Revizuirea 03 folosește instrucțiunea corectă și include explicit și sarcina analistului AI.

## Capturile din prezentare

Numerotarea include coperta. Slide-ul 20 arată instrucțiunea exactă a analistului AI și identifică contextul; slide-urile 21–22 arată fragmente din analistul AI 02. Fragmentul de pe slide-ul 21 este corect. Slide-ul 22 pune alături „zero sau o Sursă”, compatibil cu R3–R4 dacă distingem originalul de derivate, și generalizarea excesivă de la ramuri la orice DAG. R4 și datele necesare contraexemplului sunt pe același slide. Cerem verdict, exemplu și regulă înainte de a arăta revizuirea.

Slide-ul 23 arată instrucțiunea exactă a evaluatorului (agent AI de revizuire), iar 24 un fragment din rularea 03: observația că un DAG admite mai mulți părinți. Studenții verifică predicția de pe slide-ul 23: fragmentul confirmă problema, dar nu numește limita „exact o sursă” din R4 și nici contraexemplul V6 construit pe slide-ul 22; legătura o adăugăm noi. Pasajul revizuirii despre „doi copaci independenți” rămâne în sursa integrală, dar nu este proiectat: aduce o problemă de citare care ar distrage discuția. Slide-ul 25 este explicit analiza profesorului și precizează că avem un arbore de versiuni pentru fiecare fotografie; 26 verifică aceeași regulă de apartenență în două reprezentări. Aceste slide-uri nu sunt răspunsuri AI.

În răspunsurile integrale există și observații secundare; nu este necesar să le citiți în timpul cursului. Nu transformați greșelile de limbă în obiectul demonstrației. Registrul `excerpts.json` indică sursa fiecărui fragment, iar README explică selecția și limitele capturilor.

## Repere pentru discuție

- La două legende egale, cereți să fie identificate ambele fotografii după schimbarea uneia dintre legende.
- La prima editare, cereți să fie arătate conținutul păstrat și relațiile noi: V3 aparține lui F1 și are sursa V1. F1 are încă o versiune; „nimic nu se schimbă” ar fi imprecis.
- La reeditarea originalului, întrebarea de pe slide este de ce V4 nu provine din V3: sursa este versiunea editată, nu cea mai recentă.
- La „orice DAG”, folosiți doar cazul unei derivate cu două surse; nu deduceți că analistul AI a greșit toate relațiile.
- La R6, separați excluderea din model de o interdicție a unei funcții într-un produs real. S4 încalcă R4; S5 rămâne o întrebare pentru extinderea modelului.
- În transferul final, studenții propun cardinalitățile din exemple: P8 arată zero reprezentații, P7 două; „o reprezentație prezintă o piesă” este susținut de date, dar o limită strictă ar fi de convenit cu teatrul. Nu transferăm relația de sursă: nu există în noul enunț.

După predare, notați unde discuția a avut nevoie de mai mult timp și ce idei au cerut reluare. Ajustăm selecția ideilor, fără a înghesui mai mult text în cele 30 de slide-uri.
