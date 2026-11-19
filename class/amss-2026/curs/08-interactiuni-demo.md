# Cursul 8 — ghid de predare

[Prezentarea](08-interactiuni.md) are **35 de slide-uri cu copertă** și un parcurs de **100 de minute**. [Enunțul](scenarios/08-inscrieri/brief.md) și [referința](scenarios/08-inscrieri/reference.md) fixează regulile și răspunsurile. Toate datele, regulile relevante și sarcinile folosite la curs apar pe slide-uri; nu sunt necesare calculatoare sau fișe pentru studenți.

## Parcurs

| Minute | Activitate |
|---|---|
| 0–15 | Orientare, citatul, întrebarea deschisă despre confirmări care nu au venit (5 min), problema înscrierii cu confirmare eșuată, predicția pentru cererea primită a doua oară (exercițiu înainte de terminologie și înainte de regula reîncercării); interacțiune, graniță, coordonare. |
| 15–35 | Regulile înscrierii; granița și interfața expeditorului; cine coordonează; reîncercare față de cerere nouă; „ce răspunde registrul?”. |
| 35–60 | Interacțiunea S1 și S2 pas cu pas; exercițiul S3–S4; două ordini ale pașilor (fluxul F); ce garantează registrul și ce nu. |
| 60–80 | Fluxul G, care înregistrează de două ori; trei variante de recuperare după `esec`; exercițiul de comparație; decizia noastră. |
| 80–95 | Garanții pe care nu le oferă nimeni: promptul pentru paragraful „Ce vă garantăm la înscriere”, auditul promisiunilor 1–2 și 3–4, fragmente din alte rulări („atomicitate pe cerere”, „consemnat permanent”, livrarea), comparația noastră și, pe slide separat, decizia noastră. |
| 95–100 | Transfer la diplome și tipografie. |

Duratele exercițiilor includ discuția. În etapa 15–35, acordați 4 minute regulilor (două slide-uri), 4 graniței, 3 coordonării, 2 reîncercării și 7 exercițiului. În etapa 35–60: 5 lui S1, 4 lui S2, 8 exercițiului S3–S4, 5 celor două ordini, 3 garanțiilor. În etapa 60–80: 8 fluxului G, 4 variantelor, 5 exercițiului, 3 deciziei. În etapa 80–95: 2 sarcinii, 3 și 3 celor două slide-uri cu promisiuni, 2 și 2 celor cu alte rulări, 1 comparației, 2 deciziei. Tranzițiile sunt incluse în intervale.

## Distincțiile importante

Granița separă componentele pe care le proiectăm (registrul) de cele cu care doar comunicăm: site-ul ne apelează, pe expeditor îl apelăm. Despre site avem presupunerile din R2 (identificator unic pentru fiecare cerere nouă, același la reîncercare). Despre expeditor avem numai interfața `trimite(mesaj) → trimis | esec` și presupunerea R6; nu presupunem că `esec` înseamnă nelivrare, nici că `trimis` înseamnă citire. Coordonarea stă la registru, unde stau datele și regulile pe care pașii le modifică; site-ul nu apelează expeditorul.

Ordinea pașilor decide ce promite operația: înregistrarea înscrierii precede apelul expeditorului, astfel încât `esec` lasă înscrierea și locul consumat, cu confirmarea `netrimisă` (R4). Fluxul F (trimite, apoi înregistrează numai la `trimis`) încalcă R4, iar R6 arată că poate lăsa participantul cu o confirmare fără loc. Ultima întrebare a slide-ului separă cele două abateri ale lui F: un flux care apelează întâi expeditorul și înregistrează apoi oricum dă, în limitele lui R1, aceleași rezultate ca al nostru; diferă numai ce rămâne dacă operația se întrerupe între pași (o înscriere fără confirmare, respectiv un mesaj posibil livrat fără înscriere), iar preferința beneficiarului din R4 alege ordinea noastră. `netrimisă` consemnează răspunsul expeditorului, nu nelivrarea.

Reîncercarea este definită de identificatorul cererii, nu de conținut (R2, R5): aceeași cerere primește același `acceptat`, fără alt loc; o cerere nouă a aceluiași participant este refuzată de R3. Fluxul G, fără identificatori, înregistrează de două ori la reîncercare și refuză apoi un participant pentru care ar fi existat loc; cu verificarea participantului, dar tot fără identificator, ar răspunde `refuz` la reîncercare, deși înscrierea a reușit. Slide-ul „Aceeași cerere sau o cerere nouă?” numește idempotența, pe care cursul 6 o observase fără nume la eliberarea repetată: ea privește efectul repetării asupra înscrierilor, iar R5 cere suplimentar același răspuns. Rezultatul confirmării se poate modifica. Slide-ul de decizie asupra capturii AI distinge idempotența de atomicitate.

Variantele de recuperare după `esec` (A, retrimitere imediată; B, confirmare `netrimisă` și operație separată de retrimitere; C, anularea înscrierii) se compară prin presupuneri și costuri. A și B respectă R4; C nu. Exercițiul de comparație nu mai întreabă care variantă respectă R4 (tabelul o spune deja): cere un scenariu cu două mesaje primite, apelantul retrimiterii din B și întrebările pentru beneficiar. Alegem B: `înscrie` face un singur apel al expeditorului la acceptare și la reîncercarea cu confirmare `netrimisă`; propunem separat o operație apelată de un operator al centrului, cu o încercare pentru fiecare confirmare `netrimisă`. Astfel, S1–S6 își păstrează rezultatele. R5 permite retrimiterea la reîncercare, fără să o impună; alegerea este marcată explicit. Nu adăugăm o valoare nouă a rezultatului confirmării, fiindcă `netrimisă` exista deja.

