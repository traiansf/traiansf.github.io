---
title: "AMSS 2026/2027 — Cursul 3: Formularea problemei și a cerințelor"
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

**Sursă:** textul original, secțiunea Requirements refinement and rapid prototyping, pagina numerotată 13 (pagina PDF 13). Citatul și traducerea sunt păstrate din materialul anterior, verificate în registrul `docs/quotations.md`.
:::

---

# Cererea administrației

**Administrația campusului (beneficiarul):**

> „Acum primim sesizări despre defecțiuni prin mesaje și telefon. Studenții revin să întrebe dacă s-a făcut ceva. Vrem să poată raporta o problemă și să-i vadă rapid starea.”

Pe hârtie, apoi cu un coleg:

1. Formulați problema într-o propoziție.
2. Scrieți două întrebări importante pentru administrație.
3. Pentru una dintre ele, explicați ce s-ar schimba în funcție de răspuns.

*Exemplu didactic; cererea și clarificările sunt construite pentru acest curs.*

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
| O propunere de soluție | Un formular și o pagină de consultare. |

**Pe cine consultăm?** Studentul care raportează și administrația (beneficiarul), care preia și actualizează sesizările.

Obiectivul nu promite reparații mai rapide: o pagină care funcționează nu le garantează.

::: notes
Părțile interesate sunt persoanele sau organizațiile ale căror nevoi și constrângeri contează. Studentul și administrația au perspective diferite asupra aceluiași rezultat. Echipa de intervenție ar trebui consultată dacă includem organizarea reparațiilor, dar aceasta nu intră în exercițiul nostru.

Obiectivul spune ce trebuie să poată face utilizatorul; măsurarea impactului asupra numărului de apeluri ar necesita date inițiale și o țintă convenită. Nici formularul, nici o tehnologie anume nu rezultă obligatoriu din problema enunțată.
:::

---

# Convenim ce intră în sistem {.transition}

Care afirmații sunt convenite și care încă așteaptă un răspuns?

::: notes
Clarificarea transformă o întrebare deschisă sau o ipoteză într-o informație convenită. Pentru fiecare cerință trebuie să putem indica sursa sau persoana care a convenit-o.

**Organizare:** minutul 15 din 100; interval 15–35 (20 min), cu întrebări, discuția despre sesizări repetate și tipurile de cerințe. []{.pace at=15}
:::

---

# Reamintim: cinci tipuri de afirmații

| Tip de afirmație | Exemplu din cererea administrației |
|----|--------|
| Informație convenită | Studenții trebuie să poată raporta o defecțiune. |
| Consecință dedusă | Cineva trebuie să actualizeze starea; altfel ea nu se schimbă. |
| Întrebare deschisă | Două raportări ale aceluiași robinet rămân sesizări distincte? |
| Ipoteză | Provizoriu: da, fiecare raportare devine o sesizare separată. |
| Propunere de proiectare | Un formular și o pagină de consultare. |

Ipoteza răspunde provizoriu unei întrebări deschise. Ea și propunerea devin informație convenită numai după confirmarea administrației.

::: notes
Tipurile sunt cele din cursul anterior, unde exemplele veneau din bibliotecă: R2 ca informație convenită, „exemplarele unui titlu pot avea stări diferite” ca consecință dedusă, returnarea de către altcineva ca întrebare deschisă și ipoteză, verificarea R2 în operația de împrumut ca propunere. Le folosim pe tot parcursul cursului pentru a spune de unde știm o afirmație.

Consecința dedusă rezultă din ce s-a convenit, dar o verificăm tot cu beneficiarul când are costuri; o vom vedea la R3. Ipoteza despre sesizările separate primește răspuns la R3, după discuția despre sesizări repetate. A doua întrebare deschisă din cerere, „ce înseamnă rapid?”, primește răspuns la Q1.

**Organizare:** 2 min; cereți studenților câte un exemplu propriu din întrebările scrise la început. []{.pace dur=2}
:::

---

# Primele răspunsuri ale administrației

**R1 — Înregistrare:** studentul autentificat indică locul și descrierea defecțiunii; ambele sunt obligatorii. Sistemul creează o sesizare nouă, cu număr unic, studentul ca autor și starea „înregistrată”. Studentul vede numărul și starea.

**R2 — Acces:** studentul își poate consulta numai propriile sesizări și nu le schimbă starea. Personalul administrației le poate consulta pe toate și le poate actualiza starea.

**Limită convenită:** identitatea și rolul utilizatorului sunt deja cunoscute; autentificarea este în afara exercițiului.

