---
title: "AMSS 2026/2027 — Laboratorul 3: Responsabilități, contracte și invarianți"
author: "Traian-Florin Șerbănuță"
lang: ro-RO
---

# Ce proiectăm azi

Un depozit are 10 adaptoare identice, pe care clienții le pot rezerva și ridica. Operatorul înregistrează cererile. **Rezervat nu înseamnă ridicat:** ce promite registrul când acceptă sau refuză o cerere?

Discutăm în perechi, apoi urmărim împreună **o analiză AI și o revizuire**, conduse de profesor.

Materiale: [enunț](https://github.com/traiansf/traiansf.github.io/blob/main/class/amss-2026/lab/scenarios/03-contracte/scenario.md), [sprijin facultativ pentru discuție](https://github.com/traiansf/traiansf.github.io/blob/main/class/amss-2026/lab/scenarios/03-contracte/worksheet.md).

Exemplu didactic. Schițele sunt facultative; nu predăm documente. Nu sunt necesare conturi AI pentru studenți.

::: notes
Aplicăm responsabilitățile din cursul 5 și contractele din cursul 6. Nu cerem o aplicație sau o diagramă de stări. Valori precum activă/ridicată/anulată sunt deja date în enunț.

**Organizare:** minutul 0 din 100; deschidere 0–10 (10 min): problema și materialele 3, citatul 2, recapitularea și sensurile cantităților 5. 16 slide-uri cu copertă. []{.pace at=0 of=100}
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

::: notes
6: acceptat, F=10, R=10, D=0. 7: refuz, exact I. Registrul comun verifică toate apelurile; o verificare în formular poate ajuta utilizatorul, dar nu trebuie să fie singura. Codul B identifică o rezervare nouă; I numește starea inițială.

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
Profesorul conduce o singură analiză și o singură revizuire într-un context nou. Perechile nu pornesc sesiuni AI proprii. În lipsa unei rulări, folosiți exemplele didactice de pe următoarele slide-uri, fără a le numi capturi. La o rulare live păstrați regulile rezumate vizibile alături de rezultat.

**Organizare:** minutul 55 din 100; interval 55–80 (25 min): analiza 10, revizuirea 10, decizia 5. []{.pace at=55}
:::

---

# Analiza: ce îi cerem și ce verificăm?

**Cerem asistentului AI:** responsabilități și contracte. Verificăm `rezerva(B,7)` și, separat din I, `ridica(A)`.

**Reguli:** cod nou, 0<q≤D la rezervare; ridicare/anulare numai dacă rezervarea este activă. Ridicarea scade F și R; anularea doar R. Refuzul și celelalte rezervări: fără modificări. D=F−R.

**I:** F=10, A activă(4), B nefolosit, R=4, D=6. **Predicție:** ce rezultate așteptăm?

. . .

**Propunere didactică, nu captură AI:** „Canalele folosesc registrul comun. `ridica(A)`: acceptat, A ridicată(4), F=6, R=0, D=6; restul neschimbat.”

::: notes
Fragmentul provine din unica propunere din prepared-fixture.md; următorul slide examinează contractul anulării din aceeași propunere. Propunerea integrală este disponibilă în materialele laboratorului. Fragmentul de aici este corect și util: verificăm că ridicarea nu eliberează cantitatea pentru altă rezervare și că ambele canale folosesc registrul. Rularea live, dacă există, înlocuiește exemplul pentru discuție; nu suprapunem mai multe analize. Arătați rezultatul lângă rezumatul regulilor. Limităm așteptarea instrumentului la 2 min, incluse în etapă; apoi folosim exemplul etichetat.

**Organizare:** 10 min: predicție 2, analiză afișată 3, discuție 5. []{.pace dur=10}
:::

---

# Revizuirea: o observație trebuie justificată

**Evaluatorul (agent AI de revizuire)** primește enunțul, sarcina și propunerea integrală într-un context nou. Fragmentul de verificat din propunere: „Anularea redă cantitatea disponibilului.”

**Reguli:** ridicare/anulare numai pentru rezervări active. Ridicarea scade F și R cu cantitatea rezervată; D=F−R. Refuzul păstrează tot registrul. **S5:** F=10, A activă(4), R=4, D=6 → `ridica(A)` → `anuleaza(A)`.

**Observație didactică, nu captură AI:** „Lipsește condiția anulării și efectul refuzului. Verificați anularea după ridicare.”

În plen: calculați cei doi pași. Ar fi suficientă doar verificarea `D≥0`?

::: notes
După ridicare: F=6, A ridicată(4), R=0, D=6. Anularea se refuză, fără schimbări. O implementare greșită ar putea marca A anulată și produce tot un D nenegativ; invariantul singur nu specifică tranziția cerută. Dacă analiza AI a acoperit corect S5, confirmăm aceasta și nu inventăm o omisiune. Recitim observațiile evaluatorului AI în raport cu propunerea efectivă.

**Organizare:** 10 min: predicție 2, revizuire afișată 3, discuție 5. []{.pace dur=10}
:::

---

# Decizia comună asupra propunerii

**Păstrăm sau corectăm numai cu justificare:**

| Întrebare | Reper pentru decizie |
|---|---|
| Cine modifică registrul? | Aceleași operații pentru formular și import. |
| Ce înseamnă ridicare? | F și R scad cu aceeași cantitate; D=F−R nu se schimbă. |
| Ce înseamnă refuz? | Întregul registru identic, inclusiv istoricul. |
| Ce păstrăm la succes? | Celelalte rezervări integral; codul și cantitatea celei vizate. |

Un coleg explică o afirmație acceptată; alt coleg o verifică printr-un exemplu. Nu este obligatoriu să găsim o eroare.

::: notes
Cerem decizia umană, nu un vot de încredere în instrument. Dacă folosim alternativa didactică, spunem explicit acest lucru. Nu colectăm prompturi, conversații sau fișe individuale.

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
