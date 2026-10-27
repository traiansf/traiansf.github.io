---
title: "AMSS 2026/2027 — Cursul 6: Contracte și invarianți"
author: "Traian-Florin Șerbănuță"
lang: ro-RO
---

# Ce promite o operație când refuză?

La muzeu, un vizitator cere un dulap deja ocupat. Registrul răspunde „refuz”.

Este suficient mesajul sau trebuie să verificăm și registrul de după cerere?

Astăzi precizăm **condițiile apelului**, **rezultatele garantate** și **regulile păstrate de toate operațiile**.

::: notes
Continuăm atribuirea responsabilităților din cursul 5: acum facem explicit ce promite partea responsabilă. În cursul 2 am cerut deja ca refuzul unui împrumut să păstreze starea bibliotecii; aici dezvoltăm această promisiune. Exemplul este didactic și nu comandă încuietori.

**Organizare:** minutul 0 din 100; deschidere 0–10 (10 min): orientare și citat 3, predicție 7. 28 de slide-uri cu copertă. []{.pace at=0 of=100}
:::

---

# Citatul zilei

> „Precondiția obligă clientul; postcondiția obligă furnizorul.”
>
> Original: “The precondition binds the client, the postcondition binds the supplier.”

— **Bertrand Meyer**

[Sursa: Object-Oriented Software Construction, ediția a doua, §25.3, p. 873](https://bertrandmeyer.com/OOSC2/)

::: notes
Clientul este apelantul unei operații, nu neapărat o persoană. Furnizorul este partea care o realizează. Vom distinge obligația apelantului de situațiile pentru care operația promite un refuz.

**Sursă:** citatul păstrat din materialul anterior, verificat atunci în fragmentul indexat al cărții de pe site-ul autorului, §25.3, p. 873; vezi `docs/quotations.md`. La 27 octombrie 2026 pagina autorului este accesibilă, dar descărcarea PDF întoarce 404; nu pretindem o nouă verificare a paginii 873. Folosim adresa stabilă recomandată de autor.
:::

---

# Un refuz, două registre posibile

**Regulă:** atribuirea este refuzată dacă vizitatorul are deja un dulap sau dulapul cerut este ocupat. La refuz, **întregul registru rămâne identic**.

**Înainte:** V1–D1, V2–D2. Cerem `atribuie(V1, D2)`.

| Propunere | Rezultat | După |
|---|---|---|
| A | `refuz` | V1–D1, V2–D2 |
| B | `refuz` | V2–D2 |

Individual, apoi în pereche: care respectă regula? De ce faptul că fiecare dulap are cel mult un vizitator nu este suficient?

::: notes
Doar A respectă refuzul. B păstrează unicitatea, dar șterge asocierea V1–D1. Acest contraexemplu separă validitatea unei stări de corectitudinea schimbării dintre două stări.

**Organizare:** 7 min: 2 individual, 2 în pereche, 3 discuție. []{.pace dur=7}
:::

---

# Precizăm promisiunea {.transition}

Ce presupunem și ce garantăm?

::: notes
Contractul trebuie să permită verificarea unei implementări fără a copia pașii ei.

**Organizare:** minutul 10 din 100; interval 10–30 (20 min): enunț 5, concepte 8, clasificare 7. []{.pace at=10}
:::

---

# Regulile registrului

| Regulă | Conținut |
|--------|------------------------------------------|
| R1 | Identificatori cunoscuți, registru valid, operații pe rând. Fără autentificare, concurență sau erori tehnice. |
| R2 | Cel mult un dulap per vizitator; cel mult un vizitator per dulap. |
| R3 | `atribuie(v,d)` acceptă exact când v nu are dulap și d este liber; altfel refuză fără modificări. |
| R4 | `elibereaza(v)` elimină asocierea lui v; dacă lipsește, întoarce `fara_dulap`, fără modificări. |
| R5 | La succes, toate celelalte asocieri se păstrează. |

::: notes
Atribuirea nu înlocuiește dulapul deja atribuit unui vizitator. Repetarea aceleiași atribuiri este refuzată; repetarea eliberării produce alt rezultat întors, fără altă modificare. Nu proiectăm încă identificatorii necunoscuți sau încuietorile fizice.
:::

---

# Trei întrebări diferite

**Precondiție:** ce trebuie să fie adevărat pentru ca apelul să intre în domeniul promisiunii?

**Postcondiție:** ce garantăm la întoarcere, dacă precondiția a fost respectată?

**Invariant:** ce proprietate trebuie să respecte orice stare validă, înainte și după operații?

În registrul nostru: identificatori cunoscuți; efectul exact al atribuirii; unicitatea vizitator–dulap.

::: notes
Postcondiția poate depinde de starea inițială și de rezultatul întors, inclusiv de un refuz. Invariantul nu descrie singur ce schimbă o operație. Aceste noțiuni sunt utile și pentru funcții ori registre, fără clase obligatorii.
:::

---

# „Dulap liber”: precondiție sau condiție de succes?

**R1:** apelăm cu identificatori cunoscuți, pe rând, într-un registru valid.

**R3:** dacă dulapul este ocupat, `atribuie` întoarce `refuz` și păstrează întregul registru.

Prin urmare, „dulap liber” este **condiție de succes**, nu precondiție a acestei operații publice.

Dacă am impune această condiție drept precondiție, contractul nu ar mai promite rezultatul cerut pentru un dulap ocupat.

::: notes
O operație internă cu precondiții mai puternice poate fi o alegere de proiectare, dar nu înlocuiește contractul public. În afara precondiției, acest contract nu specifică rezultatul. Nu rezultă că intrările necunoscute sunt sigure sau că orice produs ar trebui să le ignore.
:::

---

# Invariantul privește toate operațiile

**R2:** un vizitator are cel mult un dulap; un dulap are cel mult un vizitator.

| Registru | Respectă R2? |
|---|---|
| Nicio asociere | Da. |
| V1–D1, V2–D2 | Da. |
| V1–D1, V1–D3 | Nu: V1 are două dulapuri. |
| V1–D1, V2–D1 | Nu: D1 are doi vizitatori. |

Proprietatea trebuie păstrată după atribuire, eliberare și refuz.

::: notes
„Cel mult unul” permite zero. Vorbim despre stările observabile la granița operației. O implementare poate avea pași interni intermediari, dar nu îi expune ca stare finală validă. Nu introducem execuție concurentă.
:::

---

# Clasificați afirmațiile

**Reguli:** identificatori cunoscuți, apeluri pe rând; cel mult o asociere pentru fiecare vizitator și fiecare dulap; atribuim dacă vizitatorul nu are dulap și dulapul este liber; altfel refuz fără modificări.

A. Identificatorul dulapului este cunoscut.

B. Dulapul cerut este liber.

C. La `refuz`, registrul de după este identic cu cel de dinainte.

D. Niciun vizitator nu apare în două asocieri.

Individual, apoi în pereche: ce rol are fiecare afirmație în acest contract? La C și D, verificăm o singură stare sau relația dintre două stări?

::: notes
A precondiție, B o parte a condiției de succes, C postcondiție pe ramura de refuz, D invariant. C compară două stări; D poate fi verificată într-o singură stare. O stare finală cu o asociere pierdută poate satisface D, dar nu C. Rolurile nu sunt categorii exclusive: invariantul se cere atât înainte, cât și după operație și poate apărea explicit între precondiții și postcondiții.

**Organizare:** 7 min, cu discuție; ajungem la minutul 30. []{.pace dur=7}
:::

---

# Scriem contractul complet {.transition}

Ce se schimbă și ce trebuie să rămână identic?

::: notes
Folosim întâi cuvinte și exemple, apoi o notație scurtă care face vizibilă păstrarea celorlalte asocieri.

**Organizare:** minutul 30 din 100; interval 30–55 (25 min): atribuire 7, scenarii 8, eliberare și repetare 10. []{.pace at=30}
:::

---

# Atribuire: ramura de succes

**Context R1:** identificatori cunoscuți, registru valid, apeluri pe rând.

**R3:** v nu are dulap și d este liber → `atribuit`.

**După:** adăugăm exact asocierea v–d. **R5:** toate celelalte asocieri se păstrează.

S1: înainte V1–D1, V2–D2; V3 nu are dulap, D3 este liber. `atribuie(V3,D3)` produce V1–D1, V2–D2, **V3–D3**.

::: notes
Formularea „V3 are D3” singură ar admite pierderea V2–D2. Postcondiția completă stabilește și ce nu se modifică. Nu cerem o schemă de baze de date.
:::

---

# Atribuire: ramura de refuz

**R3:** v are deja un dulap **sau** d este ocupat → `refuz`; întregul registru rămâne identic.

**B:** V1–D1, V2–D2; V3 fără dulap, D3 liber.

| Scenariu independent din B | Motiv de refuz |
|---|---|
| S2: `atribuie(V3,D2)` | Dulap ocupat. |
| S3: `atribuie(V1,D3)` | Vizitator deja asociat. |
| S4: `atribuie(V1,D2)` | Ambele condiții împiedică succesul. |

În toate trei, după = B. Nu ștergem o asociere existentă pentru a face cererea posibilă.

::: notes
Fiecare scenariu repornește din B. Nu le tratăm ca pași succesivi. Același rezultat generic refuz este suficient pentru enunț; nu inventăm prioritatea mesajelor pentru S4.
:::

---

# O notație scurtă pentru efectul exact

**A** = mulțimea asocierilor înainte; **A′** = mulțimea după.

**R3–R5, pe scurt:**

- dacă v nu are dulap în A și d este liber în A: `atribuit`, **A′ = A ∪ {(v,d)}**;
- altfel: `refuz`, **A′ = A**.

Reuniunea adaugă perechea; egalitatea păstrează întregul registru.

Care parte a formulei exclude dispariția unei asocieri care nu privește cererea?

::: notes
Faptul că A întreg apare în reuniune și că nu se elimină nimic. A conține perechi: verificăm absența lui v pe poziția de vizitator și a lui d pe poziția de dulap. Notația este facultativă; o propoziție cu același sens este suficientă.
:::

---

# Completați rezultatul, fără să scrieți cod

**B:** V1–D1, V2–D2; V3 fără dulap, D3 liber. Fiecare rând repornește din B.

**Reguli:** atribuire numai dacă v nu are dulap și d este liber; altfel refuz fără modificări. La succes se adaugă numai perechea cerută.

| Acțiune | Rezultat și întregul registru după |
|---|---|
| `atribuie(V3,D3)` | ? |
| `atribuie(V1,D3)` | ? |
| `atribuie(V1,D1)` | ? |

Individual, apoi în pereche: de ce ultimul rând nu este automat un succes?

::: notes
Primul: atribuit, toate cele trei asocieri. Celelalte: refuz, exact B. Repetarea aceleiași atribuiri nu satisface condiția de succes: vizitatorul are deja un dulap, iar dulapul este ocupat. O politică alternativă ar putea întoarce „deja atribuit”, dar ar fi alt contract, nu o corecție necesară.

**Organizare:** 8 min: 3 individual, 2 în pereche, 3 discuție. []{.pace dur=8}
:::

---

# Eliberarea și repetarea

**R4:** dacă v are dulap, eliminăm numai asocierea lui și întoarcem `eliberat`; altfel `fara_dulap`, fără modificări. **R5:** celelalte asocieri se păstrează.

**S5, doi pași succesivi:**

| Înainte | Acțiune | Rezultat și după |
|---|---|---|
| V1–D1, V2–D2 | `elibereaza(V1)` | `eliberat`; V2–D2. |
| V2–D2 | `elibereaza(V1)` | `fara_dulap`; V2–D2. |

Același registru final după repetare nu înseamnă același rezultat întors.

::: notes
Nu avem nevoie de terminologia operațiilor repetabile pentru a observa diferența. S5 este explicit secvențial; celelalte scenarii independente continuă să repornească din B.

**Organizare:** 4 min. []{.pace dur=4}
:::

---

# Ce lipsește din această promisiune?

**Propunere:** „După `elibereaza(V1)`, V1 nu mai are dulap.”

**Înainte:** V1–D1, V2–D2. **După propus:** registru gol.

**Regulile complete:** eliminăm numai asocierea lui V1; toate celelalte asocieri se păstrează. Fără asociere inițială: `fara_dulap`, registru identic.

În pereche: propunerea scurtă este satisfăcută? Contractul complet este respectat? Reformulați postcondiția în cuvinte.

::: notes
Propunerea scurtă este satisfăcută de registrul gol, dar contractul complet este încălcat prin pierderea V2–D2. „Eliminăm exact perechea lui V1; în rest registrul este identic; întoarcem eliberat.” Dacă nu există perechea, nu eliminăm nimic și întoarcem fara_dulap.

**Organizare:** 6 min pentru lucru și discuție; împreună cu cele 4 min de pe slide-ul anterior încheie etapa la minutul 55. []{.pace dur=6}
:::

---

# Încercăm să infirmăm propunerea {.transition}

Un invariant respectat poate ascunde o operație greșită?

::: notes
Construim un contraexemplu care respectă unicitatea, dar încalcă refuzul. Nu rulăm cod în timpul cursului.

**Organizare:** minutul 55 din 100; interval 55–80 (25 min): trasare 8, corecție 5, conservare 7, limite 5. []{.pace at=55}
:::

---

# Urmăriți operația propusă

**Pseudocod didactic, construit pentru verificare:**

```text
atribuie(v, d):
    elimină asocierea existentă a lui v, dacă există
    dacă d este ocupat: întoarce refuz
    adaugă v–d
    întoarce atribuit
```

**Date:** V1–D1, V2–D2; cerem `atribuie(V1,D2)`.

**Reguli:** maximum o asociere per vizitator/dulap; atribuirea unui vizitator deja asociat se refuză, cu întregul registru identic.

Pe hârtie: scrieți registrul după primul pas și la întoarcere. Ce regulă este încălcată?

::: notes
După eliminare și la refuz rămâne numai V2–D2. Unicitatea este respectată, dar R3 este încălcată. Este o trasare manuală a pseudocodului, nu jurnalul unei execuții reale.

**Organizare:** 8 min, cu predicție, comparație și explicație. []{.pace dur=8}
:::

---

# Decidem înainte să modificăm

**R3:** atribuirea reușește numai dacă v nu are dulap și d este liber; altfel refuz fără modificări.

Corecția noastră, în contextul **apelurilor pe rând**:

```text
atribuie(v, d):
    dacă v are dulap sau d este ocupat: întoarce refuz
    adaugă v–d
    întoarce atribuit
```

Toate celelalte asocieri se păstrează. De ce primul pas nu are nevoie să „elibereze” ceva?

::: notes
Operația nu promite mutare. Verificarea fără efecte poate decide refuzul fără reparații. În acest model nu apare schimbare concurentă între verificare și adăugare și nu discutăm întreruperi tehnice; corecția nu demonstrează garanții pentru acele situații.

**Organizare:** 5 min. []{.pace dur=5}
:::

---

# De ce se păstrează unicitatea?

**Invariant:** cel mult o asociere per vizitator și per dulap.

**Atribuire acceptată:** asociem un vizitator fără dulap cu un dulap liber.

**Eliberare:** eliminăm cel mult o pereche.

**Refuz sau `fara_dulap`:** păstrăm registrul identic.

Pornind dintr-un registru valid, explicați pentru fiecare ramură de ce nu poate introduce o a doua asociere pentru același vizitator sau dulap.

::: notes
La adăugare, nici vizitatorul, nici dulapul nu aveau altă asociere. Eliminarea nu introduce duplicate. Identitatea stării păstrează o proprietate deja adevărată. Este un argument pentru toate ramurile modelului, mai puternic decât enumerarea câtorva exemple; nu verifică automat codul unei implementări.

**Organizare:** 7 min: explicații în pereche, apoi trei răspunsuri, câte unul per ramură. []{.pace dur=7}
:::

---

# Ce poate și ce nu poate stabili o verificare?

**Contractul nostru:** identificatori cunoscuți, registru valid, apeluri pe rând; refuzul păstrează tot registrul.

| Verificare | Ce aflăm |
|---|---|
| Mesajul este `refuz` | Doar rezultatul întors. |
| Unicitatea este păstrată | Starea finală respectă acel invariant. |
| Registrul după = registrul înainte | Refuzul păstrează starea în scenariul verificat. |

Niciunul dintre aceste exemple nu verifică încuietori fizice, concurență sau identificatori necunoscuți.

::: notes
Obținerea rezultatului așteptat într-un scenariu nu garantează corectitudinea pentru toate apelurile admise. Exemplele sunt derivate din contract, nu din pașii implementării. În cursul 9 vom discuta explicit limitele explorării unui model executabil.

**Organizare:** 5 min; ajungem la minutul 80. []{.pace dur=5}
:::

---

# Verificăm un contract delegat {.transition}

O formulare convingătoare spune tot ce avem nevoie?

::: notes
Analizăm capturi reale, obținute înaintea cursului: Claude Haiku 4.5, prin Claude Code 2.1.311, la 27 octombrie 2026, fără unelte și fără contextul proiectului. Evaluatorul AI a primit într-un context nou enunțul, sarcina și răspunsul integral. Am rulat câte două încercări și am ales câte una pentru discuție; selecția nu descrie performanța tipică a modelului. Toate încercările sunt în arhiva capturilor.

**Organizare:** minutul 80 din 100; interval 80–95 (15 min): sarcină 3, analiză 5, revizuire 5, decizie 2. []{.pace at=80}
:::

---

# Ce cerem asistentului AI?

> Propune contractele pentru atribuie și elibereaza: precondiții, condiții de succes, postcondiții pentru fiecare rezultat, invarianți și ce rămâne neschimbat. Verifică S1–S6. Nu scrie cod. Răspunde în română, în maximum 400 de cuvinte.

**Context:** identificatori cunoscuți; apeluri pe rând; cel mult un dulap pentru fiecare vizitator și invers. Atribuim dacă vizitatorul nu are dulap și dulapul este liber; altfel refuz fără modificări. Eliberăm numai asocierea vizată; dacă lipsește, `fara_dulap`. Restul se păstrează.

**Date:** B = V1–D1, V2–D2; V3 fără dulap, D3 liber. S1–S6: succesul, fiecare motiv de refuz, eliberarea repetată și repetarea atribuirii.

::: notes
Instrucțiunea este cea trimisă efectiv, urmată de enunțul integral. Un evaluator (agent AI de revizuire) a primit apoi și sarcina exactă, pentru a judeca propunerea față de ce s-a cerut.

**Organizare:** 3 min. []{.pace dur=3}
:::

---

# Ce promite această propunere?

**Analistul AI — Claude Haiku 4.5, captură din 27 octombrie 2026; fragmente din contractul `atribuie`:**

> **Condiția de succes:** v nu are dulap asociat. d este liber (nu e ocupat).
>
> **Postcondițiile pentru eșec (`refuz`):** Registrul este identic cu cel inițial (nicio modificare). […]
>
> **Invarianți:** Unicitatea: un vizitator ↔ cel mult un dulap; un dulap ↔ cel mult un vizitator. […] Toate asocierile (v', d') cu v' ≠ v și d' ≠ d se păstrează.

**Reguli:** precondiții — identificatori cunoscuți, registru valid, apeluri pe rând. Succes numai dacă v nu are dulap și d este liber; altfel refuz, registru identic. La succes se păstrează celelalte asocieri.

Ce rol are fiecare afirmație? Care se verifică într-o singură stare?

::: notes
Condiția de succes este separată corect de precondiții, iar refuzul păstrează registrul, cum cere R3. Unicitatea este un invariant: se verifică într-o singură stare. „Toate asocierile … se păstrează” compară starea de după cu cea de dinainte: este o postcondiție de efect limitat (R5), nu un invariant. Regula este corectă și apare și la „Ceea ce rămâne neschimbat”, dar este trecută și printre invarianți; la fel „seturile de vizitatori și dulapuri rămân neschimbate”, omis aici. În încheierea răspunsului, a doua eliberare din S5 este numărată printre refuzuri, deși întoarce `fara_dulap`.

**Organizare:** 5 min: răspuns individual, apoi discuție. []{.pace dur=5}
:::

---

# Revizuire și decizie

**Evaluatorul (agent AI de revizuire), context nou: enunț, sarcină, răspuns integral — Claude Haiku 4.5, 27 octombrie 2026; fragmente:**

> Propunerea este **complet corectă** […]
>
> Propunerea: "[…] Toate asocierile (v', d') cu v' ≠ v și d' ≠ d se păstrează." […] ✓ Corect și precis.
>
> **Concluzie:** Propunerea nu conține erori.

**Reguli:** un invariant privește fiecare stare validă; păstrarea celorlalte asocieri compară două stări (R5). Eliberarea fără asociere întoarce `fara_dulap`.

Observația este corectă, dar suficientă? **Decizia noastră:** păstrăm condiția de succes, refuzul și unicitatea; scoatem păstrarea celorlalte asocieri dintre invarianți: este postcondiție (R5); a doua eliberare din S5 întoarce `fara_dulap`, nu `refuz`.

::: notes
O confirmare corectă local nu certifică întregul contract. Evaluatorul AI confirmă conținutul regulii, dar nu întreabă dacă este un invariant. Cealaltă revizuire păstrată confirmă la fel contractul și semnalează numai o formulare neclară a motivelor de refuz. Cerem un contraexemplu pentru fiecare corecție: un registru care conține numai V3–D3 după `atribuie(V3,D3)` din B satisface unicitatea, dar pierde V1–D1 și V2–D2.

**Organizare:** 7 min: revizuire 5, decizie 2; minutul 95. []{.pace dur=7}
:::

---

# Transferăm promisiunea {.transition}

Aceleași întrebări, alte reguli.

::: notes
Transferăm metoda de formulare, nu politica de refuz a muzeului.

**Organizare:** minutul 95 din 100; interval 95–100 (5 min): exercițiu și încheiere. []{.pace at=95}
:::

---

# O trusă pentru fiecare tehnician

**Enunț nou:** identificatori cunoscuți, apeluri pe rând; cel mult o trusă pentru fiecare tehnician și invers. Împrumutăm o trusă liberă unui tehnician fără trusă. Repetarea aceluiași împrumut întoarce `deja_imprumutat`; alte conflicte → `refuz`. Numai un împrumut nou schimbă registrul, adăugând perechea cerută.

**Înainte:** T1–K1, T2 fără trusă, K2 liberă.

1. Formulați condiția de succes și starea de după `imprumuta(T2,K2)`.
2. Independent, din aceeași stare: `imprumuta(T1,K2)`. Ce rămâne identic?
3. Tot din starea inițială: `imprumuta(T1,K1)`. Ce diferă față de muzeu?

::: notes
Succes: T1–K1 și T2–K2. Refuz: exact starea inițială, deoarece T1 are K1. Repetarea întoarce deja_imprumutat, cu starea păstrată, spre deosebire de refuzul muzeului. Transferăm metoda de citire a contractului, fără să importăm politica. Invariantul de unicitate este același și nu stabilește singur aceste rezultate. La laborator distingem cantitatea rezervată, disponibilă și fizică. Feedbackul pentru proiect poate fi cerut oricând.

**Organizare:** 5 min, încheiere la minutul 100. []{.pace dur=5}
:::
