---
title: "AMSS 2026/2027 — Laboratorul 2: Cerințe și modelarea domeniului"
author: "Traian-Florin Șerbănuță"
lang: ro-RO
---

# Același aparat, altă vizită {.transition}

**0–10 min · Observăm și discutăm în perechi**

Ce trebuie să păstrăm când un aparat revine la reparații?

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

[Sursa: Domain-Driven Design Reference — definiția modelului](https://www.domainlanguage.com/wp-content/uploads/2016/05/DDD_Reference_2015-03.pdf#page=6)

::: notes
Selectăm aspectele necesare urmăririi vizitelor. Nu proiectăm întregul atelier și nu începem de la clase sau de la schema unei baze de date.

**Sursă:** publicația autorului, Definitions, intrarea model, pagina PDF 6. Fragment păstrat din materialul anterior verificat în `docs/quotations.md`; finalul după domain este omis explicit.
:::

---

# Ce vede atelierul?

**A17 și A18 sunt aparate fizice distincte**, ambele prăjitoare model T2.

| Vizită | Aparat | Problemă raportată | Responsabil |
|---|---|---|---|
| J1 · 3 sept. | A17 | P1: pârghia nu rămâne jos | Mara, M1 |
| J2 · 8 oct. | A17 | P2: cablul este deteriorat | Radu, M2 |
| J3 · 8 oct. | A18 | P3: pârghia nu rămâne jos | Încă nimeni |

Gândiți individual un minut, apoi discutați: **ce este același și ce este distinct?** Dacă păstrăm numai „problema curentă a aparatului”, ce pierdem?

::: notes
A17 apare în două vizite distincte; modelul T2 nu identifică aparatul. P1 și P3 au același text, dar sunt raportări distincte. Păstrarea numai a ultimei probleme ar pierde istoricul J1 și asocierea cu Mara. Problema raportată nu este încă un diagnostic confirmat.

**Organizare:** 6 min, inclusiv câteva răspunsuri. Datele sunt didactice. []{.pace dur=6}
:::

---

# Construim un model împreună {.transition}

**10–35 min · Un coleg propune, celălalt întreabă; apoi schimbați rolurile**

Ce relații ne ajută să explicăm toate cele trei vizite?

::: notes
Verbalizarea unei legături este mai importantă decât forma săgeții. Colegul care întreabă cere un exemplu și o regulă pentru fiecare alegere importantă.

**Organizare:** minutul 10 din 100; interval 10–35 (25 min). Folosiți fișa ca referință, fără completare obligatorie. []{.pace at=10}
:::

---

# Reguli pentru schița voastră

- **R1–R2:** aparatul are cod stabil; poate avea zero sau mai multe vizite. Fiecare vizită are cod și dată, pentru exact un aparat.
- **R3:** vizita conține cel puțin o problemă raportată; fiecare problemă aparține unei singure vizite.
- **R4–R5:** vizita are zero sau un voluntar responsabil, identificat prin cod. O vizită nouă păstrează istoricul; nu copiază automat problemele vechi.

Schițați relațiile, apoi explicați-le colegului folosind J1 și J2 pentru A17. **Cum rămâne Mara la J1 când Radu preia J2?**

[Regulile și exemplele complete](https://github.com/traiansf/traiansf.github.io/blob/main/class/amss-2026/lab/scenarios/02-modelare/scenario.md) · Fără plăți sau inventar.

::: notes
Responsabilul se leagă de vizită, nu numai de aparat. Un voluntar poate răspunde de mai multe vizite, iar numele voluntarilor pot coincide. Fișa conține toate regulile R1–R6. Sunt suficiente cuvinte, un tabel sau o schiță pe hârtie; nu cerem notație UML sau implementare.

**Organizare:** 24 min după tranziție: 4 citire și întrebări, 8 propunere, 8 schimbarea rolurilor și verificare pe exemple, 4 discuție. []{.pace dur=24}
:::

---

# Încercăm să ne înțelegem reciproc {.transition}

**35–55 min · Două perechi își compară modelele**

Poate altcineva să explice schița voastră?

::: notes
Colegul din cealaltă pereche explică primul ce a înțeles. Diferența dintre intenție și interpretare arată unde trebuie clarificat modelul.

**Organizare:** minutul 35 din 100; interval 35–55 (20 min). Schimbul poate fi oral, cu foaia pe masă sau cu ecranul comun. []{.pace at=35}
:::

---

# Trei încercări pentru model

1. **Revenire:** A17 are J1 cu Mara; apare J2 cu Radu. Puteți afla în continuare cine răspundea de J1?
2. **Același text:** P1 în J1 și P3 în J3 spun „Pârghia nu rămâne jos”. R3 permite texte egale. Le-ați păstrat distincte?
3. **Nicio alocare:** J3 nu are încă voluntar. R4 permite zero sau un responsabil. Poate modelul exprima situația?

Cealaltă pereche alege cazul. **Arătați răspunsul în model**, apoi discutați o neclaritate sau o diferență între soluții.

::: notes
Toate cele trei situații trebuie să poată fi exprimate. O convenție diferită de desenare nu este o eroare dacă sensul relațiilor rămâne clar. Dacă timpul permite, adăugați un aparat înregistrat fără vizite și verificați limita zero din R2.

**Organizare:** 19 min: 2 citire, 12 schimb și comparație, 5 discuție comună. []{.pace dur=19}
:::

---

# Comparăm cu un răspuns AI {.transition}

**55–80 min · Analiză, revizuire și alegere împreună**

Ce propunere merită păstrată și ce trebuie doar etichetat ca alegere?

::: notes
Un agent AI poate propune o reprezentare rezonabilă care nu este impusă de beneficiar. Verificarea nu se reduce la corect sau greșit.

**Organizare:** minutul 55 din 100; interval 55–80 (25 min). Se poate folosi un instrument AI disponibil sau captura pregătită; fără a consuma etapa cu instalări. []{.pace at=55}
:::

---

# O propunere pe care o putem discuta

**Prompt real**, împreună cu regulile și datele din fișă:

> Propune un model de domeniu pentru acest atelier. Explică identitățile, relațiile și numărul permis de asocieri. Urmărește datele A17, A18, J1–J3 și spune ce informație se păstrează la o nouă vizită. Nu adăuga funcții. Răspunde în română, în maximum 400 de cuvinte.

**Captură · Haiku 4.5 · 10.10.2026 · analist 01**, fragment:

> **Problemă raportată** — identitate: compusă din (cod vizită + ordine).

R3 cere o problemă distinctă, legată de vizită; nu impune forma identificatorului. **Este o cerință, o posibilă alegere sau o contradicție?**

::: notes
Este o alegere posibilă, prezentată prea categoric. Nu o respingem automat; discutăm ce înseamnă „ordine” și dacă identificarea rămâne stabilă când ordinea de afișare se schimbă. Captura integrală este în pachet, inclusiv relațiile corecte și explicația istoricului.

**Organizare:** 12 min: 2 citire, 6 comparație în pereche cu propunerea proprie, 4 schimb de argumente. La o rulare proprie folosiți contextul complet, nu doar instrucțiunea. []{.pace dur=12}
:::

---

# Revizuirea este tot o propunere

**Într-un context nou:** dați unui evaluator (agent AI de revizuire) regulile, sarcina și modelul. Cereți: „Leagă fiecare observație de o regulă și de un exemplu. Separă încălcările de alegerile posibile.” Puteți cere același lucru altei perechi.

**Captură reală · Haiku 4.5 · 10.10.2026 · evaluator 02**, despre identificator:

> Propunerea presupune că identitatea e **(cod vizită + ordine)**. Contextul nu specifică acest format.

Comparați cu R3: fiecare problemă aparține unei vizite; textul nu o identifică. **Ce păstrați în model și ce clarificați?** Schimbați colegul care conduce discuția.

::: notes
Fragmentul provine din revizuirea pregătită la 10.10.2026, în context nou. Instrucțiunea integrală a acelei rulări este în fișa cu capturi; formularea de pe slide este o sarcină pentru activitatea studenților, nu pretinde că reproduce promptul arhivat. Acceptăm observația pentru că este susținută de R3. Identificarea prin ordine este o alegere posibilă numai cu o convenție clară de unicitate și stabilitate. Nu confundăm poziția curentă într-o listă sortată cu identitatea înregistrării.

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

**Regula nouă, convenită pentru exercițiu:** o vizită poate avea de acum **zero, unul sau doi voluntari responsabili**. Restul regulilor rămân.

**Înainte:** J1 pentru A17 are responsabilă pe Mara. J2 pentru A17 îl are pe Radu. **Acum:** Mara se alătură lui Radu la J2.

Gândiți individual, apoi explicați colegului:

- ce relație și ce cardinalitate se schimbă;
- ce informație păstrați despre J1;
- ce exemplu ar verifica noua limită.

::: notes
Relația vizită–voluntar devine zero până la doi; nu schimbăm identitatea aparatului sau a vizitei. J1 rămâne asociată Marei, iar J2 ambilor. Încercarea de a adăuga un al treilea responsabil trebuie să fie respinsă; verificăm și zero sau unul. Sensul responsabilității comune ar merita clarificat într-un proiect real, dar exercițiul convenește explicit noua limită.

**Organizare:** 10 min: 2 individual, 5 în pereche, 3 compararea explicațiilor. []{.pace dur=10}
:::

---

# Ce v-a făcut să schimbați modelul?

Discutăm câteva exemple din grupă:

- Ce a înțeles colegul altfel decât intenționați?
- Ce caz a arătat că o relație era greșită sau neclară?
- Ce sugestie AI ați acceptat, reformulat sau respins — și de ce?

Schițele și notițele vă pot rămâne pentru studiu. **Activitatea se încheie prin discuție; nu avem documente de predat.**

::: notes
Alegem două sau trei perechi cu raționamente diferite, nu câte o prezentare formală de la fiecare. Este util și un model păstrat după verificare, dacă perechea poate explica regula și exemplul care îl susțin.

**Organizare:** 9 min; încheiere la minutul 100. []{.pace dur=9}
:::
