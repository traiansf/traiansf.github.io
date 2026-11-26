# Cursul 9 — ghid de predare

[Prezentarea](09-validare.md) are **25 de slide-uri cu copertă** și un parcurs de **100 de minute**. [Enunțul](scenarios/09-microscop/brief.md), [referința](scenarios/09-microscop/reference.md) și [modelul executabil](scenarios/09-microscop/model/explorare.py) cu [rezultatele rulărilor](scenarios/09-microscop/model/rezultate.txt) fixează regulile și răspunsurile. Toate datele folosite la curs apar pe slide-uri; nu sunt necesare calculatoare sau fișe pentru studenți și nu se rulează nimic în timpul cursului.

## Calibrare după cursul 8

La cursul 8 s-au parcurs 25 din 34 de slide-uri în 100 de minute (feedbackul titularului, 24 noiembrie 2026): 19 slide-uri de conținut (fără copertă, citat și tranziții), adică peste 5 minute pe slide, deși planul prevedea 80 de minute pentru ele. Cursul 9 are 18 slide-uri de conținut (25 cu coperta, citatul și cele cinci tranziții), pentru 100 de minute; planul nu are rezervă.

**Reper:** la minutul 60 ar trebui să fie încheiat slide-ul „Trei reparații”. Dacă apar întârzieri, ordinea tăierilor este: slide-ul „Modelul, privit formal” se citește, fără discuție (numai P4 și decizia); la „Trei afirmații, trei justificări” rămâne numai întrebarea despre registrul de locuri, care încheie reluarea din cursul 8; la „Rezultatul explorării” dăm noi răspunsul; la „Decizia noastră” citim; la transfer rămân întrebările 1 și 2, iar a treia rămâne pentru studiu individual. Nu tăiem explorarea pe hârtie, ciclul din V3 și rularea codului primit. Etapa AI începe cel târziu la minutul 80.

## Parcurs

| Minute | Activitate |
|---|---|
| 0–14 | Reluarea etapei AI nepredate a cursului 8, pe scurt: promisiunile 1–2 (5); promisiunile 3–4 (5); decizia (4). |
| 14–22 | Deschiderea cursului 9: întrebarea de orientare și citatul (3); întrebarea deschisă despre erori apărute după verificări reușite (5). |
| 22–39 | Microscopul și camera: predicția (7); model, stare, execuție (5); cele trei proprietăți (5). |
| 39–78 | Explorarea pe hârtie (10); rezultatul (5); trei reparații (6); reverificarea (7); modelul privit formal, cu P4 și decizia (5); trei afirmații și validarea (6). |
| 78–95 | Lecția AI: cererea (3); cele două rapoarte (6); rularea codului (5); decizia (3). |
| 95–100 | Transfer la două grupuri și două săli. |

## Reluarea din cursul 8

Titularul a ales o reluare de 14 minute: auditul promisiunilor, fără slide-urile despre atomicitate și fără transferul la tipografie, care rămân pentru studiu individual în prezentarea publicată a cursului 8 (slide-urile 30–34). Reluarea stă la început, înaintea deschiderii cursului 9 (runda de revizuire din 26 noiembrie 2026): se încheie cu întrebarea „cum verificăm?”, la care răspund tranziția, citatul și tot cursul. De aceea deschiderea obișnuită (întrebare de orientare, citat, întrebare deschisă, exemplu, concept) începe la minutul 14 și are opt minute până la exemplu.

Fragmentele sunt cele din cursul 8, din [seria din 20 noiembrie 2026](scenarios/08-inscrieri/captures/2026-11-20/README.md); regulile necesare sunt pe slide-uri. Răspunsurile: promisiunea 1 este a registrului (fără „imediat”); promisiunea 2 nu o garantează nimeni; promisiunea 3 este a registrului în partea despre loc și a registrului împreună cu site-ul în partea despre răspuns; promisiunea 4 este a registrului în „rămâneți înscris” și a operatorului centrului în „echipa noastră va încerca din nou”.

Reluarea este folosită de trei ori mai târziu: la „Trei reparații” (cine garantează ordinea: registrul sau lucrările?), la „Trei afirmații, trei justificări” (registrul de locuri nu dă niciodată un loc în plus) și la decizia etapei AI („verificat” fără rulare este ca o garanție fără garant).

## Distincțiile importante

**Stare și starea modelului:** din cursul 7, „stare” este etapa cu nume a unui obiect. Când modelul are mai multe obiecte, definim „starea modelului” pentru toate la un loc; slide-ul „Modelul: stare, eveniment, execuție” anunță că, de acolo înainte, „stare” fără altă precizare este starea modelului, iar despre o lucrare spunem „starea lucrării”. Încheiată este starea finală a unei lucrări; starea finală intenționată a modelului este (gata, gata). O **execuție** este o secvență de evenimente permise care pornește din starea inițială; un scenariu urmărește o singură execuție.

**Ce infirmă și ce stabilește:** P1 (exclusivitate) și P3 (fără blocaj) sunt infirmate de o stare accesibilă care le încalcă și stabilite numai de parcurgerea tuturor stărilor accesibile; P2 (încheiere posibilă) este stabilită de o execuție. De aici asimetria: un contraexemplu se verifică pas cu pas, absența lui nu. S1 și S2 trec împreună prin 12 dintre cele 13 stări ale lui V0; singura ocolită este blocajul.

