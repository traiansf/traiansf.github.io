---
title: "AMSS 2026/2027 — Cursul 4: Modelarea domeniului"
author: "Traian-Florin Șerbănuță"
lang: ro-RO
---

# Ce trebuie să distingem? {.transition}

Două descrieri identice înseamnă același lucru?

::: notes
Un model de domeniu ne ajută să explicăm situațiile cerute folosind concepte, identități și relații. Reluăm din cursul 3 legătura dintre o afirmație și regula care o susține.

**Organizare:** minutul 0 din 100; interval 0–15 (15 min), inclusiv coperta, citatul și discuția inițială. 30 de slide-uri cu tot cu copertă. []{.pace at=0 of=100}
:::

---

# Citatul zilei

> „**Model:** un sistem de abstractizări care descrie aspecte selectate ale unui domeniu […]”
>
> Original: “**model:** A system of abstractions that describes selected aspects of a domain […]”

— **Eric Evans**

[Sursa: Domain-Driven Design Reference, Definitions, p. 6 (PDF)](https://www.domainlanguage.com/wp-content/uploads/2016/05/DDD_Reference_2015-03.pdf#page=6)

::: notes
„Selectate” contează: păstrăm distincțiile necesare întrebărilor noastre. Arhiva de azi urmărește fotografiile și proveniența editărilor, fără să modeleze algoritmul care schimbă pixelii.

**Sursă:** publicația autorului, Definitions, intrarea model, pagina PDF 6. Termenul definit este titlul intrării; îl redăm înaintea definiției, ca să se vadă pe slide ce se definește. Fragment păstrat din materialul anterior verificat în `docs/quotations.md`; finalul după domain este omis explicit.
:::

---

# Aceeași legendă, două fotografii

O arhivistă catalogează fotografii; fiecare intră în arhivă cu o **versiune originală**, iar editările produc alte versiuni. Arhiva conține două fotografii distincte:

| Fotografie | Legendă | Versiune originală |
|---|---|---|
| F1 | „Curte” | V1 |
| F2 | „Curte” | V2 |

**Regula convenită cu arhivista (beneficiarul):** legenda se poate schimba; fotografia își păstrează identificatorul.

**Cazul S1:** schimbăm legenda lui F1 în „Dimineață”. Pe hârtie, apoi în pereche: **ce se schimbă și ce rămâne?** Am putea folosi legenda pentru a identifica fotografia?

::: notes
Se schimbă numai legenda lui F1. F2 și identificatorii F1, F2, V1, V2 rămân aceiași. Legenda nu identifică fotografia: poate coincide și se poate schimba. Separăm ce spune enunțul de o presupunere despre identitatea imaginilor după conținut.

**Organizare:** 7 min: 2 individual, 2 în pereche, 3 discuție. Datele sunt construite pentru curs. []{.pace dur=7}
:::

---

# Un model răspunde la întrebări

Un **model de domeniu** descrie conceptele relevante, relațiile dintre ele și regulile care le limitează.

Pentru arhiva noastră vrem să putem spune:

- despre **care fotografie** vorbim, chiar dacă îi schimbăm legenda;
- **ce versiuni** îi aparțin;
- **din ce versiune** provine o versiune obținută prin editare.

Nu modelăm albume, drepturi de acces, ștergeri sau stocarea fișierelor.

::: notes
Aceste întrebări selectează conceptele utile. Modelul nu trebuie să reproducă toate proprietățile unei fotografii sau toate funcțiile unei arhive reale. Regulile și limitele sunt convenite în scenariul didactic, nu descoperite de un agent AI. În tipologia din cursul 3, R1–R5 sunt reguli ale domeniului: politica arhivei, valabilă cu sau fără sistem; R6 este o limită a exercițiului, nu o cerință.
:::

---

# Identitate și schimbare {.transition}

Ce rămâne același lucru atunci când îi schimbăm o proprietate?

::: notes
Identitatea se explică prin continuitatea pe care o cere domeniul. Un identificator o exprimă în exemplu, fără să alegem aici cum este generat sau stocat.

**Organizare:** minutul 15 din 100; interval 15–35 (20 min), inclusiv exercițiul despre editare. []{.pace at=15}
:::

---

# Identitatea nu este descrierea

**R1:** fiecare fotografie are un identificator stabil și o legendă modificabilă. Fotografii distincte pot avea aceeași legendă.

| Întrebare | Răspuns pentru F1 în S1 |
|---|---|
| „Care fotografie?” | F1, înainte și după schimbare. |
| „Ce legendă are?” | „Curte”, apoi „Dimineață”. |
| „A apărut o fotografie nouă?” | Nu, s-a schimbat doar legenda. |

**Identificatorul** și **atributul descriptiv** răspund la întrebări diferite. Nici textul egal, nici asemănarea vizuală nu stabilesc singure identitatea.

::: notes
Un atribut poate ajuta căutarea fără să fie identitatea. Evităm să transformăm exemplul într-o regulă universală conform căreia numele nu poate niciodată identifica ceva: aici imposibilitatea rezultă precis din R1.

Nici importul repetat al aceluiași fișier nu este convenit; nu deducem că ar crea o fotografie nouă sau că ar reutiliza una existentă. Revenim la el ca întrebare deschisă (S5).
:::

---

# Fotografia și versiunile ei

**R2:** fiecare versiune are identificator propriu și aparține exact unei fotografii. O fotografie are cel puțin o versiune.

**R3:** fiecare fotografie are exact un **original**, creat la catalogare (adăugarea fotografiei în arhivă). Originalul se păstrează și nu provine din altă versiune.

În arhiva noastră: F1 are originalul V1, iar F2 are originalul V2.

::: notes
Fotografia reprezintă continuitatea dintre editări; versiunea reprezintă un conținut păstrat. „Original” este rolul unei versiuni, nu neapărat un al treilea tip de obiect.
:::

---

# Editarea creează o versiune nouă

**R4:** editarea oricărei versiuni existente creează o versiune nouă a aceleiași fotografii. Versiunea nouă este o **derivată**; versiunea de la care pornește editarea este **sursa** ei. Fiecare derivată are exact o sursă, din aceeași fotografie.

**R5:** editarea păstrează legenda fotografiei și, pentru versiunile existente, conținutul, identitatea, apartenența și sursa. Schimbarea legendei nu modifică versiunile. Operațiile se execută pe rând.

::: notes
„Derivată” și „sursă” sunt roluri în relația de editare: aceeași versiune poate fi derivata uneia și sursa alteia. Sursa trebuie să existe înaintea noii versiuni. Executarea operațiilor pe rând ne scutește aici de întrebările despre editări simultane.
:::

---

# După prima editare

**Pornim din nou din situația inițială, independent de S1:** fotografia F1, legenda „Curte”, originalul V1.

**Cazul S2:** din V1 se creează, prin editare, versiunea V3.

**Reguli (R2, R4–R5):** versiunea nouă are identitate proprie, aparține aceleiași fotografii și are ca sursă versiunea de la care a pornit editarea. Editarea păstrează conținutul versiunilor existente și legenda.

În pereche, schițați situația de după editare. Arătați **ce s-a adăugat**, **ce legătură a apărut** și **ce s-a păstrat**. Apoi comparați cu perechea vecină.

::: notes
Așteptăm aceeași fotografie F1, acum cu V1 și V3; sursa lui V3 este V1. Conținutul lui V1 și legenda „Curte” rămân. O simplă săgeată este suficientă; nu cerem clase, metode sau o notație UML.

**Organizare:** 8 min: 3 schiță în pereche, 3 comparație cu altă pereche, 2 discuție. []{.pace dur=8}
:::

---

# Editarea adaugă, nu suprascrie

| Element | Înainte | După |
|---|---|---|
| Fotografie | F1, „Curte” | F1, „Curte” |
| Original | V1 | V1, păstrat |
| Versiune derivată | — | V3, aparține lui F1 |
| Sursa lui V3 | — | V1 |

**Concluzie:** F1 are acum două versiuni. Identitatea sa, legenda și conținutul lui V1 se păstrează; V3 are sursa V1.

::: notes
Acesta este răspunsul de referință construit de profesor din R2–R5, nu o captură AI. Se adaugă două relații: V3 aparține lui F1 și are sursa V1. Nu spunem că „nimic din ce exista nu se schimbă”: F1 are acum încă o versiune, iar V1 este și sursă pentru V3. Se păstrează faptele existente despre identitate, legendă, conținut, apartenență și sursă.
:::

---

# Relațiile au reguli {.transition}

Ce situații permite schița noastră și ce situații exclude?

::: notes
Numele conceptelor nu sunt suficiente. Numărul permis de asocieri și restricțiile dintre ele decid ce situații poate exprima modelul.

**Organizare:** minutul 35 din 100; interval 35–60 (25 min), inclusiv construirea și compararea ramurilor de editare. []{.pace at=35}
:::

---

# Un vocabular comun

| Termen | Sensul în acest domeniu |
|---|---|
| Fotografie | Element al arhivei, cu identificator stabil, care își reunește versiunile. |
| Legendă | Text modificabil al fotografiei. |
| Versiune | Conținut păstrat, cu identitate proprie. |
| Original | Unica versiune creată la catalogare, fără sursă. |
| Derivată | Versiune creată prin editarea altei versiuni. |
| Sursă | Versiunea existentă din care a fost creată o derivată. |

**Verificare:** „am schimbat fotografia” este suficient de precis?

::: notes
Nu: poate însemna schimbarea legendei sau crearea unei versiuni. Cerem reformularea cu termenii din tabel. Vocabularul devine util când separă operații cu efecte diferite, nu doar când enumeră substantive.
:::

---

# Două relații diferite

```mermaid
flowchart LR
  F[Fotografia F1] -->|are versiunea| V1[V1: original]
  F -->|are versiunea| V3[V3: derivată]
  V3 -->|are sursa| V1
```

**Apartenența** spune ale cui sunt versiunile. **Sursa** spune din ce versiune provine o derivată.

Săgețile arată relațiile numite pe ele; nu reprezintă ordinea execuției.

::: notes
Aceasta este o diagramă a unui exemplu concret, situația de după S2, nu modelul complet: toate nodurile sunt identificate. S3 pornește din această situație; apoi generalizăm câte asocieri sunt permise. O singură diagramă fără reguli nu ar exclude, de exemplu, două originale pentru F1.
:::

---

# Putem edita din nou originalul?

F1 are originalul **V1** și derivata **V3**, creată din V1 (S2).

**R4:** orice versiune existentă poate fi editată; noua versiune are exact o sursă, din aceeași fotografie. **R5:** versiunile existente se păstrează.

**Cazul S3:** edităm din nou V1 și obținem V4.

Individual, apoi în pereche:

1. Desenați relațiile de sursă după S3. De ce V4 nu are sursa V3?
2. Cum ar trata S3 un model care permite numai editarea ultimei versiuni? Ce regulă îl contrazice?

::: notes
V3 și V4 au ambele sursa V1: două ramuri, nu lanțul V1–V3–V4. Sursa este versiunea de la care a pornit editarea, nu cea mai recentă versiune a fotografiei. Un model „numai ultima versiune” ar respinge S3, o acțiune permisă explicit de R4. Aici verificăm modelul printr-un caz care separă cele două interpretări.

**Organizare:** 8 min: 2 individual, 3 comparație în pereche, 3 discuție. []{.pace dur=8}
:::

---

# Cardinalități: câte asocieri sunt permise?

| Pentru fiecare… | Regula |
|---|---|
| fotografie | Cel puțin o versiune; exact un original. |
| versiune | Exact o fotografie. |
| original | Nicio sursă. |
| derivată | Exact o sursă, din aceeași fotografie. |
| versiune, ca sursă | Zero, una sau mai multe derivate directe. |

Aceste numere sunt **cardinalități**. Restricția „din aceeași fotografie” nu este un număr: cere ca sursa și derivata să aparțină aceleiași fotografii.

::: notes
Cardinalitatea nu spune totul: „exact o sursă” ar admite și o sursă din altă fotografie, dacă am omite restricția. R4 permite editarea oricărei versiuni existente, inclusiv a uneia deja folosite ca sursă; de aceea, ca în S3, o versiune poate avea mai multe derivate directe. Nu introducem limite care lipsesc din reguli.
:::

---

# Interzis sau încă neconvenit?

**Cazul S4 — o asociere interzisă:** V1 aparține lui F1. Cineva propune V5 pentru F2, cu sursa V1. R4 o exclude: sursa și derivata trebuie să aparțină aceleiași fotografii.

**Cazul S5 — o întrebare deschisă:** importăm din nou același fișier. Refolosim fotografia existentă sau creăm alta?

**R6 — limitele exercițiului:** nu modelăm ștergerea, albumele, accesul, formatul și stocarea fișierelor, detectarea fișierelor identice sau algoritmii de editare.

S4 încalcă o regulă. Pentru S5, **răspunsul rămâne deschis** până convenim cu arhivista extinderea modelului.

::: notes
„Interzis” și „neconvenit” cer reacții diferite. Pentru S4 avem un rezultat justificat; pentru S5 trebuie discutat cu beneficiarul dacă extindem domeniul. În termenii cursului 3, S4 încalcă o informație convenită, iar S5 este o întrebare deschisă; un răspuns provizoriu ar fi o ipoteză, nu o regulă. O excludere din exercițiu nu este o interdicție a unei funcții într-un produs real: aici nu stabilim, de exemplu, o politică de ștergere. Identificatorii sunt deja disponibili; nu proiectăm generarea lor.
:::

---

# Conceptul nu impune reprezentarea

Legătura „V3 are sursa V1” poate fi exprimată prin:

- o referință între obiecte;
- înregistrări legate prin identificatori;
- o săgeată într-o schiță discutată cu beneficiarul.

Oricare variantă trebuie să păstreze **sursa unică**, **apartenența** și **originalul unic**.

::: notes
Nu evaluăm modelul după numărul de clase sau de tabele. Un atribut pentru rolul de original sau o legătură explicită spre original pot exprima aceeași regulă, dacă păstrăm coerența. Alegerea implementării cere alte întrebări decât cele abordate astăzi.
:::

---

# Verificăm un model propus de AI {.transition}

Ce păstrăm, ce corectăm și pe ce regulă ne bazăm?

::: notes
Un răspuns poate fi util și totuși să conțină o generalizare nejustificată. Folosim răspunsuri reale pregătite înainte de curs, cu toate încercările păstrate; analiza umană precedă verdictul asupra revizuirii.

**Organizare:** minutul 60 din 100; interval 60–90 (30 min): tranziție și două prompturi 6, două comparații ale analizei 10, revizuire și corecție 8, reprezentare și sinteză 6. Fără rulări live. []{.pace at=60 dur=1}
:::

---

# Promptul analistului AI

**Instrucțiunea exactă:**

> Propune un model de domeniu pentru regulile de mai jos: concepte, identități, relații și restricții. Explică prin S1–S4 cum susține modelul regulile. Separă alegerile de reprezentare de cerințe. Nu scrie cod și nu impune o notație. Răspunde în română, în maximum 450 de cuvinte.

**Context, în același prompt:** R1–R6 și cazurile S1–S5 (S1 legenda, S2 prima editare, S3 a doua editare a lui V1, S4 sursa din altă fotografie, S5 importul repetat, neconvenit).

::: notes
Contextul conține regulile și cazurile discutate până acum, fără soluția profesorului. Nu cerem un anumit defect. Două rulări Claude Haiku 4.5 au primit același prompt; analizăm rularea 2.

**Sursă:** instrucțiunea integrală din `scenarios/04-fotografii/captures/2026-10-10/analist-instructiune.md`; contextul integral în `context.md`, promptul complet și ambele răspunsuri în același director.

**Organizare:** 2 min. []{.pace dur=2}
:::

---

# Un răspuns susținut de reguli

**Fragment din răspunsul AI — Claude Haiku 4.5, analist AI, rularea 2, 10 octombrie 2026:**

> Un atribut modificabil, **Legenda**, aparține numai Fotografiei, nu versiunilor. Legenda se poate schimba fără să afecteze versiunile sau identitatea fotografiei.

**R1:** fotografia are identificator stabil și legendă modificabilă. **R5:** schimbarea legendei nu modifică versiunile.

**S1:** F1 are originalul V1, F2 are originalul V2; ambele au legenda „Curte”. Schimbăm doar legenda lui F1 în „Dimineață”.

În pereche: ce propoziție din fragment este susținută de R1 și ce propoziție de R5? Ce regulă am încălca dacă schimbarea legendei ar modifica V1?

::: notes
Fragmentul este corect: confirmăm o parte bună, nu căutăm obligatoriu o eroare în fiecare fragment. Prima propoziție se sprijină pe R1 (legenda este atributul modificabil al fotografiei); a doua, pe R5 (schimbarea legendei nu modifică versiunile) și pe identificatorul stabil din R1. În S1 se păstrează identitățile F1, F2, V1, V2, conținutul și apartenența versiunilor, precum și legenda lui F2. Modificarea lui V1 la schimbarea legendei ar încălca R5. Nu confundăm regula de domeniu cu o alegere ulterioară despre stocarea acelei informații.

**Sursă:** `haiku45-analist-02-response.md`, „Concepte și identități”, ultimul paragraf, integral; restul răspunsului este omis.

**Organizare:** 5 min, cu discuție. []{.pace dur=5}
:::

---

# Sunt compatibile cele două fragmente?

**Același răspuns AI — analist AI, rularea 2, fragmente:**

> Fiecare Versiune are zero sau o Sursă (relație recursivă).
>
> […] Doi copaci independenți (V3 și V4 din V1) nu sunt definiți; modelul permite orice orice configurație DAG cu original ca sursă indirectă.

„Relație recursivă”: legătură de la o versiune la altă versiune. Un **DAG** este un graf orientat fără cicluri: urmând sensul săgeților, nu poți reveni la nodul de plecare.

**Date:** V1 este originalul; V3 și V4 au sursa V1; toate aparțin lui F1. **R4:** fiecare derivată are exact o sursă.

În pereche: adăugați V6 în F1 cu sursele V3 și V4. Desenați săgeți „are sursa”. Graful are cicluri? Respectă R4? Care fragment trebuie corectat?

::: notes
„Zero sau o Sursă” este compatibil cu R3–R4, dacă distingem originalul de derivate, dar „orice configurație DAG” admite și o versiune cu două surse. Graful cu V6 nu are cicluri, dar încalcă R4: corectăm generalizarea. Răspunsul descrie corect cazul celor două ramuri în alt paragraf; defectul este generalizarea, nu întregul model. Nu cerem teorie a grafurilor: V6 → V3 și V6 → V4 înseamnă două surse; V3 → V1 și V4 → V1 completează contraexemplul. Orientarea săgeților este cea a relației „are sursa”, spre versiunea anterioară.

Repetiția „orice orice” este în original; nu discutăm formularea lingvistică.

**Sursă:** `haiku45-analist-02-response.md`: prima propoziție din „Relația de derivare (sursă)” și ultima propoziție din „Rezultat structural” (prima, despre „pădure de versiuni”, este omisă), literale.

**Organizare:** 5 min: întâi verdict și regulă în pereche, apoi comparație. []{.pace dur=5}
:::

---

# Promptul evaluatorului AI

**Instrucțiunea exactă pentru evaluator (agent AI de revizuire):**

> Ești evaluator (agent AI de revizuire). Verifică propunerea de mai jos exclusiv față de contextul și sarcina furnizate. Identifică afirmațiile susținute, contradicțiile, omisiunile relevante și alegerile prezentate ca cerințe. Pentru fiecare observație, indică fragmentul și regula sau scenariul relevant. Nu presupune că trebuie să existe greșeli; dacă o afirmație este corectă, explică de ce. Nu scrie cod. Răspunde în română, în maximum 400 de cuvinte.

**Context nou:** aceleași reguli și cazuri, sarcina analistului AI și răspunsul său integral (rularea 2).

**Predicție, înainte de a vedea răspunsul AI:** va observa evaluatorul AI contradicția dintre „zero sau o Sursă” și „orice DAG”?

::: notes
Revizuirea nu primește comentariile profesorului sau conversația analistului AI. Un context nou nu garantează independența erorilor sau corectitudinea verdictului.

**Sursă:** instrucțiunea integrală din `evaluator-v2-instructiune.md`; intrarea completă în `evaluator-v2-prompt.md`. Pe slide-ul următor apare rularea 3. Primele două revizuiri, cu diacriticele instrucțiunii deteriorate la transmitere, sunt păstrate în arhivă și nu apar pe slide-uri.

**Organizare:** 3 min, cu predicția scrisă pe hârtie înainte de slide-ul următor. []{.pace dur=3}
:::

---

# Ce observă revizuirea?

**Fragment din răspunsul AI — Claude Haiku 4.5, evaluator AI, rularea 3, 10 octombrie 2026:**

> […] un **DAG** (graph aciclic orientat) permite noduri cu mai mulți părinți și configurații arbitrare.

În captură, „părinți” înseamnă surse.

**Reper:** V3 și V4, fiecare cu sursa V1 (S3), respectă R4; V6 cu sursele V3 și V4 ar încălca R4 (exact o sursă).

**Predicția s-a confirmat?** Revizuirea observă că un DAG admite mai multe surse. Numește ea regula încălcată sau contraexemplul? Ce adăugăm noi revizuirii înainte de decizie?

::: notes
Observația este corectă: un graf fără cicluri poate admite mai multe surse pentru aceeași derivată. Răspunsul la întrebarea de predicție este „parțial”: revizuirea observă că un DAG admite mai mulți părinți, citează R4 pentru ramificare și propune un arbore în răspunsul integral, dar tratează problema ca una de prezentare (pădure vs. DAG), validează separat derivarea recursivă și nu leagă explicit mai mulți părinți de limita „exact o sursă”; nu dă niciun contraexemplu. Noi adăugăm regula încălcată și contraexemplul V6, construit deja pe slide-ul 22, înainte de decizia de pe slide-ul următor. „Părinți” este termenul folosit în captură pentru surse; pe schițele noastre săgețile „are sursa” merg de la derivată la sursă.

Cererile revizuirii despre mecanismele de implementare și prevenirea ștergerii depășesc sarcina de modelare și limitele R6; nu le adoptăm automat. În textul integral, revizuirea discută și „doi copaci independenți”, deși analistul AI nu afirmă explicit asta. Acest pasaj nu este proiectat: nu avem nevoie de el pentru a verifica limita de o sursă.

În răspunsul integral, revizuirea citează și inexact: din citatul ei din analistul AI lipsesc repetiția „orice” și finalul propoziției. Citatele unei revizuiri se verifică și ele în sursă.

**Sursă:** `haiku45-evaluator-03-response.md`, observația 1, paragraful „Problemă”: finalul celei de-a doua propoziții, de la „un DAG”, literal; restul este omis. „graph” este în original.

**Organizare:** 4 min, inclusiv răspunsuri. []{.pace dur=4}
:::

---

# Decizia noastră asupra modelului

**Analiza profesorului:**

- Păstrăm identitățile și separarea fotografiei de versiuni.
- Păstrăm mai multe derivate directe din aceeași sursă.
- Pentru **fiecare fotografie**, versiunile formează **un arbore cu rădăcina în original**: fiecare derivată are exact o sursă.

**R3–R5:** originalul este unic și nu are sursă; o derivată indică o versiune existentă anterior, din aceeași fotografie. Legăturile existente se păstrează.

**În pereche:** de ce ajungem mereu la original, fără cicluri, dacă urmărim sursele din orice versiune?

::: notes
Aceasta este corecția umană a generalizării „orice DAG”, nu o a treia captură AI. Justificarea: fiecare versiune nouă se adaugă printr-o singură legătură spre o versiune care exista deja, fără a schimba sursele versiunilor anterioare. Urmărind sursele, trecem mereu la o versiune mai veche și ne oprim la originalul fotografiei, singura ei versiune fără sursă. Vorbim despre relațiile de sursă, nu despre săgețile de apartenență. Întreaga arhivă poate avea mai mulți arbori, câte unul pentru fiecare fotografie. Nu introducem acum operația de combinare a două versiuni.

**Organizare:** 4 min, cu o justificare oferită de studenți. []{.pace dur=4}
:::

---

# Două reprezentări, aceleași verificări

**Referințe între obiecte:** versiunea V3 se referă la fotografia F1 și la versiunea-sursă V1.

**Înregistrări legate prin identificatori:**

| Versiune | Fotografie | Sursă |
|---|---|---|
| V1 | F1 | — |
| V3 | F1 | V1 |
| V4 | F1 | V1 |

**Reguli:** fiecare fotografie are un original fără sursă. Fiecare derivată are o singură sursă existentă, din aceeași fotografie.

Vrem să adăugăm V7 la F2, cu sursa V3. R4 respinge această adăugare. **Cum se vede încălcarea în fiecare reprezentare:** ce comparăm în tabel și ce comparăm între referințe?

::: notes
V3 aparține lui F1, deci nu poate fi sursa unei versiuni a lui F2 (R4). În tabel, comparăm coloana Fotografie a rândului V7 (F2) cu cea a rândului sursei V3 (F1). Între referințe, comparăm fotografia la care se referă V7 cu fotografia la care se referă sursa ei V3. Ambele reprezentări permit verificarea; niciuna nu o face singură. Pentru o verificare mai amplă: o versiune fără sursă se acceptă doar la catalogare, ca unic original al unei fotografii noi; o derivată are o singură sursă existentă, din aceeași fotografie. Noua versiune primește identitate distinctă și nu înlocuiește conținutul alteia. Tabelul este reprezentarea unui exemplu, nu o schemă de bază de date prescrisă. Variantele sunt construite de profesor din modelul corectat.

**Organizare:** 3 min. []{.pace dur=3}
:::

---

# Ce transmitem mai departe

Un model pe care îl putem discuta cu altă persoană conține:

- **sensuri:** fotografie, versiune, original, derivată, sursă;
- **reguli:** identitate, apartenență și numărul permis de asocieri;
- **exemple și contraexemple:** schimbarea legendei, editarea, două ramuri; V5 din altă fotografie, V6 cu două surse;
- **limite:** ce excludem explicit (R6);
- **întrebări deschise:** politica importului repetat (S5).

O diagramă ajută când putem explica fiecare legătură printr-o regulă sau un exemplu.

::: notes
Acesta este rezumatul pentru o conversație de proiectare, nu un șablon de livrabil. Întrebările despre cine execută operațiile și unde se verifică regulile pregătesc cursul 5, fără să îi anticipăm teoria.

**Organizare:** 3 min; încheie etapa la minutul 90. []{.pace dur=3}
:::

---

# Transferăm ideea {.transition}

Ce distincție păstrăm într-un domeniu nou?

::: notes
Transferul arată dacă studenții pot recunoaște nevoia de identitate și relații fără vocabularul fotografiilor. Folosim doar datele afișate în exercițiu.

**Organizare:** minutul 90 din 100; interval 90–100 (10 min): exercițiu și discuție 7, încheiere 3. []{.pace at=90}
:::

---

# Aceeași piesă, două reprezentații

Un teatru ține evidența pieselor și a reprezentațiilor lor. Piesa **P7** are identificator stabil și titlul „Furtuna”; piesa **P8** are același titlu, dar nu are încă nicio reprezentație. P7 are reprezentațiile **Rp1**, vineri, și **Rp2**, sâmbătă; fiecare reprezentație are identificator propriu.

Pe hârtie, apoi cu un coleg:

1. Teatrul schimbă titlul lui P7. Ce se schimbă și ce identități se păstrează? Ar putea titlul identifica piesa?
2. Ce cardinalități propuneți pentru relația piesă–reprezentație? Ce exemplu de pe slide susține fiecare limită?
3. Ce informație despre reprezentații pierdem dacă pentru P7 păstrăm doar titlul și data ultimei reprezentații?

::: notes
Se schimbă doar titlul; P7, P8, Rp1 și Rp2 se păstrează. Titlul nu identifică piesa: P8 are același titlu. Cardinalități așteptate: o piesă are zero sau mai multe reprezentații (P8, respectiv P7); o reprezentație prezintă o piesă. Datele nu arată o reprezentație cu două piese; dacă teatrul vrea spectacole duble, limita trebuie convenită, nu presupusă. Data ultimei reprezentații nu păstrează ambele reprezentații și identitățile lor. Nu transferăm relația de sursă a editărilor: nu este cerută aici.

**Organizare:** 7 min: 2 individual, 2 în pereche, 3 discuție. []{.pace dur=7}
:::

---

# Trei întrebări pentru orice model

**Identitate:** ce rămâne același lucru când îi schimbăm descrierea?

**Relații:** ce este legat de ce și câte asocieri sunt permise?

**Verificare:** ce exemplu ar separa două interpretări ale modelului?

La laborator aplicăm aceste întrebări unui atelier comunitar de reparații, prin schițe, comparații și discuții.

::: notes
Modelul este util dacă distincțiile lui explică situațiile cerute. Capturile AI au oferit atât afirmații corecte, cât și o generalizare de corectat; verdictul a venit din reguli și exemple.

**Organizare:** ultimele 3 min; încheiere la minutul 100. []{.pace dur=3}
:::
