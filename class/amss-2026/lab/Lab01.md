---
title: "AMSS 2026/2027 — Laboratorul 1: Înțelegere, specificare, revizuire"
author: "Traian-Florin Șerbănuță"
lang: ro-RO
---

# Programarea mașinilor de spălat din cămin

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
| 8–18 | Compararea interpretărilor; cinci tipuri de afirmații |
| 18–26 | Pregătirea spațiului de lucru și a rolurilor |
| 26–44 | Descrierea problemei și predarea sarcinii către analist |
| 44–60 | Schimbarea rolurilor; revizuire independentă |
| 60–78 | Evaluarea revizuirii: întâi individual, apoi împreună |
| 78–90 | Argumentare individuală și o cerință nouă |
| 90–100 | Prezentare și predarea lucrării |

::: notes
Distribuiți scenario.md și worksheet.md din lab/scenarios/lab01/ înainte de a începe. Dați studenților fișierele-sursă sau copii tipărite; ele nu sunt publicate ca prezentări separate. Folosiți prepared-fixture.md dacă instrumentele nu sunt accesibile. Dacă nu ajunge timpul, păstrați etapele de lucru fără ajutor și de revizuire.
:::

---

# Informațiile beneficiarului

Căminul dorește ca locatarii să își poată programa mașina de spălat **Albastra** sau **Verdea**.

- **F1:** o singură zi viitoare pentru pilot, **D**; spălătoria este deschisă 08:00–22:00.
- **F2:** serviciul de cazare furnizează identitatea verificată a locatarului; mașinile sunt deja configurate.
- **F3:** o cerere indică un locatar, o mașină și un interval în D; începutul precedă sfârșitul, iar intervalul se încadrează în program.
- **F8:** plățile, programările recurente, listele de așteptare, administrarea mașinilor, semnalarea defecțiunilor și notificările sunt excluse.

Fișa este sursa informațiilor convenite. Întrebările nu stabilesc reguli noi.

::: notes
Identificatorii informațiilor corespund celor din scenario.md. Citiți fișa completă, inclusiv F4–F7 și întrebările deschise Q1–Q3, înainte de a evalua un material. „Exclus” descrie limitele acestui exercițiu.
:::

---

# Reguli pe care le putem verifica

- **F4:** programările confirmate pentru **aceeași mașină** nu se suprapun; una poate începe când se termină alta.
- **F5:** din două cereri simultane în conflict, una se confirmă, cealaltă se respinge; prioritatea nu este stabilită.
- **F6:** doar titularul anulează, înainte de început; intervalul devine liber.
- **F7:** o programare reușită primește un cod; o respingere indică regula încălcată.

Întrebările deschise Q1–Q3 sunt în fișă.

::: notes
F5 ne permite să discutăm despre o responsabilitate care impune o regulă asupra mai multor cereri. Nu prescrie blocări, baze de date, clase sau un anumit mod de instalare. Pentru azi ajung o responsabilitate precisă și un scenariu. Q1: programări suprapuse ale aceluiași locatar pe mașini diferite; Q2: anularea la ora de început sau după; Q3: limite de durată, de număr sau de programare în avans, neconvenite.
:::

---

# Mai întâi: analiza proprie (0–8)

Lucrați individual, fără AI. Păstrați aceste notițe inițiale.

1. Formulați scopul și limitele cu cuvintele voastre.
2. Numiți conceptele (mașină, programare, locatar, interval) și regula care îl privește pe fiecare.
3. Ce trebuie să fie adevărat după o programare reușită?
4. Dați o cerere acceptată și una respinsă, fiecare cu informația din fișă.
5. Formulați o întrebare pentru beneficiar.

::: notes
Dați studenților fișa completă de la început și începeți imediat această activitate. Nu demonstrați mai întâi un răspuns. La minutul 8, cereți o distincție și o incertitudine. Notițele inițiale se păstrează și după ce studenții își revizuiesc interpretarea.
:::

---

# Cinci tipuri de afirmații

| Tip | Exemplu |
|---|----------|
| Informație convenită | F4: pe aceeași mașină, programările confirmate nu se suprapun. |
| Consecință dedusă | Albastra 10:30–11:30 intră în conflict cu Albastra 10:00–11:00. |
| Ipoteză | Provizoriu: un locatar nu folosește două mașini deodată. |
| Întrebare deschisă | Poate un locatar avea programări suprapuse pe mașini diferite? |
| Propunere de proiectare | O operație de programare verifică conflictul și confirmă. |

