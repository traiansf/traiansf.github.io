---
title: "AMSS 2026/2027 — Laboratorul 4: Stări, comportament și interacțiuni"
author: "Traian-Florin Șerbănuță"
lang: ro-RO
---

# Ce proiectăm azi

Pentru proiecțiile și filmele cluburilor studențești, serviciul tehnic al facultății împrumută echipamente pe bază de rezervare; studenții le ridică de la un **ghișeu cu operator**. Registrul rezervărilor acceptă sau refuză ridicarea; numai după acceptare cere unui **expeditor extern** o notificare. **Notificarea eșuează, ghișeul reîncearcă:** ce are voie să se întâmple cu rezervarea?

Lucrăm individual și discutăm în plen, apoi urmărim împreună **o analiză AI și o revizuire**, conduse de profesor.

Exemplu didactic. Schițele sunt facultative; nu predăm documente. Nu sunt necesare conturi AI pentru studenți.

::: notes
Aplicăm stările și tranzițiile din cursul 7 și interacțiunile peste graniță din cursul 8. Nu cerem o aplicație, explorarea automată a stărilor sau analiza formală din cursul 9. Valorile Rezervată/Ridicată/Anulată sunt date în enunț.

**Organizare:** minutul 0 din 100; deschidere 0–10 (10 min): problema 3, citatul 2, recapitularea 5. 17 slide-uri cu copertă. []{.pace at=0 of=100 dur=3}
:::

---

# Citatul zilei

> „O mare parte a informaticii se ocupă de mașini de stări.”
>
> Original: “Much of computer science is about state machines.”

— **Leslie Lamport**

