# Laboratorul 2 — ghid pentru profesor

**100 de minute, după cursurile 3–4; 15 slide-uri cu copertă.** Prima jumătate exersează cerințe, identitate, relații și verificarea modelului prin exemple, în perechi sau trio, cu schimbarea colegului care propune și a celui care cere justificări (formatul predat la 21 octombrie 2026, scurtat). A doua jumătate este etapa diagramei (decizia din 19 noiembrie 2026): fiecare student desenează modelul ca **diagramă de clase conceptuală**, de mână, în Mermaid sau generată cu un asistent AI și verificată; la jumătate verificăm în plen diagrama unui voluntar, iar la sfârșit comparăm diagrama convenită cu referința. Nu există predare obligatorie, încărcare, rubrică de documente sau notă separată pentru această activitate.

Materiale: [prezentare](02-modelare.md), [enunț](scenarios/02-modelare/scenario.md), [specificația diagramei](diagrame/clase-conceptuale.md), [referință](scenarios/02-modelare/reference.md), [sprijin facultativ pentru discuție](scenarios/02-modelare/worksheet.md). Enunțul și specificația pot fi consultate pe calculator sau tipărite. Pentru prima jumătate, hârtia și conversația sunt suficiente; pentru a doua, hârtia rămâne suficientă, iar Mermaid sau un asistent AI sunt opționale. Nu rezervăm timp pentru configurări.

Etapa AI condusă de profesor (o analiză și o revizuire în plen, cu capturile Claude Haiku 4.5 din 10 octombrie 2026) a fost scoasă din prezentare la 19 noiembrie 2026. [Capturile pregătite](scenarios/02-modelare/prepared-fixture.md) și [arhiva](scenarios/02-modelare/captures/2026-10-10/README.md) rămân neschimbate; sunt utile pentru exemplul identificatorului (cod vizită + ordine) dacă apare la etapa diagramei.

Pe slide-uri și în discuție numim a doua jumătate „etapa diagramei”, nu „atelier”, ca să nu se confunde cu atelierul de reparații.

## Ritmul întâlnirii

| Minute | Slide-uri | Activitate | Intervenția profesorului |
|---|---|---|---|
| 0–10 | 2–4 | Ce modelăm azi și planul celor două jumătăți, citatul, recapitularea din cursul 4. | Fără exercițiu; întrebați clasa ce își amintește din lista cursului 4. |
| 10–17 | 5–6 | Comparația A17/A18 și J1–J3, în perechi. | Cereți un exemplu de informație pierdută și o întrebare pentru organizatori. |
| 17–31 | 7 | Regulile și schița în perechi, cu roluri schimbate (J1–J2, apoi J3). | „De ce este responsabilul legat aici?” |
| 31–42 | 8 | Perechea B citește schița perechii A pe stările A19, P1/P3, J4; apoi invers. | Colegii care nu au desenat schița interpretează primii. |
| 42–50 | 9 | Schimbarea R4: doi responsabili; două exemple de acceptare. | Cereți cardinalitatea care se schimbă și ce rămâne. |
| 50–55 | 10–11 | Sarcina diagramei; fiecare deschide specificația și își alege modul de lucru. | Amintiți că un desen fără erori nu este o verificare. |
| 55–71 | 12 | Lucru individual, cu lista de verificare pe ecran. | Treceți printre bănci; alegeți unul sau doi voluntari. |
| 71–87 | 13 | Verificarea în plen a diagramei unui voluntar, apoi corecturi individuale. | Un coleg citește diagrama ca propoziții; clasa verifică pe listă. |
| 87–95 | 14 | Diagrama convenită, comparația cu referința, întrebarea despre schimbarea R4. | Arătați referința după ce clasa a convenit corecturile. |
| 95–100 | 15 | Încheiere: ce stare sau ce verificare a schimbat o diagramă. | Două sau trei răspunsuri, fără prezentări formale. |

Dacă prima jumătate întârzie, scurtați schimbarea R4 la o singură cerere (adăugarea Ioanei la J2, respinsă), păstrând cardinalitatea; nu tăiați din etapa diagramei sub 40 de minute.

## Modelul de referință

