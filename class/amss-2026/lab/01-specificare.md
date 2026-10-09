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

Fișe: [informațiile beneficiarului](https://github.com/traiansf/traiansf.github.io/blob/main/class/amss-2026/lab/scenarios/01-specificare/scenario.md)&nbsp;· [fișa de lucru](https://github.com/traiansf/traiansf.github.io/blob/main/class/amss-2026/lab/scenarios/01-specificare/worksheet.md)

::: notes
Aplicăm într-un domeniu nou înțelegerea problemei, scenariile și delegarea din cursul 2. Introducem explicit termenii de analiză și proiectare; nu cerem implementarea unei aplicații.

**Organizare:** după cursurile 1–2, fără a presupune teoria din cursul 3.
:::

---

# Citatul zilei

> „Simplitatea este o condiție necesară pentru fiabilitate.”
>
> Original: “Simplicity is prerequisite for reliability.”

— **Edsger W. Dijkstra**

[Sursa: How do we tell truths that might hurt? — EWD498](https://www.cs.virginia.edu/~evans/cs655/readings/ewd498.html)

::: notes
Înainte de delegare, descrierea trebuie să poată fi înțeleasă și verificată.

**Sursă:** transcriere universitară; afirmație marcată drept adnotare manuscrisă. Original: arhiva Dijkstra, UT Austin, EWD498.
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
Analiza proprie oferă reperul pentru verificarea rezultatului și a revizuirii.

**Organizare:** distribuiți `scenario.md` și `worksheet.md` din `lab/scenarios/01-specificare/`; rezervă: `prepared-fixture.md`. Dacă timpul e scurt, păstrați analiza fără ajutor și revizuirea.
:::

---

# Informațiile beneficiarului

Căminul dorește ca locatarii să se poată programa pentru folosirea unei mașini de spălat **Albastra** sau **Verdea**.

- **F1:** o singură zi viitoare pentru pilot, **D**; spălătoria este deschisă 08:00–22:00.
- **F2:** serviciul de cazare furnizează identitatea verificată a locatarului; mașinile sunt deja configurate.
- **F3:** o cerere indică un locatar, o mașină și un interval în D; începutul precedă sfârșitul, iar intervalul se încadrează în program.
- **F8:** plățile, programările recurente, listele de așteptare, administrarea mașinilor, semnalarea defecțiunilor și notificările sunt excluse.

Fișa este sursa informațiilor convenite. Întrebările nu stabilesc reguli noi.

::: notes
„Exclus” delimitează exercițiul. Evaluarea trebuie să țină cont de toate informațiile, inclusiv F4–F7 și întrebările Q1–Q3.

**Organizare:** identificatorii corespund fișei `scenario.md`; aceasta se citește integral.
:::

---

# Reguli pe care le putem verifica

- **F4:** programările confirmate pentru **aceeași mașină** nu se suprapun; una poate începe când se termină alta.
- **F5:** din două cereri simultane în conflict, una se confirmă, cealaltă se respinge; prioritatea nu este stabilită.
- **F6:** doar titularul anulează, înainte de început; intervalul devine liber.
- **F7:** o programare reușită primește un cod; o respingere indică regula încălcată.

Întrebările deschise Q1–Q3 sunt în fișă.

::: notes
F5 cere o garanție asupra mai multor cereri, nu un mecanism tehnic anume. Q1 privește suprapunerile aceluiași locatar pe mașini diferite; Q2, anularea la început sau după; Q3, limite încă neconvenite. Pentru azi formulăm responsabilitatea și un scenariu de verificare.
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
Distingeți ce este cunoscut de ce rămâne incert. Notițele inițiale permit compararea propriei interpretări cu varianta revizuită.

**Organizare:** fișa completă de la început, fără demonstrație prealabilă; la minutul 8 cereți o distincție și o incertitudine. Păstrați notițele. []{.pace at=0 of=100}
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
Ipoteza este un răspuns provizoriu, etichetat explicit și însoțit de consecințe; nu devine confirmată prin folosire. Modelul domeniului descrie concepte și reguli, nu neapărat clase. Sunt aceleași cinci categorii ca în cursul 2. []{.pace at=8}
:::

---

# De la regulă la responsabilitate

**Concept al domeniului:** o programare leagă un locatar, o mașină și un interval.

**Invariant:** o regulă care trebuie să rămână adevărată — aici, fără programări confirmate suprapuse pentru aceeași mașină.

**Responsabilitate:** o parte a sistemului propus trebuie să impună această regulă la fiecare confirmare.

Discutați: de ce poate fi insuficient „verifică disponibilitatea, apoi confirmă mai târziu”?

::: notes
Două cereri pot vedea simultan „liber”; invariantul privește rezultatul combinat. Aici F5 cere explicit tratarea simultaneității, în timp ce biblioteca presupunea operații pe rând (R6). Diferența vine din cerințe. Responsabilitatea poate reveni unei funcții, unui obiect, unui serviciu sau unei operații asupra datelor.

**Organizare:** desenați cele două cereri; formulați garanția și verificarea necesară, fără implementarea concurenței.
:::

---

# Spațiul de lucru și rolurile (18–26)

- Deschideți fișele și creați o copie de lucru comună.
- Alegeți orice instrument și model AI disponibil. Notați-le, dacă sunt cunoscute.
- Deschideți o **sesiune pentru analist** și o **sesiune separată pentru revizuire**.
- **A:** îndrumă analistul. **B:** verifică afirmațiile pe baza informațiilor beneficiarului.
- La minutul 44, schimbați rolurile: **B** îndrumă evaluatorul (agentul de revizuire); **A** verifică afirmațiile acestuia.

Dacă AI nu este disponibil, folosiți [exemplul pregătit](https://github.com/traiansf/traiansf.github.io/blob/main/class/amss-2026/lab/scenarios/01-specificare/prepared-fixture.md) și o revizuire separată între colegi.

::: notes
Evaluatorul AI primește explicit pachetul de revizuit. O conversație nouă poate folosi același instrument, dar fișierele comune sau istoricul automat pot introduce context suplimentar.

**Organizare:** ghid: `tooling/SETUP.md`; fără abonament obligatoriu. Fără AI, schimbați pachetele între perechi. Cei gata compară notițele; toți trec mai departe la ora anunțată. []{.pace at=18}
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
Predarea delimitează munca delegată și versiunea verificată; nu obligă acceptarea textului generat. Studenții pot redacta și corecta direct materialul. Sarcina se oprește înainte de implementare.

**Organizare:** păstrați o copie identificabilă: fișier, versiune salvată sau commit.
:::

---

# Promptul analistului (26–44)

> Ai rolul de asistent de analiză. Folosind doar informațiile beneficiarului și notițele atașate, redactează scopul, limitele, conceptele domeniului, regulile, scenariile de acceptare și întrebările deschise. Citează identificatorii informațiilor. Clasifică afirmațiile ca informație convenită, consecință dedusă, ipoteză, întrebare deschisă sau propunere de proiectare. Cere clarificări unde lipsesc reguli; nu răspunde în numele beneficiarului. Propune următoarea sarcină de proiectare, cu limite, intrări, responsabilități, verificări și o condiție de oprire. Nu o implementa.

Citiți rezultatul. Acceptați, editați sau cereți o corectare, **motivând decizia**.

::: notes
Un rezultat corect se păstrează și se justifică prin verificări. Dacă este prea lung, cereți o sinteză cu trimiteri la informații și scenarii; confruntați o afirmație importantă cu textul complet. Nu inventăm erori.

**Organizare:** promptul este în fișă. Păstrați o singură descriere comună, citată prin identificatori în predare și revizuire. []{.pace at=26}
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
Radu evită ambiguitatea Q1, despre același locatar pe mașini diferite; S8 o ridică explicit. Precizați starea inițială și condițiile fiecărui scenariu. Contează regula verificată, nu numărul scenariilor.
:::

---

# Revizuire separată (44–60)

Începeți într-un context nou. Transmiteți **informațiile, versiunea salvată și criteriile**:

> Revizuiește descrierea problemei în raport cu informațiile primite. Verifică limitele, distincțiile dintre concepte, precizia regulilor, scenariile de acceptare și dacă responsabilitățile propuse pot păstra regulile. Pentru fiecare afirmație, citează pasajul din variantă și informația-sursă sau un contraexemplu. Distinge între contradicție, întrebare nerezolvată și alternativă opțională. Identifică și deciziile pe care informațiile le susțin. Nu inventa răspunsuri ale beneficiarului și nu impune o anumită notație, arhitectură sau tehnologie.

Dați-i evaluatorului intrările convenite, nu conversația analistului.

::: notes
Un context separat nu garantează corectitudinea: același model poate repeta aceeași ipoteză. Revizuirea rămâne de evaluat de către om.

**Organizare:** fără instrumente AI, un coleg revizuiește același pachet, pe aceleași criterii. []{.pace at=44}
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
Confruntați fiecare constatare cu cerințele și varianta efectiv redactată: regulă → scenariu → decizie. Absența contradicțiilor poate fi acceptată dacă scenariile o susțin; nu sunt obligatorii defecte, respingeri sau un prompt nou.

**Organizare:** clasificare individuală înaintea discuției în pereche; notați diferențele de judecată. []{.pace at=60}
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
O regulă neclarificată poate bloca doar ramura afectată, în timp ce partea convenită continuă. Predarea explică această limită. Agentul AI nu decide Q1 sau Q2 în locul beneficiarului; laboratorul face primul pas spre o specificație și o proiectare temeinice.
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
Lucrarea este comună, dar contribuțiile și explicațiile individuale trebuie să fie identificabile. Laboratorul este formativ, fără notă numerică separată.

**Organizare:** în `lab01/<pair-id>/`: `brief.md`, `review.md`, `individual/<student-id>.md`, sau un format echivalent cu autorii precizați.
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
Ziua-pilot D este mâine. Schimbarea introduce o versiune nouă a cerințelor, nu un defect ascuns. Exceptarea programărilor existente sau o tranziție convenită sunt opțiuni. Nu anulăm și nu scurtăm implicit programări: explicăm consecințele și cerem confirmarea regulii. []{.pace at=78}
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
Comparați raționamente diferite, inclusiv pentru rezultate generate corecte. Criteriul este justificarea, nu numărul defectelor găsite.

**Organizare:** încheiați cu distincția informație–ipoteză–propunere; operațiile cu repository-ul nu trebuie să consume timpul exercițiului. []{.pace at=90}
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
Judecata se apreciază după explicații și verificări, nu după instrument, lungimea rezultatului sau aspectul diagramei. Feedbackul indică precis ce justificare lipsește.

**Organizare:** Laboratorul 2 urmează după cursurile 3–4.
:::
