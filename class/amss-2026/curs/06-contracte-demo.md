# Cursul 6 — ghid de predare

[Prezentarea](06-contracte.md) are **35 de slide-uri cu copertă** și un parcurs de **100 de minute**. [Enunțul](scenarios/06-dulapuri/brief.md) și [referința](scenarios/06-dulapuri/reference.md) fixează regulile și răspunsurile. Toate datele, regulile relevante și sarcinile folosite la curs apar pe slide-uri; nu sunt necesare calculatoare sau fișe pentru studenți.

## Parcurs

| Minute | Activitate |
|---|---|
| 0–15 | Orientare, citatul, întrebarea deschisă despre refuzuri întâlnite de studenți (5 min), problema, două registre finale pentru același refuz (exercițiu înainte de terminologie); ce descrie un contract. |
| 15–30 | Regulile registrului; precondiție, postcondiție, condiție de succes și invariant; clasificarea afirmațiilor. |
| 30–55 | Contractele atribuirii și eliberării, efectul limitat, repetarea. |
| 55–80 | Pseudocod greșit, două contraexemple trasate manual, corecție și conservarea unicității; limitele verificării; contracte scrise lângă cod (JML și alte notații) și legătura cu `assert`. |
| 80–95 | Verificare circulară: contractul și testele cerute unui asistent AI din pseudocodul greșit, față de cele cerute din reguli; scenariul care le separă și, pe slide separat, decizia noastră. |
| 95–100 | Transfer la truse și tehnicieni. |

Duratele exercițiilor includ discuția. În etapa 30–55, acordați 7 minute atribuirii, 8 scenariilor, 4 eliberării și repetării, 6 contractului incomplet. Marcajul de 6 minute de pe ultimul slide al etapei privește numai activitatea de pe acel slide. În etapa 55–80, acordați 8 minute trasării, 3 corecției, 6 conservării, 3 limitelor, 2 notațiilor și 3 discuției despre `assert`; notațiile doar se menționează, fără a cere sintaxa lor. Tranzițiile sunt incluse în intervale.

## Distincțiile importante

Identificatorii cunoscuți, registrul valid și apelurile secvențiale sunt precondițiile, adică contextul în care se aplică promisiunea. „Vizitator fără dulap și dulap liber” este condiția de succes a operației publice: ocuparea trebuie să producă un refuz specificat. Dacă am muta această condiție doar în precondiție, am retrage tocmai promisiunea cerută pentru dulapurile ocupate. Slide-ul menționează și alternativa cu câte un contract pentru fiecare caz, unde condiția intră în precondiția cazului; în curs folosim un singur contract, iar la contracte separate trebuie verificat că împreună acoperă toate apelurile admise.

O stare este validă dacă respectă toți invarianții; slide-ul invariantului definește termenul, iar înainte de el spunem „respectă R2”. R2 (unicitate) descrie o stare validă; R3–R5 (atribuire, eliberare, efect limitat) descriu relația dintre starea inițială, rezultatul întors și starea finală. Un refuz care pierde V1–D1 poate păstra unicitatea și totuși încălca contractul. La succes, „V3 are D3” nu exclude pierderea lui V2–D2; de aceea precizăm efectul exact și păstrarea restului.

S1–S4 și S6 repornesc independent din B = {V1–D1, V2–D2}, cu V3 fără dulap și D3 liber. S5 are două eliberări succesive: prima întoarce `eliberat`, a doua `fără_dulap`; starea după fiecare este {V2–D2}. Repetarea aceleiași atribuiri este refuzată, potrivit condiției de succes, chiar dacă asocierea cerută există deja. Alte reguli sunt posibile în alte enunțuri, dar nu le introducem tacit aici.

Trasarea pseudocodului greșit este manuală, nu un jurnal de execuție. Studenții caută singuri cele două contraexemple din B: `atribuie(V1,D2)` întoarce refuz, dar șterge V1–D1; `atribuie(V1,D3)` întoarce atribuit și mută vizitatorul pe D3, deși contractul cere refuz. Corecția decide înainte de modificare. Argumentul este limitat la apelurile secvențiale și absența întreruperilor tehnice din enunț.

## Pregătirea AI și proveniența