Raționamentul și diagrama sunt în [referință](scenarios/02-modelare/reference.md). Pe scurt: aparatul este un lucru fizic cu identitate stabilă; vizita este o ocazie distinctă în istoricul lui; problema raportată aparține vizitei și nu este un diagnostic; responsabilul se asociază vizitei, nu aparatului (R5). Cardinalități: aparat → vizite `0..*`, vizită → aparat `1` (R2); vizită → probleme `1..*`, problemă → vizită `1` (R3); vizită → responsabil `0..1`, voluntar → vizite `0..*` (R4).

La înregistrarea J2 pentru A17, J1, P1 și asocierea J1–Mara rămân; J2 are P2 și Radu. P1 nu se copiază automat. J3 pentru A18 poate exista fără responsabil. P1 și P3 sunt distincte, deși textele coincid. Nu deducem că A17 și A18 sunt același aparat din modelul comun T2, nici că doi voluntari sunt aceeași persoană din nume.

În prima jumătate sunt acceptabile cuvinte, tabele sau schițe libere; notația UML vine abia în a doua. „Original” și relația de sursă de la cursul 4 nu se transferă aici. Nu cereți scheme SQL, operații cu pre/postcondiții sau teoria responsabilităților din cursul 5.

La comparația între perechi, B alege una dintre stările afișate și o explică folosind schița lui A. A ascultă, apoi clarifică. Verificați sensul relațiilor, nu convenția grafică. La starea A19, modelul trebuie să admită un aparat înregistrat fără vizite (R2); la starea J4, două probleme distincte pentru aceeași vizită.

## Schimbarea R4

La minutul 42 organizatorii schimbă R4: orice vizită poate avea zero, unul sau doi responsabili. Se schimbă cardinalitatea vizită → voluntari; voluntar → vizite rămâne zero sau mai multe.

| Starea inițială | Cine cere ce | Rezultatul observabil |
|---|---|---|
| J1–Mara; J2–Radu | Un organizator cere adăugarea Marei la J2 | Acceptată: J1–Mara; J2–Mara și Radu. |
| J1–Mara; J2–Mara și Radu | Un organizator cere adăugarea Ioanei (M3) la J2 | Respinsă: asocierile ambelor vizite se păstrează. |

Respingerea nu elimină un responsabil pentru a face loc altuia. Întrebări pentru organizatori: răspund amândoi de tot sau fiecare de o parte? Cine poate retrage un responsabil? Diagrama din a doua jumătate modelează R4 inițial; schimbarea revine pe slide-ul referinței: `0..1` devine `0..2`, nimic altceva.

## Etapa diagramei

**Ce primesc studenții:** enunțul și [specificația](diagrame/clase-conceptuale.md): întrebările la care răspunde diagrama, elementele UML folosite (clasă, atribut, relație, cardinalitate, nume de rol, generalizare, notă), notația Mermaid cu limitele ei, lista de verificare, erorile frecvente, un exemplu rezolvat (un club de drumeții) cu un contraexemplu derivat spre implementare și un prompt sugerat. Specificația folosește vocabularul cursului 4: **relație** pentru linia dintre clase (UML: *association*), **asociere** pentru o instanță, **cardinalitate** (UML: *multiplicity*).

**Cum lucrează:** fiecare alege. De mână, pornind de la schița din prima jumătate; direct în Mermaid; sau cu un asistent AI, căruia îi dă enunțul complet și specificația. Diagrama generată se verifică pe listă, față de enunț; o diagramă desenată fără erori nu spune nimic despre corectitudine. Nu impunem un instrument și nu cerem conturi AI.

**Puncte de control:**

- **Minutul 55:** toți au început; cine nu știe de unde să pornească desenează întâi cele patru clase și relația aparat–vizită.
- **Minutul 65:** alegeți voluntarii; de preferință o diagramă de mână și una generată, sau două diagrame care diferă la o cardinalitate.
- **Minutul 71:** verificarea în plen. Un coleg citește diagrama ca propoziții, în ambele sensuri; clasa parcurge lista; autorul confirmă sau corectează. Dacă nu se oferă nimeni, verificați o diagramă scrisă de dumneavoastră cu o greșeală tipică (problema ca atribut al vizitei).
- **Minutul 87:** clasa convine corecturile; abia apoi arătați referința.

