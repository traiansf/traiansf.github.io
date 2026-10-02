---
title: "AMSS 2026/2027 — Laboratorul 1: Înțelegere, specificare, revizuire"
author: "Traian-Florin Șerbănuță"
lang: ro-RO
---

# Rezervarea sălilor de studiu din campus

**În perechi · 100 de minute**

Explicați singuri problema, pregătiți o specificație cu limite clare,
delegați o revizuire (review) și decideți ce afirmații sunt întemeiate.

La final: o descriere comună a problemei și explicația individuală a unei decizii de proiectare.

Fișe: [informațiile beneficiarului](https://github.com/traiansf/traiansf.github.io/blob/main/class/amss-2026/lab/scenarios/lab01/scenario.md)&nbsp;· [fișa de lucru](https://github.com/traiansf/traiansf.github.io/blob/main/class/amss-2026/lab/scenarios/lab01/worksheet.md)

::: notes
Laboratorul se desfășoară după predarea cursurilor 1 și 2. Exercițiul aplică într-un domeniu nou ideile introductive din cursul 2 despre înțelegerea problemei, scenarii și delegare; nu presupune că cerințele din cursul 3 au fost predate în detaliu. Studenții știu să programeze; introduceți explicit termenii de analiză și proiectare. Nu se cere implementarea unei aplicații.
:::

---

# Citatul zilei

> „Simplitatea este o condiție necesară pentru fiabilitate.”
>
> Original: “Simplicity is prerequisite for reliability.”

— **Edsger W. Dijkstra**

[Sursa: How do we tell truths that might hurt? — EWD498](https://www.cs.virginia.edu/~evans/cs655/readings/ewd498.html)

::: notes
Transcriere universitară, afirmația marcată ca adnotare manuscrisă; originalul este în arhiva Dijkstra de la UT Austin, EWD498.

Legătura cu tema: O descriere pe care o putem înțelege și verifica înainte de delegare.
:::

---

# Parcursul de azi

| Minute | Activitate |
|---|---|
| 0–8 | Analiză individuală, fără AI |
| 8–16 | Compararea interpretărilor; clarificarea distincțiilor |
| 16–26 | Pregătirea spațiului de lucru și a rolurilor |
| 26–44 | Descrierea problemei și predarea sarcinii către autor |
| 44–60 | Schimbarea rolurilor; revizuire independentă |
| 60–78 | Evaluarea revizuirii și modificări justificate |
| 78–90 | Argumentare individuală și o cerință nouă |
| 90–100 | Prezentarea deciziilor și predarea lucrării |

::: notes
Distribuiți scenario.md și worksheet.md din lab/scenarios/lab01/ înainte de a începe. Dați studenților fișierele-sursă sau copii tipărite; ele nu sunt publicate ca prezentări separate. Folosiți prepared-fixture.md dacă instrumentele nu sunt accesibile. Dacă nu ajunge timpul, păstrați etapele de lucru fără ajutor și de revizuire.
:::

---

# Informațiile beneficiarului

Campusul dorește ca studenții să poată rezerva sala **Alder** sau sala **Birch** pentru studiu.

- **F1:** o singură zi viitoare pentru pilot, **D**; ambele săli sunt deschise 09:00–17:00.
- **F2:** un serviciu al universității furnizează identitatea verificată a studentului; sălile sunt deja configurate.
- **F3:** o cerere indică un student, o sală și un interval în D; începutul precedă sfârșitul, iar intervalul se încadrează în programul sălii.
- **F8:** administrarea sălilor, plățile, rezervările recurente, listele de așteptare și notificările sunt excluse.

Fișa este sursa informațiilor convenite. Întrebările nu stabilesc reguli noi.

::: notes
Identificatorii informațiilor corespund celor din scenario.md. Citiți fișa completă, inclusiv F4–F7 și întrebările deschise, înainte de a evalua un material. „Exclus” descrie limitele acestui exercițiu.
:::

---

# Reguli pe care le putem verifica

- **F4:** rezervările confirmate pentru **aceeași sală** nu se pot suprapune. Una poate începe când se termină alta.
- **F5:** două cereri simultane în conflict nu pot fi ambele confirmate. Pentru o sală liberă, dacă sunt altfel valide, una se confirmă și cealaltă se respinge pentru conflict; nu s-a stabilit care are prioritate.
- **F6:** titularul poate anula înainte de început; intervalul devine liber. Alt student nu poate anula rezervarea.
- **F7:** o rezervare reușită primește un cod; o respingere indică regula convenită care nu este respectată.

Anularea la ora de început sau după aceasta și rezervările suprapuse ale aceluiași student în săli diferite rămân întrebări deschise.

::: notes
F5 ne permite să discutăm despre o responsabilitate care impune o regulă asupra mai multor cereri. Nu prescrie blocări, baze de date, clase sau un anumit mod de instalare. Pentru azi ajung o responsabilitate precisă și un scenariu.
:::

---

# Mai întâi: analiza proprie (0–8)

Lucrați individual, fără AI. Păstrați aceste notițe inițiale.

1. Formulați scopul și limitele cu cuvintele voastre.
2. Explicați ce este o sală și ce este o rezervare.
3. Dați un exemplu de cerere acceptată și unul de cerere respinsă, fiecare justificat printr-o informație din fișă.
4. Formulați o întrebare pe care ați pune-o înainte de a extinde soluția.

Folosiți propoziții, un tabel mic, o schiță sau pseudocod.

::: notes
Dați studenților fișa completă de la început și începeți imediat această activitate. Nu demonstrați mai întâi un răspuns. La minutul 8, cereți o distincție și o incertitudine. Notițele inițiale se păstrează și după ce studenții își revizuiesc interpretarea.
:::

---

# Patru tipuri de afirmații

| Tip | Exemplu |
|------|--------------|
| Cerință convenită | F4: rezervările confirmate pentru aceeași sală nu se suprapun. |
| Consecință dedusă | Alder rezervată 10:00–11:00 intră în conflict cu o cerere pentru Alder 10:30–11:30. |
| Alegere de proiectare | O operație de rezervare răspunde de verificarea conflictului și de confirmare. |
| Regulă încă neclarificată | Poate un student avea rezervări suprapuse în săli diferite? |

O propunere devine cerință convenită doar după ce o acceptă beneficiarul.

::: notes
O ipoteză este un răspuns provizoriu la o întrebare deschisă, etichetat explicit, cu consecințele sale. Studenții pot alege o ipoteză pentru explorare, dar nu o pot prezenta drept aprobată. Un model al domeniului descrie concepte și reguli; nu este neapărat o proiectare a claselor.
:::

---

# De la regulă la responsabilitate

**Concept al domeniului:** o rezervare leagă un student, o sală și un interval.

**Invariant:** o regulă care trebuie să rămână adevărată — aici, fără rezervări confirmate suprapuse pentru aceeași sală.

**Responsabilitate:** o parte a sistemului propus trebuie să impună această regulă la fiecare confirmare.

Discutați: de ce poate fi insuficient „verifică disponibilitatea, apoi confirmă mai târziu”?

::: notes
Desenați două cereri care văd amândouă „liber” înainte să fie confirmată vreuna. Invariantul privește rezultatul combinat. O responsabilitate poate aparține unei funcții, unui serviciu, unui obiect sau unei operații asupra datelor. Studenții nu trebuie să implementeze controlul concurenței; formulați garanția cerută și includeți în sarcina predată o verificare a implementării.

Exercițiul bibliotecii presupunea explicit operații executate pe rând. Aici, F5 include explicit cereri simultane, deci garanția cerută este mai puternică. Diferența vine din limitele declarate ale problemei, nu dintr-un defect al exemplului anterior.
:::

---

# Spațiul de lucru și rolurile (16–26)

- Deschideți fișele și creați o copie de lucru comună.
- Alegeți orice instrument și model AI disponibil. Notați-le, dacă sunt cunoscute.
- Deschideți o **sesiune pentru autor** și o **sesiune separată pentru revizuire**.
- **A:** îndrumă autorul. **B:** verifică afirmațiile pe baza informațiilor beneficiarului.
- La minutul 44, schimbați rolurile: **B** îndrumă evaluatorul; **A** verifică afirmațiile acestuia.

Dacă AI nu este disponibil, folosiți [exemplul pregătit](https://github.com/traiansf/traiansf.github.io/blob/main/class/amss-2026/lab/scenarios/lab01/prepared-fixture.md) și o revizuire separată între colegi.

::: notes
Pașii de configurare sunt descriși în tooling/SETUP.md. Nu trebuie cumpărat nimic și nu se impune un anumit model. O conversație nouă este suficientă; se poate folosi același instrument/model. Fișierele comune sau istoricul preluat automat pot transmite contextul autorului: dați evaluatorului doar pachetul ales explicit. Pentru lucrul fără acces la AI, schimbați pachetele cu o pereche vecină dacă ambii parteneri au redactat deja varianta de lucru.

Perechile care termină pregătirea mai devreme își compară notițele inițiale și identifică o regulă încă neclarificată, în timp ce cadrul didactic rezolvă problemele de acces. Perechile trec la etapa următoare la momentul anunțat, fără să aștepte aprobarea cadrului didactic.
:::

---

# Predarea sarcinii: un contract în miniatură

Când predați autorului sarcina și contextul (handoff), precizați:

- **Intrări:** informațiile exacte ale beneficiarului și analiza inițială.
- **Sarcină:** o descriere concisă a problemei și planul pasului următor.
- **Limite:** etichetează propunerile și întrebările; nu inventa reguli.
- **Justificări:** citează sursele lângă cerințe și scenarii.
- **Oprire:** nu continua până nu decide un om ce a rămas nerezolvat.

Salvați o copie a variantei rezultate pentru revizuire.

::: notes
Studenții pot redacta sau edita singuri descrierea. Predarea sarcinii delimitează munca delegată; nu îi obligă pe studenți să accepte textul generat. Copia poate fi un fișier, o versiune salvată sau un commit. Evaluatorul trebuie să știe ce versiune a revizuit. Sarcina se oprește înainte de implementare.
:::

---

# Promptul autorului (26–44)

> Ai rolul de asistent de analiză. Folosind doar informațiile beneficiarului și notițele atașate, redactează scopul, limitele, conceptele domeniului, regulile, scenariile de acceptare și întrebările deschise. Citează identificatorii informațiilor. Marchează separat propunerile de proiectare. Cere clarificări unde lipsesc reguli; nu răspunde în numele beneficiarului. Propune următoarea sarcină de proiectare, cu limite, intrări, responsabilități, verificări și o condiție de oprire. Nu o implementa.

Citiți rezultatul. Acceptați, editați sau cereți o corectare, **motivând decizia**.

::: notes
Fișa de lucru conține promptul de copiat. Dacă rezultatul este corect, păstrați-l și explicați verificările care susțin această concluzie. Dacă este prea lung, cereți un rezumat care să păstreze trimiterile la informații/scenarii și verificați o afirmație importantă din rezumat față de textul complet. Nu cereți erori inventate.

Ajung câteva puncte scurte. Păstrați o singură descriere comună și citați identificatorii informațiilor/scenariilor din ea în predarea sarcinii și în revizuire, fără a copia același material în mai multe secțiuni.
:::

---

# Scenarii care disting regulile

Fiecare rând este un **caz independent**, cu o singură rezervare confirmată inițial: **Alder,&nbsp;10:00–11:00**.

| Cerere sau acțiune | Rezultat așteptat | Sursă |
|---|---|---|
| Alder, 10:30–11:30 | Respingere: conflict | F4 |
| Alder, 11:00–12:00 | Acceptare* | F3–F4 |
| Birch, 10:30–11:30, alt student | Acceptare* | F3–F4 |
| Alt student anulează | Respingere; fără modificări | F6 |

\* După verificarea celorlalte condiții convenite.

Adăugați câte un caz pentru cereri simultane și pentru anulare.

::: notes
„Alt student” evită regula încă neclarificată pentru rezervări în săli diferite. Precizați starea inițială și celelalte condiții convenite pentru fiecare scenariu. Scenariile suplimentare trebuie să verifice reguli care contează pentru problemă; scopul nu este numărul lor.
:::

---

# Revizuire separată (44–60)

Începeți într-un context nou. Transmiteți **informațiile, versiunea salvată și criteriile**:

> Revizuiește descrierea problemei în raport cu informațiile primite. Verifică limitele, distincțiile dintre concepte, precizia regulilor, scenariile de acceptare și dacă responsabilitățile propuse pot păstra regulile. Pentru fiecare afirmație, citează pasajul din variantă și informația-sursă sau un contraexemplu. Distinge între contradicție, întrebare nerezolvată și alternativă opțională. Identifică și deciziile pe care informațiile le susțin. Nu inventa răspunsuri ale beneficiarului și nu impune o anumită notație, arhitectură sau tehnologie.

Dați-i evaluatorului intrările convenite, nu conversația autorului.

::: notes
Un context separat nu garantează o judecată corectă. Același model poate repeta aceeași ipoteză. De aceea urmează evaluarea umană. Dacă instrumentele nu funcționează, un coleg face revizuirea cu același pachet și aceleași criterii.
:::

---

# Verificați constatările (60–78)

Pentru fiecare constatare importantă pe care o rețineți, notați:

| Constatarea revizuirii | Verificare | Decizia omului |
|---|---|---|
| „Varianta respinge greșit rezervările adiacente.” | F4 permite adiacența; verificați regula citată. | Acceptați dacă varianta chiar respinge adiacența. |
| „Este necesară o bază de date relațională.” | Nicio informație nu prescrie stocarea. | Tratați-o ca propunere opțională de proiectare. |

Decizii: **acceptare**, **respingere** sau **amânare pentru clarificare**. Motivați.

Modificați unde se justifică; reluați scenariul afectat pe noua versiune.

::: notes
Constatările revizuirii se confruntă atât cu cerințele beneficiarului, cât și cu varianta redactată. Evaluatorul poate să nu găsească nicio contradicție; studenții pot accepta această concluzie după ce explică verificările. Nu trebuie să inventeze defecte, să respingă ceva sau să trimită un prompt nou pentru un rezultat corect.
:::

---

# Ce sarcină putem preda în continuare?

Propuneți o **sarcină de proiectare**, în limitele descrierii acceptate azi:

- clarificați limita anulării și regula rezervărilor în săli diferite;
- atribuiți responsabilitatea verificării și a confirmării rezervării;
- descrieți rezultatele rezervării/anulării care păstrează F4–F6;
- validați scenariile și evidențiați ipotezele neconfirmate;
- opriți-vă pentru revizuire umană înainte de implementare.

Precizați versiunea de intrare, rezultatul așteptat și verificările cerute.

::: notes
Un principiu al cursului este verificarea unei specificații și a unei proiectări temeinice; Laboratorul 1 face primul pas. O regulă neclarificată poate bloca ramura afectată, în timp ce lucrul la partea convenită continuă. Un plan cu limite clare arată explicit această separare.
:::

---

# Lucru comun, explicații individuale

**Comun:** descrierea concisă, următoarea sarcină (cu limite clare) și evidența revizuirii, cu deciziile voastre.

**Individual, fără AI:** păstrați analiza inițială și explicați:

- o decizie pe care o puteți apăra printr-o informație și un scenariu;
- o alternativă plauzibilă sau o ipoteză neconfirmată;
- ce trebuie reconsiderat la schimbarea de pe diapozitivul următor.

Folosiți fișa de lucru. Păstrați fragmentele de care aveți nevoie ca să vă justificați deciziile.

::: notes
Fișiere sugerate: brief.md, review.md, individual/<student-id>.md în lab01/<pair-id>/, în spațiul de lucru pus la dispoziție. Se acceptă orice format echivalent, dacă autorii sunt clar identificați. Schema de notare a cursului este 5 puncte pentru dosarul de proiectare, 3 pentru examenul grilă, 1 pentru prezență și 1 din oficiu. Acest laborator are rol formativ, fără o notă numerică separată.
:::

---

# Cerință nouă: răspuns individual (78–90)

Beneficiarul propune acum:

> „De mâine, o rezervare ar trebui să dureze cel mult 60 de minute.”

Există deja o rezervare confirmată pentru mâine (ziua D), cu durata de 90&nbsp;de minute.

Fără AI:

1. Explicați ce este nou și ce decizii anterioare sunt afectate.
2. Identificați regula lipsă pentru rezervările existente.
3. Comparați două răspunsuri justificabile și dați un scenariu care le distinge.

::: notes
Pentru acest scenariu de schimbare, ziua-pilot D este mâine. Este o versiune nouă a cerințelor, nu un defect ascuns în versiunea inițială. Exceptarea rezervărilor existente și aplicarea limitei după o tranziție convenită sunt reguli posibile. Nu anulați sau scurtați implicit o rezervare existentă. Explicați consecințele și cereți aprobarea regulii.
:::

---

# Prezentare și predare (90–100)

Fiecare pereche selectată explică unul dintre aspectele următoare:

- o regulă pe care trebuie să o stabilească beneficiarul, deși părea o decizie tehnică;
- o constatare a evaluatorului pe care perechea a verificat-o în sursă;
- o decizie corectă păstrată și scenariul care o susține.

Predați fișierele comune și explicația fiecăruia acolo unde a anunțat cadrul didactic.

Dacă nu reușiți să predați, folosiți canalul alternativ anunțat.

::: notes
Alegeți raționamente diferite, inclusiv o variantă generată corectă. Nu premiați perechea care a găsit cele mai multe defecte. Încheiați cerându-i unui student să distingă o cerință, o ipoteză și o alegere de proiectare. Lucrul cu repository-ul nu trebuie să consume din timpul exercițiului.
:::

---

# Ce arată că ați înțeles

Lucrarea este pregătită pentru feedback când:

- informațiile, ipotezele, întrebările și alegerile de proiectare se disting;
- cerințele și scenariile respectă informațiile beneficiarului;
- sarcina predată are limite, rezultat și punct de revizuire clare;
- constatările evaluatorului sunt verificate și fiecare are o decizie a voastră;
- fiecare partener explică singur o alegere și analizează schimbarea.

Urmează: formularea problemei și cerințele, apoi modelarea domeniului.

::: notes
Oferiți feedback punctual pentru revizuire acolo unde lipsesc justificări. Judecata se apreciază după explicații și verificări, nu după instrument, lungimea rezultatului sau aspectul unei diagrame.
:::