[Sursa: Computation and State Machines (2008), p. 1](https://lamport.azurewebsites.net/pubs/state-machine.pdf#page=4)

::: notes
Reluăm citatul din cursul 7. Rezervarea de azi este o mașină de stări cu trei stări; interacțiunea cu expeditorul adaugă pași, nu stări noi ale rezervării, ci o dată înregistrată: rezultatul notificării.

**Sursă:** manuscris pe site-ul autorului, prima propoziție din Introduction, pagina numerotată 1 (pagina PDF 4); reverificată la 12 noiembrie 2026. Vezi `docs/quotations.md`.

**Organizare:** 2 min. []{.pace dur=2}
:::

---

# Ce luăm din cursurile 7–8

**Stare și tranziție:** etapa ciclului de viață și datele păstrate decid ce evenimente sunt permise acum; o tranziție are stare curentă, eveniment, condiție, stare următoare și efect; un eveniment nepermis este **refuzat**, fără modificări; la succes se modifică numai datele precizate.

**Interacțiune și graniță:** cine apelează pe cine, ce se întoarce, ce se înregistrează la fiecare pas; despre un serviciu din afara graniței cunoaștem doar interfața și ce presupunem.

**Reîncercare:** aceeași cerere deja acceptată, cu același identificator, primește același rezultat, fără o a doua ridicare; notificarea poate fi retrimisă; o cerere nouă cu același conținut este judecată după reguli.

Astăzi: rezervările au stările **Rezervată**, **Ridicată**, **Anulată**; apelurile sunt secvențiale; expeditorul răspunde `trimis` sau `esec`. `netrimisă` consemnează `esec`, fără să stabilească dacă mesajul a ajuns.

::: notes
Recapitulăm fără exemplele cursurilor: așa judecăm propunerile de azi. Întrebările de verificare rămân aceleași: ce este permis acum, ce se înregistrează, cine coordonează, ce promitem când cealaltă parte eșuează.

**Organizare:** 5 min. []{.pace dur=5}
:::

---

# Ce are voie să se întâmple cu o rezervare? {.transition}

**10–30 min · Individual, apoi explicații în plen**

Alt student, aceeași rezervare: refuzat de stare sau de condiție?

::: notes
Începem cu predicții individuale, apoi construim tabelul de tranziții și îl explicăm în plen. Nu folosim AI în această etapă.

**Organizare:** minutul 10 din 100; interval 10–30 (20 min): predicții 6, tabel 7, explicații în plen 7. []{.pace at=10}
:::

---

# Trei scenarii de prezis

**Starea inițială I:** rezervarea A (titular T1, proiector) și rezervarea B (titular T2, cameră) sunt Rezervate; niciun identificator de cerere înregistrat.

**R3 (ridicare):** `ridica(c, r, s)` cu c nou este acceptată exact când r este Rezervată și s este titularul: r trece în Ridicată, data și c se înregistrează, rezultat `ridicat`; altfel `refuz`, fără modificări, fără notificare. **R6 (anulare):** `anuleaza(r)` numai pentru o rezervare Rezervată → Anulată, fără notificare; altfel `refuz`. **R2 (stări):** Anulată este finală intenționată; Ridicată permite reîncercarea, fără o a doua ridicare.

1. Individual, din I: scenariul S2 (`ridica(c1, A, T2)`); scenariul S7 (`anuleaza(B)`, apoi `ridica(c2, B, T2)`); continuarea scenariului S1 (A Ridicată, c1 înregistrat): scenariul S5 (`ridica(c7, A, T1)`). Rezultat, stare, ce se înregistrează.
2. În plen: pentru fiecare refuz, ce îl decide: **starea** sau **condiția**?

[Enunțul complet: R1–R8 și scenariile S1–S7](https://github.com/traiansf/traiansf.github.io/blob/main/class/amss-2026/lab/scenarios/04-comportament/scenario.md)

::: notes
S2: refuz, decis de condiție (T2 nu este titularul); I neschimbată, c1 neînregistrat. S7: anularea acceptată, B Anulată; ridicarea refuzată, decisă de stare (Anulată este finală); fără notificare. S5: refuz, decis de stare (A nu mai este Rezervată); c7 este o cerere nouă, deci R5 nu se aplică. Linkul duce la enunțul complet, ca referință; regulile necesare fiecărui exercițiu sunt pe slide-uri.

**Organizare:** 6 min: 3 individual, 3 în plen. []{.pace dur=6}
:::

---

# Tabelul de tranziții

**Reguli:** `ridica` cu c nou: numai din Rezervată, numai de titular → Ridicată, cu data și c înregistrate și notificarea `trimisă` sau `netrimisă`. **R5 (reîncercare):** `ridica` cu c deja înregistrat: același `ridicat`, starea neschimbată; dacă notificarea este `netrimisă`, expeditorul este apelat din nou. `anuleaza` numai din Rezervată → Anulată. Altfel: refuzat, fără modificări; datele nu se șterg.

Individual, completați tabelul (stare curentă, eveniment, condiție, stare următoare, efect). În plen, un coleg îl explică rând cu rând, iar alt coleg verifică:

- în ce stare se află rezervarea când sosește o **reîncercare**? Are rândul ei?
- care rânduri sunt refuzuri decise de condiție și care de stare?
- ce rămâne înregistrat după `anuleaza(B)`: titularul, echipamentul?

::: notes
Rândurile așteptate: Rezervată + `ridica` cu c nou și s titular → Ridicată; Ridicată + `ridica` cu c înregistrat → Ridicată (reîncercare, notificarea poate fi actualizată); Rezervată + `anuleaza` → Anulată. Reîncercarea sosește în Ridicată, nu în Rezervată: c este înregistrat numai la acceptare. Mulți o pun în Rezervată; întrebarea colegului care verifică o scoate la iveală. Refuzuri de condiție: alt student; de stare: o cerere nouă de ridicare în Ridicată sau Anulată, anularea în Ridicată. Reîncercarea în Ridicată este permisă; de aceea Ridicată nu este o stare finală intenționată în sensul cursului 7. După anulare, titularul și echipamentul rămân (R8). În Ridicată, reîncercarea poate actualiza notificarea: păstrarea etapei nu înseamnă păstrarea întregii stări.

**Organizare:** 14 min: 7 individual, 7 în plen; ajungem la minutul 30. []{.pace dur=14}
:::

---

# Cine coordonează ridicarea? {.transition}

**30–55 min · Interacțiunea pas cu pas, apoi reîncercările**

Expeditorul a răspuns `esec`. Ce promite registrul ghișeului?

::: notes
Scriem interacțiunea pentru cazul normal și pentru eșecul notificării, apoi reîncercarea și cererea nouă. Granița și presupunerile despre expeditor rămân pe slide.

**Organizare:** minutul 30 din 100; interval 30–55 (25 min): interacțiune 12, reîncercări 13. []{.pace at=30}
:::

---

# Interacțiunea pentru `ridica`

**Din I, independent:** A este Rezervată, cu titularul T1; c1 este neînregistrat. **R3 (ridicare):** acceptarea trece A în Ridicată și înregistrează data și c1.

**R4 (notificare):** după o ridicare acceptată, registrul cere expeditorului `trimite(mesaj)`, care răspunde `trimis` sau `esec`; registrul înregistrează notificarea `trimisă` sau `netrimisă`; **eșecul nu anulează ridicarea**, ghișeul primește `ridicat`. **R7 (graniță):** presupunem doar că expeditorul răspunde; `esec` nu înseamnă că mesajul nu a ajuns. Refuzul nu apelează expeditorul.

Individual, scrieți pașii (cine → cui, ce se trimite sau se întoarce, ce înregistrează registrul) pentru:

- scenariul S1 (`ridica(c1, A, T1)`, expeditorul răspunde `trimis`);
- scenariul S3 (`ridica(c1, A, T1)`, expeditorul răspunde `esec`).

În plen, un coleg explică S1, alt coleg S3, apoi: **în ce pas schimbă registrul starea: înainte sau după apelul expeditorului? Ce s-ar întâmpla cu S3 în ordinea inversă?**

::: notes
S1: ghișeu → registru; registrul verifică (A Rezervată, T1 titular, c1 nou), trece A în Ridicată, înregistrează data și c1, notificarea în așteptare; registru → expeditor `trimite`; expeditor → registru `trimis`; registrul înregistrează `trimisă`; registru → ghișeu `ridicat`. S3: identic, cu `esec` și `netrimisă`; răspunsul rămâne `ridicat`. Tranziția precede apelul. În ordinea inversă (starea schimbată numai la `trimis`), la `esec` studentul ar pleca cu echipamentul, iar A ar rămâne Rezervată: registrul ar putea accepta încă o ridicare pentru aceeași rezervare, iar R4 ar fi încălcată.

**Organizare:** 12 min: 5 individual, 7 în plen. []{.pace dur=12}
:::

---

# Reîncercare sau cerere nouă?

**R5 (reîncercare):** o cerere cu c deja înregistrat primește același `ridicat`, fără a doua ridicare; dacă notificarea este `netrimisă`, expeditorul este apelat din nou și rezultatul se actualizează; dacă este `trimisă`, nu. **R3 (ridicare):** o cerere cu c nou pentru o rezervare care nu mai este Rezervată: `refuz`, fără modificări, fără notificare.

Individual, **independent** una de alta:

- scenariul S4 (reîncercare după eșec): continuarea lui S3 (notificare eșuată: A Ridicată, c1 înregistrat, notificare `netrimisă`): `ridica(c1, A, T1)`, expeditorul răspunde `trimis`;
- scenariul S5 (cerere nouă după ridicare): continuarea lui S1 (ridicare confirmată: A Ridicată, c1 înregistrat, notificare `trimisă`): `ridica(c7, A, T1)`.

În plen, un coleg explică S4, alt coleg S5: **Ce deosebește cererile pentru același student și aceeași rezervare? Ce garantează registrul ghișeului în fiecare caz?**

::: notes
S4: c1 înregistrat → reîncercare; notificarea `netrimisă` → expeditorul apelat din nou → `trimisă`; răspuns `ridicat`; A rămâne Ridicată, o singură ridicare. S5: c7 nou → cerere nouă; A nu este Rezervată → `refuz`, nimic nu se modifică, expeditorul nu este apelat. Le deosebește numai identificatorul cererii. Garanții: o rezervare este ridicată cel mult o dată; reîncercarea primește același rezultat; rezultatul notificării este înregistrat; refuzul nu produce mesaje. Nu garantăm livrarea sau citirea mesajului.

**Organizare:** 13 min: 5 individual, 8 în plen; ajungem la minutul 55. []{.pace dur=13}
:::

---

# O analiză AI, o revizuire împreună {.transition}

**55–75 min · Demonstrație condusă de profesor, discuție în plen**

Prezicem răspunsul, îl verificăm, apoi decidem ce păstrăm.

::: notes
Profesorul conduce o singură analiză și o singură revizuire într-un context nou. Studenții nu pornesc sesiuni AI proprii. Slide-urile următoare conțin capturi reale Claude Haiku 4.5 din 12 noiembrie 2026, obținute înaintea laboratorului prin Claude Code 2.1.322, fără unelte și fără contextul proiectului; o rulare live le poate înlocui. Am rulat câte două încercări și am ales câte una; selecția nu descrie performanța tipică a modelului. La o rulare live păstrați regulile rezumate vizibile alături de rezultat.

**Organizare:** minutul 55 din 100; interval 55–75 (20 min): analiza 8, revizuirea 8, decizia 4. []{.pace at=55}
:::

---

# Analiza: ce îi cerem și ce verificăm?

**[Instrucțiunea trimisă](https://github.com/traiansf/traiansf.github.io/blob/main/class/amss-2026/lab/scenarios/04-comportament/ai/analist-prompt.md):** „Propune tabelul de tranziții al rezervării […] și tabelul interacțiunii pentru ridica […]. Calculează S2, S4 și S7. […]”

**Reguli:** c se înregistrează numai la acceptare. O reîncercare cu c înregistrat primește `ridicat` și retrimite notificarea `netrimisă`; o cerere nouă în Ridicată primește `refuz`.

**Scenariul S4 (reîncercare după eșec):** A Ridicată, titular T1, c1 înregistrat, notificare `netrimisă`. Apel: `ridica(c1, A, T1)`; expeditorul răspunde `trimis`.

**Predicție:** în ce stare se află A când sosește reîncercarea din S4 și ce rezultat primește ghișeul?

. . .

**Analistul AI — Claude Haiku 4.5, 12 noiembrie 2026; fragmente:**

> | **Rezervată** | `ridica(c, r, s)` | c înregistrat | **Rezervată** | Reîncercare (handler separat) |
>
> | **Ridicată** | `ridica(c, r, s)` | — | **Ridicată** | Fără modificări; returnează `refuz` |
>
> **S4:** […] **Rezultat:** `ridicat`, expeditor apelat din nou

::: notes
Răspunsul calculează corect S2, S4 și S7 și descrie corect interacțiunea (tranziția înaintea apelului expeditorului). Tabelul de tranziții pune însă reîncercarea în Rezervată, unde c nu poate fi înregistrat, și refuză orice `ridica` în Ridicată: după tabel, S4 ar primi `refuz`; după calculul propriu al lui S4, `ridicat`. Tabelul și scenariul se contrazic; R5 dă dreptate scenariului. Și enunțul trimis avea o contradicție: R2 numea Ridicată „finală”, deși R5 permite reîncercări. Am corectat enunțul curent; captura păstrează intrarea originală și nu atribuim modelului eroarea noastră. Răspunsul adaugă și presupuneri despre expeditor care nu sunt în enunț („nu are memorie de cereri”). Cealaltă analiză păstrată are aceeași așezare greșită a rândului de reîncercare, fără contradicția cu S4. Răspunsul integral este în capturile pregătite, legate pe slide-ul următor.

**Organizare:** 8 min: predicție 2, analiză afișată 2, discuție 4. O rulare live are cel mult 2 min, incluse; altfel folosim captura. Linkul instrucțiunii păstrează intrarea istorică. La o rulare live, combinați instrucțiunea cu enunțul curent, conform ghidului AI, care explică și corectarea lui R2. []{.pace dur=8}
:::

---

# Revizuirea: o observație trebuie justificată

**Evaluatorul (agent AI de revizuire) — Claude Haiku 4.5, captură din 12 noiembrie 2026; context nou; fragmente:**

> **1. Rândul 3 al tabelului de tranziții (c înregistrat în Rezervată)** […] **Problem**: Notația "handler separat" e vagă. […]
>
> ✓ **Idempotență** (R3 + R5): Același c ➜ același răspuns invariant
>
> Propunerea e solidă […]

**Reguli:** c se înregistrează numai la o ridicare acceptată, deci o reîncercare sosește în **Ridicată**; R5 (reîncercare) cere același `ridicat`, iar o cerere nouă primește `refuz`.

În plen: observația 1 este susținută de reguli? **Ce nu a verificat evaluatorul AI: ce spune tabelul despre `ridica` în Ridicată?**

[Capturile pregătite: instrucțiunile reale și răspunsurile integrale](https://github.com/traiansf/traiansf.github.io/blob/main/class/amss-2026/lab/scenarios/04-comportament/prepared-fixture.md)

::: notes
Observația 1 este corectă, dar superficială: „handler separat” este într-adevăr vag, însă problema rândului este starea: reîncercarea nu poate sosi în Rezervată. Evaluatorul AI nu confruntă rândul „Ridicată | ridica | refuz” cu calculul lui S4 dar confirmă „idempotența”. Idempotența privește efectul repetării, nu egalitatea răspunsurilor; R5 cere aici și același răspuns. Notificarea poate fi actualizată. Cealaltă revizuire păstrată declară propunerea „corectă și completă”. Dacă o rulare live acoperă corect aceste puncte, o confirmăm și nu inventăm o omisiune.

**Organizare:** 8 min: predicție 2, revizuire afișată 2, discuție 4. []{.pace dur=8}
:::

---

# Decizia comună asupra propunerii

| Întrebare | Reper pentru decizie |
|:-----------------------|:------------------------------------------|
| Când schimbă registrul starea? | Înaintea apelului expeditorului; o păstrează la eșec. R4 (notificare). |
| Unde este rândul reîncercării? | În Ridicată; c se înregistrează la acceptare. R3 (ridicare). |
| Este Ridicată finală? | Nu: R5 (reîncercare) permite un eveniment. Enunțul inițial o numea greșit finală. |
| Ce primește o cerere nouă în Ridicată? | `refuz`, fără modificări; reîncercarea primește `ridicat`. |
| Ce presupunem despre expeditor? | Răspunde `trimis` sau `esec`. R7 (graniță). |

Un coleg explică o afirmație acceptată; alt coleg o verifică printr-un scenariu.

::: notes
Nu este obligatoriu să găsim o eroare. Cerem decizia umană, nu un vot de încredere în instrument. Precizăm proveniența fragmentului discutat: captură pregătită sau rulare live. Nu colectăm prompturi, conversații sau fișe individuale.

**Organizare:** 4 min; încheierea etapei la minutul 75. []{.pace dur=4}
:::

---

# Verificăm trasările altor colegi {.transition}

**75–100 min · Individual, explicații în plen și încheiere**

Poate altcineva aplica exact tabelul și interacțiunea noastră?

::: notes
Revenim la lucrul individual și la explicațiile în plen după demonstrația AI comună. Nu schimbăm regulile și nu adăugăm returnarea echipamentelor.

**Organizare:** minutul 75 din 100; interval 75–100 (25 min): exercițiu 15, încheiere 10. []{.pace at=75}
:::

---

# Același conținut, alt identificator

**Starea de pornire I:** A (titular T1) și B (titular T2) Rezervate; niciun identificator înregistrat.

**Reguli:** `ridica` cu c nou: numai din Rezervată, de titular → Ridicată, c înregistrat, notificare `trimisă`/`netrimisă`; cu c înregistrat: același `ridicat`, iar notificarea `netrimisă` se reîncearcă; altfel refuz fără modificări; eșecul notificării nu anulează ridicarea.

1. Individual: din I, `ridica(c1, A, T1)` cu `esec`; apoi, după ce răspunsul nu s-a afișat la ghișeu, ghișeul trimite `ridica(c8, A, T1)` cu un identificator **nou**. Rezultatul, starea și notificarea după fiecare pas.
2. În plen, un voluntar explică; un coleg verifică primul dacă expeditorul a fost apelat la pasul al doilea.
3. Alt coleg explică ramura separată, tot din starea de după pasul 1: ghișeul reîncearcă cu `ridica(c1, A, T1)`, iar expeditorul răspunde `trimis`. **Ce diferă față de pasul 2 și de ce?**

::: notes
Pasul 1: `ridicat`; A Ridicată, c1 înregistrat, notificare `netrimisă`. Pasul 2: c8 este cerere nouă, A nu mai este Rezervată → `refuz`; nimic nu se modifică, expeditorul nu este apelat; notificarea rămâne `netrimisă`. Ramura 3: c1 înregistrat → reîncercare; expeditorul apelat din nou → notificarea `trimisă`; `ridicat`. Diferența stă numai în identificatorul cererii; conținutul este identic. Întrebarea de încheiere: ce ar trebui să facă ghișeul ca să nu ajungă la pasul 2?

**Organizare:** 15 min: reflecție 4, explicații și verificări în plen 8, discuție 3. []{.pace dur=15}
:::

---

# Ce putem explica acum?

Un exemplu din discuția voastră pentru fiecare întrebare:

- Ce evenimente sunt permise într-o stare și ce decide un refuz: starea sau condiția?
- În ce pas schimbă registrul starea față de apelul expeditorului, și de ce?
- Ce deosebește o reîncercare de o cerere nouă cu același conținut?
- Ce au confirmat sau au corectat analiza și revizuirea comună?

**Repere:** tranziția precede apelul expeditorului; eșecul notificării este înregistrat, nu ascuns; reîncercarea sosește în Ridicată și primește același rezultat; presupunem despre expeditor numai că răspunde.

::: notes
Ascultați două sau trei exemple scurte. O explicație bună numește starea de pornire, evenimentul sau pasul, rezultatul și regula. Nu cereți predări, susțineri individuale sau un număr de defecte. Notați numai dificultățile recurente pentru pregătirea următoare.

**Organizare:** 10 min; încheiere la minutul 100. []{.pace dur=10}
:::