::: notes
„Sesizare” desemnează înregistrarea făcută de un student, nu defecțiunea fizică. Numărul identifică sesizarea, chiar dacă descrierea seamănă cu a alteia. R1 și R2 sunt răspunsuri ale beneficiarului din exemplul didactic, nu fapte despre un sistem real al universității.

La respingerea unei înregistrări incomplete nu se creează sesizarea; formularea completă apare în etapa următoare. Deocamdată verificăm dacă răspunsurile acoperă întrebările inițiale ale studenților.
:::

---

# Limitele convenite pentru prima versiune

| În prima versiune | În afara primei versiuni |
|---|---|
| Înregistrarea unei sesizări | Fotografii și notificări |
| Consultarea stării | Repartizarea echipelor de intervenție |
| Actualizarea stării de către administrație | Prioritizarea și termenele de reparație |

**Obiectivul versiunii:** studentul își poate înregistra sesizarea și poate afla starea consemnată de administrație.

**Limită:** sistemul nu garantează când se repară defecțiunea.

::: notes
Delimitarea trebuie convenită, nu dedusă din lipsa unei funcții în enunț. Aici administrația acceptă explicit aceste limite. Actualizarea stării intră în versiune deoarece consultarea unei stări mereu inițiale nu ar satisface obiectivul.

„În afara primei versiuni” nu înseamnă că funcția este inutilă. O cerere ulterioară poate modifica limitele, iar atunci revedem cerințele afectate.
:::

---

# Ce știm și ce rămâne de convenit?

**Reamintim:** R1 (înregistrare) dă sesizării un număr unic, afișat studentului; notificările sunt excluse.

**Fragmente din răspunsul AI** (Claude Haiku 4.5, 10 octombrie 2026) la cererea administrației și „Propune o specificație concisă: cerințe funcționale, cerințe de calitate și trei exemple de acceptare. Răspunde în română, în maximum 500 de cuvinte.”

| Afirmația din răspunsul AI | Ce tip de afirmație este acum? |
|---|---|
| Sistem generează ticket unic (ID automat) | ? |
| Confirmare imediată via email/mesaj cu ID-ul ticket-ului | ? |
| 99% timp de funcționare | ? |

Pentru fiecare: **informație convenită** (inclusă sau exclusă), **consecință dedusă**, **întrebare deschisă**, **ipoteză** sau **propunere**?

::: notes
Unicitatea este informație convenită prin R1; generarea automată a numărului este o consecință dedusă: R1 spune că sistemul creează sesizarea cu număr unic, iar studentul indică doar locul și descrierea. Notificarea prin email/mesaj este exclusă explicit din prima versiune; R1 cere însă ca studentul să vadă numărul pe ecran. Disponibilitatea de 99% este o propunere de cerință de calitate, nediscutată cu administrația; ea ridică întrebări deschise: ce disponibilitate vrea administrația, pe ce perioadă și cum se măsoară.

Modelul AI primise numai cererea inițială și sarcina de a propune o specificație, fără clarificări; promptul este pe slide: „Administrația campusului cere:”, cererea, apoi instrucțiunea citată. Discutăm ce păstrăm după răspunsurile administrației, nu încălcarea unor reguli pe care nu le primise. Nici ipoteza, nici propunerea nu constituie un acord. Cei 99% sunt primul exemplu de precizie fără sursă; îl reluăm în etapa despre numere, după Q1. Formulările și terminologia modelului AI sunt păstrate. Captura provine din a doua dintre cele două rulări inițiale, la 10 octombrie 2026; promptul este în `initial-prompt.md`.

**Sursă:** `scenarios/03-sesizari/captures/2026-10-10/haiku45-initial-02-response.md`; două puncte din „Raportare problemă” și celula din rândul „Disponibilitate”, fără modificări de conținut.

**Organizare:** 4 min, inclusiv justificările orale. []{.pace dur=4}
:::

---

# Sesizări repetate: păstrăm sau schimbăm regulile?

**Scenariu:** Ana raportează robinetul care curge în sala A12. Bogdan raportează mai târziu același robinet.

**Până acum:** R1 creează o sesizare nouă la fiecare trimitere validă; R2 permite studentului să consulte numai propriile sesizări.

- **A — păstrăm regulile (ipoteza de mai devreme):** fiecare raportare primește număr propriu.
- **B — revizuim R1 și R2:** Bogdan urmărește sesizarea Anei, fără să se creeze una nouă.

Ce întrebare îi puneți administrației, astfel încât răspunsul ei să decidă între variante? Ce vede Bogdan după trimitere în fiecare variantă?

