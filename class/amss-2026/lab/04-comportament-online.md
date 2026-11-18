---
title: "AMSS 2026/2027 — Laboratorul 4: Stări, comportament și interacțiuni — online"
author: "Traian-Florin Șerbănuță"
lang: ro-RO
operation-names: [ridică, anulează, trimite]
state-names: [Rezervată, Ridicată, Anulată]
---

# Ce proiectăm azi

Pentru proiecțiile și filmele cluburilor studențești, serviciul tehnic al facultății împrumută echipamente pe bază de rezervare; studenții le ridică de la un **ghișeu cu operator**. Registrul rezervărilor acceptă sau refuză ridicarea; numai după acceptare cere unui **expeditor extern** o notificare. **Notificarea eșuează, ghișeul reîncearcă:** ce are voie să se întâmple cu rezervarea?

Discutăm în plen pe Teams, apoi urmărim împreună **o analiză AI și o revizuire**, conduse de profesor.

Exemplu didactic. Schițele sunt facultative; nu predăm documente. Nu sunt necesare conturi AI pentru studenți.

::: notes
Aplicăm stările și tranzițiile din cursul 7 și interacțiunile peste graniță din cursul 8. Nu cerem o aplicație, explorarea automată a stărilor sau analiza formală din cursul 9. Stările Rezervată, Ridicată și Anulată sunt precizate în enunț.

**Organizare:** minutul 0 din 100; deschidere 0–10 (10 min): problema 3, citatul 2, recapitularea 5. 17 slide-uri cu copertă; Teams în plen, fără grupuri separate. Profesorul conduce etapa AI. Predicțiile se trimit în chat la semnal. []{.pace at=0 of=100 dur=3}
:::

---

# Citatul zilei

> „O mare parte a informaticii se ocupă de mașini de stări.”
>
> Original: “Much of computer science is about state machines.”

— **Leslie Lamport**