O ipoteză sau o propunere devine informație convenită doar după ce o confirmă beneficiarul.

::: notes
Sunt aceleași cinci tipuri ca în cursul 2. O ipoteză este un răspuns provizoriu la o întrebare deschisă, etichetat explicit, cu consecințele sale. Studenții pot alege o ipoteză pentru explorare, dar nu o pot prezenta drept confirmată. Un model al domeniului descrie concepte și reguli; nu este neapărat o proiectare a claselor.
:::

---

# De la regulă la responsabilitate

**Concept al domeniului:** o programare leagă un locatar, o mașină și un interval.

**Invariant:** o regulă care trebuie să rămână adevărată — aici, fără programări confirmate suprapuse pentru aceeași mașină.

**Responsabilitate:** o parte a sistemului propus trebuie să impună această regulă la fiecare confirmare.

Discutați: de ce poate fi insuficient „verifică disponibilitatea, apoi confirmă mai târziu”?

::: notes
Desenați două cereri care văd amândouă „liber” înainte să fie confirmată vreuna. Invariantul privește rezultatul combinat. O responsabilitate poate aparține unei funcții, unui serviciu, unui obiect sau unei operații asupra datelor. Studenții nu trebuie să implementeze controlul concurenței; formulați garanția cerută și includeți în sarcina predată o verificare a implementării.

Exercițiul bibliotecii presupunea explicit operații executate pe rând (R6). Aici, F5 include explicit cereri simultane, deci garanția cerută este mai puternică. Diferența vine din limitele declarate ale problemei, nu dintr-un defect al exemplului anterior.
:::

---

# Spațiul de lucru și rolurile (18–26)

- Deschideți fișele și creați o copie de lucru comună.
- Alegeți orice instrument și model AI disponibil. Notați-le, dacă sunt cunoscute.
- Deschideți o **sesiune pentru analist** și o **sesiune separată pentru revizuire**.
- **A:** îndrumă analistul. **B:** verifică afirmațiile pe baza informațiilor beneficiarului.
- La minutul 44, schimbați rolurile: **B** îndrumă evaluatorul; **A** verifică afirmațiile acestuia.