**Lecția AI a cursului (decizia din 19 noiembrie 2026, `docs/ai-lessons-and-lab-diagrams.md`): verificarea circulară.** Un contract sau niște teste scrise după cod descriu ce face codul, cu tot cu defect: confirmă implementarea, nu o verifică. Formatul: „cine a verificat pe cine?” — contractul și testele obținute din operația greșită, față de cele obținute din reguli, și scenariul care le separă. Nu mai folosim perechea analist–evaluator (agent AI de revizuire).

Prezentarea folosește **capturi reale** Claude Haiku 4.5, obținute la 19 noiembrie 2026 prin Claude Code 2.1.328, fără unelte și fără contextul proiectului, fiecare încercare într-un context nou; [arhiva cererii A](scenarios/06-dulapuri/captures/2026-11-19/README.md) și [arhiva cererii B](scenarios/06-dulapuri/captures/2026-11-19b/README.md) păstrează prompturile exacte, contextele, răspunsurile integrale, metadatele și toate încercările. [Prompturile pregătite](scenarios/06-dulapuri/ai/README.md) rămân sursa pentru capturi noi. Capturile din 27 octombrie 2026 (analist și evaluator) rămân arhivate, neschimbate.

**Cererea A** dă asistentului AI unicitatea, B și pseudocodul greșit din etapa 55–80, fără R3, și îi cere contractul și cinci teste. **Cererea B** are aceeași instrucțiune, cu regulile R1–R5 în locul pseudocodului. Am rulat patru încercări A și trei B (cererea B a fost rulată din nou după redenumirea rezultatului `fără_dulap` din R4; prima serie B, cu `fara_dulap`, rămâne arhivată). Am ales încercarea A 02: condiția de succes cere numai ca dulapul să fie „liber la momentul verificării”, postcondiția refuzului spune că asocierea anterioară a vizitatorului este eliminată, iar toate cele cinci teste trec pe operația greșită; testul 4 (`atribuie(V1,D2)`, `refuz`, {V2–D2}) este chiar contraexemplul trasat la minutul 55, scris ca rezultat așteptat. Toate cele patru încercări A omit „v nu are dulap” și cer mutarea lui V1 pe D3; celelalte trei scriu însă că refuzul lasă registrul identic, deși codul nu îl lasă, iar încercarea 03 are un test care ar pica pe cod. Selecția nu descrie comportamentul tipic al modelului. Din cererea B am ales încercarea 01 a seriei noi (celelalte două sunt la fel de corecte): condiția de succes este completă, iar testele 2 și 4 cer `refuz` cu B neschimbat, deci pică pe operația greșită.

Discuția nu reproșează modelului răspunsul A: a descris corect pseudocodul. Lecția privește sursa așteptărilor: rezultatul așteptat se scrie din enunț și din contract, nu din implementarea verificată. Scenariile care separă cele două contracte: S3 (diferă rezultatul întors) și S4 (diferă registrul de după). Notele tranziției fac legătura cu slide-ul „Ce poate și ce nu poate stabili o verificare?”. Pseudocodul trasat în etapa 55–80 rămâne exemplu didactic construit; pe slide-ul „Contractul scris din cod” este rupt pe mai multe rânduri ca să încapă alături, cu același text.

## Încheiere și calibrare

Transferul la truse folosește regulile explicit date, nu presupune că toate domeniile au aceeași regulă la repetare. La repetarea aceluiași împrumut, noul enunț cere `deja_imprumutat` fără modificări; muzeul cere refuz. Același invariant de unicitate permite ambele reguli, dar nu le stabilește. La laborator, distincția se reia cu cantități. După curs, notați dacă studenții confundă încă condiția de succes cu precondiția; folosiți acea observație pentru ritmul laboratorului.

## Feedback aplicat

Fiecare exercițiu și fiecare fragment AI reia pe același slide regulile necesare, în propoziții întregi; la prima apariție dintr-un slide, identificatorii poartă cuvintele-cheie din enunț: R1 (context), R2 (unicitate), R3 (atribuire), R4 (eliberare), R5 (efect limitat). Ramurile unui contract se numesc cazuri („cazul de refuz”); „ramură” rămâne pentru scenariile independente. Decizia asupra capturilor AI are slide propriu, după ce studenții au comparat cele două contracte.

Studenții nu prea lucrează în pereche nici când li se cere (observație din 6 noiembrie 2026). De aceea exercițiile au lucru individual și discuție cu toată clasa, iar timpul lucrului în pereche a trecut la discuție. Cursul are și o întrebare deschisă, după citat, legată de experiența studenților.