**Ce urmăriți (greșeli ale studenților):**

- problema raportată ca atribut text al vizitei sau al aparatului (pierde P1/P3 și J4);
- responsabilul legat de aparat (pierde J1–Mara la J2);
- o singură cardinalitate pe linie, sau citită invers (`1` lângă Vizită pentru „o vizită privește un aparat”);
- `1..*` între aparat și vizite (exclude A19);
- `id`, `aparatId`, `createdAt`, tipuri `String`, o clasă `VizitaVoluntar`;
- clase pentru organizatori, proprietari sau piese (R6);
- operații (`adaugăProblemă()`), care aparțin Laboratorului 3.

**Ce urmăriți la diagramele generate cu AI:** chei străine și identificatori tehnici, tipuri, compoziție UML în locul cardinalității, clase din R6, un cod al problemei raportate prezentat ca cerință (R3 nu îl impune; vezi capturile din 10 octombrie), citate din enunț care nu spun ce li se atribuie, cardinalități corecte în text, dar inversate în sursa Mermaid. Lăudați și ce este corect, cu regula lui: nu căutăm obligatoriu o greșeală.

**Limitele Mermaid** (detalii în specificație): un singur nume pe relație, fără roluri separate la capete; cardinalitățile sunt scrise mărunt și se pot suprapune; secțiunea operațiilor apare goală; notele se leagă numai de clase. În Mermaid 12, eticheta unui capăt poate fi acoperită de o cutie: în diagrama de referință de pe slide, câteva caractere invizibile (U+2800) după primul `0..*` o mută la vedere.

Încheiați cu exemple din două sau trei răspunsuri: o stare care a arătat o relație greșită, o corectură făcută după verificare, o sugestie AI acceptată sau respinsă. Notați pentru pregătirea următoare dificultățile recurente. Nu colectați diagrame sau fișe; ele rămân studenților.

## Varianta online

[Prezentarea online](02-modelare-online.md) păstrează slide-urile, stările, specificația și timpii de mai sus, pentru o întâlnire Teams în care toți vorbesc în plen, fără grupuri separate. Se schimbă doar forma conversației:

- **Răspuns în chat, trimis la semnal**, în locul primei reflecții în pereche: fiecare scrie, dar trimite abia la semnal, ca răspunsurile să rămână independente. Citiți două răspunsuri diferite și invitați-le autorii să le explice.
- **Schițe arătate în plen:** fiecare schițează pe hârtie; autorul își ține foaia la cameră, o trimite ca fotografie în chat sau o scrie ca tabel scurt.
- **Ștafeta** în locul schimbării rolurilor: un coleg explică J1–J2 pe schița lui, altul cere regula și un exemplu, apoi explică el J3 pe propria schiță.
- **Colegul numit** în locul celeilalte perechi: cine își arată schița numește colegul care alege o stare și o citește primul; ceilalți scriu în chat „de acord” sau o obiecție. Dacă nu se oferă nimeni, scrieți în chat un model scurt sub formă de tabel.
- **Etapa diagramei:** linkurile enunțului și specificației se pun în chat. Voluntarul își partajează ecranul sau lipește diagrama în chat ca text Mermaid; oricine o poate vedea desenată în [Mermaid Live](https://mermaid.live). Colegi numiți o verifică punct cu punct; ceilalți scriu „de acord” sau o obiecție. Diagrama convenită se poate scrie ca text Mermaid în chat, corectat de un coleg, înainte de referință.

Prezentarea poate fi partajată de profesor sau preluată de un student. Cu sesiunea sincronizată, studenții urmăresc slide-urile la <https://cs.unibuc.ro/~tserbanuta/amss/now>, iar ecranul partajat rămâne liber pentru diagrama unui coleg. Nu trimiteți în chat parola profesorului sau linkul de control. Nu faceți push pe `main` în timpul întâlnirii. În plen discuția durează mai mult: dacă ritmul întârzie, ascultați mai puține schițe în prima jumătate, dar păstrați verificarea unei diagrame la jumătatea etapei. Mesajele din chat nu se colectează și nu se notează.
