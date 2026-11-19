# Cursul 4 — ghid de predare și capturi pregătite

Prezentarea [04-domeniu.md](04-domeniu.md) are **30 de slide-uri cu tot cu copertă** și un plan de **100 de minute**. Se poate preda integral din slide-uri: fără instrument AI, browser suplimentar, execuție de cod sau fișe pentru studenți. Studenții lucrează pe hârtie și discută cu colegii. Nu revenim la estimarea uniformă de două minute pe slide.

## Parcurs

| Minute | Activitate | Spațiu protejat pentru studenți |
|---|---|---|
| 0–10 | Ce selectăm din domeniu; aceeași legendă, două fotografii. | 2 min: întrebare către clasă. |
| 10–35 | Identitate, fotografie și versiune; prima editare. | 8 min pentru schiță și comparație. |
| 35–60 | Vocabular, relații, ramuri, cardinalități și limite. | 8 min pentru reeditarea originalului. |
| 60–90 | Aceleași fapte, două cereri către un asistent AI (clase, concepte); sortarea elementelor; reprezentări. | 3 + 3 + 4 min pe cele trei fragmente; 7 min pentru sortare. |
| 90–100 | Transfer la piesă–reprezentație și încheiere. | 7 min exercițiu, 3 min sinteză. |

Începuturile etapelor sunt 0, 10, 35, 60 și 90; notele au marcaje de ritm, iar în etapa 60–90 fiecare slide are durata precizată, astfel încât ceasul de pe telefon să urmeze exact planul de mai sus. Duratele exercițiilor includ răspunsurile în plen. Dacă o discuție depășește timpul, comprimați explicațiile repetitive despre vocabular și reprezentare, nu sortarea și nici exercițiul final.

## Pregătire

Citiți [enunțul](scenarios/04-fotografii/brief.md) și [referința](scenarios/04-fotografii/reference.md). Regulile sunt didactice; nu reprezintă observații despre un produs real. În tipologia cerințelor din cursul 3, R1–R5 sunt reguli ale domeniului, iar R6 este o limită a exercițiului, nu o cerință; S5 este o întrebare deschisă în sensul celor cinci tipuri de afirmații. Scenariile S1–S5 sunt etichetate pe slide-uri la prima apariție, înaintea capturilor. Versiunile sunt numerotate în toată arhiva, în ordinea creării; slide-ul 3 o spune, ca V2 să nu fie citit drept „a doua versiune a lui F1”. Identificatorii nu se schimbă: capturile AI proiectate folosesc aceleași nume. S2 reia explicit starea inițială, independent de schimbarea legendei din S1; S3 continuă S2. Toate datele necesare exercițiilor sunt pe slide-ul lăsat pe ecran. Diagrama ilustrează instanțe; tabelul de cardinalități exprimă modelul general.

## Segmentul AI: forma cererii modelează modelul

Lecția AI a cursului, după decizia din 19 noiembrie 2026 (fiecare curs are altă lecție despre AI, în alt format; vezi `docs/ai-lessons-and-lab-diagrams.md`): **cine cere clase primește și decizii de implementare; cine cere concepte, relații și cardinalități primește un model al domeniului.** Formatul: aceleași fapte, două cereri, două răspunsuri alăturate, iar studenții sortează elementele în „concept sau regulă a domeniului” și „decizie de implementare”. Nu căutăm o greșeală în răspuns.

Capturile sunt [rulări reale Claude Haiku 4.5 din 19.11.2026](scenarios/04-fotografii/captures/2026-11-19/README.md), prin Claude Code 2.1.328, fără unelte și fără contextul proiectului, câte un context nou pentru fiecare rulare; prompturile sunt și în [`scenarios/04-fotografii/ai/`](scenarios/04-fotografii/ai/README.md). Contextul conține R1–R5 și S1–S4, fără R6, a cărei ultimă propoziție interzice clasele. Trei rulări pentru fiecare cerere; efectul a apărut în toate, dar selecția nu descrie comportamentul tipic al modelului.

Numerotarea include coperta:

| Slide | Conținut | Minute |
|---|---|---|
| 19 | Tranziția „Ce cerem, aceea primim” (minutul 60). | 1 |
| 20 | Cele două cereri exacte și contextul comun; predicție individuală. | 3 |
| 21 | Cererea A, rularea 2: clasa `Versiune` (tipuri, `fotografie_id`, `sursa_id`, `None` pentru original). | 3 |
| 22 | Cererea A, aceeași rulare: clasa `Arhiva` (dicționare, contor, excepție). | 3 |
| 23 | Cererea B, rularea 3: relațiile și cardinalitățile, verificate pe S3. | 4 |
| 24 | Sortarea individuală a șase elemente: D, I sau „I pentru D”, apoi discuție. | 7 |
| 25 | Sortarea noastră și decizia: întâi concepte, apoi clase cu deciziile numite. | 3 |
| 26–27 | Două reprezentări; ce transmitem mai departe (neschimbate, cu o nouă linie despre deciziile de implementare). | 3 + 3 |

Sortarea de referință: tipurile identificatorilor, contorul, excepția și clasa `Arhiva` sunt decizii de implementare; `fotografie_id`/`sursa_id` și `None` pentru original implementează reguli ale domeniului (apartenența, sursa, originalul fără sursă); apartenența și sursa unică din răspunsul B sunt reguli ale domeniului (R2, R4); „Original”, prezentat de răspunsul B ca al treilea concept, este pentru noi rolul unei versiuni. Contorul contrazice enunțul complet (R6: identificatorii sunt deja disponibili), dar R6 nu a fost trimisă; nu îl prezentăm ca eroare a asistentului AI. Excepția pentru un identificator repetat răspunde la o întrebare pe care regulile nu o pun; legătura cu S5 (importul repetat) este o temă pentru discuție, nu o concluzie.

Capturile din [10.10.2026](scenarios/04-fotografii/captures/2026-10-10/README.md) (analist AI și evaluator (agent AI de revizuire), cu generalizarea „orice DAG”) rămân arhivate; prezentarea nu le mai folosește.

## Repere pentru discuție

- La două legende egale, cereți să fie identificate ambele fotografii după schimbarea uneia dintre legende.
- La prima editare, cereți să fie arătate conținutul păstrat și relațiile noi: V3 aparține lui F1 și are sursa V1. F1 are încă o versiune; „nimic nu se schimbă” ar fi imprecis.
- La reeditarea originalului, întrebarea de pe slide este de ce V4 nu provine din V3: sursa este versiunea editată, nu cea mai recentă.
- La sortare, cereți întâi răspunsuri pentru `fotografie_id`/`sursa_id`: relația este a domeniului, identificatorul păstrat este reprezentarea ei. Nu transformați sortarea într-o critică a codului; răspunsul A nu este greșit, ci amestecă deciziile cu regulile.
- La R6, separați excluderea din model de o interdicție a unei funcții într-un produs real. S4 încalcă R4; S5 rămâne o întrebare pentru extinderea modelului.
- În transferul final, studenții propun cardinalitățile din exemple: P8 arată zero reprezentații, P7 două; „o reprezentație prezintă o piesă” este susținut de date, dar o limită strictă ar fi de convenit cu teatrul. Nu transferăm relația de sursă: nu există în noul enunț.

După predare, notați unde discuția a avut nevoie de mai mult timp și ce idei au cerut reluare. Ajustăm selecția ideilor, fără a înghesui mai mult text în cele 30 de slide-uri.
