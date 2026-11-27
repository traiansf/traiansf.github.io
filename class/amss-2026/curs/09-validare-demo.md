# Cursul 9 — ghid de predare

[Prezentarea](09-validare.md) are **24 de slide-uri cu copertă**, dintre care trei pentru studiu individual, marcate pe slide („Instrumente pentru modele formale”, „Modelul scris pentru un instrument” și transferul), și un parcurs planificat de **86 de minute** din 100, cu 14 minute de rezervă. [Enunțul](scenarios/09-microscop/brief.md), [referința](scenarios/09-microscop/reference.md) și [modelul executabil](scenarios/09-microscop/model/explorare.py) cu [rezultatele rulărilor](scenarios/09-microscop/model/rezultate.txt) fixează regulile și răspunsurile. Toate datele folosite la curs apar pe slide-uri; nu sunt necesare calculatoare sau fișe pentru studenți și nu se rulează nimic în timpul cursului.

## Calibrare după cursul 8

La cursul 8 s-au parcurs 25 din 34 de slide-uri în 100 de minute (feedbackul titularului, 24 noiembrie 2026): 19 slide-uri de conținut (fără copertă, citat și tranziții), adică peste 5 minute pe slide, deși planul prevedea 80 de minute pentru ele. Cursul 9 are 15 slide-uri de conținut în plan (21 cu coperta, citatul și cele patru tranziții; plus trei de studiu individual), planificate la 86 de minute; la ritmul măsurat, de peste 5 minute pe slide, cele 14 minute de rezervă sunt necesare, nu un spațiu pentru conținut nou.

**Reper:** la minutul 46 ar trebui să fie încheiat slide-ul „Trei reparații”; etapa AI poate începe cel târziu la minutul 82 (planul o pune la 68). Dacă rezerva nu ajunge, ordinea tăierilor este: slide-ul „Modelul, privit formal” se citește, fără discuție (numai P4 și decizia); la „Dincolo de modelul explorat” rămâne numai întrebarea despre registrul de locuri; la „Rezultatul explorării” dăm noi răspunsul; la „Decizia noastră” citim, fără întrebare. Slide-urile de studiu individual se anunță și se sar. Nu tăiem explorarea pe hârtie, ciclul din V3 și rularea codului primit.

## Parcurs

| Minute | Activitate |
|---|---|
| 0–8 | Deschiderea: întrebarea de orientare și citatul (3); întrebarea deschisă despre erori apărute după verificări reușite (5). |
| 8–25 | Microscopul și camera: predicția (7); model, stare, execuție (5); cele trei proprietăți (5). |
| 25–68 | Explorarea pe hârtie (10); rezultatul (5); trei reparații (6); reverificarea (7); modelul privit formal, cu P4 și decizia (5); trei afirmații și validarea (3); dincolo de modelul explorat: anulări, registrul de locuri, date și condiții (7). Slide-ul „Instrumente pentru modele formale” este pentru studiu individual. |
| 68–86 | Lecția AI: cererea (3); cele două rapoarte (6); rularea codului (5); decizia: cine verifică verificatorul (4). Slide-ul „Modelul scris pentru un instrument” este pentru studiu individual. |
| 86–100 | Rezervă. Transferul (două grupuri, două săli) este pentru studiu individual; dacă rămân 5 minute, îl parcurgem în plen. |

## Distincțiile importante

**Stare și starea modelului:** din cursul 7, „stare” este etapa cu nume a unui obiect. Când modelul are mai multe obiecte, definim „starea modelului” pentru toate la un loc; slide-ul „Modelul: stare, eveniment, execuție” anunță că, de acolo înainte, „stare” fără altă precizare este starea modelului, iar despre o lucrare spunem „starea lucrării”. Finalizată este starea finală a unei lucrări; starea finală intenționată a modelului este (gata, gata). O **execuție** este o secvență de evenimente permise care pornește din starea inițială; un scenariu urmărește o singură execuție.

**Ce infirmă și ce stabilește:** P1 (exclusivitate) și P3 (fără blocaj) sunt infirmate de o stare accesibilă care le încalcă și stabilite numai de parcurgerea tuturor stărilor accesibile; P2 (finalizare posibilă) este stabilită de o execuție. De aici asimetria: un contraexemplu se verifică pas cu pas, absența lui nu. S1 și S2 trec împreună prin 12 dintre cele 13 stări ale lui V0; singura ocolită este blocajul.

