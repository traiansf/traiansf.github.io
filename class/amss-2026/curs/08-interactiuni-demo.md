# Cursul 8 — ghid de predare

[Prezentarea](08-interactiuni.md) are **33 de slide-uri cu copertă** și un parcurs de **100 de minute**. [Enunțul](scenarios/08-inscrieri/brief.md) și [referința](scenarios/08-inscrieri/reference.md) fixează regulile și răspunsurile. Toate datele, regulile relevante și sarcinile folosite la curs apar pe slide-uri; nu sunt necesare calculatoare sau fișe pentru studenți.

## Parcurs

| Minute | Activitate |
|---|---|
| 0–15 | Orientare, citatul, întrebarea deschisă despre confirmări care nu au venit (5 min), problema înscrierii cu confirmare eșuată, predicția interacțiunii eșuate (exercițiu înainte de terminologie); interacțiune, graniță, coordonare. |
| 15–35 | Regulile înscrierii; granița și interfața expeditorului; cine coordonează; reîncercare față de cerere nouă; „ce răspunde registrul?”. |
| 35–60 | Interacțiunea S1 și S2 pas cu pas; exercițiul S3–S4; două ordini ale pașilor (fluxul F); ce garantează registrul și ce nu. |
| 60–80 | Fluxul G, care înregistrează de două ori; trei variante de recuperare după `esec`; exercițiul de comparație; decizia noastră. |
| 80–95 | Sarcină AI pregătită, tabel al interacțiunii de revizuit, promptul evaluatorului (agent AI de revizuire), revizuire și, pe slide separat, decizia noastră. |
| 95–100 | Transfer la diplome și tipografie. |

Duratele exercițiilor includ discuția. În etapa 15–35, acordați 4 minute regulilor (două slide-uri), 4 graniței, 3 coordonării, 2 reîncercării și 7 exercițiului. În etapa 35–60: 5 lui S1, 4 lui S2, 8 exercițiului S3–S4, 5 celor două ordini, 3 garanțiilor. În etapa 60–80: 8 fluxului G, 4 variantelor, 5 exercițiului, 3 deciziei. Tranzițiile sunt incluse în intervale.

## Distincțiile importante

Granița separă componentele pe care le proiectăm (registrul) de cele pe care doar le folosim (site-ul, expeditorul). Despre expeditor avem numai interfața `trimite(mesaj) → trimis | esec` și presupunerea R6; nu presupunem că `esec` înseamnă nelivrare, nici că `trimis` înseamnă citire. Coordonarea stă la registru, unde stau datele și regulile pe care pașii le modifică; site-ul nu apelează expeditorul.

Ordinea pașilor decide ce promite operația: înregistrarea înscrierii precede apelul expeditorului, astfel încât `esec` lasă înscrierea și locul consumat, cu confirmarea `netrimisă` (R4). Fluxul F (trimite, apoi înregistrează numai la `trimis`) încalcă R4 și presupune, contrar lui R6, că `esec` înseamnă că mesajul nu a ajuns.

Reîncercarea este definită de identificatorul cererii, nu de conținut (R2, R5): aceeași cerere primește același `acceptat`, fără alt loc; o cerere nouă a aceluiași participant este refuzată de R3. Fluxul G, fără identificatori, înregistrează de două ori la reîncercare și refuză apoi un participant pentru care ar fi existat loc; cu verificarea participantului, dar tot fără identificator, ar răspunde `refuz` la reîncercare, deși înscrierea a reușit. Termenul „idempotent” este menționat doar în note, ca denumire din literatură; slide-urile folosesc regula R5.

Variantele de recuperare după `esec` (A, reîncercare imediată; B, confirmare `netrimisă` și operație separată de retrimitere; C, anularea înscrierii) se compară prin presupuneri și costuri. A și B respectă R4; C nu. Decizia noastră, B cu cel mult o reîncercare imediată, este justificată prin reguli și scenarii și nu este prezentată ca singura corectă.

Slide-ul „Ce garantează registrul și ce nu” enumeră explicit limitele: livrarea, citirea, căderea registrului între pași (exclusă de R1), concurența. Nu le rezolvăm; le numim.

## Pregătirea AI și proveniența

Prezentarea folosește **capturi reale** Claude Haiku 4.5, obținute la 12 noiembrie 2026 prin Claude Code 2.1.322, fără unelte și fără contextul proiectului; [arhiva](scenarios/08-inscrieri/captures/2026-11-12/README.md) păstrează promptul exact, contextul, răspunsurile integrale, metadatele și ambele încercări pentru fiecare rol. [Prompturile pregătite](scenarios/08-inscrieri/ai/README.md) rămân sursa pentru capturi noi.

Am ales analiza 01: pașii au ordinea cerută de R4 (locul consumat și înscrierea înregistrată înaintea apelului expeditorului), scenariile S1–S6 sunt corecte, dar adaugă un refuz neconvenit în enunț pentru o reîncercare cu alt participant sau atelier („pentru protecție”) și folosește termeni neglosați („atomicitate”). Analiza 02 înregistrează înscrierea abia după răspunsul expeditorului și folosește „idempotență”. Evaluatorul AI a primit într-un context nou enunțul, sarcina și răspunsul integral. Am ales revizuirea 02, care confirmă ordinea pașilor și semnalează adăugirea ca „plauzibilă dar non-specificată”, lăsând decizia oamenilor; revizuirea 01 o confirmă ca „validare defensivă rezonabilă”. Selecția nu descrie performanța tipică a modelului.

Discuția arată o propunere bună și o revizuire bună: nu căutăm un eșec. Decizia noastră păstrează ordinea pașilor și verificările, acceptă observația evaluatorului AI (adăugirea devine întrebare pentru beneficiar) și glosează „atomicitate” în vocabularul cursului. Fluxurile F și G rămân exemple didactice construite.

## Încheiere și calibrare

Transferul la diplome cere trei propoziții: interiorul și exteriorul, presupunerile despre tipografie și ce garantăm local după `esec`, inclusiv identificatorul purtat de comandă. La laborator, interacțiunea cu un expeditor extern se combină cu ciclul de viață din cursul 7. După curs, notați dacă studenții mai confundă reîncercarea cu o cerere nouă sau dacă interpretează `esec` ca nelivrare; folosiți observația pentru ritmul laboratorului.

## Feedback aplicat

Fiecare exercițiu și fiecare fragment AI reia pe același slide regulile necesare, în propoziții întregi; la prima apariție dintr-un slide, identificatorii poartă cuvintele-cheie din enunț: R1 (context), R2 (cerere), R3 (acceptare), R4 (confirmare), R5 (reîncercare), R6 (granița), R7 (efect limitat). Exercițiile au lucru individual și discuție cu toată clasa, fără lucru în pereche; deschiderea are întrebarea deschisă după citat; decizia asupra revizuirii AI are slide propriu.

Vocabular: **graniță** pentru limita sistemului nostru (nu „limită”, rezervată valorilor acceptate); **reîncercare** pentru aceeași cerere trimisă din nou, cu același identificator; **cerere nouă** pentru o cerere cu identificator nou, oricare ar fi conținutul; **expeditor** pentru serviciul extern; **coordonare** pentru responsabilitatea de a conduce pașii unei operații.
