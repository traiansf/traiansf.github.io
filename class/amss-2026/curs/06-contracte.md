---
title: "AMSS 2026/2027 — Cursul 6: Contracte și invarianți"
author: "Traian-Florin Șerbănuță"
lang: ro-RO
operation-names: [atribuie, eliberează, împrumută]
---

# Ce promite o operație? {.transition}

Când o operație refuză o cerere, ce trebuie să rămână adevărat?

::: notes
Continuăm atribuirea responsabilităților din cursul 5: acum facem explicit ce promite componenta responsabilă, inclusiv când nu poate reuși. În cursul 2 am cerut deja ca un împrumut respins să păstreze starea bibliotecii; aici dezvoltăm această promisiune.

**Organizare:** minutul 0 din 100; interval 0–15 (15 min), inclusiv coperta, citatul, întrebarea deschisă, problema, exercițiul cu două registre și slide-ul despre contract. 35 de slide-uri cu copertă. []{.pace at=0 of=100}
:::

---

# Citatul zilei

> „Precondiția obligă clientul; postcondiția obligă furnizorul.”
>
> Original: “The precondition binds the client, the postcondition binds the supplier.”

— **Bertrand Meyer**

[Sursa: Object-Oriented Software Construction, ediția a doua, „Using assertions”, p. 873](https://bertrandmeyer.com/OOSC2/)

::: notes
Clientul lui Meyer este ceea ce numim în curs apelantul unei operații, nu neapărat o persoană. Furnizorul este componenta care o realizează. Vom distinge ce cere precondiția de la apelant de cazurile pentru care operația promite un refuz.

**Sursă:** citatul păstrat din materialul anterior, verificat atunci în fragmentul indexat al cărții de pe site-ul autorului, subsecțiunea „Using assertions”, p. 873; vezi `docs/quotations.md`. Revizuirea din 28 octombrie 2026 situează pasajul înaintea începutului secțiunii 25.3, de aceea nu mai dăm numărul secțiunii. La 27 și 28 octombrie 2026 pagina autorului este accesibilă, dar descărcarea PDF întoarce 404; nu pretindem o nouă verificare a paginii 873. Folosim adresa stabilă recomandată de autor.
:::

---

# Când o cerere este refuzată

Gândiți-vă la o aplicație pe care ați folosit-o sau ați scris-o: o plată, o rezervare, un formular trimis.

**Cererea a fost refuzată. Ce v-ați așteptat să rămână neschimbat? De unde ați ști că a rămas așa?**

Ați întâlnit un refuz după care se schimbase totuși ceva?

::: notes
Nu căutăm un singur răspuns corect. Pot apărea o plată refuzată, cu suma totuși blocată, o rezervare pierdută după o modificare refuzată sau un formular respins care șterge câmpurile completate. Observăm că mesajul de refuz nu spune singur ce s-a întâmplat cu datele și că așteptările noastre rămân adesea nescrise; azi le facem explicite. Erorile tehnice menționate de studenți sunt relevante, dar exemplul de azi le lasă deoparte.

**Organizare:** 5 min: întrebare către clasă; notăm câteva exemple, fără să le rezolvăm. []{.pace dur=5}
:::

---

# Un refuz la dulapurile muzeului

La intrarea într-un muzeu, vizitatorii primesc dulapuri pentru bagaje. Un **registru**, componenta responsabilă, ține asocierile vizitator–dulap și răspunde la două cereri: atribuirea unui dulap și eliberarea lui.

**Regula convenită cu muzeul (beneficiarul):** un vizitator are cel mult un dulap, iar un dulap are cel mult un vizitator; o cerere imposibilă este refuzată.

Un vizitator cere un dulap deja ocupat. Registrul răspunde `refuz`. **Este suficient rezultatul întors sau trebuie să verificăm și registrul de după cerere?**

*Exemplu didactic; registrul doar ține evidența, nu deschide dulapuri. Lucrăm pe hârtie; toate datele necesare sunt pe slide-uri.*

::: notes
Rezultatul întors singur nu ajunge: refuzul este o promisiune despre starea de după, nu doar o valoare întoarsă. Trebuie să ne uităm la registru ca să știm dacă cererea refuzată a lăsat ceva în urmă. De aici înainte, „registrul” înseamnă conținutul lui: mulțimea asocierilor. Exercițiul următor arată două registre care însoțesc același rezultat.

**Organizare:** 2 min: întrebare către clasă, așteptăm răspunsul. []{.pace dur=2}
:::

---

# Un refuz, două registre posibile

**Regulă:** atribuirea este refuzată dacă vizitatorul are deja un dulap sau dulapul cerut este ocupat. La refuz, **întregul registru rămâne identic**.

**Înainte:** V1–D1, V2–D2. Cerem `atribuie(V1, D2)`.

| Propunere | Rezultat | După |
|---|---|---|
| P1 | `refuz` | V1–D1, V2–D2 |
| P2 | `refuz` | V2–D2 |

Individual, apoi discutăm: care respectă regula? De ce faptul că fiecare dulap are cel mult un vizitator nu este suficient?

::: notes
Doar P1 respectă refuzul. P2 păstrează unicitatea, dar șterge asocierea V1–D1. Acest contraexemplu separă validitatea unei stări de corectitudinea modificării de la o stare la alta.

**Organizare:** 5 min: 2 individual, 3 discuție. []{.pace dur=5}
:::

---

# Ce descrie un contract

Un **contract** completează interfața unei operații din cursul 5: pe lângă semnătură și sensul rezultatelor, spune ce promite componenta fiecărui apelant, fără să descrie pașii prin care o realizează:

- **condițiile apelului:** ce presupunem despre cerere și despre registru;
- **rezultatele garantate:** ce întoarce și cum arată registrul după, la succes și la refuz;
- **regulile păstrate de toate operațiile:** ce respectă orice registru, înainte și după fiecare operație.

Pentru registrul muzeului le precizăm pe rând și le verificăm pe scenarii. Nu modelăm autentificarea, concurența sau erorile tehnice.

::: notes
Exercițiul anterior a arătat deja că a treia categorie nu este suficientă singură: ambele registre respectau unicitatea, dar numai unul respecta refuzul. Numele consacrate ale celor trei întrebări, precondiție, postcondiție și invariant, urmează după regulile complete ale registrului.
:::

---

# Precizăm promisiunea {.transition}

Ce presupunem și ce garantăm?

::: notes
Contractul trebuie să permită verificarea unei implementări fără a copia pașii ei.

**Organizare:** minutul 15 din 100; interval 15–30 (15 min): reguli 3, concepte 5, clasificare 7. []{.pace at=15}
:::

---

# Regulile registrului

| Regulă | Conținut |
|--------|------------------------------------------|
| R1 (context) | Identificatorii vizitatorilor și ai dulapurilor sunt cunoscuți, registrul inițial respectă R2 (unicitate), iar apelurile sunt secvențiale: fiecare începe după încheierea celui anterior. Nu discutăm autentificarea, concurența sau erorile tehnice. |
| R2 (unicitate) | Un vizitator are cel mult un dulap, iar un dulap are cel mult un vizitator. |
| R3 (atribuire) | `atribuie(v,d)` reușește exact când v nu are dulap și d este liber; altfel refuză fără modificări. |
| R4 (eliberare) | `eliberează(v)` elimină asocierea lui v; dacă lipsește, întoarce `fără_dulap`, fără modificări. |
| R5 (efect limitat) | La succes, toate celelalte asocieri se păstrează. |

::: notes
Atribuirea nu înlocuiește dulapul deja atribuit unui vizitator. Repetarea aceleiași atribuiri este refuzată; repetarea eliberării produce alt rezultat întors, fără altă modificare. Nu proiectăm încă identificatorii necunoscuți sau încuietorile fizice.
:::

---

# Trei întrebări diferite

**Precondiție:** ce trebuie să fie adevărat la apel pentru ca operația să garanteze ceva?

**Postcondiție:** ce garantăm la întoarcere, dacă precondiția a fost respectată?

**Invariant:** ce proprietate trebuie să fie adevărată în orice stare, înainte și după operații?

Postcondiția poate depinde de o **condiție de succes**: dintre apelurile admise de precondiție, ea decide care reușesc și care primesc refuzul promis.

În registrul nostru, precondiția cere identificatori cunoscuți, postcondiția dă efectul exact al atribuirii, iar invariantul este unicitatea vizitator–dulap.

::: notes
Postcondiția poate depinde de starea inițială și de rezultatul întors, inclusiv de un refuz. Condiția de succes nu este o a patra categorie separată: ea împarte postcondiția în cazuri. Invariantul nu descrie singur ce modifică o operație. Aceste noțiuni sunt utile și pentru funcții ori registre, fără clase obligatorii.
:::

---

# „Dulap liber”: ține de precondiție sau de condiția de succes?

**R1 (context):** apelăm secvențial, cu identificatori cunoscuți, într-un registru care respectă R2 (unicitate).

**R3 (atribuire):** dacă dulapul este ocupat, `atribuie` întoarce `refuz` și păstrează întregul registru.

Prin urmare, într-un singur contract, „dulap liber” este **o parte a condiției de succes**, alături de „vizitator fără dulap”, nu o precondiție a acestei operații publice. Dacă o impunem ca precondiție, nu mai promitem nimic pentru un dulap ocupat.

**Alternativă: câte un contract pentru fiecare caz.** „Dulap liber” devine parte din precondiția contractului de succes, iar „dulap ocupat” intră în cea a contractului de refuz. Atunci trebuie să verificăm că împreună acoperă toate apelurile admise.

::: notes
O operație internă cu precondiții mai puternice poate fi o alegere de proiectare, dar nu înlocuiește contractul public. În afara precondiției, acest contract nu specifică rezultatul. Nu rezultă că intrările necunoscute sunt sigure sau că orice produs ar trebui să le ignore.

Cele două forme spun același lucru dacă nu lasă goluri: într-un singur contract, „altfel: refuz” acoperă automat restul apelurilor; la contracte separate, acoperirea trebuie verificată, iar dacă rezultatul trebuie să fie unic, verificăm și că precondițiile nu se suprapun. Forma pe cazuri este utilă când rezultatele sunt mai multe: `fără_dulap` nu este nici succes, nici refuz, deci împărțirea în succes și eșec ar fi artificială. În curs folosim un singur contract cu condiție de succes.
:::

---

# Invariantul privește toate operațiile

**R2 (unicitate):** un vizitator are cel mult un dulap, iar un dulap are cel mult un vizitator.

O stare este **validă** dacă respectă toți invarianții. Aici avem unul singur, R2.

| Registru | Valid? |
|---|---|
| Nicio asociere | ? |
| V1–D1, V2–D2 | Da. |
| V1–D1, V1–D3 | Nu: V1 are două dulapuri. |
| V1–D1, V2–D1 | Nu: D1 are doi vizitatori. |

Proprietatea trebuie păstrată după atribuire, eliberare și refuz. Un registru gol este valid?

::: notes
Da: „cel mult unul” permite zero. Validitatea este relativă la invarianții aleși: dacă adăugăm un invariant, unele stări valide nu mai sunt valide. O stare validă nu înseamnă o modificare corectă: P2 din primul exercițiu lasă un registru valid, dar încalcă refuzul. „Valid” de aici privește starea, nu o cerere permisă, ca „trimiterea validă” din cursul 3. Vorbim despre stările observabile la granița operației. O implementare poate avea pași interni intermediari, dar nu îi expune ca stare finală validă. Nu introducem execuție concurentă.

**Organizare:** 1 min, din cele 5 ale conceptelor: întrebare către clasă. []{.pace dur=1}
:::

---

# Clasificați afirmațiile

**Reguli:** identificatorii sunt cunoscuți, iar apelurile sunt secvențiale; un vizitator are cel mult un dulap, iar un dulap cel mult un vizitator; atribuim dacă vizitatorul nu are dulap și dulapul este liber, altfel refuzăm fără modificări.

1. Identificatorul dulapului este cunoscut.

2. Dulapul cerut este liber.

3. La `refuz`, registrul de după este identic cu cel de dinainte.

4. Niciun vizitator nu apare în două asocieri.

Individual, apoi discutăm: ce rol are fiecare afirmație în acest contract? La 3 și 4, verificăm o singură stare sau relația dintre două stări?

::: notes
1 precondiție, 2 o parte a condiției de succes, 3 postcondiție în cazul de refuz, 4 invariant. Afirmația 3 compară două stări; 4 poate fi verificată într-o singură stare. O stare finală cu o asociere pierdută poate satisface 4, dar nu 3. Rolurile nu sunt categorii exclusive: invariantul se cere atât înainte, cât și după operație și poate apărea explicit între precondiții și postcondiții.

**Organizare:** 7 min: 2 individual, 5 discuție; ajungem la minutul 30. []{.pace dur=7}
:::

---

# Scriem contractul complet {.transition}

Ce se modifică și ce trebuie să rămână identic?

::: notes
Folosim întâi cuvinte și exemple, apoi o notație scurtă care face vizibilă păstrarea celorlalte asocieri.

**Organizare:** minutul 30 din 100; interval 30–55 (25 min): atribuire 7, scenarii 8, eliberare și repetare 10. []{.pace at=30}
:::

---

# Atribuire: cazul de succes

**R1 (context):** identificatorii sunt cunoscuți, registrul este valid, iar apelurile sunt secvențiale.

**R3 (atribuire):** dacă v nu are dulap și d este liber, operația întoarce `atribuit`.

**După:** adăugăm exact asocierea v–d. **R5 (efect limitat):** toate celelalte asocieri se păstrează.

**Scenariul S1 (V3 primește D3):** înainte V1–D1, V2–D2; V3 nu are dulap, D3 este liber. `atribuie(V3,D3)` produce V1–D1, V2–D2, **V3–D3**.

::: notes
Formularea „V3 are D3” singură ar admite pierderea V2–D2. Postcondiția completă stabilește și ce nu se modifică. Nu cerem o schemă de baze de date.
:::

---

# Atribuire: cazul de refuz

**R3 (atribuire):** dacă v are deja un dulap **sau** d este ocupat, operația întoarce `refuz`, iar întregul registru rămâne identic.

**B:** V1–D1, V2–D2; V3 fără dulap, D3 liber.

| Scenariu independent din B | Motiv de refuz |
|---|---|
| S2: `atribuie(V3,D2)` | Dulap ocupat. |
| S3: `atribuie(V1,D3)` | Vizitator deja asociat. |
| S4: `atribuie(V1,D2)` | Ambele condiții împiedică succesul. |

În toate trei, registrul de după este exact B. Nu ștergem o asociere existentă pentru a face cererea posibilă.

::: notes
Fiecare scenariu repornește din B. Nu le tratăm ca pași succesivi. Același rezultat `refuz` este suficient pentru enunț; nu inventăm un motiv distinct de refuz pentru S4.
:::

---

# O notație scurtă pentru efectul exact

**A** = mulțimea asocierilor înainte; **A′** = mulțimea după.

**R3 și R5 (atribuire, efect limitat), pe scurt:**

- dacă v nu are dulap în A și d este liber în A: `atribuit`, **A′ = A ∪ {(v,d)}**;
- altfel: `refuz`, **A′ = A**.

**Formal,** cu $A[v]$ = dulapurile lui v în A și $A^{-1}[d]$ = vizitatorii lui d în A:

- dacă $A[v] = \emptyset \wedge A^{-1}[d] = \emptyset$ atunci *rezultat* = `atribuit` $\wedge\ A' = A \cup \{(v,d)\}$;
- dacă $A[v] \neq \emptyset \vee A^{-1}[d] \neq \emptyset$ atunci *rezultat* = `refuz` $\wedge\ A' = A$.

Reuniunea adaugă perechea; egalitatea păstrează întregul registru. Care parte a formulei exclude dispariția unei asocieri care nu privește cererea?

::: notes
Faptul că A întreg apare în reuniune și că nu se elimină nimic. A conține perechi: $A[v] = \{x \mid (v,x) \in A\}$ și $A^{-1}[d] = \{y \mid (y,d) \in A\}$; cele două condiții verifică absența lui v pe poziția de vizitator și a lui d pe poziția de dulap. Într-un registru valid, R2 (unicitate) face ca fiecare dintre aceste mulțimi să aibă cel mult un element. A doua condiție formală este negația primeia, deci cele două cazuri acoperă toate apelurile admise și nu se suprapun. Notația este facultativă; o propoziție cu același sens este suficientă.
:::

---

# Completați rezultatul, fără să scrieți cod

**B:** V1–D1, V2–D2; V3 fără dulap, D3 liber. Fiecare rând repornește din B.

**Reguli:** atribuim numai dacă v nu are dulap și d este liber; altfel refuzăm fără modificări. La succes adăugăm numai perechea cerută.

| Acțiune | Rezultat și întregul registru după |
|---|---|
| `atribuie(V3,D3)` | ? |
| `atribuie(V1,D3)` | ? |
| `atribuie(V1,D1)` | ? |

Individual, apoi discutăm: de ce ultimul rând nu este automat un succes?

::: notes
Primul: atribuit, toate cele trei asocieri. Celelalte: refuz, exact B. Repetarea aceleiași atribuiri nu satisface condiția de succes: vizitatorul are deja un dulap, iar dulapul este ocupat. O regulă diferită ar putea întoarce `deja_atribuit`, dar ar fi alt contract, nu o corecție necesară.

**Organizare:** 8 min: 3 individual, 5 discuție. []{.pace dur=8}
:::

---

# Eliberarea și repetarea

**R4 (eliberare):** dacă v are dulap, eliminăm numai asocierea lui și întoarcem `eliberat`; altfel întoarcem `fără_dulap`, fără modificări. **R5 (efect limitat):** celelalte asocieri se păstrează.

**Scenariul S5 (eliberare repetată), doi pași succesivi:**

| Înainte | Acțiune | Rezultat și după |
|---|---|---|
| V1–D1, V2–D2 | `eliberează(V1)` | `eliberat`; V2–D2. |
| V2–D2 | `eliberează(V1)` | `fără_dulap`; V2–D2. |

Același registru final după repetare nu înseamnă același rezultat întors.

::: notes
Nu avem nevoie de terminologia operațiilor repetabile pentru a observa diferența. S5 are pași succesivi; celelalte scenarii independente continuă să repornească din B.

**Organizare:** 4 min. []{.pace dur=4}
:::

---

# Ce lipsește din această promisiune?

**Propunere:** „După `eliberează(V1)`, V1 nu mai are dulap.”

**Înainte:** V1–D1, V2–D2. **După propus:** registru gol.

**Regulile complete:** eliminăm numai asocierea lui V1; toate celelalte asocieri se păstrează. Fără asociere inițială: `fără_dulap`, registru identic.

Propunerea scurtă este satisfăcută? Contractul complet este respectat? Reformulați postcondiția în cuvinte.

::: notes
Propunerea scurtă este satisfăcută de registrul gol, dar contractul complet este încălcat prin pierderea V2–D2. „Eliminăm exact perechea lui V1; în rest registrul este identic; întoarcem `eliberat`.” Dacă nu există perechea, nu eliminăm nimic și întoarcem `fără_dulap`.

**Organizare:** 6 min pentru lucru și discuție; împreună cu cele 4 min de pe slide-ul anterior încheie etapa la minutul 55. []{.pace dur=6}
:::

---

# Încercăm să infirmăm propunerea {.transition}

Un invariant respectat poate ascunde o operație greșită?

::: notes
Construim un contraexemplu care respectă unicitatea, dar încalcă refuzul. Nu rulăm cod în timpul cursului.

**Organizare:** minutul 55 din 100; interval 55–80 (25 min): trasare 8, corecție 3, conservare 6, limite 3, contracte în cod și `assert` 5. []{.pace at=55}
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

**B:** V1–D1, V2–D2; V3 fără dulap, D3 liber.

**Reguli:** un vizitator are cel mult un dulap, iar un dulap cel mult un vizitator; atribuirea reușește numai dacă vizitatorul nu are dulap și dulapul este liber; altfel refuz, cu întregul registru identic.

Pe hârtie, apoi discutăm: găsiți două apeluri independente din B: unul pentru care operația întoarce `refuz`, dar modifică registrul; altul pentru care întoarce `atribuit`, deși contractul cere refuz. Scrieți registrul final al fiecăruia și verificați unicitatea.

::: notes
`atribuie(V1,D2)`: eliminarea lasă {V2–D2}, D2 este ocupat, întoarce refuz; registrul final {V2–D2} pierde V1–D1. `atribuie(V1,D3)`: eliminarea lasă {V2–D2}, D3 este liber, întoarce atribuit cu {V2–D2, V1–D3}: operația a mutat vizitatorul, deși contractul cere refuz pentru un vizitator care are deja dulap. Unicitatea este respectată în ambele registre finale; R3 este încălcată în ambele. Pentru contrast, `atribuie(V3,D2)` nu are ce elimina, găsește D2 ocupat și refuză cu B intact: defectul apare numai când v are deja dulap. Este o trasare manuală a pseudocodului, nu jurnalul unei execuții reale.

**Organizare:** 8 min: 3 pe hârtie, 5 discuție. []{.pace dur=8}
:::

---

# Decidem înainte să modificăm

**R3 (atribuire):** atribuirea reușește numai dacă v nu are dulap și d este liber; altfel refuz fără modificări.

Corecția noastră, în contextul **apelurilor secvențiale**:

```text
atribuie(v, d):
    dacă v are dulap sau d este ocupat: întoarce refuz
    adaugă v–d
    întoarce atribuit
```

Toate celelalte asocieri se păstrează. De ce primul pas nu are nevoie să „elibereze” ceva?

::: notes
Operația nu promite mutare. Verificarea fără efecte poate decide refuzul fără reparații. În acest model nu apare o modificare concurentă între verificare și adăugare și nu discutăm întreruperi tehnice; corecția nu demonstrează garanții pentru acele cazuri.

**Organizare:** 3 min. []{.pace dur=3}
:::

---

# De ce se păstrează unicitatea?

**R2 (unicitate):** un vizitator are cel mult un dulap, iar un dulap are cel mult un vizitator.

**Atribuire acceptată:** asociem un vizitator fără dulap cu un dulap liber.

**Eliberare:** eliminăm cel mult o pereche.

**Refuz sau `fără_dulap`:** păstrăm registrul identic.

Pornind dintr-un registru valid, explicați pentru fiecare caz de ce nu poate introduce o a doua asociere pentru același vizitator sau dulap.

::: notes
La adăugare, nici vizitatorul, nici dulapul nu aveau altă asociere. Eliminarea nu introduce duplicate. Un registru lăsat identic păstrează o proprietate deja adevărată. Este un argument pentru toate cazurile contractului, mai puternic decât enumerarea câtorva exemple; nu verifică automat codul unei implementări.

**Organizare:** 6 min: discuție cu toată clasa, cel puțin un răspuns pentru fiecare caz. []{.pace dur=6}
:::

---

# Ce poate și ce nu poate stabili o verificare?

**Contractul nostru:** pentru identificatori cunoscuți, un registru valid și apeluri secvențiale, refuzul păstrează tot registrul.

**Vorbim despre orice implementare,** nu despre cele de pe slide-urile anterioare. Nu presupunem că respectă contractul: tocmai asta vrem să aflăm.

| Verificare, când contractul cere refuz | Ce aflăm dacă trece |
|---|---|
| Rezultatul întors este `refuz` | Numai rezultatul, nu și starea de după. |
| Unicitatea este păstrată | Starea finală respectă acel invariant. |
| Registrul de după este identic cu cel de dinainte | Refuzul păstrează starea în scenariul verificat. |

Niciunul dintre aceste exemple nu verifică încuietori fizice, concurență sau identificatori necunoscuți.

::: notes
Verificarea se scrie din contract și se aplică unei implementări despre care nu știm încă nimic; dacă am presupune că aceasta respectă contractul, verificarea nu ne-ar mai spune nimic. Exemplu: operația greșită de mai devreme, la `atribuie(V1,D2)`, trece primele două verificări și o pică pe a treia. Obținerea rezultatului așteptat într-un scenariu nu garantează corectitudinea pentru toate apelurile admise. Exemplele sunt derivate din contract, nu din pașii implementării. În cursul 9 vom discuta explicit limitele explorării unui model executabil.

**Organizare:** 3 min. []{.pace dur=3}
:::

---

# Contracte scrise lângă cod

| Limbaj | Unde scriem contractul |
|---|---|
| Java | [**JML**](https://www.cs.ucf.edu/~leavens/JML/), în comentarii speciale; instrument: [OpenJML](https://www.openjml.org/) |
| C | [**ACSL**](https://frama-c.com/html/acsl.html), în comentarii speciale; instrument: [Frama-C](https://frama-c.com/) |
| C++ | `pre`, `post`, în [proiectul C++26](https://wg21.link/p2900), încă disputate |
| Rust | Instrumente externe: [Kani](https://model-checking.github.io/kani/), [Prusti](https://github.com/viperproject/prusti-dev), [Verus](https://github.com/verus-lang/verus) |
| Python | Biblioteci, de exemplu [icontract](https://github.com/Parquery/icontract) |

**În JML:** `requires` este precondiția, `ensures` postcondiția, `\old` starea de dinainte, iar `\result` rezultatul întors. Un instrument poate citi aceste adnotări și le poate verifica.

::: notes
Aceleași întrebări din curs primesc o notație pe care un instrument o poate citi. În JML, cazul de refuz s-ar scrie, ca exemplu didactic nerulat: `requires areDulap(v) || !eLiber(d); ensures \result == REFUZ && asocieri().equals(\old(asocieri()));`. Cuvântul `also` adaugă cazul de succes, deci este chiar forma cu câte un contract pentru fiecare caz. Nu cerem sintaxa și nu impunem un instrument. OpenJML poate adăuga verificări la execuție (`--rac`) sau poate încerca o demonstrație statică, care dă garanții mai puternice, dar cere specificații mai atente. Proiectul C++26 adaugă și `contract_assert`, pentru verificări în corpul funcției; Python nu are o notație proprie pentru contracte. Ca exemplu de limbaj cu contracte proprii, Eiffel, limbajul lui Meyer, are `require` și `ensure`.

**Sursă:** căutare din 6 noiembrie 2026: documentația [OpenJML](https://www.openjml.org/), biblioteca [icontract](https://github.com/Parquery/icontract), [contractele Kani](https://model-checking.github.io/kani/crates/doc/kani/contracts/index.html). La C++, P2900 este în proiectul C++26, dar [P4334R0](https://www.open-std.org/jtc1/sc22/wg21/docs/papers/2026/p4334r0.pdf) (august 2026) îl contestă și consemnează suport doar experimental în GCC 16.1; nu afirmăm că va rămâne în standard. Reverificați înainte de următoarea ediție.

**Organizare:** 2 min: prezentare scurtă, fără exercițiu. []{.pace dur=2}
:::

---

# Contractul și instrucțiunea `assert`

**Reguli:** atribuim dacă v nu are dulap și d este liber; altfel `refuz`, cu registrul identic. Unicitatea vizitator–dulap se păstrează. *Exemplu didactic, nerulat:*

```java
Rezultat atribuie(Vizitator v, Dulap d) {
    if (areDulap(v) || !eLiber(d)) return REFUZ;
    Set<Asociere> inainte = Set.copyOf(asocieri);
    asocieri.add(new Asociere(v, d));
    assert respectaUnicitatea(asocieri);
    assert asocieri.equals(cuAsocierea(inainte, v, d));
    return ATRIBUIT;
}
```

De ce refuzul este `if`, nu `assert`? Ce spune un `assert` trecut despre alte apeluri?

::: notes
Refuzul este un rezultat promis, deci trebuie produs mereu; un `assert` poate fi dezactivat: în Java este oprit implicit și se activează cu `-ea`, în Python `-O` îl elimină, iar în C `NDEBUG` îl dezactivează. Un `assert` eșuat semnalează un defect, nu un caz al contractului. Aici primul `assert` verifică invariantul, iar al doilea postcondiția și are nevoie de o copie a stării de dinainte. Un `assert` pentru precondiție are sens când apelantul este sub controlul nostru; aici ar acoperi R1 (context), nu „dulap liber”, care ține de condiția de succes. Un `assert` verifică o stare, într-o execuție; contractul privește toate apelurile admise. Faptul că trece nu spune nimic despre apelurile neexecutate.

**Sursă:** ghidul Oracle [Programming With Assertions](https://docs.oracle.com/cd/E19683-01/806-7930/assert/index.html), căutare din 6 noiembrie 2026: nu folosim `assert` pentru argumentele metodelor publice, dar îl putem folosi pentru postcondiții și pentru precondițiile metodelor nepublice.

**Organizare:** 3 min: discuție cu toată clasa; ajungem la minutul 80. []{.pace dur=3}
:::

---

# Cine a verificat pe cine? {.transition}

Testele trec. Ce au verificat?

::: notes
Revenim la operația greșită din etapa anterioară. Am cerut unui asistent AI contractul și testele ei, o dată pornind de la pseudocod, o dată pornind de la reguli. Un contract și niște teste scrise după cod descriu ce face codul, cu tot cu defect: confirmă implementarea, nu o verifică. Este observația de pe slide-ul „Ce poate și ce nu poate stabili o verificare?”, întâlnită acum la un asistent AI.

**Sursă:** capturi reale obținute înaintea cursului: Claude Haiku 4.5, prin Claude Code 2.1.328, la 19 noiembrie 2026, fără unelte și fără contextul proiectului, fiecare încercare într-un context nou. Am rulat patru încercări pornind de la pseudocod și trei pornind de la reguli și am ales câte una pentru discuție; selecția nu descrie comportamentul tipic al modelului. Toate încercările sunt în arhiva capturilor. La curs nu rulăm instrumente.

**Organizare:** minutul 80 din 100; interval 80–95 (15 min): cererile 2, contractul scris din cod 3, testele 4, contractul scris din reguli 3, decizie 3. []{.pace at=80}
:::

---

# Ce cerem asistentului AI?

**Cererea A, instrucțiunea exactă:**

> Scrie contractul operației atribuie de mai jos: precondițiile, condiția de succes, postcondițiile pentru fiecare rezultat și invarianții. Apoi scrie cinci teste pentru ea, fiecare cu registrul dinainte, apelul, rezultatul așteptat și registrul așteptat după. Nu scrie cod. Răspunde în română, în maximum 350 de cuvinte.

**Context trimis:** un vizitator are cel mult un dulap, iar un dulap cel mult un vizitator; identificatori cunoscuți, apeluri secvențiale; rezultatele `atribuit` și `refuz`; **pseudocodul operației greșite de mai devreme**; B = V1–D1, V2–D2, V3 fără dulap, D3 liber. **Fără regula atribuirii.**

**Cererea B,** într-un context nou: aceeași instrucțiune, cu „din regulile de mai jos”; contextul are regulile R1–R5 și B, fără pseudocod.

**Predicție:** va semnala răspunsul la cererea A că refuzul pierde asocierea veche?

::: notes
Cererea A este o cerere obișnuită: „scrie contractul și testele pentru acest cod”. Contextul ei conține unicitatea, dar nu R3 (atribuire): asistentul AI nu are de unde ști ce trebuia să facă operația, ci doar ce face. „Test” este cuvântul din cerere; în vocabularul nostru, un test de acest fel este un scenariu: starea dinainte, apelul, rezultatul așteptat.

**Sursă:** `din-cod-prompt.md` (arhiva `2026-11-19`) și `din-enunt-prompt.md` (arhiva `2026-11-19b`); contextul integral este rezumat pe slide.

**Organizare:** 2 min; predicții prin ridicarea mâinii, fără discuție. []{.pace dur=2}
:::

---

# Contractul scris din cod

:::::: {.columns}
::: {.column width="56%"}
**Asistentul AI, cererea A — Claude Haiku 4.5, captură din 19 noiembrie 2026; fragmente:**

> **Condiția de succes:** Dulapul d este liber la momentul verificării și operația se completează cu atribuit
>
> **Dacă rezultatul este `refuz`:** […] Orice asociere anterioară a vizitatorului v este eliminată […]
:::
::: {.column width="42%"}
**Pseudocodul primit:**

```text
atribuie(v, d):
    elimină asocierea existentă
        a lui v, dacă există
    dacă d este ocupat:
        întoarce refuz
    adaugă v–d
    întoarce atribuit
```
:::
::::::

**R3 (atribuire):** reușește numai dacă v nu are dulap și d este liber; altfel `refuz`, cu întregul registru identic.

Descrie contractul pseudocodul? Descrie R3? Ce lipsește din condiția de succes?

::: notes
Contractul descrie fidel pseudocodul: „la momentul verificării” înseamnă după eliminarea asocierii vechi, iar refuzul elimină asocierea anterioară. Față de R3, condiția de succes nu mai cere „v nu are dulap”, iar refuzul nu mai păstrează registrul. Răspunsul nu semnalează nimic: din cod nu avea de unde ști că eliminarea este un defect. Pseudocodul este afișat aici pe mai multe rânduri, ca să încapă alături; textul trimis are rândurile de pe slide-ul „Urmăriți operația propusă”.

**Organizare:** 3 min: răspuns individual, apoi discuție. []{.pace dur=3}
:::

---

# Testele scrise din cod

**Asistentul AI, cererea A — aceeași captură; două dintre cele cinci teste, integral:**

:::::: {.columns}
::: {.column width="49%"}
> **Test 3: Realocare de vizitator la dulap liber**
>
> - Dinainte: B
> - Apel: atribuie(V1, D3)
> - Rezultat așteptat: atribuit
> - După: {V1–D3, V2–D2}
:::
::: {.column width="49%"}
> **Test 4: Refuz la realocare cu dulap ocupat**
>
> - Dinainte: B
> - Apel: atribuie(V1, D2)
> - Rezultat așteptat: refuz
> - După: {V2–D2}
:::
::::::

**B:** V1–D1, V2–D2; V3 fără dulap, D3 liber. **R3 (atribuire):** reușește numai dacă v nu are dulap și d este liber; altfel `refuz`, cu întregul registru identic.

Individual, apoi discutăm: trec testele pe operația din pseudocod? Ce cere R3 la aceleași apeluri?

::: notes
Ambele trec: la `atribuie(V1,D3)` operația mută V1 pe D3, la `atribuie(V1,D2)` refuză după ce a șters V1–D1. Toate cele cinci teste ale răspunsului trec pe operația greșită. După R3, ambele apeluri trebuie refuzate, cu registrul exact B. Testul 4 este chiar contraexemplul trasat la minutul 55, scris ca rezultat așteptat: testul fixează defectul în loc să-l găsească. Dintre celelalte trei teste omise, o atribuire reușită și un refuz pentru un dulap ocupat de alt vizitator respectă și R3; al cincilea mută V1 pornind din alt registru decât B.

**Organizare:** 4 min: 2 individual, 2 discuție. []{.pace dur=4}
:::

---

# Contractul scris din reguli

**Asistentul AI, cererea B — Claude Haiku 4.5, 19 noiembrie 2026; fragmente:**

> **Condiția de succes:** Atribuirea reușește dacă și numai dacă: vizitatorul v nu are dulap în registrul curent, **ȘI** dulapul d este liber (niciun vizitator nu-l ocupă) în registrul curent

:::::: {.columns}
::: {.column width="49%"}
> **Test 2:** Refuz — vizitator deja cu dulap
>
> - Inițial: B = {V1–D1, V2–D2}
> - Apel: atribuie(V1, D3)
> - Așteptat: "refuz"
> - După: {V1–D1, V2–D2} ✓ neschimbat
:::
::: {.column width="49%"}
> **Test 4:** Refuz — amândouă condițiile violate
>
> - Inițial: B = {V1–D1, V2–D2}
> - Apel: atribuie(V1, D2)
> - Așteptat: "refuz"
> - După: {V1–D1, V2–D2} ✓ neschimbat
:::
::::::

**Operația din pseudocod** elimină întâi asocierea lui v, apoi refuză dacă d este ocupat. Ce produce la testele 2 și 4? Ce scenariu separă contractele?

::: notes
Testul 2: operația întoarce `atribuit`, cu {V2–D2, V1–D3}; testul 4: întoarce `refuz`, dar cu {V2–D2}. Ambele pică. Scenariul S4 (`atribuie(V1,D2)`, ambele condiții împiedică succesul) separă cele două contracte prin registrul de după, iar scenariul S3 (`atribuie(V1,D3)`, vizitator deja asociat) chiar prin rezultatul întors. Același model, cu aceeași instrucțiune, a scris teste care verifică, pentru că a pornit de la reguli. Celelalte două încercări cu reguli au aceeași condiție de succes și refuzuri cu registrul identic.

**Sursă:** răspunsul integral `haiku45-din-enunt-01`, arhiva `2026-11-19b`; fragmentele sunt condiția de succes, cu titlul și lista ei redate pe un singur rând, și testele 2 și 4, integral.

**Organizare:** 3 min: răspuns individual, apoi discuție. []{.pace dur=3}
:::

---

# Decizia noastră: cine a verificat pe cine?

**Contractul și testele scrise din cod** au descris operația, cu tot cu defect: toate testele trec, iar testul 4 cere chiar pierderea asocierii V1–D1. Au confirmat codul, nu l-au verificat.

**Contractul și testele scrise din reguli** pică exact la scenariile S3 (vizitator deja asociat) și S4 (ambele condiții împiedică succesul): ele verifică.

**Regula noastră:** rezultatul așteptat se scrie din enunț și din contract, nu din implementarea verificată. Când cerem teste unui asistent AI, îi dăm regulile; dacă îi dăm și codul, îi cerem să-l compare cu ele.

::: notes
Nu reproșăm modelului răspunsul la cererea A: a făcut ce i s-a cerut, iar contractul descrie corect pseudocodul. Problema este circularitatea: dacă implementarea este și sursa așteptărilor, orice defect devine comportament specificat. Aceeași capcană apare fără AI, când scriem testele uitându-ne la cod. Toate cele patru încercări din cod omit „v nu are dulap” din condiția de succes și au un test care cere mutarea lui V1 pe D3. Numai cea selectată scrie și pierderea asocierii la refuz; celelalte trei scriu că refuzul lasă registrul identic, deși codul nu îl lasă, iar una are chiar un test care ar pica pe cod. Toate sunt în arhivă. Selecția nu descrie comportamentul tipic al modelului.

**Organizare:** 3 min; încheierea etapei la minutul 95. []{.pace dur=3}
:::

---

# Transferăm promisiunea {.transition}

Aceleași întrebări, alte reguli.

::: notes
Transferăm metoda de formulare, nu regula de refuz a muzeului.

**Organizare:** minutul 95 din 100; interval 95–100 (5 min): exercițiu și încheiere. []{.pace at=95}
:::

---

# O trusă pentru fiecare tehnician

**Enunț nou:** identificatorii sunt cunoscuți, iar apelurile sunt secvențiale; un tehnician are cel mult o trusă de scule, iar o trusă cel mult un tehnician. Împrumutăm o trusă liberă unui tehnician fără trusă. Repetarea aceluiași împrumut întoarce `deja_imprumutat`; celelalte conflicte întorc `refuz`. Numai un împrumut nou modifică registrul, adăugând perechea cerută.

**Înainte:** tehnicianul T1 are trusa K1; T2 nu are trusă; trusa K2 este liberă.

1. Formulați condiția de succes și starea de după `împrumută(T2,K2)`.
2. Independent, din aceeași stare: `împrumută(T1,K2)`. Ce rămâne identic?
3. Tot din starea inițială: `împrumută(T1,K1)`. Ce diferă față de muzeu?

::: notes
Succes: T1–K1 și T2–K2. Refuz: exact starea inițială, deoarece T1 are K1. Repetarea întoarce `deja_imprumutat`, cu starea păstrată, spre deosebire de refuzul muzeului. Transferăm metoda de citire a contractului, fără să importăm regulile muzeului. Invariantul de unicitate este același și nu stabilește singur aceste rezultate. La laborator distingem cantitatea rezervată, disponibilă și fizică. Feedbackul pentru proiect poate fi cerut oricând.

**Organizare:** 5 min, încheiere la minutul 100. []{.pace dur=5}
:::
