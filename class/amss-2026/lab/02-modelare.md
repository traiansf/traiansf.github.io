---
title: "AMSS 2026/2027 — Laboratorul 2: Cerințe și modelarea domeniului"
author: "Traian-Florin Șerbănuță"
lang: ro-RO
---

# Ce modelăm azi

Organizatorii unui atelier comunitar de reparații (beneficiarul) țin evidența aparatelor aduse, a vizitelor, a problemelor raportate și a voluntarilor responsabili. **Același aparat poate reveni de mai multe ori:** ce păstrăm despre fiecare vizită?

Construim împreună un model al domeniului, îl verificăm pe stări concrete, îl comparăm cu un răspuns AI și îl adaptăm când o regulă se schimbă.

Exemplu didactic. Hârtia și conversația sunt suficiente.

::: notes
Fixăm problema înainte de exercițiu: un aparat cu mai multe vizite, fiecare cu problemele și responsabilul ei. Aplicăm distincțiile din cursurile 3–4: reguli convenite, identitate, relații și exemple care verifică un model.

**Organizare:** minutul 0 din 100; deschidere 0–4 (4 min): ce modelăm azi, citatul, recapitularea din cursul 4. 16 slide-uri cu copertă. []{.pace at=0 of=100 dur=1}
:::

---

# Citatul zilei

> „**Model:** un sistem de abstractizări care descrie aspecte alese ale unui domeniu […]”
>
> Original: “**model:** A system of abstractions that describes selected aspects of a domain […]”

— **Eric Evans**