::: notes
Întrebarea concretă ar putea fi: „Doriți o evidență separată pentru fiecare raportare sau o singură sesizare urmărită de mai mulți studenți?” Mai trebuie lămurit cine stabilește că este aceeași defecțiune. B ar modifica două acorduri: R1 nu ar mai crea o sesizare la fiecare trimitere validă, iar R2 ar trebui să permită accesul lui Bogdan la sesizarea Anei. Nu prezentăm B ca fiind deja compatibilă cu regulile convenite.

Nu alegem A doar pentru că este mai ușor de implementat. Exemplul scoate la iveală o decizie a beneficiarului.

**Organizare:** 4 min de discuție. []{.pace dur=4}
:::

---

# Răspunsul devine regulă

**R3 — Sesizări repetate**, răspunsul administrației:

> „În prima versiune păstrăm fiecare sesizare separat, chiar dacă descrie aceeași defecțiune. Nu reunim și nu respingem automat sesizările repetate.”

**Ipoteza devine informație convenită:** fiecare student primește și consultă propria sesizare.

**Consecință dedusă, acceptată de administrație:** cele două sesizări se actualizează separat, chiar dacă o singură intervenție repară robinetul.

::: notes
Această decizie păstrează o evidență a fiecărei raportări, cu un cost operațional pentru administrație.

R3 confirmă că păstrăm R1 și R2 și pentru raportări despre aceeași defecțiune. Reunirea ar putea fi o alegere legitimă într-o altă versiune, după revizuirea explicită a regulilor afectate.
:::

---

# Tipuri de cerințe

| Tip de cerință | La ce întrebare răspunde | Exemplu din campus |
|------|-----|---------|
| Cerință funcțională | Ce face sistemul pentru utilizator? | Studentul consultă starea propriei sesizări. |
| Regulă a domeniului | Ce politică se aplică, cu sau fără sistem? | Sesizările repetate se păstrează separat. |
| Cerință de calitate (nefuncțională) | Cât de bine și în ce condiții? | Starea se afișează într-un timp convenit, la o încărcare dată. |
| Restricție | Ce nu putem alege noi? | Identitatea utilizatorului vine din sistemul universității. |

O cerință descrie **un rezultat observabil** și condițiile în care îl cerem.

::: notes
O limită a versiunii („fotografiile nu intră acum”) nu este o cerință: spune ce lăsăm în afară; apare ca opțiune în exercițiul următor.

Cerința funcțională descrie o interacțiune cu sistemul și rezultatul ei. Regula domeniului este politica organizației: administrația o aplica și când sesizările veneau prin telefon; sistemul trebuie să o respecte, nu o inventează. Cerința de calitate spune cât de bine se face ceva, și trebuie să poată fi evaluată: un prag, condiții, un mod de măsurare; adesea este numită nefuncțională. Restricția este impusă din afară: o tehnologie existentă, legea, bugetul; nu o convenim, o consemnăm.

Tipurile se pot suprapune: controlul accesului este exprimat prin comportament, dar privește și securitatea. Nu cerem o clasificare unică; cerem să știm ce întrebare pune cerința, pentru că fiecare tip se verifică altfel: prin exemple de acceptare, prin confirmarea beneficiarului, prin măsurare. Etichetele R1, R2, … numerotează răspunsurile administrației; un răspuns poate conține cerințe de tipuri diferite.

Deosebirea importantă rămâne între un comportament convenit și o formulare care lasă rezultatul la interpretarea proiectantului. Revenim la „rapid” cu un criteriu concret.
:::

---

# Ce tip de cerință este?

Pe hârtie, pentru fiecare afirmație: **funcțională**, **regulă a domeniului**, **de calitate**, **restricție** sau **limită a versiunii**? Unele admit două răspunsuri.

1. Studentul vede numărul și starea sesizării imediat după trimitere.
2. Numai administrația poate schimba starea unei sesizări.
3. Fiecare sesizare primește un număr unic.
4. Sistemul rămâne utilizabil cu 10.000 de sesizări înregistrate.
5. Autentificarea este asigurată de contul universității, deja existent.
6. Notificările prin email nu intră în prima versiune.

::: notes
1 este funcțională. 2 este o regulă a domeniului (cine are dreptul să declare starea) exprimată și ca cerință funcțională de control al accesului; acceptați ambele răspunsuri. 3 este funcțională: un rezultat al sistemului, nu o politică a administrației. 4 este o cerință de calitate, încă neverificabilă: nu spune ce înseamnă „utilizabil”, nici cum măsurăm; o completăm la Q1. 5 este o restricție. 6 este o limită a versiunii, nu o cerință.

