# Cursul 9 — ghid de predare

[Prezentarea](09-validare.md) are **26 de slide-uri cu copertă** și un parcurs de **100 de minute**. [Enunțul](scenarios/09-microscop/brief.md), [referința](scenarios/09-microscop/reference.md) și [modelul executabil](scenarios/09-microscop/model/explorare.py) cu [rezultatele rulate](scenarios/09-microscop/model/rezultate.txt) fixează regulile și răspunsurile. Toate datele folosite la curs apar pe slide-uri; nu sunt necesare calculatoare sau fișe pentru studenți și nu se rulează nimic în timpul cursului.

## Calibrare după cursul 8

La cursul 8 s-au parcurs 25 din 34 de slide-uri în 100 de minute (feedbackul titularului, 24 noiembrie 2026): 19 slide-uri de conținut (fără copertă, citat și tranziții), adică peste 5 minute pe slide, deși planul prevedea 80 de minute pentru ele. Cursul 9 are tot 19 slide-uri de conținut (26 cu coperta, citatul și cele cinci tranziții), pentru 100 de minute. Dacă întârzie, ordinea tăierilor este: rândul 5 al exercițiului „Ce evenimente sunt permise?”, punctele 2–3 de la „Trei afirmații, trei justificări”, apoi slide-ul „Modelul, privit formal” (se citește, fără discuție). Nu tăiați explorarea pe hârtie și rularea codului primit.

## Parcurs

| Minute | Activitate |
|---|---|
| 0–8 | Orientare, citatul, întrebarea deschisă despre erori apărute după verificări reușite (5 min). |
| 8–22 | Reluarea etapei AI nepredate a cursului 8, pe scurt: promisiunile 1–2 (5), promisiunile 3–4 (5), decizia (4). |
| 22–42 | Microscopul și camera: predicția (6), model, stare, execuție (5), cele trei proprietăți (4), evenimente permise (5). |
| 42–78 | Explorarea pe hârtie (8), rezultatul (5), trei reparații (5), reverificarea (7), modelul privit formal (5), trei afirmații și limitele lor (6). |
| 78–95 | Lecția AI: cererea (3), cele două rapoarte (6), rularea codului (5), decizia (3). |
| 95–100 | Transfer la două grupuri și două săli. |

## Reluarea din cursul 8

Titularul a ales o reluare de circa 15 minute: auditul promisiunilor, fără slide-urile despre atomicitate și fără transferul la tipografie, care rămân pentru studiu individual în prezentarea publicată a cursului 8 (slide-urile 30–34). Fragmentele sunt cele din cursul 8, din [seria din 20 noiembrie 2026](scenarios/08-inscrieri/captures/2026-11-20/README.md); regulile necesare sunt pe slide-uri. Răspunsurile: promisiunea 1 este a registrului (fără „imediat”); promisiunea 2 nu o garantează nimeni; promisiunea 3 este a registrului în partea despre loc și a registrului împreună cu site-ul în partea despre răspuns; promisiunea 4 este a registrului în „rămâneți înscris” și a operatorului centrului în „echipa noastră va încerca din nou”. Puntea spre cursul 9: „registrul garantează niciun loc în plus” este o afirmație despre orice secvență de cereri; cum o verificăm?

## Distincțiile importante

**Stare și starea modelului:** din cursul 7, „stare” este etapa cu nume a unui obiect. Când modelul are mai multe obiecte, spunem mereu „starea modelului” pentru toate la un loc. O **execuție** este o secvență de evenimente permise din starea inițială; un scenariu urmărește o singură execuție.

**Ce infirmă și ce stabilește:** P1 (exclusivitate) și P3 (fără blocaj) sunt infirmate de o stare accesibilă și stabilite numai de toate; P2 (încheiere posibilă) este stabilită de o execuție. De aici asimetria: un contraexemplu se verifică pas cu pas, absența lui nu.

**V0 (ordini diferite)** respectă P1 și P2 și încalcă P3: (M, C) este un blocaj, atins în doi pași. **V1** și **V2** nu au blocaj și nu au cicluri, deci orice execuție se încheie (dacă se produce un eveniment cât timp unul este permis). **V3 (renunțare)** nu are blocaj, dar are un ciclu, pe care îl caută studenții: respectă P1–P3 și totuși nu garantează încheierea; lipsea P4 (progres). Lecția: și lista de proprietăți se validează, cu beneficiarul.

**Formal** înseamnă aici numai scris explicit; cele două slide-uri cerute de foaia de parcurs sunt „Modelul, privit formal” și „Trei afirmații, trei justificări”. **Verificarea** întreabă dacă modelul respectă proprietatea; **validarea**, dacă modelul și proprietățile sunt cele potrivite. Nu predăm un instrument.

## Pregătirea AI și proveniența

Lecția AI (decizia din 19 noiembrie 2026): **verificare afirmată față de verificare executată**. Formatul: comparăm raportul scris cu rularea păstrată a codului primit.

Capturi reale Claude Haiku 4.5, prin Claude Code 2.1.331, la 24 noiembrie 2026: șase rulări ale aceluiași prompt, fără unelte, în [arhivă](scenarios/09-microscop/captures/2026-11-24/README.md), cu codul extras neschimbat și ieșirile lui. Rularea 02 raportează un blocaj printr-o secvență imposibilă (Z cere întâi M, deci nu poate ocupa L), iar codul ei, rulat, infirmă raportul și conține o verificare greșită a lui P1. Rularea 06 scrie „Testez exploratorul” și raportează „OK”, corect, fără să fi rulat ceva. Celelalte patru nu raportează rezultate inventate. Selecția nu descrie comportamentul tipic al modelului; o spun notele tranziției.

Enunțul cu trei lucrări și ordinea comună M, C, L nu are blocaj: 42 de stări accesibile, 62 de tranziții, confirmate de exploratorul nostru și de cinci dintre cele șase programe primite (al șaselea numără greșit tranzițiile). Cu ordinea L, M pentru Z, blocajul există și este găsit în trei pași: proba exploratorului pe o variantă greșită.

## Încheiere

Transferul (două grupuri, două săli) cere starea, evenimentele permise, deosebirea blocaj–stare finală și ce ar trebui arătat pentru „ambele grupuri pot ieși”. După curs, notați dacă studenții spun „am verificat” pentru un scenariu și „nu există” pentru o explorare mărginită; folosiți observația la Laboratorul 5.

## Feedback aplicat

**24 noiembrie 2026 (titularul):** cursul 8 a fost prea încărcat; predare până la slide-ul 25 („Decizia noastră: varianta B”). Cursul 9 reia pe scurt auditul promisiunilor și are mai puține slide-uri și exerciții mai lungi. Exercițiile au lucru individual și discuție cu toată clasa, fără lucru în pereche; regulile necesare sunt pe slide-urile care le folosesc, cu cuvintele-cheie ale enunțului.