[Sursa: Domain-Driven Design Reference, Definitions, p. 6 (PDF)](https://www.domainlanguage.com/wp-content/uploads/2016/05/DDD_Reference_2015-03.pdf#page=6)

::: notes
Selectăm aspectele necesare urmăririi vizitelor; nu proiectăm întregul atelier și nu începem de la clase sau de la schema unei baze de date. Reluăm citatul din cursul 4.

**Sursă:** publicația autorului, Definitions, intrarea model, pagina PDF 6. Termenul definit este titlul intrării; îl redăm înaintea definiției, ca să se vadă pe slide ce se definește. Fragment păstrat din materialul anterior verificat în `docs/quotations.md`; finalul după domain este omis explicit.

**Organizare:** 1 min. []{.pace dur=1}
:::

---

# Ce urmărim când cerem un model

Din cursul 4: un model pe care îl putem discuta cu altă persoană conține:

- **sensuri:** conceptele și ce înseamnă fiecare;
- **reguli:** identitate, apartenență și numărul permis de asocieri;
- **exemple și contraexemple:** stări pe care regulile le permit și stări pe care le exclud;
- **limite:** ce excludem explicit;
- **întrebări deschise:** ce nu stabilește încă enunțul.

O schiță ajută când putem explica fiecare relație printr-o regulă sau un exemplu.

::: notes
Recapitulăm lista de la sfârșitul cursului 4, fără exemplele arhivei foto: așa vom judeca schițele de azi. În atelier le vom întâlni pe rând: aparat, vizită, problemă raportată și voluntar responsabil; regulile R1–R5; vizitele J1–J3 ca exemple; limita R6; întrebările adresate organizatorilor. Lista nu este un șablon de livrabil.

**Organizare:** 2 min, fără exercițiu. []{.pace dur=2}
:::

---

# Același aparat, altă vizită {.transition}

**4–10 min · Observăm și discutăm în perechi**

Ce trebuie să păstrăm când un aparat revine la atelier?

::: notes
Pornim de la date concrete: ce este același și ce este distinct. Schița este suportul conversației; nu cerem documente de predat.

**Organizare:** minutul 4 din 100; interval 4–10 (6 min): observații inițiale. Perechi sau un trio când este nevoie. []{.pace at=4}
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
A17 apare în două vizite distincte; modelul T2 nu identifică aparatul. P1 și P3 au același text, dar sunt raportări distincte; J2 și J3 au aceeași dată, dar sunt vizite distincte. Păstrarea numai a ultimei probleme ar pierde P1, raportată la J1; dacă și responsabilul ar fi asociat aparatului, s-ar pierde și asocierea J1–Mara. Problema raportată nu este încă un diagnostic confirmat.

Întrebări probabile: mai multe probleme la aceeași vizită (R3 le permite), ștergerea sau corectarea unei vizite (rămân deschise în R6), doi voluntari la aceeași vizită (pregătește schimbarea finală), proprietarul aparatului (exclus în R6). Cereți legătura cu modelul: ce relație s-ar schimba după răspuns.

**Organizare:** 6 min: 2 individual, 2 în pereche, 2 în plen. Datele sunt didactice. []{.pace dur=6}
:::

---

# Construim un model împreună {.transition}

**10–35 min · Un coleg propune, celălalt întreabă; apoi schimbați rolurile**

Ce relații ne ajută să păstrăm informația despre fiecare vizită?

::: notes
Verbalizarea unei relații este mai importantă decât forma săgeții. Colegul care întreabă cere un exemplu și o regulă pentru fiecare alegere importantă.

**Organizare:** minutul 10 din 100; interval 10–35 (25 min). Regulile de pe slide-ul următor sunt referința; schițăm liber, fără formular de completat. []{.pace at=10}
:::

---

# Reguli pentru schița voastră

- **Aparat–vizită (R1–R2):** fiecare are cod propriu. O vizită are dată și privește exact un aparat; un aparat are zero sau mai multe vizite.
- **Vizită–problemă (R3):** o vizită are cel puțin o problemă raportată; fiecare problemă aparține exact unei vizite. Textele pot coincide.
- **Vizită–voluntar (R4):** o vizită are zero sau un responsabil; un voluntar poate răspunde de mai multe vizite. Voluntarul se identifică prin cod.
- **Revenire (R5):** vizita nouă păstrează istoricul vizitelor anterioare; problemele și responsabilul se asociază fiecărei vizite separat.

Unul schițează și explică J1 și J2: **cum rămâne Mara responsabilă de J1 după ce Radu devine responsabil de J2?** Celălalt cere regula și un exemplu. La semnal, schimbați rolurile și explicați J3.

[Enunțul complet: R1–R6 și datele](https://github.com/traiansf/traiansf.github.io/blob/main/class/amss-2026/lab/scenarios/02-modelare/scenario.md) · R6: fără inventar, plăți sau proprietari.

::: notes
Aici parcurgem enunțul, pornind de la întrebările puse la „Trei vizite”: mai multe probleme la aceeași vizită (R3), ștergerea sau corectarea unei vizite (deschise în R6), proprietarul (exclus în R6), doi voluntari (R4 spune zero sau unul; revenim la minutul 80). Responsabilul se leagă de vizită, nu de aparat (R4–R5). O vizită nouă nu suprascrie datele celor anterioare și nu preia automat problemele lor. Numele voluntarilor pot coincide, la fel ca modelele aparatelor; codurile le disting. O problemă raportată descrie observația celui care a adus aparatul, nu un diagnostic confirmat. În tipologia din cursul 3, R1–R5 sunt reguli ale domeniului: politica atelierului, valabilă și într-un registru pe hârtie; R6 este limita exercițiului, nu o cerință. Sunt suficiente cuvinte, un tabel sau o schiță pe hârtie; nu cerem notație UML sau implementare.

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

# Încercăm schița altei perechi

1. **Aparat fără vizite:** A19 a fost înregistrat, dar nu a venit încă la atelier. R2 permite zero vizite. Are schița loc pentru el?
2. **Același text:** P1 în J1 și P3 în J3 spun „Pârghia nu rămâne jos”. R3 permite texte egale. Rămân distincte în schiță?
3. **Două probleme:** la o nouă vizită J4, A18 vine cu două probleme raportate. R3 permite una sau mai multe. Poate schița exprima starea?

**Pe schița perechii A, perechea B alege o stare și explică prima** cum o exprimă modelul; autorii ascultă, apoi clarifică. Repetați pe schița B, cu rolurile inversate. Discutați o neclaritate sau o diferență între soluții.

::: notes
Toate cele trei stări trebuie să poată fi exprimate: A19 există fără nicio vizită, P1 și P3 rămân înregistrări distincte, iar J4 are două probleme, fiecare legată numai de J4. O convenție diferită de desenare nu este o eroare dacă sensul relațiilor rămâne clar. Revenirea (cine răspundea de J1 după J2) a fost sarcina de construcție; rămâne o stare de rezervă dacă o pereche termină devreme.

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

**Instrucțiunea reală**, urmată în prompt de enunț (R1–R6 și datele):

> Propune un model de domeniu pentru acest atelier. Explică identitățile, relațiile și numărul permis de asocieri. Urmărește datele A17, A18, J1–J3 și spune ce informație se păstrează la o nouă vizită. Nu adăuga funcții. Răspunde în română, în maximum 400 de cuvinte.

**Captură reală · Claude Haiku 4.5 · 10.10.2026 · analist AI 01**, fragment:

> **Problemă raportată** — identitate: compusă din (cod vizită + ordine).

**R3:** fiecare problemă raportată aparține exact unei vizite; textul ei poate coincide cu al altei probleme. **Este identificarea prin (cod vizită + ordine) o cerință, o alegere de reprezentare sau o contradicție?** Un coleg explică: cum ați identificat P1–P3 în schiță?

::: notes
Este o alegere de reprezentare posibilă, prezentată fără a fi marcată ca alegere. R3 cere să distingem înregistrările, dar nu impune forma identificatorului. Discutăm ce înseamnă „ordine”: un număr atribuit și păstrat în cadrul vizitei sau poziția curentă într-o listă sortată? Doar prima convenție poate păstra identificarea după o reordonare. Captura integrală este în capturile pregătite, inclusiv relațiile corecte și explicația istoricului.

**Organizare:** 12 min: 2 citire, 6 comparație în pereche cu propunerea proprie, 4 schimb de argumente. La o rulare proprie folosiți contextul complet, nu doar instrucțiunea. []{.pace dur=12}
:::

---

# Verificăm și observația evaluatorului AI

**Într-un context nou**, dați unui **evaluator (agent AI de revizuire)** regulile R1–R6, datele inițiale, sarcina și răspunsul de verificat: modelul vostru sau captura integrală. Cereți observații susținute de reguli și exemple, cu încălcările separate de alegerile de reprezentare. Puteți cere aceeași verificare altei perechi.

**Captură reală · Claude Haiku 4.5 · 10.10.2026 · evaluator AI 02**, despre identificator:

> Propunerea presupune că identitatea e **(cod vizită + ordine)**. Contextul nu specifică acest format. […] De ce nu cod global pentru problemă?

**Ce parte acceptați? Este obligatoriu un cod global?** Celălalt coleg conduce discuția: ce păstrați și cum precizați alegerea?

[Capturile pregătite: instrucțiunea reală a evaluatorului AI și răspunsurile integrale](https://github.com/traiansf/traiansf.github.io/blob/main/class/amss-2026/lab/scenarios/02-modelare/prepared-fixture.md)

::: notes
Acceptăm observația că formatul identificatorului nu este cerut de R3; datele nu spun dacă P1–P3 sunt coduri globale sau locale vizitei. Întrebarea „De ce nu cod global?” propune o alternativă, nu dovedește că ea este obligatorie. Păstrăm identificarea prin (cod vizită + număr local) dacă numărul este unic în vizită și rămâne stabil; o etichetăm ca alegere. Și un cod global poate respecta aceleași reguli. Nu confundăm poziția curentă într-o listă sortată cu identitatea înregistrării.

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

**Organizatorii schimbă R4:** o vizită poate avea **zero, unul sau doi voluntari responsabili**. Limita se aplică oricărei vizite; celelalte reguli rămân neschimbate.

**Inițial:** J1 o are pe Mara (M1), iar J2 pe Radu (M2); ambele vizite sunt pentru A17.

Gândiți individual, apoi explicați colegului:

1. Ce relație și ce cardinalitate (numărul permis de asocieri) se schimbă?
2. Scrieți două exemple de acceptare, ca la cursul 3 (**starea inițială → cine cere ce → rezultatul observabil**), pentru două cereri succesive ale organizatorilor: adăugarea Marei la J2, apoi adăugarea Ioanei (M3) la J2. Ce acceptați, ce respingeți și cine rămâne asociat fiecărei vizite?
3. Ce ați întreba organizatorii despre responsabilitatea comună?

::: notes
Cardinalitatea vizită → voluntari devine 0–2; voluntar → vizite rămâne zero sau mai multe. Nu schimbăm identitatea aparatului sau a vizitei. Organizatorii schimbă o regulă a domeniului; exemplele de acceptare, în forma din cursul 3, verifică noua regulă înainte de orice implementare. Cererile se încearcă succesiv: (1) J1–Mara, J2–Radu → adăugăm Mara la J2 → acceptat; J1–Mara, J2–Mara și Radu. (2) Pornind de aici, cerem și Ioana la J2 → respins; J1–Mara, J2–Mara și Radu rămân. Un rezultat care elimină un responsabil existent pentru a face loc celui nou nu respectă cererea de adăugare. Problemele și asocierile vizită–aparat se păstrează în ambele exemple.

Întrebări utile: răspund amândoi de tot sau fiecare de o parte? Cine poate retrage un responsabil? Nu cerem acum proiectarea efectuării reparației, exclusă prin R6.

**Organizare:** 10 min: 2 individual, 5 în pereche, 3 compararea explicațiilor. []{.pace dur=10}
:::

---

# De ce am schimbat sau am păstrat modelul?

Discutăm câteva exemple din grupă:

- Ce a înțeles colegul altfel decât intenționați?
- Ce stare a arătat că o relație era greșită sau neclară?
- Ce observație a evaluatorului AI sau a altei perechi ați acceptat, reformulat sau respins și de ce?

Păstrați schițele și notițele care vă ajută la studiu. **Activitatea se încheie prin discuție; nu avem documente de predat.**

::: notes
Urmărim dacă perechea leagă schimbarea sau păstrarea modelului de o regulă și un exemplu; un model confirmat după verificare este un rezultat la fel de bun.

**Organizare:** 9 min; două sau trei perechi cu raționamente diferite, fără prezentări formale; încheiere la minutul 100. []{.pace dur=9}
:::
