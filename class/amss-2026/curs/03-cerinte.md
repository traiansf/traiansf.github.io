---
title: "AMSS 2026/2027 — Cursul 3: Formularea problemei și cerințe"
author: "Traian-Florin Șerbănuță"
lang: ro-RO
---

# Pornim de la problemă {.transition}

Ce trebuie să convenim înainte de a proiecta o soluție?

::: notes
În cursul anterior am întâlnit diferența dintre o cerere inițială și regulile necesare unei soluții. Astăzi aprofundăm doar acest pas: formulăm problema, clarificăm limitele și verificăm cerințele prin exemple.

**Organizare:** minutul 0 din 100; interval 0–15 (15 min), inclusiv coperta, citatul, analiza inițială și discuția. []{.pace at=0 of=100}
:::

---

# Citatul zilei

> „Cea mai dificilă parte a construirii unui sistem software este să decidem exact ce să construim.”
>
> Original: “The hardest single part of building a software system is deciding precisely what to build.”

— **Frederick P. Brooks, Jr.**

[Sursa: No Silver Bullet — Essence and Accident in Software Engineering, p. 13](https://worrydream.com/refs/Brooks_1986_-_No_Silver_Bullet.pdf#page=13)

::: notes
Dacă nu convenim ce înseamnă „rezolvat”, o implementare impecabilă poate livra alt rezultat decât cel cerut. Clarificarea cerințelor privește comportamentul convenit cu beneficiarul.

**Sursă:** textul original, secțiunea Requirements refinement and rapid prototyping, pagina numerotată 13 (pagina PDF 13). Citatul și traducerea sunt păstrate din materialul anterior, verificat în registrul `docs/quotations.md`.
:::

---

# Cererea administrației

**Administrația campusului (beneficiarul):**

> „Acum primim sesizări despre defecțiuni prin mesaje și telefon. Studenții revin să întrebe dacă s-a făcut ceva. Vrem să poată raporta o problemă și să-i vadă rapid starea.”

Pe hârtie, apoi cu un coleg:

1. Formulați problema într-o propoziție.
2. Scrieți două întrebări importante pentru administrație.
3. Pentru una dintre ele, explicați ce s-ar schimba în funcție de răspuns.

*Scenariu didactic; cererea și clarificările sunt construite pentru acest curs.*

::: notes
Problema: studentul nu poate afla starea sesizării fără să întrebe din nou. Nu știm încă ce se înregistrează, cine actualizează starea sau ce înseamnă „rapid”. O întrebare utilă deosebește rezultatele posibile: două sesizări pentru aceeași defecțiune rămân distincte sau se reunesc?

**Organizare:** 7 min: 2 individual, 2 în pereche, 3 pentru câteva răspunsuri. Lăsați enunțul pe ecran. []{.pace dur=7}
:::

---

# Problemă, obiectiv, soluție

| Nivel | În exemplul campusului |
|---|---|
| Problema | Studentul nu poate afla starea sesizării fără să întrebe din nou. |
| Obiectivul | Studentul își poate înregistra sesizarea și consulta starea. |
| O posibilă soluție | Un formular și o pagină de consultare. |

**Cine trebuie ascultat?** Studentul care raportează și administrația (beneficiarul), care preia și actualizează sesizările.

O pagină care funcționează nu înseamnă, singură, că defecțiunile sunt reparate mai repede.

::: notes
Părțile interesate sunt persoanele sau organizațiile ale căror nevoi și constrângeri contează. Studentul și administrația au perspective diferite asupra aceluiași rezultat. Echipa de intervenție ar trebui consultată dacă includem organizarea reparațiilor, dar aceasta nu intră în exercițiul nostru.

Obiectivul spune ce trebuie să poată face utilizatorul; măsurarea impactului asupra numărului de apeluri ar necesita date inițiale și o țintă convenită. Nici formularul, nici o tehnologie anume nu rezultă obligatoriu din problema enunțată.
:::

---

# Convenim ce intră în sistem {.transition}

Care afirmații sunt confirmate și care încă așteaptă un răspuns?

::: notes
Clarificarea transformă o întrebare deschisă sau o ipoteză într-o informație convenită. Pentru fiecare cerință trebuie să putem indica sursa sau persoana care a convenit-o.

**Organizare:** minutul 15 din 100; interval 15–35 (20 min), cu întrebări și discuția despre sesizări repetate. []{.pace at=15}
:::

---

# Primele răspunsuri ale administrației

**R1 — Înregistrare:** studentul identificat indică locul și descrierea defecțiunii; ambele sunt obligatorii. O sesizare acceptată are un număr unic, un autor și starea „înregistrată”; studentul îi vede numărul și starea.

**R2 — Acces:** studentul își poate consulta numai propriile sesizări și nu le schimbă starea. Personalul administrației le poate consulta pe toate și le actualizează starea.

**Limită convenită:** identitatea și rolul utilizatorului sunt deja cunoscute; autentificarea este în afara exercițiului.

::: notes
„Sesizare” desemnează înregistrarea făcută de un student, nu defecțiunea fizică. Numărul identifică sesizarea, chiar dacă descrierea seamănă cu a alteia. R1 și R2 sunt răspunsuri ale beneficiarului din scenariul didactic, nu fapte despre un sistem real al universității.

La respingerea unei înregistrări incomplete nu se creează sesizarea; formularea completă apare în etapa următoare. Deocamdată verificăm dacă răspunsurile acoperă întrebările inițiale ale studenților.
:::

---

# Limitele primei versiuni

| În prima versiune | În afara primei versiuni |
|---|---|
| Înregistrarea unei sesizări | Fotografii și notificări |
| Consultarea stării | Repartizarea echipelor de intervenție |
| Actualizarea stării de către administrație | Prioritizarea și termenele de reparație |

**Rezultat urmărit:** studentul poate afla ce stare a înregistrat administrația.

**Limită:** sistemul nu garantează când se repară defecțiunea.

::: notes
Delimitarea trebuie convenită, nu dedusă din lipsa unei funcții în enunț. Aici administrația acceptă explicit aceste limite. Actualizarea stării intră în versiune deoarece consultarea unei stări mereu inițiale nu ar satisface obiectivul.

„În afara primei versiuni” nu înseamnă că funcția este inutilă. O cerere ulterioară poate modifica limitele, iar atunci revedem cerințele afectate.
:::

---

# Ce știm și ce rămâne de convenit?

**Acum știm:** R1 cere un număr unic; notificările sunt excluse; nicio cerință de calitate nu este încă convenită.

**Fragmente din răspunsul AI — Claude Haiku 4.5, rularea 2 fără clarificări, 10 octombrie 2026.** Modelul AI primise doar cererea inițială și sarcina de a propune o specificație.

| Afirmație capturată | Cum o tratăm acum? |
|---|---|
| Sistem generează ticket unic (ID automat) | ? |
| Confirmare imediată via email/mesaj cu ID-ul ticket-ului | ? |
| 99% timp de funcționare | ? |

Ce este confirmat, ce depășește limitele și ce rămâne de convenit?

::: notes
Unicitatea este confirmată prin R1. Notificarea prin email/mesaj nu intră în versiunea convenită; R1 cere însă ca studentul să vadă numărul în interfață. Disponibilitatea de 99% este o cerință de calitate propusă, nediscutată cu administrația: ar trebui convenite și perioada, și modul de măsurare.

Modelul AI nu primise clarificările: discutăm ce păstrăm după răspunsurile administrației, nu încălcarea unor reguli pe care nu le primise. Promptul integral va fi afișat în etapa demo. Formulările și terminologia modelului AI sunt păstrate.

**Sursă:** `scenarios/03-sesizari/captures/2026-10-10/haiku45-initial-02-response.md`; două puncte din „Raportare problemă” și celula din rândul „Disponibilitate”, fără modificări de conținut.

**Organizare:** 4 min, inclusiv justificările orale. []{.pace dur=4}
:::

---

# Sesizări repetate: două politici posibile

**Situație:** Ana raportează robinetul care curge în sala A12. Bogdan raportează mai târziu același robinet.

**Nu există încă o regulă despre sesizări repetate.**

- **Varianta A:** ambele sesizări primesc numere proprii.
- **Varianta B:** Bogdan este asociat sesizării deja existente.

Ce întrebare îi puneți administrației, ca ea să aleagă între variante? Ce ar trebui să vadă Bogdan după trimitere?

::: notes
Întrebarea concretă ar putea fi: „Doriți o evidență separată pentru fiecare raportare sau o singură sesizare urmărită de mai mulți studenți?” Mai trebuie lămurit cine stabilește că este aceeași defecțiune. B ridică și o întrebare de acces: Bogdan nu poate consulta sesizarea Anei prin R2, deci politica ar cere o modificare explicită.

Nu alegem A doar pentru că este mai ușor de implementat. Exemplul scoate la iveală o decizie a beneficiarului.

**Organizare:** 4 min de discuție. []{.pace dur=4}
:::

---

# Răspunsul devine regulă

**R3 — Sesizări repetate**, răspunsul administrației:

> „În prima versiune păstrăm fiecare sesizare separat, chiar dacă descrie aceeași defecțiune. Nu reunim și nu respingem automat sesizările repetate.”

Ana primește S41, Bogdan primește S42. Fiecare își consultă propria sesizare.

**Consecință dedusă, acceptată de administrație:** cele două sesizări se actualizează separat, chiar dacă o singură intervenție repară robinetul.

::: notes
Această decizie păstrează o evidență a fiecărei raportări, cu un cost operațional pentru administrație. Identificatorii S41 și S42 sunt exemple, nu o cerință de numerotare consecutivă.

Reunirea ar putea fi o alegere legitimă într-o altă versiune. Acordul asupra R3 este ceea ce face verificabil rezultatul cerut aici.
:::

---

# Cerințele răspund la întrebări diferite

| Întrebare | Tip | Exemplu |
|------|-----|---------|
| Ce poate face utilizatorul? | Cerință funcțională | Studentul consultă starea propriei sesizări. |
| Ce politică a administrației trebuie respectată? | Regulă a domeniului | Sesizările repetate se păstrează separat. |
| În ce condiții și cât de bine? | Cerință de calitate | Starea se afișează într-un timp convenit, cu un număr precizat de sesizări și de consultări simultane. |

O cerință utilă descrie **un rezultat observabil** și condițiile în care îl cerem.

::: notes
Tipurile se pot suprapune: controlul accesului este exprimat prin comportament, dar privește și securitatea. Nu cerem o clasificare unică. Etichetele R1–R4 numerotează răspunsurile administrației; un astfel de răspuns poate conține cerințe de tipuri diferite. Cerințele de calitate sunt adesea numite nefuncționale; și ele trebuie să poată fi evaluate.

Deosebirea importantă este între un comportament convenit și o formulare care lasă rezultatul la interpretarea proiectantului. Revenim la „rapid” cu un criteriu concret.
:::

---

# Scriem rezultate verificabile {.transition}

Ar putea două echipe să decidă la fel dacă cerința este îndeplinită?

::: notes
Un exemplu de acceptare concretizează o regulă. El poate scoate la iveală o întrebare rămasă deschisă înainte să existe o implementare sau un test automat.

**Organizare:** minutul 35 din 100; interval 35–65 (30 min), inclusiv exercițiul în perechi, compararea rezultatelor și criteriul de timp. []{.pace at=35}
:::

---

# De la intenție la cerință

„Studentul poate raporta o defecțiune” devine:

**Când** studentul identificat trimite un loc și o descriere nevidă, **sistemul înregistrează** sesizarea, cu studentul ca autor, și îi afișează numărul unic și starea „înregistrată”.

**Dacă lipsește** locul sau descrierea, sistemul indică informația lipsă și nu creează sesizarea.

Urmărim: **cine**, **în ce condiții**, **ce rezultat** și **ce se întâmplă la respingere**.

Un **exemplu de acceptare** verifică cerința pe date concrete: starea inițială, cine cere ce și rezultatul observabil, inclusiv la respingere.

::: notes
Aceasta este forma completă a lui R1, convenită în scenariul didactic. Face observabil și succesul, și respingerea. Nu prescrie formularul, baza de date sau algoritmul de generare a numărului.

„Nevidă” este suficient pentru exemplele de astăzi; validarea unui loc real sau tratarea șirurilor formate doar din spații ar necesita precizări dacă le includem. Nu pretindem că o singură propoziție epuizează toate condițiile unui produs real.
:::

---

# Ce înseamnă actualizarea stării?

**R4 — Regula convenită:** numai administrația poate face aceste schimbări:

- „înregistrată” → „în lucru”;
- „în lucru” → „rezolvată”.

Orice altă cerere de schimbare, inclusiv repetarea stării curente, este respinsă; starea rămâne aceeași, iar utilizatorul vede motivul.

„Rezolvată” înseamnă că **administrația a declarat reparația încheiată**. Redeschiderea nu este inclusă.

Poate sistemul să constate singur că robinetul a fost reparat?

::: notes
Sistemul consemnează declarația unei persoane autorizate; nu verifică fizic reparația. Această distincție previne o promisiune pe care sistemul nu o poate susține.

R4 explicitează și respingerea unei cereri care repetă starea curentă. Folosim regula pentru a scrie exemple, fără să dezvoltăm încă modelarea stărilor sau contractele operațiilor; acestea au cursuri proprii.
:::

---

# În perechi: exemple de acceptare

**R4:** numai administrația schimbă starea: „înregistrată” → „în lucru” → „rezolvată”. Orice altă cerere de schimbare, inclusiv repetarea stării curente, este respinsă, cu motiv și fără modificarea stării.

**Date:** S41 este „înregistrată”. Ana este autoarea sesizării; Daria lucrează în administrație. Fiecare exemplu pornește separat de la această stare.

1. Scrieți două exemple de acceptare: o cerere de schimbare permisă și una respinsă.
2. Pentru fiecare: **starea inițială → cine cere ce schimbare → rezultatul observabil**.
3. Schimbați foaia cu o altă pereche: rezultatul urmează din regulă?

::: notes
Permisă: Daria cere trecerea la „în lucru”; noua stare este afișată. Respinsă din cauza rolului: Ana cere aceeași schimbare; motivul este lipsa dreptului. Respinsă din cauza schimbării nepermise: Daria cere direct „rezolvată” sau repetă „înregistrată”. În toate respingerile, S41 rămâne „înregistrată”.

Cazurile sunt independente. Un exemplu care schimbă simultan rolul și tranziția nu izolează motivul respingerii; invitați perechea să-l îmbunătățească.

**Organizare:** 9 min: 4 pentru scriere, 2 pentru schimbul între perechi, 3 pentru discutarea a două exemple. []{.pace dur=9}
:::

---

# Un exemplu verifică și ce rămâne neschimbat

**R1:** o sesizare nouă primește un număr unic, un autor și starea „înregistrată”.

**R3:** sesizările repetate rămân separate și nu sunt respinse automat. O sesizare nouă nu modifică autorul, numărul sau starea uneia existente.

**Situația inițială:** S41, a Anei, descrie robinetul din A12 și este „în lucru”. Bogdan trimite o sesizare validă despre același robinet.

Pe hârtie: ce trebuie să existe după înregistrare? Precizați rezultatul pentru **Bogdan** și starea lui **S41**.

::: notes
Bogdan primește o sesizare distinctă, de exemplu S42, în starea „înregistrată”. S41 rămâne a Anei, „în lucru”. Identitatea, autorul și starea vechii sesizări nu sunt rescrise de noua raportare.

Exemplul verifică mai mult decât apariția unui mesaj de succes. Nu cerem un anumit format al identificatorului.

**Organizare:** 3 min cu discutarea răspunsului. []{.pace dur=3}
:::

---

# „Rapid” pentru ce anume?

Administrația vrea ca studentul să vadă **rapid** starea sesizării.

Pot fi interpretări diferite:

- pagina afișează repede o stare deja înregistrată;
- personalul actualizează repede starea după intervenție;
- echipa repară repede defecțiunea.

**Clarificare convenită:** cerința de timp privește doar **afișarea stării deja înregistrate**.

De unde până unde măsurăm? Cu câte sesizări și câte consultări simultane? Câte consultări trebuie să se încadreze în timp?

::: notes
Cele trei intervale implică responsabilități diferite. Nu putem transforma o cerință despre afișare într-o promisiune despre durata reparației. Un prag numeric fără operație, puncte de măsurare și condiții poate rămâne la fel de ambiguu ca adjectivul inițial.

**Organizare:** cereți o interpretare înainte de a arăta slide-ul următor.
:::

---

# O cerință de calitate convenită

**Q1 — Timpul de consultare** *(valori stabilite pentru exercițiu)*

| Element | Acordul cu administrația |
|----|------------|
| Interval măsurat | Acțiunea de consultare în browser → afișarea stării. |
| Condiții | Rețeaua campusului; 10.000 de sesizări; 20 de consultări simultane. |
| Lot de verificare | 1.000 de consultări valide ale propriilor sesizări. |
| Prag | Cel puțin 950 afișează starea corectă în cel mult 2 secunde. |

**Pragurile și condițiile se convin cu beneficiarul.**

::: notes
950 din 1.000 înseamnă 95%. Nici celelalte 50 nu pot afișa date greșite: R2 și cerința funcțională continuă să se aplice; Q1 privește pragul de timp. „Valide” înseamnă consultări permise de R2 (studentul, propria sesizare), nu consultări reușite: o consultare care eșuează rămâne în lot, dar nu intră între cele 950 reușite la timp.

Nu există măsurători reale aici. Un plan de măsurare complet ar fixa și dispozitivele, browserul, profilul cererilor, setul de date și condițiile rețelei. Acestea trebuie convenite înaintea verificării; exemplul nu constituie un acord operațional complet.
:::

---

# Pragul trebuie să permită o decizie

**Q1:** în lotul de 1.000, cel puțin 950 de consultări afișează starea corectă în cel mult 2 secunde, în condițiile convenite.

Două loturi independente, în aceleași condiții:

| Lot | Îndeplinește Q1? |
|------------|---|
| A: 950 afișează corect în cel mult 2 secunde; celelalte 50, în 3 secunde. | ? |
| B: 949 afișează corect în cel mult 2 secunde; celelalte 51, în 3 secunde. | ? |

Dacă am ști doar media unui lot, de exemplu 1,2 secunde, am putea decide?

*Date didactice, nu rezultate ale unei execuții.*

::: notes
A îndeplinește pragul; B nu. „Cel puțin” include exact 950, iar „cel mult” include exact 2 secunde. Media nu arată câte consultări au respectat pragul. Nu schimbăm după măsurare criteriul convenit.

Un lot reușit susține o afirmație limitată la condițiile verificării. Nu stabilește performanța la orice încărcare.

**Organizare:** 4 min cu răspunsuri și justificări. []{.pace dur=4}
:::

---

# Revizuim înainte de a preda mai departe {.transition}

Ce acceptăm, ce corectăm și ce rămâne de decis?

::: notes
Revizuirea confruntă fiecare afirmație cu sursa și cu exemplele. Urmărim trei contexte AI distincte: cererea inițială; analiza cu reguli clarificate; revizuirea acelei analize. Toate răspunsurile provin din rulări reale cu Claude Haiku 4.5.

**Organizare:** minutul 65 din 100; interval 65–90 (25 min): tranziție și trei prompturi, 7 min; trei comparații cu răspunsurile, câte 5 min; 3 min pentru întrebări. []{.pace at=65}
:::

---

# Promptul inițial: fără clarificări

**Prompt integral — trimis identic în două contexte noi, Claude Haiku 4.5:**

> Administrația campusului cere:
>
> „Acum primim sesizări despre defecțiuni prin mesaje și telefon. Studenții revin să întrebe dacă s-a făcut ceva. Vrem să poată raporta o problemă și să-i vadă rapid starea.”
>
> Propune o specificație concisă: cerințe funcționale, cerințe de calitate și trei exemple de acceptare. Răspunde în română, în maximum 500 de cuvinte.

*Claude Code, 10 octombrie 2026. Fără regulile convenite sau soluția profesorului.*

::: notes
Cererea lasă deschise politicile și criteriile de calitate. Un răspuns util poate propune variante, dar trebuie să distingem propunerile de acordul beneficiarului. Nu cerem modelului AI să greșească și nu îi furnizăm un răspuns de imitat.

**Sursă:** `scenarios/03-sesizari/captures/2026-10-10/initial-prompt.md`, integral. Două rulări independente, model declarat `claude-haiku-4-5`, Claude Code 2.1.294, fără unelte, în directoare temporare goale. Ambele încercări sunt păstrate.

**Organizare:** 2 min; rulările au fost făcute înainte de curs. []{.pace dur=2}
:::

---

# Răspunsul AI completează ce beneficiarul nu a spus

**Cererea primită:** studentul să raporteze o problemă și să-i vadă rapid starea. Niciun prag, nicio reluare și niciun termen de închidere precizat.

**Fragmente din răspunsul AI — Claude Haiku 4.5, rularea 2 fără clarificări, 10 octombrie 2026:**

> < 2 secunde pentru încărcarea paginii

> ȘI: poate cere reluarea dacă crede că nu e bine\
> ȘI: după 3 zile fără răspuns, ticket se marchează "Închis"

În perechi: **ce trebuie confirmat cu administrația înainte ca aceste propuneri să devină cerințe?**

*Selecție din două încercări; ambele au introdus detalii neconfirmate.*

::: notes
Primul fragment introduce un prag și alege încărcarea paginii ca operație măsurată. Studenții pot observa că și Q1 are 2 secunde: valoarea coincide, dar propunerea măsoară altă operație, folosește „<” în loc de „cel mult” și nu are condiții sau lot. Al doilea fragment adaugă, după „Rezolvat”, o cerere de reluare (redeschiderea este exclusă), o stare nouă și închiderea automată dacă studentul nu reacționează în 3 zile. Cererea nu justifică aceste alegeri; ele pot fi discutate ca propuneri, nu tratate ca acord deja obținut.

Promptul cerea explicit cerințe de calitate, fără să ceară separarea propunerilor de informațiile convenite: o valoare propusă era previzibilă. Promptul analistului AI cere această separare. Nu afirmăm că modelul AI a încălcat R1–R4 sau Q1: nu le primise. Prima încercare inventează, între altele, o promisiune de verificare în 24 de ore; a doua are un exemplu mai scurt de politică neconfirmată. Selecția nu măsoară comportamentul tipic al modelului AI.

**Sursă:** `haiku45-initial-02-response.md`, celula din rândul „Timp de răspuns” și ultimele două linii din „Exemplul 3: Ticket închis”. Fragmente literale; analiza este a profesorului.

**Organizare:** 5 min: 2 în perechi, 3 pentru răspunsuri. []{.pace dur=5}
:::

---

# Promptul analistului AI: reguli convenite

**Context nou:** cererea inițială, R1–R4, Q1 și excluderile discutate. Fără primul răspuns AI sau soluția profesorului.

**Instrucțiunea exactă, la finalul promptului:**

> Organizează cerințele convenite și scrie trei exemple de acceptare. Pentru fiecare indică regula sursă. Separă întrebările deschise de cerințe; nu introduce reguli sau funcții noi. Păstrează condițiile și pragul lui Q1. Răspunde în română, în maximum 450 de cuvinte.

*Claude Haiku 4.5, două rulări independente cu aceeași intrare, 10 octombrie 2026.*

::: notes
Contextul cu răspunsurile administrației înlocuiește ipotezele cu informații convenite. Un context nou permite să observăm analiza regulilor furnizate fără influența primei propuneri. Nu este o continuare ascunsă a conversației inițiale.

**Sursă:** instrucțiune integrală din `analist-instructiune.md`. `analist-prompt.md` include și copia nemodificată a contextului din `context-clarificat.md`: cererea și regulile consolidate, fără soluția de referință. Regulile relevante exercițiului următor sunt repetate pe acel slide.

**Organizare:** 2 min. []{.pace dur=2}
:::

---

# Ce pierde rezumatul unei cerințe?

**Fragment din răspunsul AI — Claude Haiku 4.5, analist AI, rularea 1, 10 octombrie 2026:**

> Cu 10.000 sesizări și 20 consultări simultane, cel puțin 950/1.000 consultări asupra propriilor sesizări afișează stare corectă în ≤ 2 secunde.

**Q1 primit de analistul AI:** aceleași valori, plus **rețeaua campusului** și intervalul măsurat **de la acțiunea de consultare în browser până la afișarea stării**.

Pe hârtie: ce s-ar putea măsura diferit dacă predăm numai rezumatul? **Rescrieți cerința, păstrând toate condițiile.**

::: notes
Lipsesc rețeaua și punctele de măsurare. Cineva ar putea măsura doar răspunsul serverului, ignorând timpul până la afișarea în browser, sau ar putea evalua în altă rețea. Numerele corecte nu compensează pierderea condițiilor.

Corecția profesorului: cu 10.000 de sesizări și 20 de consultări simultane în rețeaua campusului, cel puțin 950 din 1.000 de consultări valide ale propriilor sesizări afișează starea corectă în cel mult 2 secunde de la acțiunea de consultare în browser. Aceasta păstrează rezultatul, punctele de măsurare, încărcarea și pragul. Acceptăm formulări echivalente.

**Sursă:** `haiku45-analist-01-response.md`, prima propoziție din Q1, integrală. Și a doua încercare omite rețeaua și punctele de măsurare; prima a fost selectată pentru formularea compactă. Nu generalizăm din două rulări.

**Organizare:** 5 min: 2 pentru corectare pe hârtie, 3 pentru discuție. []{.pace dur=5}
:::

---

# Promptul evaluatorului AI

**Evaluator (agent AI de revizuire), context separat:** cererea, regulile convenite și excluderile, plus răspunsul integral al analistului AI din rularea 1. Fără sarcina analistului AI și fără corecția profesorului.

**Instrucțiunea exactă, la finalul promptului:**

> Revizuiește specificația față de cererea și regulile convenite, fără să o rescrii. Pentru fiecare constatare, citează afirmația și regula relevantă și explică efectul printr-un exemplu. Distinge erorile și omisiunile de alegerile de proiectare sau extinderi. Precizează și ce este corect și limitele verificării. Răspunde în română, în maximum 450 de cuvinte.

*Claude Haiku 4.5, două rulări independente cu aceeași intrare, 10 octombrie 2026.*

::: notes
Evaluatorul AI primește sursa, nu doar rezumatul de examinat. Cele două rulări de revizuire sunt independente și primesc același răspuns al analistului AI (rularea 1), inclusiv secțiunile care nu apar pe slide-uri. Nu îi semnalăm în prompt omisiunea descoperită de noi și nu îi cerem un număr minim de defecte.

**Sursă:** instrucțiune integrală din `evaluator-instructiune.md`; intrarea completă în `evaluator-prompt.md`. Claude Haiku 4.5, două contexte noi, 10 octombrie 2026.

**Organizare:** 2 min. []{.pace dur=2}
:::

---

# Verificăm și revizuirea AI

**Fragment din răspunsul AI — Claude Haiku 4.5, evaluator AI, rularea 1, 10 octombrie 2026:**

> **Q1**: Pragul de performanță este transcris exact, […]

**Comparația noastră între Q1 și specificația analistului AI:**

| Element din Q1 | Se păstrează? |
|---|---|
| Cel puțin 950/1.000 în cel mult 2 secunde | Da |
| Rețeaua campusului | Nu |
| Acțiunea de consultare în browser → afișarea stării | Nu |

**Decizia noastră:** pragul este transcris corect, dar revizuirea nu semnalează cele două condiții pierdute de analistul AI. Le restabilim înainte de a preda specificația mai departe: acordul evaluatorului AI nu înlocuiește comparația cu sursa.

::: notes
Nu transformăm observația despre prag într-o afirmație că întregul Q1 ar fi verificat. Numerele sunt transcrise corect, dar evaluatorul AI nu identifică pierderea rețelei și a intervalului măsurat. În „Limitări ale Verificării”, el amintește configurația rețelei și browserul doar ca limite ale verificării, nu ca omisiuni din Q1-ul analistului AI.

Revizuirea are și o constatare utilă: „afișează confirmarea” nu spune explicit că se afișează numărul și starea, așa cum cere R1. Nu prezentăm tot răspunsul ca greșit. Cealaltă rulare discută alte omisiuni, dar nu semnalează nici ea cele două condiții din Q1.

**Sursă:** `haiku45-evaluator-01-response.md`, începutul punctului Q1 din „Alinieri Corecte”, cu finalul omis explicit. Tabelul și decizia sunt analiza profesorului. Toate cele șase încercări sunt păstrate, inclusiv cele nefolosite pe slide-uri.

**Organizare:** 8 min: 5 pentru explicarea diferenței dintre confirmarea unui prag și verificarea cerinței întregi, 3 pentru întrebări; treceți la exercițiul final la minutul 90. []{.pace dur=8}
:::

---

# Aplicăm pe o altă problemă {.transition}

Putem formula o cerință fără să completăm tacit ce lipsește?

::: notes
Schimbarea domeniului verifică dacă studenții pot folosi distincțiile, nu doar reproduce regulile campusului. Exercițiul este formativ, fără notă separată.

**Organizare:** minutul 90 din 100; interval 90–100 (10 min): 7 min exercițiu și discuție, 3 min sinteză și încheiere. []{.pace at=90}
:::

---

# Exercițiu final: loc la consultații

**Profesorul cere:** „Studenții să se poată înscrie ușor la consultații.”

**Clarificări confirmate:** există intervale de 15 minute, fiecare cu un singur loc. Înscrierile sunt înregistrate pe rând. Un student nu se poate înscrie la un interval deja ocupat. Anularea înscrierii nu intră în exercițiu.

Individual, pe hârtie, fără asistent AI, scrieți:

1. O cerință pentru încercarea de înscriere la un interval ocupat.
2. Un exemplu concret care o verifică.
3. O întrebare care ar clarifica termenul „ușor”.

::: notes
Răspuns posibil: încercarea este respinsă și înscrierea existentă se păstrează. Exemplu: Ana ocupă intervalul 10:00–10:15; Bogdan încearcă același interval și nu obține locul. Modul de informare a lui Bogdan poate fi propus, dar enunțul nu impune textul sau canalul mesajului.

„Ușor” ar putea privi pașii necesari, înțelegerea opțiunilor sau accesibilitatea. Întâi întrebăm despre ce utilizatori și ce sarcină este vorba, apoi convenim un criteriu; nu alegem arbitrar „maximum trei clicuri”.

**Organizare:** 7 min: 3 individual, 4 pentru discutarea câtorva răspunsuri. []{.pace dur=7}
:::

---

# Trei întrebări de păstrat

1. **De unde știm?** Informație convenită, consecință dedusă, ipoteză sau propunere?
2. **Ce observăm?** În ce condiții sistemul acceptă sau respinge o cerere și ce rămâne neschimbat?
3. **Ce mai trebuie decis?** Cine poate răspunde și ce depinde de răspuns?

**Cursul următor:** modelarea domeniului — conceptele și relațiile care explică regulile convenite.

::: notes
Înțelegerea se vede în capacitatea de a formula un rezultat și a-l susține printr-o sursă și un exemplu. Nu este necesar ca toate cerințele să folosească aceeași formulă de redactare.

**Organizare:** 3 min pentru sinteză și întrebări; încheiere la minutul 100. []{.pace dur=3}
:::
