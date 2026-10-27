---
title: "AMSS 2026/2027 — Laboratorul 3: Responsabilități, contracte și invarianți"
author: "Traian-Florin Șerbănuță"
lang: ro-RO
---

# Ce proiectăm azi

Un depozit are 10 adaptoare identice, pe care clienții le pot rezerva și ridica. Operatorul înregistrează cererile. **Rezervat nu înseamnă ridicat:** ce promite registrul când acceptă sau refuză o cerere?

Discutăm în perechi, apoi urmărim împreună **o analiză AI și o revizuire**, conduse de profesor.

Exemplu didactic. Schițele sunt facultative; nu predăm documente. Nu sunt necesare conturi AI pentru studenți.

::: notes
Aplicăm responsabilitățile din cursul 5 și contractele din cursul 6. Nu cerem o aplicație sau o diagramă de stări. Valori precum activă/ridicată/anulată sunt deja date în enunț.

**Organizare:** minutul 0 din 100; deschidere 0–10 (10 min): problema 3, citatul 2, recapitularea și sensurile cantităților 5. 16 slide-uri cu copertă. []{.pace at=0 of=100}
:::

---

# Citatul zilei

> „Precondiția obligă clientul; postcondiția obligă furnizorul.”
>
> Original: “The precondition binds the client, the postcondition binds the supplier.”

— **Bertrand Meyer**