**V0 (ordini diferite)** respectă P1 și P2 și încalcă P3: (M, C) este un blocaj, accesibil în doi pași; V0 are patru execuții complete, dintre care două se opresc în blocaj. **V1** și **V2** nu au blocaj și nu au cicluri, deci orice execuție se încheie (dacă se produce un eveniment cât timp unul este permis). **V3 (renunțare)** nu are blocaj, dar are un ciclu, pe care îl caută studenții: respectă P1–P3 și totuși nu garantează finalizarea; lipsea P4 (progres). Lecția: și lista de proprietăți se validează, cu beneficiarul.

**Cine garantează varianta:** ordinea în care o lucrare își ocupă aparatele este, în model, o presupunere despre lucrări. V1 devine o garanție a registrului numai dacă registrul verifică ordinea (refuză camera unei lucrări care nu are microscopul); V2 este a registrului prin operația `ocupă ambele`; V3 depinde de lucrări. Decizia de pe slide: V1 sau V2, cu regula aplicată de registru; explorarea nu alege între ele.

**Formal** înseamnă aici numai scris explicit; cele două slide-uri cerute de foaia de parcurs sunt „Modelul, privit formal” și „Trei afirmații, trei justificări”. **Verificarea** întreabă dacă modelul respectă proprietatea; **validarea**, dacă modelul și proprietățile sunt cele potrivite. Amândouă definițiile sunt pe al doilea slide. Nu predăm un instrument.

**Date și condiții:** registrul de locuri din cursul 8 are date (locuri libere, identificatori, înscrieri) și condiții pe evenimente; stările accesibile sunt infinit de multe, deci explorarea cere un model mărginit sau o abstracție, iar afirmația pentru orice n cere un argument de invariant. Slide-ul de studiu individual care urmează numește instrumentele (TLA+, SPIN, Alloy pentru explorare; Lean, Isabelle, Rocq pentru demonstrații); nu le predăm.

**Argumentul** pentru orice număr de lucrări și de aparate, cu o ordine comună: lucrarea cu ultimul aparat ocupat din ordine se poate finaliza sau găsește liber următorul. Îl dăm oral la „Trei afirmații, trei justificări”, studenții îl aplică la predicția etapei AI (ordinea comună M, C, L), iar pe slide apare la decizia etapei AI.

## Pregătirea AI și proveniența

Lecția AI (decizia din 19 noiembrie 2026): **verificare afirmată față de verificare executată**. Formatul: comparăm raportul scris cu rularea păstrată a codului primit.

Capturi reale Claude Haiku 4.5, prin Claude Code 2.1.332, la 27 noiembrie 2026 (seria rulată din nou după redenumirea în `finalizează` / Finalizată; seria din 24 noiembrie rămâne arhivată): șase rulări ale aceluiași prompt, fără unelte, în [arhivă](scenarios/09-microscop/captures/2026-11-27/README.md), cu codul extras neschimbat și ieșirile lui. Rularea 03 raportează, ca „Rezultat”, 27 de stări, 48 de tranziții și un blocaj printr-o secvență imposibilă (Z ocupă întâi M, deci nu poate ocupa L), fără niciun semn că nu a rulat nimic; codul ei, rulat, dă 42 și 62, verifică greșit P1 și tipărește secvența de blocaj ca text fix: la P1 are dreptate raportul, la P3 are dreptate codul. Rularea 01 nu dă rezultate („Rezultatele se raportează conform cererii”) și tipărește „P1 OK” fără verificare. Rularea 04 tipărește un „contraexemplu” pentru P1 care este o execuție corectă (în notele slide-ului „Rulăm codul primit”). Celelalte nu raportează rezultate, dar niciuna nu spune că nu a rulat codul. Selecția nu descrie comportamentul tipic al modelului AI; o spun notele tranziției.

Decizia etapei AI se citește ca „cine verifică verificatorul?”: un contraexemplu îl credem după ce îl refacem pe reguli; „nu există contraexemplu” al unui explorator, numai după ce i-am citit verificarea și l-am probat pe o variantă greșită; un argument în proză, numai după ce îl refacem noi. Slide-ul de studiu individual „Modelul scris pentru un instrument” propune alternativa (asistentul AI scrie modelul în TLA+, Promela sau Lean, noi citim codificarea și rulăm instrumentul) și spune ce se schimbă cu un agent AI care rulează cod: ieșirea poate fi reală, dar verifică tot ce a scris el. Nu am rulat o astfel de captură.