Întrebarea utilă pentru fiecare răspuns: cum am verifica-o? Dacă răspunsul este „întrebăm administrația”, este regulă sau restricție; dacă este „măsurăm”, este de calitate; dacă este „scriem un exemplu”, este funcțională.

**Organizare:** 3 min: 1 individual, 2 pentru răspunsuri. []{.pace dur=3}
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

**Cererea** spunea „să poată raporta o problemă”. **Răspunsul administrației** (R1, mai devreme) a adăugat cine, ce date și ce rezultat. **Forma verificabilă** adaugă condiția precisă și cazul de respingere:

> **Când** studentul autentificat trimite locul și descrierea defecțiunii, ambele nevide, **sistemul creează** sesizarea, cu studentul ca autor, și îi afișează numărul unic și starea „înregistrată”.
>
> **Dacă lipsește** locul sau descrierea, sistemul indică informația lipsă și nu creează sesizarea.

Un **exemplu de acceptare** descrie un caz concret și rezultatul așteptat; poate verifica și **o respingere corectă**:

*Ana trimite „A12” și „robinetul curge” → sesizare nouă a Anei, „înregistrată”; Ana vede numărul și starea.*

::: notes
Conținutul convenit nu se schimbă; se adaugă precizia necesară unei decizii. „Obligatorii” devine „ambele nevide”: o condiție pe care două echipe o verifică la fel. Din „obligatorii” deducem că fără loc sau descriere sesizarea nu se creează (consecință dedusă). Că sistemul indică informația lipsă este propunerea noastră, confirmată de administrație în exemplul didactic. Cereți studenților tipul fiecărui adaos.

Urmărim cine cere, în ce condiții și ce rezultat observabil obține, inclusiv la respingere. Nu prescriem formularul, baza de date sau algoritmul de generare a numărului.

„Nevide” este suficient pentru exemplele de astăzi; validarea unui loc real sau tratarea șirurilor formate doar din spații ar necesita precizări dacă le includem. Nu pretindem că o singură propoziție epuizează toate condițiile unui produs real.

„Acceptare” privește conformitatea sistemului cu cerința, nu aprobarea fiecărei cereri a utilizatorului. Exemplul se poate discuta înaintea implementării; încă nu este un rezultat de test executat.
:::

---

# Ce înseamnă actualizarea stării?

**R4 — Schimbarea stării:** numai administrația poate face aceste două schimbări:

- „înregistrată” → „în lucru”;
- „în lucru” → „rezolvată”.

Orice altă cerere de schimbare este respinsă, inclusiv cererea de a trece în starea curentă; starea rămâne aceeași, iar utilizatorul vede motivul.

„Rezolvată” înseamnă că **administrația a declarat reparația încheiată**. Redeschiderea nu este inclusă.

Poate sistemul să constate singur că robinetul a fost reparat?

::: notes
Sistemul consemnează declarația unei persoane autorizate; nu verifică fizic reparația. Această distincție previne o promisiune pe care sistemul nu o poate susține.

R4 explicitează și respingerea unei cereri de trecere în starea curentă, de exemplu „înregistrată” → „înregistrată”. Folosim regula pentru a scrie exemple, fără să dezvoltăm încă modelarea stărilor sau contractele operațiilor; acestea au cursuri proprii.
:::

---

# În perechi: exemple de acceptare

**R4:** numai administrația schimbă starea: „înregistrată” → „în lucru” sau „în lucru” → „rezolvată”. Orice altă cerere de schimbare, inclusiv repetarea stării curente, este respinsă: motiv afișat, stare neschimbată.

**Date:** sesizarea S41, a Anei, este „înregistrată”; Daria lucrează în administrație. Fiecare exemplu pornește separat de la această stare.

1. Scrieți două exemple: unul cu o schimbare permisă, unul cu o cerere respinsă corect.
2. Pentru fiecare: **starea inițială → cine cere ce schimbare → rezultatul observabil**.
3. Schimbați foaia cu o altă pereche: rezultatul decurge din regulă?

::: notes
Permisă: Daria cere trecerea la „în lucru”; noua stare este afișată. Respinsă din cauza rolului: Ana cere aceeași schimbare; motivul este lipsa dreptului. Respinsă din cauza schimbării nepermise: Daria cere direct „rezolvată” sau cere trecerea în „înregistrată”. În toate respingerile, S41 rămâne „înregistrată”.

Cazurile sunt independente. Un exemplu care schimbă simultan rolul și tranziția nu izolează motivul respingerii; invitați perechea să-l îmbunătățească.

**Organizare:** 9 min: 4 pentru scriere, 2 pentru schimbul între perechi, 3 pentru discutarea a două exemple. []{.pace dur=9}
:::

