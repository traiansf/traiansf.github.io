---
title: "AMSS 2026/2027 — Laboratorul 3: Responsabilități, contracte și invarianți — online"
author: "Traian-Florin Șerbănuță"
lang: ro-RO
---

# Ce proiectăm azi

Un depozit are 10 adaptoare de alimentare identice, pe care clienții le pot rezerva și ridica. Operatorul înregistrează cererile. **Rezervat nu înseamnă ridicat:** ce promite registrul când acceptă sau refuză o cerere?

Discutăm în plen pe Teams, apoi urmărim împreună **o analiză AI și o revizuire**, conduse de profesor.

Exemplu didactic. Schițele sunt facultative; nu predăm documente. Nu sunt necesare conturi AI pentru studenți.

::: notes
Aplicăm responsabilitățile din cursul 5 și contractele din cursul 6. Nu cerem o aplicație sau o diagramă de stări. Valori precum activă/ridicată/anulată sunt deja date în enunț.

**Organizare:** minutul 0 din 100; deschidere 0–10 (10 min): problema 3, citatul 2, recapitularea și sensurile cantităților 5. 16 slide-uri cu copertă; Teams în plen, fără grupuri separate. Profesorul conduce etapa AI. Predicțiile se trimit în chat la semnal. []{.pace at=0 of=100 dur=3}
:::

---

# Citatul zilei

> „Precondiția obligă clientul; postcondiția obligă furnizorul.”
>
> Original: “The precondition binds the client, the postcondition binds the supplier.”

— **Bertrand Meyer**