Enunțul cu trei lucrări și ordinea comună M, C, L nu are blocaj: 42 de stări accesibile, 62 de tranziții, confirmate de exploratorul nostru și de patru dintre cele șase programe primite (04 și 06 numără numai tranzițiile spre stări noi: 41). Cu ordinea L, M pentru Z, blocajul există și este găsit în trei pași: proba exploratorului pe o variantă greșită.

## Încheiere

Transferul (două grupuri, două săli), de studiu individual din 27 noiembrie 2026, pornește cu ambele grupuri afară, ca să rămână ceva de explorat: cere execuția care susține „ambele grupuri pot ieși” și ce stabilește ea, o stare accesibilă fără evenimente permise, cu deosebirea dintre blocaj și starea finală intenționată, apoi ce ar trebui rulat sau argumentat după trecerea la sens unic. Rezultatele sunt rulate (`model/muzeu.py`): 13 stări și un blocaj cu trasee opuse, 14 stări și niciun blocaj cu sens unic. După curs, notați dacă studenții spun „am verificat” pentru un scenariu și „nu există” pentru o explorare mărginită; folosiți observația la Laboratorul 5.

## Feedback aplicat

**24 noiembrie 2026 (titularul):** cursul 8 a fost prea încărcat; predare până la slide-ul 25 („Decizia noastră: varianta B”). Cursul 9 are mai puține slide-uri și exerciții mai lungi; a fost scris cu o reluare scurtă a auditului promisiunilor din cursul 8. Exercițiile au lucru individual și discuție cu toată clasa, fără lucru în pereche; regulile necesare sunt pe slide-urile care le folosesc, cu cuvintele-cheie ale enunțului.

**26 noiembrie 2026 (rundă de revizuire):** trei lecturi independente (consistența cu cursurile 4–8, studiul de caz și exercițiile, limba) și lectura proprie. Slide-ul „Ce evenimente sunt permise?” a fost contopit cu explorarea pe hârtie; „validare” și „verificare” sunt definite pe slide; întrebările la care slide-ul răspundea singur au fost înlocuite (în câte feluri se pot succeda evenimentele, câte scenarii reușite ar stabili P3, prin câte stări trec S1 și S2, cine face ceva în plus la fiecare reparație, cine are dreptate la P1 și la P3); transferul nu mai pornește din blocaj; R3 are aceeași formulare în enunț, pe slide-ul care introduce regulile și în enunțul trimis asistentului AI, iar rezumatele de pe slide-urile de lucru nu mai sunt telegrafice. Reverificarea independentă a textului revizuit a confirmat numerele și timpii; observațiile ei de formulare sunt aplicate.

**27 noiembrie 2026 (comentariile titularului, `curs/comentarii/09-validare.md`):** slide nou „Dincolo de modelul explorat: anulări și date”, cu întrebările mutate de la „Trei afirmații” și cu regulile registrului de locuri pe slide; discuție despre date și condiții pe tranziții; „Decizia noastră” devine „cine verifică verificatorul?”; două slide-uri noi de studiu individual (instrumente; modelul scris pentru un instrument și agenții AI care rulează cod); transferul devine studiu individual. „Ce proprietate lipsește?” este o întrebare separată; în tabelul rulărilor, ieșirile programelor sunt rezumate ca „respectată” / „încălcată” (textul tipărit rămâne în note), iar exploratorul nostru are rândul lui. La cererea titularului din aceeași zi, operația, regula și starea de la sfârșitul unei lucrări sunt `finalizează(l)`, R4 (finalizare), P2 (finalizare posibilă) și Finalizată; capturile au fost rulate din nou (seria din 27 noiembrie), iar etapa AI folosește rulările 03 și 01 (04 în note). Planul rămâne 86 de minute: +4 la etapa 25–68, +1 la decizie, −5 prin transfer.

**26 noiembrie 2026 (titularul), după rundă:** reluarea din cursul 8 a fost scoasă, fără alt conținut în loc: 21 de slide-uri, 86 de minute planificate și 14 minute de rezervă. Etapa AI nepredată a cursului 8 (slide-urile 26–34 ale prezentării publicate) rămâne pentru studiu individual.