---

# Un exemplu verifică și ce rămâne neschimbat

**R1:** o sesizare nouă primește un număr unic și starea „înregistrată”; autorul ei este studentul care a trimis-o.

**R3:** sesizările despre aceeași defecțiune se păstrează separat; nu se reunesc și nu se resping automat.

**Starea inițială:** S41, a Anei, descrie robinetul din A12 și este „în lucru”. Bogdan trimite o sesizare validă despre același robinet.

Pe hârtie, scrieți exemplul de acceptare: **starea inițială → cine cere ce → rezultatul observabil**. Precizați ce primește **Bogdan** și ce rămâne neschimbat la **S41**.

::: notes
Consecință dedusă din R3: o sesizare nouă nu modifică autorul, numărul sau starea uneia existente. Bogdan primește o sesizare distinctă, de exemplu S42, în starea „înregistrată”. S41 rămâne a Anei, „în lucru”. Identificatorii S41 și S42 sunt exemple, nu o cerință de numerotare consecutivă.

Exemplul verifică mai mult decât apariția unui mesaj de succes. Nu cerem un anumit format al identificatorului.

**Organizare:** 3 min cu discutarea răspunsului. []{.pace dur=3}
:::

---

# „Rapid” pentru ce anume?

Administrația vrea ca studentul să vadă **rapid** starea sesizării. Întrebarea deschisă „ce înseamnă rapid?” admite interpretări diferite:

- pagina afișează repede starea deja consemnată;
- personalul actualizează repede starea după intervenție;
- echipa repară repede defecțiunea.

**Clarificare convenită:** cerința de timp privește doar **afișarea stării deja consemnate**.

De unde până unde măsurăm? Cu câte sesizări și câte consultări simultane? Câte consultări trebuie să respecte pragul de timp?

::: notes
Cele trei intervale implică responsabilități diferite. Nu putem transforma o cerință despre afișare într-o promisiune despre durata reparației. Un prag numeric fără operație, puncte de măsurare și condiții poate rămâne la fel de ambiguu ca termenul inițial „rapid”.

**Organizare:** cereți răspunsuri la cele trei întrebări de jos înainte de a arăta Q1: ele fixează intervalul măsurat, condițiile și proporția consultărilor care trebuie să respecte pragul de timp.
:::

---

# O cerință de calitate convenită

**Q1 — Timpul de consultare** *(cerință de calitate; valori stabilite pentru exercițiu)*

| Element | Acordul cu administrația |
|----|------------|
| Interval măsurat | Acțiunea de consultare în browser → afișarea stării. |
| Condiții | Rețeaua campusului; 10.000 de sesizări existente; 20 de consultări simultane. |
| Lot de verificare | 1.000 de consultări valide ale propriilor sesizări. |
| Prag | Cel puțin 950 afișează starea corectă în cel mult 2 secunde. |

**Consultări valide:** cele permise de R2, adică fiecare student își consultă propria sesizare.

Celelalte 50 de consultări pot depăși 2 secunde, dar trebuie să afișeze și ele starea corectă.

::: notes
950 din 1.000 înseamnă 95%. Nici celelalte 50 nu pot afișa date greșite: R2 și cerința funcțională continuă să se aplice; Q1 privește pragul de timp. „Valide” privește dreptul de acces (R2), nu reușita: o consultare care eșuează rămâne în lot, nu se numără printre cele 950 reușite la timp, iar lipsa stării corecte încalcă cerința funcțională de consultare, indiferent de prag.

Nu există măsurători reale aici. Un plan de măsurare complet ar fixa și dispozitivele, browserul, profilul cererilor, setul de date și condițiile rețelei. Acestea trebuie convenite înaintea verificării; exemplul nu constituie un acord operațional complet.
:::

---

# Pragul trebuie să permită o decizie

**Q1:** în lotul de 1.000, cel puțin 950 de consultări afișează starea corectă în cel mult 2 secunde, în condițiile convenite.

Două loturi independente, în aceleași condiții:

| Lot | Îndeplinește Q1? |
|------------|---|
| A: 950 afișează corect în cel mult 2 secunde; celelalte 50 afișează corect în 3 secunde. | ? |
| B: 949 afișează corect în cel mult 2 secunde; celelalte 51 afișează corect în 3 secunde. | ? |

Dacă am ști doar media unui lot, de exemplu 1,2 secunde, am putea decide?

*Date didactice, nu rezultate ale unei execuții.*

