---
title: "AMSS 2026/2027 — Laboratorul 2: Cerințe și modelarea domeniului"
author: "Traian-Florin Șerbănuță"
lang: ro-RO
---

# Același aparat, altă vizită {.transition}

**0–10 min · Observăm și discutăm în perechi**

Ce trebuie să păstrăm când un aparat revine la atelier?

::: notes
Aplicăm distincțiile din cursurile 3–4: reguli convenite, identitate, relații și exemple care verifică un model. Schița este suportul conversației; nu cerem documente de predat.

**Organizare:** minutul 0 din 100; interval 0–10 (10 min), cu copertă, citat și observații inițiale. Perechi sau un trio când este nevoie; 14 slide-uri cu copertă. []{.pace at=0 of=100}
:::

---

# Citatul zilei

> „Un sistem de abstractizări care descrie aspecte selectate ale unui domeniu […]”
>
> Original: “A system of abstractions that describes selected aspects of a domain […]”

— **Eric Evans**

[Sursa: Domain-Driven Design Reference — definiția modelului, p. 6 (PDF)](https://www.domainlanguage.com/wp-content/uploads/2016/05/DDD_Reference_2015-03.pdf#page=6)

::: notes
Selectăm aspectele necesare urmăririi vizitelor; nu proiectăm întregul atelier și nu începem de la clase sau de la schema unei baze de date. Reluăm citatul din cursul 4.

**Sursă:** publicația autorului, Definitions, intrarea model, pagina PDF 6. Fragment păstrat din materialul anterior verificat în `docs/quotations.md`; finalul după domain este omis explicit.
:::

---

# Trei vizite la atelier

**A17 și A18 sunt aparate fizice distincte**, deși ambele sunt prăjitoare de pâine model T2.

| Vizită | Aparat | Problemă raportată | Responsabil |
|---|---|---|---|
| J1 · 3 sept. | A17 | P1: „Pârghia nu rămâne jos” | Mara (M1) |
| J2 · 8 oct. | A17 | P2: „Cablul este deteriorat” | Radu (M2) |
| J3 · 8 oct. | A18 | P3: „Pârghia nu rămâne jos” | Încă nimeni |

1. **Ce este același și ce este distinct? Ce pierde atelierul dacă păstrează numai „problema curentă” a fiecărui aparat?**
2. **Ce întrebare le-ați pune organizatorilor al cărei răspuns ar schimba modelul?**

::: notes
A17 apare în două vizite distincte; modelul T2 nu identifică aparatul. P1 și P3 au același text, dar sunt raportări distincte; J2 și J3 au aceeași dată, dar sunt vizite distincte. Păstrarea numai a ultimei probleme ar pierde istoricul J1 și asocierea cu Mara. Problema raportată nu este încă un diagnostic confirmat.

Întrebări probabile: mai multe probleme la aceeași vizită (R3 le permite), ștergerea sau corectarea unei vizite (rămân deschise în R6), doi voluntari la aceeași vizită (pregătește schimbarea finală), proprietarul aparatului (exclus în R6). Cereți legătura cu modelul: ce relație s-ar schimba după răspuns.

**Organizare:** 6 min: 2 individual, 2 în pereche, 2 în plen. Datele sunt didactice. []{.pace dur=6}
:::

---

# Construim un model împreună {.transition}

**10–35 min · Un coleg propune, celălalt întreabă; apoi schimbați rolurile**

Ce relații ne ajută să explicăm toate cele trei vizite?

::: notes
Verbalizarea unei legături este mai importantă decât forma săgeții. Colegul care întreabă cere un exemplu și o regulă pentru fiecare alegere importantă.

**Organizare:** minutul 10 din 100; interval 10–35 (25 min). Scenariul de pe slide-ul următor este referința; nu se completează nimic. []{.pace at=10}
:::

---

# Reguli pentru schița voastră

- **R1–R2:** aparatul se identifică prin cod, nu prin model. O vizită are cod și dată și privește exact un aparat; un aparat are zero sau mai multe vizite.
- **R3:** o vizită are cel puțin o problemă raportată; fiecare problemă aparține exact unei vizite; textele pot coincide.
- **R4–R5:** o vizită are zero sau un voluntar responsabil, identificat prin cod; un voluntar poate răspunde de mai multe vizite. O vizită nouă nu înlocuiește și nu preia automat problemele sau responsabilul celor anterioare.

Unul schițează și explică J1 și J2: **cum rămâne Mara responsabilă de J1 după ce Radu devine responsabil de J2?** Celălalt cere regula și un exemplu. La semnal, schimbați rolurile și explicați J3.

[Scenariul complet: R1–R6 și datele](https://github.com/traiansf/traiansf.github.io/blob/main/class/amss-2026/lab/scenarios/02-modelare/scenario.md) · R6: fără inventar, plăți sau proprietari.

::: notes
Responsabilul se leagă de vizită, nu de aparat (R4–R5). Un voluntar poate răspunde de mai multe vizite, iar numele voluntarilor pot coincide. Sunt suficiente cuvinte, un tabel sau o schiță pe hârtie; nu cerem notație UML sau implementare.

**Organizare:** 24 min după tranziție: 4 citire și întrebări, 8 propunere, 8 schimbarea rolurilor și explicarea lui J3, 4 discuție. []{.pace dur=24}
:::

---

# Altă pereche citește schița {.transition}

**35–55 min · Două perechi își compară modelele**

Poate altcineva să explice schița voastră?

::: notes
Diferența dintre intenție și interpretare arată unde trebuie clarificat modelul. De aceea explică primul colegul din cealaltă pereche.

**Organizare:** minutul 35 din 100; interval 35–55 (20 min). Schimbul poate fi oral, cu foaia pe masă sau cu ecranul comun. []{.pace at=35}
:::

---

# Un caz pentru schița altei perechi

1. **Revenire:** A17 are J1 cu Mara; apare J2 cu Radu. Puteți afla în continuare cine răspundea de J1?
2. **Același text:** P1 în J1 și P3 în J3 spun „Pârghia nu rămâne jos”. R3 permite texte egale. Rămân distincte în schiță?
3. **Două probleme:** la o nouă vizită J4, A18 vine cu două probleme raportate. R3 permite una sau mai multe. Poate schița exprima situația?

Fiecare pereche alege un caz pentru cealaltă. **Perechea care primește cazul îl rezolvă pe schița celeilalte și explică prima**; autorii completează abia după aceea. Apoi inversați rolurile și discutați o neclaritate sau o diferență între soluții.

::: notes
Toate cele trei situații trebuie să poată fi exprimate: J1 își păstrează responsabilul, P1 și P3 rămân înregistrări distincte, iar J4 are două probleme, fiecare legată numai de J4. O convenție diferită de desenare nu este o eroare dacă sensul relațiilor rămâne clar. Dacă timpul permite, adăugați un aparat înregistrat fără vizite și verificați limita zero din R2.

**Organizare:** 19 min: 2 citire, 12 schimb și comparație, 5 discuție comună. []{.pace dur=19}
:::

---

# Comparăm cu un răspuns AI {.transition}

**55–80 min · Verificăm o analiză AI și revizuirea ei**

Ce cer regulile și ce alege doar propunerea AI?

::: notes
Un agent AI poate propune o alegere de reprezentare rezonabilă pe care organizatorii (beneficiarul) nu au impus-o. Verificarea nu se reduce la corect sau greșit.

**Organizare:** minutul 55 din 100; interval 55–80 (25 min). Se poate folosi un instrument AI disponibil sau captura pregătită. Nu consumăm etapa cu instalări. []{.pace at=55}
:::

---

# Cum identifică analistul AI o problemă raportată?

**Instrucțiunea reală**, urmată în prompt de scenariu (R1–R6 și datele):

> Propune un model de domeniu pentru acest atelier. Explică identitățile, relațiile și numărul permis de asocieri. Urmărește datele A17, A18, J1–J3 și spune ce informație se păstrează la o nouă vizită. Nu adăuga funcții. Răspunde în română, în maximum 400 de cuvinte.

**Captură reală · Claude Haiku 4.5 · 10.10.2026 · analist AI 01**, fragment:

> **Problemă raportată** — identitate: compusă din (cod vizită + ordine).

**R3:** fiecare problemă raportată aparține exact unei vizite; textul ei poate coincide cu al altei probleme. **Este identificarea prin (cod vizită + ordine) o cerință, o alegere de reprezentare sau o contradicție?** Un coleg explică: cum ați identificat P1–P3 în schiță?

::: notes
Este o alegere de reprezentare posibilă, prezentată prea categoric. Nu o respingem automat; discutăm ce înseamnă „ordine” și dacă identificarea rămâne stabilă când ordinea de afișare se schimbă. Captura integrală este în capturile pregătite, inclusiv relațiile corecte și explicația istoricului.

**Organizare:** 12 min: 2 citire, 6 comparație în pereche cu propunerea proprie, 4 schimb de argumente. La o rulare proprie folosiți contextul complet, nu doar instrucțiunea. []{.pace dur=12}
:::

---

# Revizuirea este tot o propunere

**Într-un context nou**, dați unui evaluator (agent AI de revizuire) scenariul complet, sarcina analistului AI și răspunsul de verificat: modelul vostru sau captura integrală. Cereți observații legate de reguli și exemple, cu încălcările separate de alegerile de reprezentare. Sau cereți aceeași verificare altei perechi.

**Captură reală · Claude Haiku 4.5 · 10.10.2026 · evaluator AI 02**, despre identificator:

> Propunerea presupune că identitatea e **(cod vizită + ordine)**. Contextul nu specifică acest format. […] De ce nu cod global pentru problemă?

**Acceptați observația? Ce păstrați și ce clarificați?** Acum conduce discuția celălalt coleg.

[Capturile pregătite: instrucțiunea reală a evaluatorului și răspunsurile integrale](https://github.com/traiansf/traiansf.github.io/blob/main/class/amss-2026/lab/scenarios/02-modelare/prepared-fixture.md)

::: notes
Acceptăm observația: R3 nu fixează forma identificatorului, iar datele dau deja coduri P1–P3. Identificarea prin ordine este o alegere posibilă numai cu o convenție clară de unicitate și stabilitate. Nu confundăm poziția curentă într-o listă sortată cu identitatea înregistrării.

Fragmentul provine din revizuirea pregătită la 10.10.2026, în context nou, cu sarcina analistului AI inclusă. Formularea de pe slide este sarcina activității studenților, nu promptul arhivat; acesta este în capturile pregătite.

**Organizare:** 12 min: 5 revizuire sau citirea capturii, 4 decizie argumentată în pereche, 3 discuție comună. []{.pace dur=12}
:::

---

# O regulă se schimbă {.transition}

**80–100 min · Adaptăm modelul și discutăm ce am înțeles**

Care relație este afectată și ce istoric păstrăm?

::: notes
Schimbarea arată dacă modelul separă conceptele utile. Nu introducem repartizarea responsabilităților software din cursul următor.

**Organizare:** minutul 80 din 100; interval 80–100 (20 min): schimbare 10, conversație finală 9, tranziție 1. []{.pace at=80}
:::

---

# Doi voluntari pentru aceeași vizită

**Organizatorii cer:** la reparațiile complicate lucrează doi voluntari și amândoi trebuie să apară ca responsabili. De acum înainte, o vizită are **zero, unul sau doi voluntari responsabili**. Celelalte reguli rămân neschimbate.

**Înainte:** Mara este responsabilă de J1, iar Radu de J2, ambele vizite pentru A17. **Acum:** Mara se alătură lui Radu la J2.

Gândiți individual, apoi explicați colegului:

- ce relație și ce cardinalitate se schimbă și ce păstrați despre J1;
- două exemple de acceptare pentru noua limită: unul permis și unul respins;
- o întrebare pentru organizatori despre responsabilitatea comună.

::: notes
Relația vizită–voluntar devine zero până la doi; nu schimbăm identitatea aparatului sau a vizitei. J1 rămâne asociată Marei, iar J2 ambilor. Încercarea de a adăuga un al treilea responsabil este respinsă, iar asocierile existente rămân. Întrebări utile: răspund amândoi de tot sau fiecare de o parte? Cine poate retrage un responsabil? Limita se aplică oricărei vizite; modelul nu înregistrează dacă reparația este complicată (R6 exclude efectuarea reparației). Dacă o pereche observă diferența, este o întrebare bună pentru organizatori.

**Organizare:** 10 min: 2 individual, 5 în pereche, 3 compararea explicațiilor. []{.pace dur=10}
:::

---

# De ce am schimbat sau am păstrat modelul?

Discutăm câteva exemple din grupă:

- Ce a înțeles colegul altfel decât intenționați?
- Ce caz a arătat că o relație era greșită sau neclară?
- Ce observație a evaluatorului AI sau a altei perechi ați acceptat, reformulat sau respins și de ce?

Păstrați schițele și notițele care vă ajută la studiu. **Activitatea se încheie prin discuție; nu avem documente de predat.**

::: notes
Urmărim dacă perechea leagă schimbarea sau păstrarea modelului de o regulă și un exemplu; un model confirmat după verificare este un rezultat la fel de bun.

**Organizare:** 9 min; două sau trei perechi cu raționamente diferite, fără prezentări formale; încheiere la minutul 100. []{.pace dur=9}
:::