**V0 (ordini diferite)** respectă P1 și P2 și încalcă P3: (M, C) este un blocaj, accesibil în doi pași; V0 are patru execuții complete, dintre care două se opresc în blocaj. **V1** și **V2** nu au blocaj și nu au cicluri, deci orice execuție se încheie (dacă se produce un eveniment cât timp unul este permis). **V3 (renunțare)** nu are blocaj, dar are un ciclu, pe care îl caută studenții: respectă P1–P3 și totuși nu garantează încheierea; lipsea P4 (progres). Lecția: și lista de proprietăți se validează, cu beneficiarul.

**Cine garantează varianta:** ordinea în care o lucrare își ocupă aparatele este, în model, o presupunere despre lucrări. V1 devine o garanție a registrului numai dacă registrul verifică ordinea (refuză camera unei lucrări care nu are microscopul); V2 este a registrului prin operația `ocupă ambele`; V3 depinde de lucrări. Decizia de pe slide: V1 sau V2, cu regula aplicată de registru; explorarea nu alege între ele.

**Formal** înseamnă aici numai scris explicit; cele două slide-uri cerute de foaia de parcurs sunt „Modelul, privit formal” și „Trei afirmații, trei justificări”. **Verificarea** întreabă dacă modelul respectă proprietatea; **validarea**, dacă modelul și proprietățile sunt cele potrivite. Amândouă definițiile sunt pe al doilea slide. Nu predăm un instrument.

**Argumentul** pentru orice număr de lucrări și de aparate, cu o ordine comună: lucrarea cu ultimul aparat ocupat din ordine poate încheia sau găsește liber următorul. Îl dăm oral la „Trei afirmații, trei justificări”, studenții îl aplică la predicția etapei AI (ordinea comună M, C, L), iar pe slide apare la decizia etapei AI.

## Pregătirea AI și proveniența

Lecția AI (decizia din 19 noiembrie 2026): **verificare afirmată față de verificare executată**. Formatul: comparăm raportul scris cu rularea păstrată a codului primit.

Capturi reale Claude Haiku 4.5, prin Claude Code 2.1.331, la 24 noiembrie 2026: șase rulări ale aceluiași prompt, fără unelte, în [arhivă](scenarios/09-microscop/captures/2026-11-24/README.md), cu codul extras neschimbat și ieșirile lui. Rularea 02 raportează un blocaj printr-o secvență imposibilă (Z ocupă întâi M, deci nu poate ocupa L), iar codul ei, rulat, contrazice raportul și conține o verificare greșită a lui P1: la P1 are dreptate raportul, la P3 are dreptate codul. Rularea 06 scrie „Testez exploratorul” și raportează „OK”, corect, fără să fi rulat ceva. Celelalte patru nu raportează rezultate inventate, dar niciuna nu spune că nu a rulat codul. Selecția nu descrie comportamentul tipic al modelului AI; o spun notele tranziției.

Enunțul cu trei lucrări și ordinea comună M, C, L nu are blocaj: 42 de stări accesibile, 62 de tranziții, confirmate de exploratorul nostru și de cinci dintre cele șase programe primite (al șaselea numără greșit tranzițiile). Cu ordinea L, M pentru Z, blocajul există și este găsit în trei pași: proba exploratorului pe o variantă greșită.

## Încheiere

Transferul (două grupuri, două săli) pornește cu ambele grupuri afară, ca să rămână ceva de explorat: cere execuția care susține „ambele grupuri pot ieși” și ce stabilește ea, o stare accesibilă fără evenimente permise, cu deosebirea dintre blocaj și starea finală intenționată, apoi ce ar trebui rulat sau argumentat după trecerea la sens unic. Rezultatele sunt rulate (`model/muzeu.py`): 13 stări și un blocaj cu trasee opuse, 14 stări și niciun blocaj cu sens unic. După curs, notați dacă studenții spun „am verificat” pentru un scenariu și „nu există” pentru o explorare mărginită; folosiți observația la Laboratorul 5.

## Feedback aplicat

**24 noiembrie 2026 (titularul):** cursul 8 a fost prea încărcat; predare până la slide-ul 25 („Decizia noastră: varianta B”). Cursul 9 reia pe scurt auditul promisiunilor și are mai puține slide-uri și exerciții mai lungi. Exercițiile au lucru individual și discuție cu toată clasa, fără lucru în pereche; regulile necesare sunt pe slide-urile care le folosesc, cu cuvintele-cheie ale enunțului.

**26 noiembrie 2026 (rundă de revizuire):** trei lecturi independente (consistența cu cursurile 4–8, studiul de caz și exercițiile, limba) și lectura proprie. Reluarea a trecut la început; slide-ul „Ce evenimente sunt permise?” a fost contopit cu explorarea pe hârtie (25 de slide-uri); „validare” și „verificare” sunt definite pe slide; întrebările la care slide-ul răspundea singur au fost înlocuite (în câte feluri se pot succeda evenimentele, câte scenarii reușite ar stabili P3, prin câte stări trec S1 și S2, cine face ceva în plus la fiecare reparație, cine are dreptate la P1 și la P3); transferul nu mai pornește din blocaj; R3 are aceeași formulare în enunț, pe slide-ul care introduce regulile și în enunțul trimis asistentului AI, iar rezumatele de pe slide-urile de lucru nu mai sunt telegrafice. Reverificarea independentă a textului revizuit a confirmat numerele și timpii; observațiile ei de formulare sunt aplicate.