::: notes
A îndeplinește pragul; B nu. „Cel puțin” include exact 950, iar „cel mult” include exact 2 secunde. Media nu arată câte consultări au respectat pragul. Nu schimbăm după măsurare criteriul convenit.

Un lot reușit susține o afirmație limitată la condițiile verificării. Nu stabilește performanța la orice încărcare.

**Organizare:** 4 min cu răspunsuri și justificări. []{.pace dur=4}
:::

---

# Numere precise: de unde vin? {.transition}

Ce număr dintr-un răspuns AI are o sursă în enunț?

::: notes
Un număr precis pare măsurat sau convenit. Urmărim fiecare număr dintr-un răspuns AI până la o regulă a enunțului; dacă nu găsim una, numărul este o propunere, oricât de exact ar fi. Legătura cu etapele anterioare: Q1 a cerut o discuție cu administrația pentru fiecare valoare, iar „99% timp de funcționare”, clasificat la început, era deja un număr fără sursă.

**Organizare:** minutul 65 din 100; interval 65–90 (25 min): promptul 3, trei fragmente de urmărit câte 4, tabelul nostru 4, decizia 3, întrebări 3. []{.pace at=65}
:::

---

# Cerem cerințe de calitate verificabile

**Context nou:** cererea administrației, R1–R4, Q1 și excluderile, în formularea enunțului; fără conversație anterioară sau soluția profesorului.

**Instrucțiunea exactă, la finalul promptului:**

> Pe baza enunțului, scrie cerințele de calitate pentru prima versiune a sistemului. Fiecare cerință trebuie să fie verificabilă: un prag numeric, condițiile în care se aplică și modul de măsurare. Răspunde în română, în maximum 350 de cuvinte.

**Singura cerință de calitate din enunț, Q1 (timpul de consultare):** în rețeaua campusului, cu 10.000 de sesizări existente și 20 de consultări simultane, cel puțin 950 dintr-un lot de 1.000 de consultări valide ale propriilor sesizări afișează starea corectă în cel mult 2 secunde, de la acțiunea de consultare în browser.

**Predicție:** ce numere va conține răspunsul, în afara celor din Q1?

::: notes
Instrucțiunea cere un prag numeric pentru fiecare cerință, dar enunțul are un singur prag convenit. Un răspuns poate fie să se limiteze la Q1 și să semnaleze ce lipsește, fie să completeze singur pragurile. Nu cerem modelului AI să greșească; o cerere de cerințe măsurabile este una obișnuită.

**Sursă:** `scenarios/03-sesizari/captures/2026-11-19/calitate-prompt.md`: o propoziție de introducere, enunțul copiat din `brief.md` (cererea, limitele, R1–R4, Q1, excluderile) și instrucțiunea de pe slide, integrală. Claude Code, model cerut `claude-haiku-4-5`, 19 noiembrie 2026, trei rulări în contexte noi, fără unelte.

**Organizare:** 3 min; notați pe tablă două-trei predicții. []{.pace dur=3}
:::

---

# Urmăriți fiecare număr până la sursă (1)

**Fragmente din răspunsul AI — Claude Haiku 4.5, rularea 1:**

> **CQ1 — Înregistrare validă** […] Măsurare: 100% dintre sesizările complete sunt create cu identificator; 0% dintre sesizările incomplete sunt acceptate; eroarea se afișează în max 1 secundă.
>
> **CQ3 — Acces controlat — administrație** […] Măsurare: […] 100% din tranzițiile valide sunt aplicate în max 1 secundă; 100% din tranzițiile invalide sunt respinse cu mesaj.

**R1 (înregistrare):** cu locul și descrierea nevide se creează o sesizare cu număr unic; altfel nu se creează. **R4 (schimbarea stării):** numai administrația schimbă „înregistrată” → „în lucru” → „rezolvată”; altă schimbare se respinge. **Q1 (timpul de consultare)** fixează un timp numai pentru consultare.

Pe hârtie, un tabel: **număr din răspuns → regula sursă** sau **nesusținut**.

::: notes
100% și 0% din CQ1 reformulează R1: regula se aplică fiecărei trimiteri, deci „toate” și „niciuna” decurg din ea. La fel 100% din CQ3, din R4. „Max 1 secundă” apare de două ori și nu are sursă: Q1 fixează un timp numai pentru consultare, iar despre afișarea erorii sau aplicarea unei schimbări enunțul nu spune nimic. Un număr nesusținut stă lângă unele susținute, în aceeași propoziție și cu aceeași siguranță.