[Sursa: Object-Oriented Software Construction, ediția a doua, §25.3, p. 873](https://bertrandmeyer.com/OOSC2/)

::: notes
Refuzul unei cantități indisponibile poate fi un rezultat promis, dacă operația acceptă asemenea cereri. Nu trebuie să scoatem acea situație din contract numind disponibilitatea precondiție.

**Sursă:** citatul păstrat din materialele anterioare, verificat atunci în fragmentul indexat al cărții de pe site-ul autorului, §25.3, p. 873. La 27 octombrie 2026 pagina autorului este accesibilă, PDF-ul nu; limita verificării este consemnată în `docs/quotations.md`.
:::

---

# Ce luăm din cursurile 5–6

**Responsabilitate:** cine decide și cine poate modifica registrul?

**Contract:** ce presupunem, când reușim, ce întoarcem și ce păstrăm?

**Invariant:** ce relații respectă toate stările valide?

Astăzi: **F** = bucăți fizic în depozit; **R** = suma cantităților rezervate activ; **D = F − R** = disponibil. Inițial avem 10 bucăți, fără reaprovizionare sau retururi; lucrăm pe rând.

::: notes
Rezervarea reduce disponibilul, nu stocul fizic. Ridicarea reduce simultan stocul fizic și rezervatul. Abrevierile sunt explicate studenților și repetate pe slide-urile de lucru. P reprezintă totalul ridicat și va fi introdus doar în discuția de referință, dacă ajută.
:::

---

# Cine răspunde de modificarea registrului? {.transition}

**10–30 min · Individual, apoi explicații în pereche**

Aceeași cerere vine din formular și din import.

::: notes
Începem cu o predicție individuală înainte de compararea responsabilităților. Nu folosim AI în această etapă.

**Organizare:** minutul 10 din 100; interval 10–30 (20 min): reflecție 3, explicații cu roluri schimbate 10, discuție 7. []{.pace at=10}
:::

---

# Șase bucăți disponibile, două canale

**I:** F=10; A activă(4), B nefolosit; R=4, D=6. **F** = fizic, **R** = rezervat activ, **D** = disponibil.

**R2:** rezervăm o cantitate întreagă pozitivă, cel mult egală cu D, cu identificator nefolosit. Crește R, scade D, F rămâne identic; altfel refuz fără modificări. **R5:** formularul și importul folosesc aceleași reguli; alte rezervări se păstrează.

1. Individual: din I, `rezerva(B,6)` și, independent, `rezerva(B,7)` — ce rezultat și ce cantități rămân?
2. Un coleg propune verificări în fiecare canal; celălalt propune operații ale unui registru comun. Comparați dependențele.
3. Schimbați rolurile: cine împiedică importul să ocolească regula?

[Enunțul complet: R1–R5 și scenariile S1–S7](https://github.com/traiansf/traiansf.github.io/blob/main/class/amss-2026/lab/scenarios/03-contracte/scenario.md)

::: notes
6: acceptat, F=10, R=10, D=0. 7: refuz, exact I. Registrul comun verifică toate apelurile; o verificare în formular poate ajuta utilizatorul, dar nu trebuie să fie singura. Codul B identifică o rezervare nouă; I numește starea inițială. Linkul de pe slide duce la enunțul complet (R1–R5, S1–S7), ca referință; regulile necesare fiecărui exercițiu sunt pe slide-uri.

**Organizare:** 20 min pentru întreaga etapă, cu duratele din tranziție. []{.pace dur=20}
:::

---

# Ce garantează operațiile? {.transition}

**30–55 min · Construim și explicăm contracte**

Un refuz păstrează și cantitățile, și rezervările.

::: notes
Precondițiile comune sunt registru valid, identificatori nenuli, cantități întregi și apeluri pe rând. Pozitivitatea, disponibilitatea și identificatorul nefolosit decid succesul; refuzurile sunt specificate. Spre deosebire de muzeu, aici enunțul specifică și refuzul ridicării/anulării cu un identificator necunoscut. Domeniul promisiunii se citește din fiecare enunț.

**Organizare:** minutul 30 din 100; interval 30–55 (25 min): rezervare 10, ridicare/anulare 15. []{.pace at=30}
:::

---

# Contractul rezervării

**Înainte I:** F=10, A activă(4), B nefolosit, R=4, D=6; F fizic, R rezervat activ, D disponibil.

**R1:** numere întregi, identificatori nenuli, registru valid, apeluri pe rând. **R2:** pentru cantitatea q>0, identificator nefolosit și q≤D → rezervare activă nouă de q bucăți; F nu se schimbă. Altfel refuz fără modificări. **R5:** celelalte rezervări se păstrează.

În pereche, unul formulează contractul, celălalt verifică:

- S2: `rezerva(B,7)`; S7: `rezerva(B,0)` — fiecare din I;
- succesul `rezerva(B,6)` și păstrarea lui A;
- relația **D = F − R** și lipsa cantităților negative.

Schimbați rolurile înainte de concluzie.

::: notes
Ambele refuzuri păstrează exact I. Succesul creează B activă(6); F=10, R=10, D=0. Contractul nu poate spune doar „disponibil nenegativ”, fiindcă asta ar admite schimbarea cantității lui A. Nu cerem o transcriere obligatorie.

**Organizare:** 10 min. []{.pace dur=10}
:::

---

# Ridicarea nu mărește cantitatea disponibilă

**Înainte I:** F=10, A activă(4), R=4, D=6. F fizic, R rezervat activ, D disponibil.

**R3–R4:** numai o rezervare activă de q bucăți poate fi ridicată sau anulată. O marcăm ridicată/anulată. La ridicare, F și R scad cu q; D nu se schimbă. La anulare, F rămâne, R scade cu q, D crește cu q. **R5:** păstrăm codul, cantitatea și celelalte rezervări; la refuz, tot registrul.

Un coleg explică S3 (`ridica(A)`), celălalt S4 (`anuleaza(A)`), **independent din I**. Apoi schimbați rolurile:

**S5:** din I, `ridica(A)`, apoi `anuleaza(A)`. Ce rezultat și ce stare produce fiecare pas? De ce nu putem „reda” cele 4 bucăți?

::: notes
S3: F=6, R=0, D=6, A ridicată(4). S4: F=10, R=0, D=10, A anulată(4). S5: primul pas ca S3; al doilea refuză și păstrează exact acea stare. Cele patru bucăți au părăsit fizic depozitul; nu există retur în domeniu. Invarianți: 0≤R≤F≤10, D=F−R. Opțional, F plus cantitatea ridicată rămâne 10.

**Organizare:** 15 min, cu discuție. []{.pace dur=15}
:::

---

# O analiză AI, o revizuire împreună {.transition}

**55–80 min · Demonstrație condusă de profesor, discuție în plen**

Prezicem răspunsul, îl verificăm, apoi decidem ce păstrăm.

::: notes
Profesorul conduce o singură analiză și o singură revizuire într-un context nou. Perechile nu pornesc sesiuni AI proprii. Slide-urile următoare conțin capturi reale Claude Haiku 4.5 din 27 octombrie 2026, obținute înaintea laboratorului prin Claude Code, fără unelte și fără contextul proiectului; o rulare live le poate înlocui. Am rulat câte două încercări și am ales câte una; selecția nu descrie performanța tipică a modelului. La o rulare live păstrați regulile rezumate vizibile alături de rezultat.

**Organizare:** minutul 55 din 100; interval 55–80 (25 min): analiza 10, revizuirea 10, decizia 5. []{.pace at=55}
:::

---

# Analiza: ce îi cerem și ce verificăm?

**Cerem asistentului AI:** responsabilități și contracte, cu precondiții și condiții de succes separate.

**Reguli:** cod nou, 0<q≤D la rezervare; ridicare/anulare numai pentru o rezervare activă; altfel refuz, fără modificări. Ridicarea scade F și R; anularea doar R. D=F−R.

**Din I** (F=10, A activă(4), R=4, D=6): S2 `rezerva(B,7)`; S3 `ridica(A)`; S5 `ridica(A)`, apoi `anuleaza(A)`. **Predicție:** ce rezultate așteptăm?

. . .

**Analistul AI — Claude Haiku 4.5, captură din 27 octombrie 2026; fragmente pentru `rezerva` și S3:**

> **Precondiții:** id ≠ 0; id nu apare deja în registru; q > 0; D ≥ q\n> **Refuz:** Orice precondițiune încălcată ⇒ stare neschimbată
>
> **S3:** `ridica(A)` — A activ ✓ → Marcheaza A ridicată; F=10−4=**6**; R=4−4=**0**; D=6 (nemodificat).

::: notes
Calculele S2, S3 și S5 sunt corecte, iar registrul este singurul care modifică starea. Sarcina cerea însă separat condițiile de succes: codul nefolosit, q>0 și disponibilitatea sunt trecute la precondiții, apoi folosite ca motive de refuz. După cursul 6: dacă D≥q ar fi precondiție, refuzul pentru D<q nu ar mai fi promis. „id ≠ 0” transformă „identificator nenul” într-o condiție numerică. Cealaltă analiză păstrată are aceeași confuzie. Răspunsul integral este în materialele laboratorului.

**Organizare:** 10 min: predicție 2, analiză afișată 3, discuție 5. O rulare live are cel mult 2 min, incluse; altfel folosim captura. []{.pace dur=10}
:::

---

# Revizuirea: o observație trebuie justificată

**Evaluatorul (agent AI de revizuire)** a primit într-un context nou enunțul, sarcina și propunerea integrală.

**Evaluatorul AI — Claude Haiku 4.5, captură din 27 octombrie 2026; fragmente:**

> **3. Efect asupra altor rezervări** Propunerea nu enumeră explicit "alte rezervări rămân neschimbate". […]
>
> **Concluzie:** Propunerea e substantiv corectă. […] Nu sunt remedieri logice necesare.

**Reguli:** R5 — o operație nu modifică alte rezervări. Cod nou, q>0 și q≤D decid succesul; altfel refuz, cu întregul registru identic.

În plen: observația 3 este susținută de R5? Ce nu a verificat evaluatorul AI la „Precondiții: … D ≥ q”?

::: notes
Observația 3 este corectă: R5 cere efectul limitat, iar propunerea nu îl formulează. Evaluatorul AI acceptă însă disponibilitatea drept precondiție, deși refuzul pentru D<q trebuie promis: aceasta este o condiție de succes. Cealaltă revizuire păstrată declară precondițiile „necesare și suficiente”. Dacă o rulare live acoperă corect aceste puncte, o confirmăm și nu inventăm o omisiune.

**Organizare:** 10 min: predicție 2, revizuire afișată 3, discuție 5. []{.pace dur=10}
:::

---

# Decizia comună asupra propunerii

**Păstrăm sau corectăm numai cu justificare:**

| Întrebare | Reper pentru decizie |
|---|---|
| Cine modifică registrul? | Aceleași operații pentru formular și import. |
| Ce decide succesul? | Cod nou, q>0, q≤D: condiții de succes, cu refuz promis. |
| Ce înseamnă refuz? | Întregul registru identic, inclusiv istoricul. |
| Ce păstrăm la succes? | Celelalte rezervări integral; codul și cantitatea celei vizate. |

Un coleg explică o afirmație acceptată; alt coleg o verifică printr-un exemplu. Nu este obligatoriu să găsim o eroare.

::: notes
Cerem decizia umană, nu un vot de încredere în instrument. Precizăm proveniența fragmentului discutat: captură pregătită sau rulare live. Nu colectăm prompturi, conversații sau fișe individuale.

**Organizare:** 5 min; încheierea etapei la minutul 80. []{.pace dur=5}
:::

---

# Verificăm explicația altor colegi {.transition}

**80–100 min · Comparație între perechi și încheiere**

Poate altcineva aplica exact contractul nostru?

::: notes
Revenim la colaborarea între colegi după demonstrația AI comună. Nu schimbăm regulile și nu adăugăm ridicare parțială.

**Organizare:** minutul 80 din 100; interval 80–100 (20 min): comparație 14, încheiere 6. []{.pace at=80}
:::

---

# Două rezervări, două operații succesive

**Înainte:** F=10; A activă(4), B activă(6); R=10, D=0. F fizic, R rezervat activ, D disponibil.

**Reguli:** pentru o rezervare activă de q bucăți, anularea scade R cu q, fără schimbarea lui F; ridicarea scade F și R cu q. D=F−R. Păstrăm codul, cantitatea și celelalte rezervări; la refuz, întregul registru.

1. Executăm `anuleaza(A)`, apoi `ridica(B)`. Ce cantități și ce rezervări avem după fiecare pas?
2. Explicați unei alte perechi. Un coleg din acea pereche verifică primul păstrarea rezervării neatinse de operație.
3. Inversați rolurile. Ramură separată, imediat după anularea lui A: `rezerva(A,2)`. **Codul nu se reutilizează.** Ce se păstrează la refuz?

::: notes
După anulare: F=10, R=6, D=4, A anulată(4), B activă(6). După ridicarea lui B: F=4, R=0, D=4, A anulată(4), B ridicată(6). Punctul 3 este o ramură separată din starea de după anulare, nu după ambii pași: refuz, exact acea stare. Identificatorul păstrat în istoric exclude reutilizarea.

**Organizare:** 14 min: reflecție 3, explicații în ambele sensuri 8, discuție 3. []{.pace dur=14}
:::

---

# Ce putem explica acum?

Un exemplu din discuția voastră pentru fiecare întrebare:

- Cine asigură respectarea regulii și ce dependență evită copierea ei?
- Ce promite un refuz, dincolo de mesaj?
- Ce relație dintre cantități este un invariant?
- Ce a confirmat sau a schimbat analiza și revizuirea comună?

**Repere:** aceleași reguli în ambele canale; refuz → registru identic; D=F−R≥0; operațiile păstrează celelalte rezervări.

::: notes
Ascultați două sau trei exemple scurte. O explicație bună numește starea de pornire, operația și rezultatul, plus regula. Nu cereți predări, susțineri individuale sau un număr de defecte. Notați numai dificultățile recurente pentru pregătirea următoare.

**Organizare:** 6 min; încheiere la minutul 100. []{.pace dur=6}
:::