Slide-ul „Ce garantează registrul și ce nu” enumeră explicit limitele: livrarea, citirea, căderea registrului între pași (exclusă de R1), concurența. Nu le rezolvăm; le numim.

## Pregătirea AI și proveniența

Lecția AI a cursului (decizia din 19 noiembrie 2026): **garanții pe care nu le oferă nimeni**. La o graniță, un text generat promite lucruri despre componente pe care nu le controlăm: livrarea, rapiditatea, retrimiterea „automată”, „atomicitatea”. Formatul este un audit al afirmațiilor: pentru fiecare garanție, studenții spun cine o oferă (registrul, site-ul, expeditorul sau nimeni) și ce regulă a enunțului o susține. Nu este perechea analist–evaluator din cursurile anterioare.

Prezentarea folosește **capturi reale** Claude Haiku 4.5, obținute la 19 noiembrie 2026 prin Claude Code 2.1.328, fiecare într-un context nou, fără unelte și fără contextul proiectului: trei prompturi cu același enunț și decizia B (paragraful pentru participanți, patru rulări; nota pentru echipa de operare și garanțiile pentru echipa de dezvoltare, câte opt). [Arhiva](scenarios/08-inscrieri/captures/2026-11-19/README.md) păstrează prompturile exacte, contextul, răspunsurile integrale, metadatele, toate încercările și motivul selecției; [prompturile pregătite](scenarios/08-inscrieri/ai/README.md) rămân sursa pentru capturi noi.

Am ales paragraful `promisiuni-01`: patru promisiuni cu garanți diferiți. Locul păstrat la `esec` și locurile limitate sunt ale registrului (R3, R4); „fără înscrieri duble” este al registrului (R3, R5), dar „același răspuns” depinde și de site, care trebuie să trimită același identificator (R2): dacă apăsarea butonului produce o cerere nouă, răspunsul este `refuz`. „Veți primi confirmare imediat … îl reîncercăm automat” nu o oferă nimeni: expeditorul promite doar un răspuns (R6), registrul nu află livrarea, iar retrimiterea are loc la reîncercarea site-ului sau prin operator (varianta B). Fragmentele din celelalte rulări: „atomicitate pe cerere” pentru ce este idempotența față de înscrieri și „consemnat permanent”, adevărat doar prin presupunerea R1 (`nota-08`); `esec` citit ca nelivrare (`garantii-02`); și formularea prudentă „Livrarea efectivă … nu este garantată de sistem” (`garantii-08`), ca auditul să nu devină „găsește greșeala”. Selecția nu descrie comportamentul tipic al modelului.

Decizia noastră păstrează promisiunile oferite de registru, rescrie promisiunea despre confirmare fără livrare, rapiditate sau retrimitere automată, corectează „atomicitate” (efecte integral sau deloc) față de idempotență și trimite o garanție mai puternică despre livrare la furnizorul expeditorului, în interfața lui; legătura cu transferul la tipografie. Capturile din 12 noiembrie 2026 (analistul AI care folosea „atomicitate”, evaluatorul AI) rămân arhivate în `scenarios/08-inscrieri/captures/2026-11-12/` și nu mai apar pe slide-uri. Fluxurile F și G rămân exemple didactice construite.

## Încheiere și calibrare

Transferul la diplome cere trei propoziții: interiorul și exteriorul, presupunerile despre tipografie și ce îi trebuie registrului ca o comandă retrimisă să nu ducă la două tipăriri. Identificatorul singur nu o garantează: tipografia trebuie să promită că îl recunoaște. Contrastul cu exemplul cursului: mesajul duplicat era un cost acceptat, diploma tipărită de două ori nu este. La laborator, interacțiunea cu un expeditor extern se combină cu ciclul de viață din cursul 7. După curs, notați dacă studenții mai confundă reîncercarea cu o cerere nouă sau dacă interpretează `esec` ca nelivrare; folosiți observația pentru ritmul laboratorului.

## Feedback aplicat

Fiecare exercițiu și fiecare fragment AI reia pe același slide regulile necesare, în propoziții întregi; la prima apariție dintr-un slide, identificatorii poartă cuvintele-cheie din enunț: R1 (context), R2 (cerere), R3 (acceptare), R4 (confirmare), R5 (reîncercare), R6 (graniță), R7 (efect limitat). Exercițiile au lucru individual și discuție cu toată clasa, fără lucru în pereche; deschiderea are întrebarea deschisă după citat; comparația și decizia asupra textelor AI au slide-uri proprii, separate de capturi.

Vocabular: **graniță** pentru limita sistemului nostru (nu „limită”, rezervată valorilor acceptate); **reîncercare** pentru aceeași cerere trimisă din nou, cu același identificator; **cerere nouă** pentru o cerere cu identificator nou, oricare ar fi conținutul; **expeditor** pentru serviciul extern; **coordonare** pentru responsabilitatea de a conduce pașii unei operații.