**Sursă:** `haiku45-calitate-01-response.md`: titlurile CQ1 și CQ3, cu descrierea omisă și linia „Măsurare” alăturată titlului; linia „Măsurare” a lui CQ1 integral, a lui CQ3 fără prima parte („100% dintre sesizările sistemului sunt vizibile;”). În răspuns, CQ2 are și el „max 1 secundă”.

**Organizare:** 4 min: 2 individual, 2 pentru răspunsuri. []{.pace dur=4}
:::

---

# Urmăriți fiecare număr până la sursă (2)

**Fragment din același răspuns AI (rularea 1):**

> **CQ5 — Performanță de consultare (Q1)** […]\
> Măsurare: Cu 10.000 sesizări în sistem și 20 consultări simultane, minimum 950 din 1.000 consultări valide afișează starea corectă în maxim 2 secunde; […]\
> Condiții: 20 utilizatori simultani; fiecare cu 50 sesizări în portofoliu; bază de date cu 10.000 înregistrări; măsurare din acțiunea de consultare la afișare completă.

**Q1 (timpul de consultare):** în rețeaua campusului, cu 10.000 de sesizări existente și 20 de consultări simultane, cel puțin 950 dintr-un lot de 1.000 de consultări valide ale propriilor sesizări afișează starea corectă în cel mult 2 secunde, de la acțiunea de consultare în browser.

Continuați tabelul. Un număr care apare și în Q1 înseamnă același lucru? Ce condiție din Q1 lipsește?

::: notes
10.000, 20 de consultări simultane, 950 din 1.000 și 2 secunde vin din Q1. „20 utilizatori simultani” nu este același lucru cu 20 de consultări simultane: un utilizator poate face mai multe consultări sau niciuna. „50 sesizări în portofoliu” nu are sursă: Q1 nu fixează setul de date. Punctele de măsurare sunt păstrate; lipsește rețeaua campusului.

**Sursă:** `haiku45-calitate-01-response.md`: din CQ5, linia „Măsurare” până la omisiunea marcată și linia „Condiții”, integral.

**Organizare:** 4 min: 2 individual, 2 pentru răspunsuri. []{.pace dur=4}
:::

---

# Urmăriți fiecare număr până la sursă (3)

**Fragmente din același răspuns AI (rularea 1):**

> **CQ4 — Independență sesizări** […]\
> Măsurare: După 1.000 de operații pe sesizări diferite, 100% dintre sesizările neafectate păstrează identificatorul și starea anterioară. […]
>
> **CQ6 — Corectitudine sub concurență** […]\
> Măsurare: 0 stări invalide; 100% consistență după operații concurente.\
> Condiții: 2+ cereri de schimbare de stare în paralel pe aceeași sesizare.

**R3 (sesizări repetate):** o sesizare nouă nu modifică autorul, numărul sau starea uneia existente. **Limită convenită:** exemplele de actualizare pornesc din stările indicate și nu analizează concurența actualizărilor.

Continuați tabelul: ce cere enunțul și ce a adăugat agentul AI?

::: notes
„1.000 de operații” este dimensiunea unei verificări alese de agentul AI; R3 cere rezultatul, nu un număr de operații. 100% reformulează R3: nicio sesizare existentă nu se schimbă. CQ6 este o cerință nouă: enunțul lasă concurența actualizărilor în afara exercițiului, iar „2+ cereri în paralel” nu are sursă. 0 și 100% din CQ6 par riguroase, dar măsoară o cerință pe care nimeni nu a convenit-o.

**Sursă:** `haiku45-calitate-01-response.md`: din CQ4, titlul și linia „Măsurare”, cu descrierea și condițiile omise; din CQ6, titlul, cu descrierea omisă, și liniile „Măsurare” și „Condiții”, integral.

**Organizare:** 4 min: 2 individual, 2 pentru răspunsuri. []{.pace dur=4}
:::

---

# Tabelul de proveniență

**Comparația noastră** (răspunsul AI, rularea 1, față de enunț):

| Număr din răspuns | Sursa în enunț și verdictul nostru |
|------------------------------------|--------------------------------------------------|
| 100%, 0% (CQ1, CQ3, CQ4) | R1–R4 privesc fiecare cerere: **susținut**. |
| Max 1 secundă (CQ1–CQ3) | Q1 (timpul de consultare) nu o cere: **nesusținut**. |
| 10.000, 20, 950 din 1.000, 2 s (CQ5) | Q1: **susținut**; lipsește rețeaua campusului. |
| 20 de utilizatori simultani (CQ5) | Q1 spune 20 de consultări: **schimbat**. |
| 50 de sesizări pe utilizator (CQ5) | Setul de date nu este stabilit: **nesusținut**. |
| 1.000 de operații (CQ4) | R3 (sesizări repetate) nu cere un număr: **nesusținut**. |
| 2+ cereri în paralel (CQ6) | Concurența este exclusă: **nesusținut**. |