Dacă AI nu este disponibil, folosiți [exemplul pregătit](https://github.com/traiansf/traiansf.github.io/blob/main/class/amss-2026/lab/scenarios/lab01/prepared-fixture.md) și o revizuire separată între colegi.

::: notes
Pașii de configurare sunt descriși în tooling/SETUP.md. Nu trebuie cumpărat nimic și nu se impune un anumit model. O conversație nouă este suficientă; se poate folosi același instrument/model. Fișierele comune sau istoricul preluat automat pot transmite contextul analistului: dați evaluatorului doar pachetul ales explicit. Pentru lucrul fără acces la AI, schimbați pachetele cu o pereche vecină dacă ambii parteneri au redactat deja varianta de lucru.

Perechile care termină pregătirea mai devreme își compară notițele inițiale și identifică o regulă încă neclarificată, în timp ce profesorul rezolvă problemele de acces. Perechile trec la etapa următoare la momentul anunțat, fără să aștepte confirmarea profesorului.
:::

---

# Predarea sarcinii: un contract în miniatură

Când predați analistului sarcina și contextul (handoff), precizați:

- **Intrări:** informațiile exacte ale beneficiarului și analiza inițială.
- **Sarcină:** o descriere concisă a problemei și planul pasului următor.
- **Limite:** clasifică afirmațiile; nu inventa reguli.
- **Justificări:** citează sursele lângă cerințe și scenarii.
- **Oprire:** nu continua până nu decide un om ce a rămas nerezolvat.

Salvați o copie a variantei rezultate pentru revizuire.

::: notes
Studenții pot redacta sau edita singuri descrierea. Predarea sarcinii delimitează munca delegată; nu îi obligă pe studenți să accepte textul generat. Copia poate fi un fișier, o versiune salvată sau un commit. Evaluatorul trebuie să știe ce versiune a revizuit. Sarcina se oprește înainte de implementare.
:::

---

# Promptul analistului (26–44)

> Ai rolul de asistent de analiză. Folosind doar informațiile beneficiarului și notițele atașate, redactează scopul, limitele, conceptele domeniului, regulile, scenariile de acceptare și întrebările deschise. Citează identificatorii informațiilor. Clasifică afirmațiile ca informație convenită, consecință dedusă, ipoteză, întrebare deschisă sau propunere de proiectare. Cere clarificări unde lipsesc reguli; nu răspunde în numele beneficiarului. Propune următoarea sarcină de proiectare, cu limite, intrări, responsabilități, verificări și o condiție de oprire. Nu o implementa.

Citiți rezultatul. Acceptați, editați sau cereți o corectare, **motivând decizia**.

::: notes
Fișa de lucru conține promptul de copiat. Dacă rezultatul este corect, păstrați-l și explicați verificările care susțin această concluzie. Dacă este prea lung, cereți un rezumat care să păstreze trimiterile la informații/scenarii și verificați o afirmație importantă din rezumat față de textul complet. Nu cereți erori inventate.

Ajung câteva puncte scurte. Păstrați o singură descriere comună și citați identificatorii informațiilor/scenariilor din ea în predarea sarcinii și în revizuire, fără a copia același material în mai multe secțiuni.
:::

---

# Scenarii care disting regulile

Fiecare rând este un **caz independent**, după S1: Ioana are programată **Albastra,&nbsp;10:00–11:00**.

| ID | Cerere sau acțiune | Rezultat așteptat | Sursă |
|-|--------|------|--|
| S2 | Radu: Albastra, 10:30–11:30 | Respingere: conflict | F4 |
| S3 | Radu: Albastra, 11:00–12:00 | Acceptare* | F3–F4 |
| S4 | Radu: Verdea, 10:30–11:30 | Acceptare* | F3–F4 |
| S7 | Radu anulează programarea Ioanei | Respingere; fără modificări | F6 |

\* După verificarea celorlalte condiții convenite.

Completați voi S5 (cereri simultane), S6 (anulare) și S8 (aceeași persoană, altă mașină).

::: notes
Radu evită întrebarea încă deschisă despre programările aceluiași locatar pe mașini diferite (Q1); S8 o ridică explicit. Precizați starea inițială și celelalte condiții convenite pentru fiecare scenariu. Scenariile suplimentare trebuie să verifice reguli care contează pentru problemă; scopul nu este numărul lor.
:::

---

# Revizuire separată (44–60)

Începeți într-un context nou. Transmiteți **informațiile, versiunea salvată și criteriile**:

> Revizuiește descrierea problemei în raport cu informațiile primite. Verifică limitele, distincțiile dintre concepte, precizia regulilor, scenariile de acceptare și dacă responsabilitățile propuse pot păstra regulile. Pentru fiecare afirmație, citează pasajul din variantă și informația-sursă sau un contraexemplu. Distinge între contradicție, întrebare nerezolvată și alternativă opțională. Identifică și deciziile pe care informațiile le susțin. Nu inventa răspunsuri ale beneficiarului și nu impune o anumită notație, arhitectură sau tehnologie.

Dați-i evaluatorului intrările convenite, nu conversația analistului.

::: notes
Un context separat nu garantează o judecată corectă. Același model poate repeta aceeași ipoteză. De aceea urmează evaluarea umană. Dacă instrumentele nu funcționează, un coleg face revizuirea cu același pachet și aceleași criterii.
:::

---

# Verificați constatările (60–78)

Mai întâi singuri (5 minute): clasificați fiecare constatare. Apoi decideți împreună.

| Constatarea revizuirii | Verificare | Decizia omului |
|-----|-----|-----|
| „Și o respingere ar trebui să primească un cod.” | F7 cere cod doar la reușită. | Respingeți ca defect; cel mult o propunere. |
| „Lipsește tratarea unei mașini defecte.” | F8 exclude semnalarea defecțiunilor. | Amânați, ca extindere ulterioară. |
| Nicio problemă găsită | Reluați S1–S8 pe versiunea revizuită. | Acceptați dacă rezultatele coincid. |

Decizii: **acceptare**, **respingere** sau **amânare**. Motivați și reluați scenariul afectat.

::: notes
Constatările revizuirii se confruntă atât cu cerințele beneficiarului, cât și cu varianta redactată. Clasificarea individuală vine înaintea discuției în pereche, ca fiecare student să-și formeze propria judecată; notați unde partenerii au decis diferit. Evaluatorul poate să nu găsească nicio contradicție; studenții pot accepta această concluzie după ce reiau scenariile și explică ce au verificat. Nu trebuie să inventeze defecte, să respingă ceva sau să trimită un prompt nou pentru un rezultat corect.

Tabelul se leagă de diapozitivul „Verificăm și revizuirea” din cursul 2: regula, scenariul și decizia pentru fiecare constatare.
:::

---

# Ce sarcină putem preda în continuare?

Propuneți o **sarcină de proiectare** care, în limitele descrierii acceptate azi:

- marchează cazurile care depind de Q1 și Q2, fără să le decidă;
- atribuie responsabilitatea verificării și a confirmării programării;
- descrie rezultatele programării/anulării care păstrează F4–F6;
- validează scenariile și semnalează ipotezele neconfirmate;
- se oprește pentru revizuire umană înainte de implementare.

Precizați versiunea de intrare, rezultatul așteptat și verificările cerute.

::: notes
Un principiu al cursului este verificarea unei specificații și a unei proiectări temeinice; Laboratorul 1 face primul pas. O regulă neclarificată poate bloca ramura afectată, în timp ce lucrul la partea convenită continuă. Un plan cu limite clare arată explicit această separare. Agentul care primește sarcina nu poate decide Q1 sau Q2 în locul beneficiarului.
:::

---

# Lucru comun, explicații individuale

**Comun:** descrierea concisă, următoarea sarcină (cu limite clare) și rezultatele revizuirii, cu deciziile voastre.

**Individual, fără AI:** păstrați analiza inițială și explicați:

- o decizie pe care o puteți apăra printr-o informație și un scenariu;
- o alternativă plauzibilă sau o ipoteză neconfirmată;
- ce trebuie reconsiderat la schimbarea de pe diapozitivul următor.

Folosiți fișa de lucru. Păstrați fragmentele de care aveți nevoie ca să vă justificați deciziile.

::: notes
Fișiere sugerate: `brief.md`, `review.md`, `individual/<student-id>.md` în `lab01/<pair-id>/`, în spațiul de lucru pus la dispoziție. Se acceptă orice format echivalent, dacă autorii sunt clar identificați. Schema de notare a cursului este 5 puncte pentru dosarul de proiectare, 3 pentru examenul grilă, 1 pentru prezență și 1 din oficiu. Acest laborator are rol formativ, fără o notă numerică separată.
:::

---

# Cerință nouă: răspuns individual (78–90)

Beneficiarul propune acum:

> „De mâine, o programare ar trebui să dureze cel mult 90 de minute.”

Există deja o programare confirmată pentru mâine (ziua D), de 120&nbsp;de minute.

Fără AI:

1. Explicați ce este nou și ce decizii anterioare sunt afectate.
2. Identificați regula lipsă pentru programările existente.
3. Comparați două răspunsuri justificabile și dați un scenariu care le distinge.

::: notes
Pentru acest scenariu de schimbare, ziua-pilot D este mâine. Este o versiune nouă a cerințelor, nu un defect ascuns în versiunea inițială. Exceptarea programărilor existente și aplicarea limitei după o tranziție convenită sunt reguli posibile. Nu anulați sau scurtați implicit o programare existentă. Explicați consecințele și cereți confirmarea regulii.
:::

---

# Prezentare și predarea lucrării (90–100)

Fiecare pereche selectată explică unul dintre aspectele următoare:

- o regulă pe care trebuie să o stabilească beneficiarul, deși părea o decizie tehnică;
- o constatare a evaluatorului pe care perechea a verificat-o în sursă;
- o decizie corectă păstrată și scenariul care o susține.

Predați fișierele comune și explicația fiecăruia acolo unde a anunțat profesorul.

Dacă nu reușiți să predați, folosiți canalul alternativ anunțat.

::: notes
Alegeți raționamente diferite, inclusiv o variantă generată corectă. Nu premiați perechea care a găsit cele mai multe defecte. Încheiați cerându-i unui student să distingă o informație convenită, o ipoteză și o propunere de proiectare. Lucrul cu repository-ul nu trebuie să consume din timpul exercițiului.
:::

---

# Ce arată că ați înțeles

Lucrarea este pregătită pentru feedback când:

- cele cinci tipuri de afirmații se disting;
- cerințele și scenariile respectă informațiile beneficiarului;
- sarcina predată are limite, rezultat și punct de revizuire clare;
- constatările evaluatorului sunt verificate și fiecare are o decizie a voastră;
- fiecare partener explică singur o alegere și analizează schimbarea.

Urmează cursurile 3–5: [formularea problemei și cerințe, modelarea domeniului, responsabilități](https://traiansf.github.io/class/amss2026/).

::: notes
Oferiți feedback punctual pentru revizuire acolo unde lipsesc justificări. Judecata se apreciază după explicații și verificări, nu după instrument, lungimea rezultatului sau aspectul unei diagrame. Laboratorul 2 urmează după cursurile 3 și 4.
:::