[Sursa: Computation and State Machines (2008), p. 1](https://lamport.azurewebsites.net/pubs/state-machine.pdf#page=4)

::: notes
Reluăm citatul din cursul 7. Rezervarea de azi este o mașină de stări cu trei stări; interacțiunea cu expeditorul nu adaugă stări noi ale rezervării, ci pași și o dată în plus: rezultatul notificării.

**Sursă:** manuscris pe site-ul autorului, prima propoziție din Introduction, pagina numerotată 1 (pagina PDF 4); reverificată la 12 noiembrie 2026. Vezi `docs/quotations.md`.

**Organizare:** 2 min. []{.pace dur=2}
:::

---

# Ce luăm din cursurile 7–8

**Stare și tranziție:** starea (etapa cu nume a ciclului de viață) și datele păstrate decid ce evenimente sunt permise acum; o tranziție are stare curentă, eveniment, condiție, stare următoare și efect; un eveniment nepermis este **refuzat**, fără modificări; la succes se modifică numai datele precizate.

**Interacțiune și graniță:** cine apelează pe cine, ce se întoarce, ce se înregistrează la fiecare pas; despre un serviciu din afara graniței cunoaștem doar interfața și ce presupunem.

**Reîncercare:** aceeași cerere, trimisă din nou cu același identificator, primește același rezultat, iar efectul ei nu se repetă; o cerere nouă cu același conținut este judecată după reguli.

Astăzi: rezervările au stările **Rezervată**, **Ridicată**, **Anulată**; apelurile sunt secvențiale; expeditorul răspunde `trimis` sau `esec`. `netrimisă` consemnează `esec`, fără să stabilească dacă mesajul a ajuns.

::: notes
Recapitulăm fără exemplele cursurilor: așa judecăm propunerile de azi. Întrebările de verificare rămân aceleași: ce este permis acum, ce se înregistrează, cine coordonează, ce promitem când componenta din exterior eșuează.

**Organizare:** 5 min. []{.pace dur=5}
:::

---

# Ce are voie să se întâmple cu o rezervare? {.transition}

**10–30 min · Predicții în chat, apoi explicații în ștafetă**

Alt student, aceeași rezervare: refuzat de stare sau de condiție?

::: notes
Începem cu predicții individuale, apoi construim tabelul de tranziții și îl explicăm în plen. Nu folosim AI în această etapă.

**Organizare:** minutul 10 din 100; interval 10–30 (20 min): predicții în chat 6, tabel 7, explicații în ștafetă 7. []{.pace at=10}
:::

---

# Trei scenarii de prezis

**Starea inițială I:** A (titular T1) și B (titular T2) sunt în Rezervată; niciun identificator înregistrat.

**R3 (ridicare):** `ridică(c, r, s)` cu c nou este acceptată exact când r este Rezervată și s este titularul: r trece în Ridicată, cu momentul ridicării și c înregistrate; rezultat `ridicat`; altfel `refuz`, fără modificări și fără notificare. **R6 (anulare):** `anulează(r)` este permis numai pentru o rezervare Rezervată, care trece în Anulată, fără notificare; în celelalte cazuri: `refuz`. **R2 (stări):** Anulată este o stare finală intenționată: nu permite evenimente.

1. În chat, la semnal, din I: scenariul S2 (alt student), `ridică(c1, A, T2)`; scenariul S7 (anulare, apoi ridicare), `anulează(B)`, apoi `ridică(c2, B, T2)`; după scenariul S1 (ridicare confirmată; A Ridicată), scenariul S6 (anulare după ridicare), `anulează(A)`. Rezultat, stare, ce se înregistrează.
2. În ștafetă, pe rând: pentru fiecare refuz, ce îl decide: **starea** sau **condiția**?

[Enunțul complet: R1–R8 și scenariile S1–S7](https://github.com/traiansf/traiansf.github.io/blob/main/class/amss-2026/lab/scenarios/04-comportament/scenario.md)

::: notes
S2: refuz, decis de condiție (T2 nu este titularul); I neschimbată, c1 neînregistrat. S7: anularea acceptată, B Anulată; ridicarea refuzată, decisă de stare (Anulată este finală); fără notificare. S6: refuz, decis de stare (anularea cere Rezervată); A rămâne Ridicată, cu c1 și notificarea înregistrate. Linkul duce la enunțul complet, ca referință; regulile necesare fiecărui exercițiu sunt pe slide-uri.

**Organizare:** 6 min: 3 în chat, 3 în ștafetă. []{.pace dur=6}
:::

---

# Tabelul de tranziții

**Reguli:** o cerere `ridică` cu c nou este acceptată numai din Rezervată și numai pentru titular: rezervarea trece în Ridicată, se înregistrează momentul ridicării și c, iar notificarea devine `trimisă` sau `netrimisă`. **R5 (reîncercare):** pentru un c deja înregistrat, registrul întoarce același `ridicat`, fără să schimbe starea, și retrimite notificarea `netrimisă`. `anulează` este permis numai din Rezervată și duce în Anulată. În celelalte cazuri evenimentul este refuzat, fără modificări; datele nu se șterg.

Un coleg propune tabelul în plen (stare curentă, eveniment, condiție, stare următoare, efect), rând cu rând; un coleg numit verifică, apoi schimbați vorbitorii, cu obiecții în chat:

- în ce stare se află rezervarea când sosește o **reîncercare**? Are rândul ei?
- o cerere nouă (c neînregistrat) pentru o rezervare Ridicată: o refuză starea sau condiția?
- ce rămâne înregistrat după `anulează(B)`: titularul, echipamentul?

::: notes
Rândurile așteptate: Rezervată + `ridică` cu c nou și s titular → Ridicată; Ridicată + `ridică` cu c înregistrat → Ridicată (reîncercare, notificarea poate fi actualizată); Rezervată + `anulează` → Anulată. Reîncercarea sosește în Ridicată, nu în Rezervată: c este înregistrat numai la acceptare. Mulți o pun în Rezervată; întrebarea colegului care verifică o scoate la iveală. Cererea nouă în Ridicată merită discuția: citită față de rândul din Rezervată, o refuză starea; citită față de rândul reîncercării din Ridicată, o refuză condiția (c nu este înregistrat). Ambele lecturi sunt corecte; tabelul trebuie doar să dea `refuz`, fără modificări. Reîncercarea în Ridicată este permisă; de aceea Ridicată nu este o stare finală intenționată în sensul cursului 7. După anulare, titularul și echipamentul rămân (R8). În Ridicată, reîncercarea poate actualiza notificarea: păstrarea stării nu înseamnă păstrarea tuturor datelor.

**Organizare:** 14 min, cu discuție; ajungem la minutul 30. []{.pace dur=14}
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

# Interacțiunea pentru `ridică`

**Din I, independent:** A este Rezervată, cu titularul T1; c1 este neînregistrat. **R3 (ridicare):** acceptarea trece A în Ridicată și înregistrează momentul ridicării și c1.

**R4 (notificare):** după o ridicare acceptată, registrul cere expeditorului `trimite(mesaj)`, care răspunde `trimis` sau `esec`; registrul înregistrează notificarea `trimisă` sau `netrimisă`; **eșecul nu anulează ridicarea**, ghișeul primește `ridicat`. **R7 (graniță):** presupunem doar că expeditorul răspunde; `esec` nu înseamnă că mesajul nu a ajuns. Refuzul nu apelează expeditorul.

În chat, la semnal, scrieți pașii (cine → cui, ce se trimite sau se întoarce, ce înregistrează registrul) pentru:

- scenariul S1 (ridicare confirmată): `ridică(c1, A, T1)`, expeditorul răspunde `trimis`;
- scenariul S3 (notificare eșuată): `ridică(c1, A, T1)`, expeditorul răspunde `esec`.

Apoi în ștafetă: un coleg explică S1, un coleg numit S3, apoi: **în ce pas schimbă registrul starea: înainte sau după apelul expeditorului? Ce s-ar întâmpla cu S3 în ordinea inversă?**

::: notes
S1: ghișeu → registru; registrul verifică (A Rezervată, T1 titular, c1 nou), trece A în Ridicată, înregistrează momentul ridicării și c1, notificarea în așteptare; registru → expeditor `trimite`; expeditor → registru `trimis`; registrul înregistrează `trimisă`; registru → ghișeu `ridicat`. S3: identic, cu `esec` și `netrimisă`; răspunsul rămâne `ridicat`. Tranziția precede apelul. În ordinea inversă (starea schimbată numai la `trimis`), la `esec` studentul ar pleca cu echipamentul, iar A ar rămâne Rezervată: registrul ar putea accepta încă o ridicare pentru aceeași rezervare, iar R4 ar fi încălcată.

**Organizare:** 12 min: 5 în chat, 7 în ștafetă. []{.pace dur=12}
:::

---

# Reîncercare sau cerere nouă?

**R5 (reîncercare):** o cerere cu c deja înregistrat primește același `ridicat`, fără a doua ridicare; dacă notificarea este `netrimisă`, expeditorul este apelat din nou și rezultatul se actualizează; dacă este `trimisă`, nu. **R3 (ridicare):** o cerere cu c nou pentru o rezervare care nu mai este Rezervată: `refuz`, fără modificări, fără notificare.

În chat, la semnal, scenariile fiind **independente** unul de altul:

- scenariul S4 (reîncercare după eșec): continuarea lui S3 (notificare eșuată: A Ridicată, c1 înregistrat, notificare `netrimisă`): `ridică(c1, A, T1)`, expeditorul răspunde `trimis`;
- scenariul S5 (cerere nouă după ridicare): continuarea lui S1 (ridicare confirmată: A Ridicată, c1 înregistrat, notificare `trimisă`): `ridică(c7, A, T1)`.

În ștafetă, un coleg explică S4, un coleg numit S5: **Ce deosebește cererile pentru același student și aceeași rezervare? Ce garantează registrul ghișeului în fiecare caz?**

::: notes
S4: c1 înregistrat → reîncercare; notificarea `netrimisă` → expeditorul apelat din nou → `trimisă`; răspuns `ridicat`; A rămâne Ridicată, o singură ridicare. S5: c7 nou → cerere nouă; A nu este Rezervată → `refuz`, nimic nu se modifică, expeditorul nu este apelat. Le deosebește numai identificatorul cererii. Garanții: o rezervare este ridicată cel mult o dată; reîncercarea primește același rezultat; rezultatul notificării este înregistrat; refuzul nu produce mesaje. Nu garantăm livrarea sau citirea mesajului.

**Organizare:** 13 min: 5 în chat, 8 în ștafetă; ajungem la minutul 55. []{.pace dur=13}
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

**Scenariul S4 (reîncercare după eșec),** calculat mai devreme: A Ridicată, c1 înregistrat, notificare `netrimisă`; `ridică(c1, A, T1)` cu `trimis` → `ridicat`, notificare `trimisă`.

**Predicție în chat:** ce rând al tabelului de tranziții trebuie să acopere S4? Ce verificați întâi?

. . .

**Analistul AI — Claude Haiku 4.5, captură din 12 noiembrie 2026; fragmente:**

> | **Rezervată** | `ridica(c, r, s)` | c înregistrat | **Rezervată** | Reîncercare (handler separat) |
>
> | **Ridicată** | `ridica(c, r, s)` | — | **Ridicată** | Fără modificări; returnează `refuz` |
>
> **S4:** […] **Rezultat:** `ridicat`, expeditor apelat din nou

::: notes
Răspunsul calculează corect S2, S4 și S7 și descrie corect interacțiunea (tranziția înaintea apelului expeditorului). Tabelul de tranziții pune însă reîncercarea în Rezervată, unde c nu poate fi înregistrat, și refuză orice `ridică` în Ridicată: după tabel, S4 ar primi `refuz`; după calculul propriu al lui S4, `ridicat`. Tabelul și scenariul se contrazic; R5 dă dreptate scenariului. Și enunțul trimis avea o contradicție: R2 numea Ridicată „finală”, deși R5 permite reîncercări. Am corectat enunțul curent; captura păstrează intrarea originală și nu atribuim modelului eroarea noastră. Răspunsul adaugă și presupuneri despre expeditor care nu sunt în enunț („nu are memorie de cereri”). Cealaltă analiză păstrată are aceeași așezare greșită a rândului de reîncercare, fără contradicția cu S4. Răspunsul integral este în capturile pregătite, legate pe slide-ul următor.

**Organizare:** 8 min: predicție 2, analiză afișată 2, discuție 4. Predicția nu mai cere rezultatul lui S4, calculat în etapa a doua, ci rândul din tabel care trebuie să îl acopere: Ridicată, `ridică` cu c înregistrat, rămâne Ridicată. O rulare live are cel mult 2 min, incluse; altfel folosim captura. Linkul instrucțiunii păstrează intrarea istorică. La o rulare live, combinați instrucțiunea cu enunțul curent, conform ghidului AI, care explică și corectarea lui R2. []{.pace dur=8}
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

În chat, la semnal, apoi pe rând: observația 1 este susținută de reguli? **Ce nu a verificat evaluatorul AI: ce spune tabelul despre `ridică` în Ridicată?**

[Capturile pregătite: instrucțiunile reale și răspunsurile integrale](https://github.com/traiansf/traiansf.github.io/blob/main/class/amss-2026/lab/scenarios/04-comportament/prepared-fixture.md)

::: notes
Observația 1 este corectă, dar superficială: „handler separat” este într-adevăr vag, însă problema rândului este starea: reîncercarea nu poate sosi în Rezervată. Evaluatorul AI nu confruntă rândul „Ridicată | ridica | refuz” cu calculul lui S4, dar confirmă „idempotența”. Idempotența privește efectul repetării, nu egalitatea răspunsurilor; R5 cere aici și același răspuns. Notificarea poate fi actualizată. Cealaltă revizuire păstrată declară propunerea „corectă și completă”. Dacă o rulare live acoperă corect aceste puncte, o confirmăm și nu inventăm o omisiune.

**Organizare:** 8 min: predicție 2, revizuire afișată 2, discuție 4. []{.pace dur=8}
:::

---

# Decizia comună asupra propunerii

| Întrebare | Reper pentru decizie |
|:---------------------------|:---------------------------------------|
| Când schimbă registrul starea? | Înaintea apelului expeditorului; o păstrează la eșec. R4 (notificare). |
| Unde este rândul reîncercării? | În Ridicată; c se înregistrează la acceptare. R3 (ridicare). |
| Este Ridicată finală? | Nu: R5 (reîncercare) permite un eveniment. Enunțul inițial o numea greșit finală. |
| Ce primește o cerere nouă? | În Ridicată: `refuz`, fără modificări; reîncercarea primește `ridicat`. |
| Presupunerea despre expeditor? | Răspunde `trimis` sau `esec`. R7 (graniță). |

Un coleg explică o afirmație acceptată; alt coleg o verifică printr-un scenariu.

::: notes
Nu este obligatoriu să găsim o eroare. Cerem decizia umană, nu un vot de încredere în instrument. Precizăm proveniența fragmentului discutat: captură pregătită sau rulare live. Nu colectăm prompturi, conversații, mesaje din chat sau fișe individuale.

**Organizare:** 4 min; încheierea etapei la minutul 75. []{.pace dur=4}
:::

---

# Ce știe ghișeul după un refuz? {.transition}

**75–100 min · Explicații și verificări în plen, încheiere**

Răspunsul registrului nu a ajuns la ghișeu. Cu ce identificator trimite ghișeul cererea următoare?

::: notes
Revenim la explicațiile în ștafetă după demonstrația AI comună. Până acum am privit granița dinspre expeditor; acum o privim dinspre ghișeu, care este și el în afara registrului. Nu schimbăm regulile și nu adăugăm returnarea echipamentelor; ce lipsește devine întrebare pentru beneficiar.

**Organizare:** minutul 75 din 100; interval 75–100 (25 min): exercițiu 15, încheiere 10. []{.pace at=75}
:::

---

# Ghișeul nu a primit răspunsul

**Starea inițială I:** A (titular T1) și B (titular T2) sunt în Rezervată; niciun identificator înregistrat.

**Reguli:** o cerere `ridică` cu c nou este acceptată numai din Rezervată și numai pentru titular: rezervarea trece în Ridicată, iar c se înregistrează. Pentru un c deja înregistrat, registrul întoarce același `ridicat`. În celelalte cazuri întoarce `refuz`, fără modificări. `anulează` este permis numai din Rezervată. Ghișeul trimite un c nou pentru o cerere nouă și același c când reîncearcă.

1. În chat, la semnal: din I, `ridică(c1, A, T1)`, iar expeditorul răspunde `trimis`. Răspunsul registrului nu ajunge la ghișeu, deci operatorul nu predă încă proiectorul; ghișeul trimite `ridică(c8, A, T1)`, cu un identificator **nou**. Rezultatul și starea după fiecare cerere.
2. Un voluntar explică în plen, iar un coleg numit verifică. Apoi: ce știe operatorul după a doua cerere? Ce cereri mai sunt acceptate pentru A?
3. În ștafetă: ce responsabilitate a ghișeului ar fi evitat refuzul, fără schimbarea regulilor? **Ce ați întreba beneficiarul?**

::: notes
1: prima cerere → `ridicat`; A Ridicată, c1 înregistrat, notificare `trimisă`: studentul primește mesajul despre ridicare înainte să aibă proiectorul. A doua: c8 este cerere nouă, A nu mai este Rezervată → `refuz`; nimic nu se modifică, expeditorul nu este apelat. 2: operatorul vede numai `refuz`, același rezultat pentru alt student, pentru o rezervare anulată și pentru una deja ridicată; nu poate deosebi „ridicată prin cererea mea” de celelalte. Registrul spune Ridicată, deși proiectorul este încă la ghișeu. Pentru A mai este acceptată numai reîncercarea cu c1, care ar primi `ridicat`, fără alt apel al expeditorului; `anulează(A)` este refuzat. Dacă ghișeul nu mai are c1, niciun eveniment permis nu îl mai ajută. 3: refuzul ar fi fost evitat dacă ghișeul și-ar fi îndeplinit responsabilitatea pe care R3 o presupune: păstrează identificatorul până primește răspunsul și reîncearcă cu el. Ghișeul este o componentă din afara graniței, iar presupunerea despre el nu a fost respectată. Garanțiile registrului țin numai cât timp presupunerile despre apelanți sunt respectate. Întrebări pentru beneficiar, fără să le decidem noi: refuzul ar trebui să spună motivul (ca rezultatul `fara_dulap` din cursul 6)? Ar trebui ca ghișeul să poată afla starea unei rezervări? Ce face operatorul când a pierdut identificatorul? Nu adăugăm reguli; notăm întrebările.

**Organizare:** 15 min: trasare în chat 4, explicații și verificări în ștafetă 5, discuție 6. []{.pace dur=15}
:::

---

# Ce putem explica acum?

Un exemplu din discuția voastră pentru fiecare întrebare:

- Ce evenimente sunt permise într-o stare și ce decide un refuz: starea sau condiția?
- În ce pas schimbă registrul starea față de apelul expeditorului, și de ce?
- Ce deosebește o reîncercare de o cerere nouă cu același conținut și ce presupunem despre apelant?
- Ce au confirmat sau au corectat analiza și revizuirea comună?

**Repere:** tranziția precede apelul expeditorului; eșecul notificării este înregistrat, nu ascuns; reîncercarea sosește în Ridicată și primește același rezultat; presupunem despre expeditor numai că răspunde, iar despre ghișeu, că reîncearcă cu același identificator.

::: notes
Ascultați două sau trei exemple scurte. O explicație bună numește starea de pornire, evenimentul sau pasul, rezultatul și regula. Nu cereți predări, susțineri individuale sau un număr de defecte. Notați numai dificultățile recurente pentru pregătirea următoare.

**Organizare:** 10 min; încheiere la minutul 100. []{.pace dur=10}
:::