::: notes
Tabelul este verificarea noastră, nu o continuare a răspunsului AI. Procentele de 100% și 0% sunt susținute pentru că reformulează reguli: „fiecare” și „niciuna”. Cele trei verdicte cer acțiuni diferite: ce este susținut păstrăm, ce este schimbat corectăm după sursă, ce este nesusținut ducem la administrație sau scoatem. Răspunsul nu marchează nicăieri această diferență: „max 1 secundă” și „2 secunde” au aceeași formă.

**Organizare:** 4 min; comparați cu tabelele studenților. []{.pace dur=4}
:::

---

# Decizia noastră: precis nu înseamnă convenit

**Decizia noastră:**

- Păstrăm CQ5 cu valorile din Q1 (timpul de consultare), cu 20 de **consultări** simultane, și adăugăm rețeaua campusului.
- „Max 1 secundă” pentru erori și schimbări de stare devine o întrebare pentru administrație: contează acest timp? Dacă da, cu ce prag și în ce condiții?
- 50 de sesizări pe utilizator și 1.000 de operații sunt propuneri pentru planul de verificare, nu cerințe.
- 100% și 0% le putem scrie mai simplu, ca reguli: „fiecare”, „niciuna”.

**Ce reținem:** un număr precis nu este și un număr convenit. Fiecare număr dintr-o cerință are o sursă sau o persoană care trebuie să-l confirme.

*Rulare selectată din trei; în altă rulare, singurul prag de timp a fost cel din Q1.*

::: notes
CQ6 nu se păstrează: concurența actualizărilor este în afara exercițiului; dacă administrația o vrea, este o cerință nouă, de convenit. Rularea 2 a păstrat Q1 integral, dar a ales numere pentru teste (10 combinații, 15 tranziții valide). Rularea 3 a folosit numai valorile din Q1 și procente de 100% care reformulează regulile. Selecția arată un risc posibil, nu comportamentul tipic al modelului AI.

**Sursă:** arhiva `scenarios/03-sesizari/captures/2026-11-19/README.md` păstrează toate cele trei rulări și motivul selecției.

**Organizare:** 3 min, apoi 3 min pentru întrebări; treceți la exercițiul final la minutul 90. []{.pace dur=6}
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

**Un profesor (beneficiarul) cere:** „Studenții să se poată înscrie ușor la consultații.”

**Clarificări convenite:** există intervale de 15 minute, fiecare cu un singur loc. Înscrierile se procesează pe rând, câte una. Un student nu se poate înscrie la un interval deja ocupat. Anularea înscrierii nu intră în exercițiu.

Individual, pe hârtie, fără asistent AI, scrieți:

1. O cerință (cine, în ce condiții, ce rezultat) pentru încercarea de înscriere la un interval ocupat.
2. Un exemplu concret care o verifică.
3. O întrebare deschisă pentru profesor, care ar clarifica termenul „ușor”.

::: notes
Răspuns posibil: încercarea este respinsă și înscrierea existentă se păstrează. Exemplu: Ana ocupă intervalul 10:00–10:15; Bogdan încearcă același interval și nu obține locul. Modul de informare a lui Bogdan poate fi propus, dar enunțul nu impune textul sau canalul mesajului.

„Ușor” ar putea privi pașii necesari, înțelegerea opțiunilor sau accesibilitatea. Întâi întrebăm despre ce utilizatori și ce sarcină este vorba, apoi convenim un criteriu; nu alegem arbitrar „maximum trei clicuri”.

**Organizare:** 7 min: 3 individual, 4 pentru discutarea câtorva răspunsuri. []{.pace dur=7}
:::

---

# Trei întrebări de păstrat

1. **De unde știm?** Informație convenită, consecință dedusă, întrebare deschisă, ipoteză sau propunere — inclusiv când afirmația vine de la un agent AI?
2. **Ce observăm?** În ce condiții sistemul acceptă sau respinge o cerere și ce rămâne neschimbat?
3. **Ce mai trebuie decis?** Cine poate răspunde și ce depinde de răspuns?

**Cursul următor:** modelarea domeniului — conceptele și relațiile care explică regulile convenite.

::: notes
Înțelegerea se vede în capacitatea de a formula un rezultat și a-l susține printr-o sursă și un exemplu. Nu este necesar ca toate cerințele să folosească aceeași formulă de redactare.

**Organizare:** 3 min pentru sinteză și întrebări; încheiere la minutul 100. []{.pace dur=3}
:::