[Sursa: Object-Oriented Software Construction, ediția a doua, „Using assertions”, p. 873](https://bertrandmeyer.com/OOSC2/)

::: notes
Reluăm citatul din cursul 6. Clientul lui Meyer este apelantul operației. Refuzul unei cantități indisponibile poate fi un rezultat promis, dacă operația acceptă asemenea cereri. Nu trebuie să scoatem acel caz din contract numind disponibilitatea precondiție.

**Sursă:** citatul păstrat din materialele anterioare, verificat atunci în fragmentul indexat al cărții de pe site-ul autorului, subsecțiunea „Using assertions”, p. 873. La 27 octombrie 2026 pagina autorului este accesibilă, PDF-ul nu; limita verificării este consemnată în `docs/quotations.md`.

**Organizare:** 2 min. []{.pace dur=2}
:::

---

# Ce luăm din cursurile 5–6

**Responsabilitate:** cine decide și cine poate modifica registrul?

**Contract:** precondiția (ce presupunem despre apel), condiția de succes (când reușim) și postcondițiile (ce întoarcem și ce păstrăm, la succes și la refuz).

**Invariant:** ce relații trebuie să fie adevărate în orice stare? O stare este **validă** dacă îi respectă pe toți.

Astăzi: **F** = bucăți fizic în depozit; **R** = suma cantităților rezervate activ; **D = F − R** = disponibil. „A activă(4)” înseamnă rezervarea A, activă, pentru 4 bucăți. Inițial avem 10 bucăți, fără reaprovizionare sau retururi; apelurile sunt secvențiale: fiecare începe după încheierea celui anterior.

::: notes
Rezervarea reduce disponibilul, nu stocul fizic. Ridicarea reduce simultan stocul fizic și rezervatul. Abrevierile sunt repetate pe slide-urile de lucru. Litera R numește cantitatea rezervată; regulile poartă mereu un număr și cuvinte-cheie, de exemplu R2 (rezervare). P reprezintă totalul ridicat și va fi introdus doar în discuția de referință, dacă ajută.

**Organizare:** 5 min. []{.pace dur=5}
:::

---

# Cine răspunde de modificarea registrului? {.transition}

**10–30 min · Predicții în chat, apoi explicații în ștafetă**

Aceeași cerere vine din formular și din import.

::: notes
Începem cu o predicție individuală înainte de compararea responsabilităților. Nu folosim AI în această etapă.

**Organizare:** minutul 10 din 100; interval 10–30 (20 min): reflecție 5, explicații în ștafetă 8, discuție 7. []{.pace at=10}
:::

---

# Șase bucăți disponibile, două canale

**Starea inițială I:** F=10; A activă(4); identificatorul B nefolosit; R=4, D=6. **F** = fizic, **R** = rezervat activ, **D** = disponibil.

**R2 (rezervare):** rezervăm o cantitate întreagă pozitivă, cel mult egală cu D, cu un identificator nefolosit; R crește, D scade, F rămâne identic. Altfel refuzăm, fără modificări. **R5 (istoric și efect limitat):** formularul și importul folosesc aceleași reguli; celelalte rezervări se păstrează.

1. Individual: din I, scenariul S1 (`rezerva(B,6)`) și, independent, scenariul S2 (`rezerva(B,7)`) — ce rezultat și ce cantități rămân?
2. La semnal, predicțiile în chat. Un coleg propune verificări în fiecare canal; un coleg numit, operații ale unui registru comun, cu semnătura și rezultatele lor. Comparați dependențele.
3. Continuăm ștafeta cu alt coleg: cine împiedică importul să ocolească regula?

[Enunțul complet: R1–R5 și scenariile S1–S7](https://github.com/traiansf/traiansf.github.io/blob/main/class/amss-2026/lab/scenarios/03-contracte/scenario.md)

::: notes
S1: acceptat, F=10, R=10, D=0. S2: refuz, exact I. Registrul comun verifică toate apelurile; o verificare în formular poate ajuta utilizatorul, dar nu trebuie să fie singura. B este identificatorul unei rezervări noi; I numește starea inițială. Linkul de pe slide duce la enunțul complet (R1–R5, S1–S7), ca referință; regulile necesare fiecărui exercițiu sunt pe slide-uri.

**Organizare:** 20 min pentru întreaga etapă, cu duratele din tranziție. []{.pace dur=20}
:::

---

# Ce garantează operațiile? {.transition}

**30–55 min · Construim și explicăm contracte**

Un refuz păstrează și cantitățile, și rezervările.

::: notes
Precondițiile comune sunt registru valid, identificatori nevizi, cantități întregi și apeluri secvențiale. Pozitivitatea, disponibilitatea și identificatorul nefolosit decid succesul; refuzurile sunt specificate. Spre deosebire de muzeu, aici enunțul specifică și refuzul ridicării sau anulării cu un identificator necunoscut. Ce garantează operația și în ce condiții se citește din fiecare enunț.

**Organizare:** minutul 30 din 100; interval 30–55 (25 min): rezervare 10, ridicare și anulare 15. []{.pace at=30}
:::

---

# Contractul rezervării

**Starea inițială I:** F=10, A activă(4), identificatorul B nefolosit, R=4, D=6; F fizic, R rezervat activ, D disponibil.

**R1 (context):** cantitățile sunt numere întregi, identificatorii sunt nevizi, registrul este valid, iar apelurile sunt secvențiale. **R2 (rezervare):** pentru o cantitate q>0, un identificator nefolosit și q≤D, operația creează o rezervare activă nouă de q bucăți; F nu se modifică. Altfel refuză, fără modificări. **R5 (istoric și efect limitat):** celelalte rezervări se păstrează.

Un coleg formulează contractul în plen (precondiții, condiție de succes, postcondiții), iar un coleg numit verifică; apoi schimbați vorbitorii, cu obiecții în chat:

- scenariul S2 (`rezerva(B,7)`) și scenariul S7 (`rezerva(B,0)`), fiecare din I;
- succesul din scenariul S1 (`rezerva(B,6)`) și păstrarea lui A;
- relația **D = F − R** și lipsa cantităților negative: ajung ele singure?

::: notes
Ambele refuzuri păstrează exact I. Succesul creează B activă(6); F=10, R=10, D=0. Dacă discuția rămâne la invarianți, propuneți după `rezerva(B,6)` registrul greșit A activă(2), B activă(6), F=10, R=8, D=2: respectă invarianții, dar a modificat cantitatea lui A; îl exclude R5 (istoric și efect limitat), nu un invariant. De aceea contractul nu poate spune doar „disponibil nenegativ”. Nu cerem o transcriere obligatorie.

**Organizare:** 10 min. []{.pace dur=10}
:::

---

# Ridicarea nu mărește cantitatea disponibilă

**Starea inițială I:** F=10, A activă(4), R=4, D=6. F fizic, R rezervat activ, D disponibil.

**R3 (ridicare) și R4 (anulare):** numai o rezervare activă de q bucăți poate fi ridicată sau anulată; o marcăm ridicată, respectiv anulată. La ridicare, F și R scad cu q, iar D nu se modifică. La anulare, F rămâne, R scade cu q, iar D crește cu q. **R5 (istoric și efect limitat):** păstrăm identificatorul, cantitatea și celelalte rezervări; la refuz, tot registrul.

Un coleg explică scenariul S3 (`ridica(A)`), un coleg numit scenariul S4 (`anuleaza(A)`), **independent din I**. Alt coleg continuă ștafeta:

**Scenariul S5:** din I, `ridica(A)`, apoi `anuleaza(A)`. Ce rezultat și ce stare produce fiecare pas? De ce nu putem „reda” cele 4 bucăți?

::: notes
S3: F=6, R=0, D=6, A ridicată(4). S4: F=10, R=0, D=10, A anulată(4). S5: primul pas ca S3; al doilea refuză și păstrează exact acea stare. Cele patru bucăți au părăsit fizic depozitul; nu există retur în domeniu. Invarianți: 0≤R≤F≤10, D=F−R. Opțional, F plus cantitatea ridicată rămâne 10. Dacă cineva propune după `ridica(A)` starea F=6, R=4, D=2: A nu mai este activă, deci R trebuie să fie 0.

**Organizare:** 15 min, cu discuție. []{.pace dur=15}
:::

---

# O analiză AI, o revizuire împreună {.transition}

**55–80 min · Demonstrație condusă de profesor, discuție în plen**

Prezicem răspunsul, îl verificăm, apoi decidem ce păstrăm.

::: notes
Profesorul conduce o singură analiză și o singură revizuire într-un context nou. Studenții nu pornesc sesiuni AI proprii. Slide-urile următoare conțin capturi reale Claude Haiku 4.5 din 27 octombrie 2026, obținute înaintea laboratorului prin Claude Code, fără unelte și fără contextul proiectului; o rulare live le poate înlocui. Am rulat câte două încercări și am ales câte una; selecția nu descrie performanța tipică a modelului. La o rulare live păstrați regulile rezumate vizibile alături de rezultat.

**Organizare:** minutul 55 din 100; interval 55–80 (25 min): analiza 10, revizuirea 10, decizia 5. []{.pace at=55}
:::

---

# Analiza: ce îi cerem și ce verificăm?

**[Instrucțiunea trimisă](https://github.com/traiansf/traiansf.github.io/blob/main/class/amss-2026/lab/scenarios/03-contracte/ai/analist-prompt.md):** „[…] formulează contractele operațiilor rezerva, ridica și anuleaza: precondiții, condiții de succes, efecte, refuzuri și invarianți. Calculează S2, S3 și S5. […]”

**[Reguli](https://github.com/traiansf/traiansf.github.io/blob/main/class/amss-2026/lab/scenarios/03-contracte/ai/context.md):** rezervarea reușește numai cu un identificator nefolosit și 0<q≤D; ridicarea și anularea, numai pentru o rezervare activă; altfel refuz, fără modificări. Ridicarea scade F și R cu q; anularea, doar R.

**Din I** (F=10, A activă(4), R=4, D=F−R=6): scenariul S2 (`rezerva(B,7)`); scenariul S3 (`ridica(A)`); scenariul S5 (`ridica(A)`, apoi `anuleaza(A)`). **Predicție în chat, la semnal:** ce rezultate așteptăm?

. . .

**Analistul AI — Claude Haiku 4.5, captură din 27 octombrie 2026; fragmente din contractul `rezerva`:**

> **Precondiții:** id ≠ 0; id nu apare deja în registru; q > 0; D ≥ q
>
> **Refuz:** Orice precondițiune încălcată ⇒ stare neschimbată

::: notes
Răspunsul calculează corect S2, S3 și S5 (de exemplu S3: F=6, R=0, D=6, A ridicată), iar registrul este singurul care modifică starea. Sarcina cerea însă separat condiția de succes: identificatorul nefolosit, q>0 și disponibilitatea sunt trecute la precondiții, apoi folosite ca motive de refuz. După cursul 6: dacă D≥q ar fi precondiție, refuzul pentru D<q nu ar mai fi promis. „Efectele” și „refuzurile” din sarcina trimisă sunt postcondițiile celor două cazuri. Fragmentul redă rândurile „Precondiții” și „Refuz” din tabelul propunerii; „id” este identificatorul rezervării. „id ≠ 0” citește literal cuvântul „nenuli” din enunțul trimis atunci; de aceea enunțul spune acum „nevizi”. Nu îl reproșăm modelului. Cealaltă analiză păstrată are aceeași confuzie. Răspunsul integral este în capturile pregătite, legate pe slide-ul următor.

**Organizare:** 10 min: predicție 2, analiză afișată 3, discuție 5. O rulare live are cel mult 2 min, incluse; altfel folosim captura. Pentru o rulare live, „Instrucțiunea trimisă” duce la promptul complet (instrucțiunea urmată de enunț), iar „Reguli” la context (enunțul). []{.pace dur=10}
:::

---

# Revizuirea: o observație trebuie justificată

**Evaluatorul (agent AI de revizuire) — Claude Haiku 4.5, captură din 27 octombrie 2026; context nou, cu enunțul, sarcina și propunerea integrală; fragmente:**

> **3. Efect asupra altor rezervări** Propunerea nu enumeră explicit "alte rezervări rămân neschimbate". […]
>
> **Concluzie:** Propunerea e substantiv corectă. […] Nu sunt remedieri logice necesare.

**Reguli:** R5 (istoric și efect limitat) cere ca o operație să nu modifice alte rezervări. Identificatorul nefolosit, q>0 și q≤D decid succesul rezervării; altfel operația refuză, iar întregul registru rămâne identic.

În chat, la semnal, apoi pe rând: observația 3 este susținută de R5? Ce nu a verificat evaluatorul AI la „Precondiții: … D ≥ q”?

[Capturile pregătite: instrucțiunile reale și răspunsurile integrale](https://github.com/traiansf/traiansf.github.io/blob/main/class/amss-2026/lab/scenarios/03-contracte/prepared-fixture.md)

::: notes
Observația 3 este corectă: R5 cere efectul limitat, iar propunerea nu îl formulează. Evaluatorul AI acceptă însă disponibilitatea drept precondiție, deși refuzul pentru D<q trebuie promis: aceasta este o parte a condiției de succes. „Substantiv corectă” din captură înseamnă „corectă în esență”; nu corectăm textul. Cealaltă revizuire păstrată declară precondițiile „necesare și suficiente”. Dacă o rulare live acoperă corect aceste puncte, o confirmăm și nu inventăm o omisiune.

**Organizare:** 10 min: predicție 2, revizuire afișată 3, discuție 5. []{.pace dur=10}
:::

---

# Decizia comună asupra propunerii

**Păstrăm sau corectăm numai cu justificare:**

| Întrebare | Reper pentru decizie |
|---|---|
| Cine modifică registrul? | Aceleași operații pentru formular și import. |
| Ce decide succesul? | Identificator nefolosit, q>0, q≤D: împreună, condiția de succes, cu refuz promis. |
| Ce înseamnă refuz? | Întregul registru identic, inclusiv istoricul. |
| Ce păstrăm la succes? | Celelalte rezervări, integral; identificatorul și cantitatea celei vizate. |

Un coleg explică o afirmație acceptată; alt coleg o verifică printr-un exemplu. Nu este obligatoriu să găsim o eroare.

::: notes
Cerem decizia umană, nu un vot de încredere în instrument. Precizăm proveniența fragmentului discutat: captură pregătită sau rulare live. Nu colectăm prompturi, conversații, mesaje din chat sau fișe individuale.

**Organizare:** 5 min; încheierea etapei la minutul 80. []{.pace dur=5}
:::

---

# Verificăm explicația altor colegi {.transition}

**80–100 min · Explicații și verificări în plen, încheiere**

Poate altcineva aplica exact contractul nostru?

::: notes
Revenim la explicațiile în ștafetă după demonstrația AI comună. Nu schimbăm regulile și nu adăugăm ridicare parțială.

**Organizare:** minutul 80 din 100; interval 80–100 (20 min): comparație 14, încheiere 6. []{.pace at=80}
:::

---

# Două rezervări, două operații succesive

**Starea de pornire (după scenariul S1):** F=10; A activă(4), B activă(6); R=10, D=0. F fizic, R rezervat activ, D disponibil.

**Reguli:** pentru o rezervare activă de q bucăți, anularea scade R cu q, fără modificarea lui F; ridicarea scade F și R cu q; D=F−R. Păstrăm identificatorul, cantitatea și celelalte rezervări; la refuz, întregul registru.

1. Executăm `anuleaza(A)`, apoi `ridica(B)`. Ce cantități și ce rezervări avem după fiecare pas?
2. Un voluntar explică în plen; un coleg numit verifică primul păstrarea rezervării neatinse de operație. Ceilalți pot formula obiecții în chat.
3. Alt coleg explică o ramură separată, imediat după anularea lui A, ca în scenariul S6 (reutilizarea lui A), dar din această stare: `rezerva(A,2)`. **Identificatorul nu se reutilizează.** Ce se păstrează la refuz?

::: notes
După anulare: F=10, R=6, D=4, A anulată(4), B activă(6). După ridicarea lui B: F=4, R=0, D=4, A anulată(4), B ridicată(6). Punctul 3 este o ramură separată din starea de după anulare, nu după ambii pași: refuz, exact acea stare. Aici D=4≥2, deci singurul motiv de refuz este identificatorul reutilizat: refuzul vine din R5 (istoric și efect limitat), nu din disponibilitate.

**Organizare:** 14 min: reflecție 3, explicații și verificări în ștafetă 8, discuție 3. []{.pace dur=14}
:::

---

# Ce putem explica acum?

Un exemplu din discuția voastră pentru fiecare întrebare:

- Cine asigură respectarea regulii și ce dependență evită copierea ei?
- Ce promite un refuz, dincolo de mesaj?
- Ce relație dintre cantități este un invariant?
- Ce au confirmat sau au corectat analiza și revizuirea comună?

**Repere:** ambele canale aplică aceleași reguli prin operațiile registrului; un refuz lasă registrul identic; D=F−R≥0 este un invariant; fiecare operație păstrează celelalte rezervări.

::: notes
Ascultați două sau trei exemple scurte. O explicație bună numește starea de pornire, operația și rezultatul, plus regula. Nu cereți predări, susțineri individuale sau un număr de defecte. Notați numai dificultățile recurente pentru pregătirea următoare.

**Organizare:** 6 min; încheiere la minutul 100. []{.pace dur=6}
:::
