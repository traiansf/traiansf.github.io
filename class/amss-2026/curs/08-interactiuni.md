---
title: "AMSS 2026/2027 — Cursul 8: Interacțiuni, fluxuri de lucru și granițe"
author: "Traian-Florin Șerbănuță"
lang: ro-RO
operation-names: [înscrie, trimite, "retrimite confirmările"]
---

# Cine coordonează o operație care iese din sistem? {.transition}

Registrul a acceptat cererea, serviciul extern a raportat un eșec. Ce îi spunem utilizatorului?

::: notes
În cursul 7 am urmărit un singur obiect de-a lungul vieții lui. Azi o operație traversează o graniță: o parte a muncii este făcută de un serviciu pe care nu îl controlăm. Întrebarea cursului: cine coordonează, ce promitem când cealaltă parte eșuează și ce se întâmplă când cererea vine a doua oară.

**Organizare:** minutul 0 din 100; interval 0–15 (15 min), inclusiv coperta, citatul, întrebarea deschisă, problema, exercițiul de predicție și slide-ul despre graniță. 33 de slide-uri cu copertă. []{.pace at=0 of=100}
:::

---

# Citatul zilei

> „Orice organizație care proiectează un sistem (în sens larg) va produce o soluție a cărei structură este o copie a structurii de comunicare a organizației.”
>
> Original: “Any organization that designs a system (defined broadly) will produce a design whose structure is a copy of the organization's communication structure.”

— **Melvin E. Conway**

[Sursa: Conway’s Law — formularea autorului](https://www.melconway.com/Home/Conways_Law.html)

::: notes
Granițele dintre componente urmează adesea granițele dintre organizații: expeditorul de confirmări din exemplul de azi este operat de altă firmă, deci îl cunoaștem numai prin interfața lui și prin ce presupunem despre el. Conway descrie o tendință, nu o regulă de proiectare; pentru noi, concluzia este că o graniță organizațională trebuie făcută explicită în model, cu presupunerile ei.

**Sursă:** pagina autorului, formularea introdusă prin „Here is one form of the paper's thesis”; nu o confundați cu variantele din alte surse. Reverificată la 12 noiembrie 2026. Vezi `docs/quotations.md`.
:::

---

# O confirmare care nu a venit

Gândiți-vă la o plată, o înscriere, o comandă online: ați apăsat butonul, pagina a rămas pe loc sau a dat eroare, iar confirmarea nu a venit.

**Ați apăsat din nou? Ce s-a întâmplat: două comenzi, niciuna, sau una cu două confirmări? De unde ați fi știut care este starea reală?**

::: notes
Nu căutăm un singur răspuns corect. Pot apărea plăți duble, comenzi înregistrate fără confirmare, confirmări pentru comenzi inexistente, pagini care spun „nu apăsați din nou”. Observăm că utilizatorul nu vede decât răspunsul canalului, iar sistemul trebuie să decidă ce înseamnă o cerere repetată. Azi facem explicite aceste decizii.

**Organizare:** 5 min: întrebare către clasă; notăm câteva exemple, fără să le rezolvăm. []{.pace dur=5}
:::

---

# Înscriere acceptată, confirmare eșuată

Un centru cultural organizează ateliere cu locuri limitate. **Registrul de locuri**, componenta pe care o proiectăm, primește cererile de înscriere de la site și înregistrează înscrierile acceptate. După fiecare înscriere acceptată, registrul cere unui **expeditor de confirmări**, un serviciu extern operat de altă firmă, să trimită participantului o confirmare.

**Regula convenită cu centrul (beneficiarul):** eșecul confirmării nu anulează o înscriere acceptată; centrul preferă un participant înscris fără confirmare unui participant cu confirmare fără loc.

P1 cere un loc la atelierul A de fotografie nocturnă. Registrul acceptă, dar expeditorul răspunde `esec`. **Ce îi spunem site-ului? Ce rămâne înregistrat?**

*Exemplu didactic; registrul nu trimite el însuși mesaje. Lucrăm pe hârtie; toate datele necesare sunt pe slide-uri.*

::: notes
Îi spunem `acceptat`: înscrierea există, locul este consumat, iar lângă înscriere rămâne rezultatul `netrimisă`: expeditorul a raportat `esec`, fără să știm dacă mesajul a ajuns. Răspunsul nu depinde de expeditor, ci de regula beneficiarului; dar trebuie să rămână undeva faptul că trimiterea nu a fost confirmată de expeditor. De aici întrebarea cursului: cine coordonează pașii și ce promitem pentru fiecare.

**Organizare:** 2 min: întrebare către clasă, așteptăm răspunsul. []{.pace dur=2}
:::

---

# Preziceți interacțiunea eșuată

**Reguli:** atelierul A are 2 locuri; o cerere nouă este acceptată dacă participantul nu este înscris și există loc; după acceptare registrul cere expeditorului confirmarea, care răspunde `trimis` sau `esec`; eșecul confirmării nu anulează înscrierea; site-ul reîncearcă aceeași cerere cu același identificator, iar registrul întoarce același `acceptat`, fără alt loc consumat.

**Înainte:** 2 locuri libere, nicio înscriere. Site-ul trimite `înscrie(c1, P1, A)`; expeditorul răspunde `esec`. Site-ul nu afișează nimic utilizatorului și trimite din nou `înscrie(c1, P1, A)`.

Individual, apoi discutăm: după a doua cerere, **câte locuri sunt libere, câte înscrieri are P1 și ce răspuns primește site-ul?** Ce ar trebui să facă registrul cu confirmarea?

::: notes
Un loc liber, o singură înscriere, răspunsul `acceptat` de două ori. A doua cerere are același identificator, deci este aceeași cerere, nu una nouă; registrul nu consumă alt loc. Cu confirmarea, registrul poate încerca din nou trimiterea sau o poate lăsa pentru mai târziu; ambele sunt decizii de proiectare pe care le comparăm în a doua parte. Răspunsurile diferite ale studenților arată de ce regula trebuie scrisă.

**Organizare:** 6 min: 3 individual, 3 discuție. []{.pace dur=6}
:::

---

# Interacțiune, graniță, coordonare

O **interacțiune** este succesiunea apelurilor prin care mai multe componente realizează o operație: cine apelează pe cine, ce trimite, ce primește, ce înregistrează. Ordinea aleasă a pașilor este **fluxul de lucru** al operației.

**Granița** sistemului nostru separă componentele pe care le proiectăm de cele pe care doar le folosim. Despre o componentă din exterior cunoaștem **interfața** ei și ce **presupunem** despre ea; nu îi cunoaștem pașii.

**Coordonarea** este responsabilitatea de a conduce pașii unei operații: de a decide ordinea, de a înregistra rezultatul fiecărui pas și de a răspunde apelantului, inclusiv când un pas eșuează sau când cererea vine a doua oară.

Pentru înscrieri le precizăm pe rând și le verificăm pe scenarii. Nu modelăm plata, lista de așteptare, concurența sau erorile tehnice din interiorul registrului.

::: notes
Legătura cu cursul 5: interfața rămâne semnătura și sensul rezultatelor; noutatea este că pentru o componentă din exterior interfața este tot ce avem, iar restul sunt presupuneri de scris explicit. Legătura cu cursul 6: ce promite registrul când expeditorul eșuează este o postcondiție a operației `înscrie`, nu o speranță. Coordonarea este o responsabilitate ca oricare alta: cineva trebuie să o aibă.
:::

---

# Interfețe, coordonare și cereri repetate {.transition}

Ce știm despre expeditor și ce promitem noi?

::: notes
Citim regulile complete, apoi desenăm granița, repartizăm responsabilitățile și precizăm ce înseamnă o cerere repetată.

**Organizare:** minutul 15 din 100; interval 15–35 (20 min): reguli 4, graniță 4, coordonare 3, reîncercare 2, exercițiu 7. []{.pace at=15}
:::

---

# Regulile înscrierii: context, cerere, acceptare, confirmare

| Regulă | Conținut |
|--------|------------------------------------------|
| R1 (context) | Atelierul A are 2 locuri; participanții sunt cunoscuți; apelurile sunt secvențiale. Fără plată, listă de așteptare, anulare, concurență sau erori tehnice în registru. |
| R2 (cerere) | `înscrie(c, p, a)`: identificatorul cererii c este generat de site, unic pentru fiecare cerere nouă; o reîncercare trimite același c. |
| R3 (acceptare) | O cerere cu c neînregistrat este acceptată exact când p nu este înscris la a și există loc: registrul consumă locul și înregistrează (c, p, a). Altfel: `refuz`, fără modificări, fără apelul expeditorului. |
| R4 (confirmare) | După acceptare, registrul cere expeditorului `trimite(mesaj)`, care răspunde `trimis` sau `esec`; registrul înregistrează confirmarea `trimisă` sau `netrimisă`. Eșecul confirmării nu anulează înscrierea; site-ul primește `acceptat`. |

::: notes
R4 vine de la beneficiar; noi nu o putem schimba, doar o putem face explicită. R3 spune și ce nu se întâmplă la refuz: niciun apel către expeditor.
:::

---

# Regulile înscrierii: reîncercare, graniță, efect limitat

| Regulă | Conținut |
|--------|------------------------------------------|
| R5 (reîncercare) | O cerere cu c deja înregistrat primește același `acceptat`, fără alt loc și fără a doua înscriere. Dacă confirmarea este `netrimisă`, registrul poate cere din nou trimiterea; dacă este `trimisă`, nu apelează expeditorul. |
| R6 (graniță) | Despre expeditor presupunem doar că răspunde la fiecare apel cu `trimis` sau `esec`. `esec` nu înseamnă că mesajul nu a ajuns; `trimis` nu înseamnă că a fost citit. `netrimisă` consemnează `esec`, nu nelivrarea. |
| R7 (efect limitat) | O cerere nu modifică alte înscrieri și nici locurile lor. |

::: notes
R6 vine de la furnizorul extern: este tot ce știm. R5 spune ce înseamnă „aceeași cerere”: identificatorul, nu conținutul. Două cereri noi cu același conținut sunt cereri diferite, iar a doua este refuzată de R3.
:::

---

# Granița și interfața expeditorului

:::::: {.columns align=center}
::: {.column width="50%"}
```mermaid
flowchart TB
  S[Site] -->|"înscrie(c, p, a)"| R[Registrul de locuri]
  R -->|"trimite(mesaj)"| E[Expeditor de confirmări]
  subgraph interior [Sistemul nostru]
    R
  end
```
:::
::: {.column width="46%"}
**Interfața expeditorului:** `trimite(mesaj)` întoarce `trimis` sau `esec`. Atât știm.

**R6 (graniță):** presupunem că răspunde la fiecare apel.

**Ce nu presupunem:** că `esec` înseamnă „mesajul nu a ajuns”; că `trimis` înseamnă „a fost citit”; cât durează.
:::
::::::

Săgeata înseamnă „apelează”; site-ul și expeditorul sunt în afara graniței, iar ce știm despre fiecare diferă.

::: notes
Site-ul este în afara graniței în sensul că nu îl proiectăm azi, deși este al centrului; expeditorul este în afara ei și organizațional. Pentru ambele avem numai interfața: ce ne trimit și ce le întoarcem. Presupunerile despre expeditor sunt partea cea mai fragilă a modelului: dacă una cade (de exemplu, nu răspunde niciodată), promisiunile noastre trebuie recitite. Nu desenăm procese, servere sau protocoale.

**Organizare:** 4 min. []{.pace dur=4}
:::

---

# Cine coordonează?

| Componentă | Responsabilitate |
|:----------|:--------------------------------------------------|
| Site | interpretează formularul, generează identificatorul cererii, reîncearcă cu același identificator, afișează rezultatul |
| **Registru** | decide acceptarea, consumă locul, înregistrează înscrierea și identificatorul, **apelează expeditorul**, înregistrează confirmarea, răspunde site-ului |
| Expeditor | încearcă trimiterea și răspunde `trimis` sau `esec` |

Registrul **coordonează**: site-ul nu apelează expeditorul; interfața expeditorului nu cere acces la locuri. **R4 (confirmare):** eșecul confirmării nu anulează înscrierea acceptată; de aceea registrul o înregistrează înaintea apelului expeditorului. **Dacă site-ul ar trimite el confirmarea, ce ar trebui să știe și ce ar putea merge prost?**

::: notes
Site-ul ar trebui să cunoască rezultatul deciziei și regula R4 și ar trebui să fie el cel care înregistrează rezultatul confirmării, deși nu deține înscrierile; o confirmare ar putea pleca fără înscriere sau o înscriere ar rămâne fără urma confirmării. Coordonarea stă acolo unde stau datele și regulile pe care pașii le modifică. Ca în cursul 5, dependența utilă este apelul operației; cuplarea de regulile registrului ar fi costul variantei cu site-ul coordonator.

**Organizare:** 3 min: întrebare către clasă. []{.pace dur=3}
:::

---

# Aceeași cerere sau o cerere nouă?

**R5 (reîncercare):** o cerere cu identificator c **deja înregistrat** este o reîncercare: același `acceptat`, fără alt loc, fără a doua înscriere. **R3 (acceptare):** o cerere cu c nou este judecată după locuri și după înscrierile existente.

**În ambele rânduri, prima cerere a fost acceptată și c1 este înregistrat.**

| Cererea | Ce este | Ce decide rezultatul |
|:------------------------------------------|:------------|:------------------------------|
| `înscrie(c1, P1, A)` după `înscrie(c1, P1, A)` | reîncercare | înscrierea deja înregistrată pentru c1 |
| `înscrie(c9, P1, A)` după `înscrie(c1, P1, A)` | cerere nouă | P1 este deja înscris → `refuz` |

**Identificatorul cererii** este ceea ce le deosebește, nu conținutul. În cursul 6, repetarea eliberării dădea alt rezultat (`fara_dulap`); aici regula cere **același** rezultat.

::: notes
Regulile se citesc din enunț, nu se importă de la muzeu. Fără identificator, registrul nu ar putea distinge „aceeași cerere, trimisă din nou” de „altă cerere cu același conținut” și ar răspunde `refuz` la reîncercare, deși P1 este înscris: site-ul ar afișa un refuz pentru o înscriere reușită. Idempotența privește efectul repetării, nu egalitatea răspunsurilor. Aici efectul asupra înscrierilor nu se repetă; R5 cere suplimentar același răspuns. Notificarea poate fi retrimisă și rezultatul ei se poate modifica. Vezi RFC 9110, §9.2.2: https://www.rfc-editor.org/rfc/rfc9110.html#section-9.2.2.

**Organizare:** 2 min. []{.pace dur=2}
:::

---

# Ce răspunde registrul?

**Reguli:** o cerere nouă reușește dacă participantul nu este înscris și există loc. La reîncercare: `acceptat`, fără alt loc; putem retrimite confirmarea `netrimisă`. Eșecul păstrează înscrierea; refuzul nu modifică nimic și nu apelează expeditorul.

**Pornire pentru rândurile 1–3, independente:** 1 loc liber; (c1, P1, A), confirmare `netrimisă`.

| | Cererea | Rezultat | Locuri libere | Apel extern? |
|:-|:----------------------------------|:---------|:-------------|:-------------|
| 1 | `înscrie(c1, P1, A)` | ? | ? | ? |
| 2 | `înscrie(c9, P1, A)` | ? | ? | ? |
| 3 | `înscrie(c2, P2, A)`, cu `esec` | ? | ? | ? |
| 4 | după 3: `înscrie(c3, P3, A)` | ? | ? | ? |

**Individual, apoi discutăm:** completați tabelul. La 1, retrimiterea este obligatorie?

::: notes
1: `acceptat`, 1 loc, reîncercare; registrul poate apela din nou expeditorul (R5 permite) și actualizează confirmarea dacă răspunde `trimis`. 2: `refuz`, 1 loc, nu; P1 este deja înscris. 3: `acceptat`, 0 locuri, da; confirmarea lui P2 rămâne `netrimisă`. 4: `refuz`, 0 locuri, nu; nu mai sunt locuri. Expeditorul este apelat numai după o acceptare nouă sau la o reîncercare cu confirmare `netrimisă`.

**Organizare:** 7 min: 3 individual, 4 discuție; ajungem la minutul 35. []{.pace dur=7}
:::

---

# Urmărim fluxul {.transition}

Înregistrăm înainte sau după ce apelăm expeditorul?

::: notes
Scriem interacțiunea pas cu pas pentru cazul normal și pentru eșecul confirmării, apoi reîncercările; comparăm două ordini ale pașilor.

**Organizare:** minutul 35 din 100; interval 35–60 (25 min): S1 5, S2 4, exercițiul S3–S4 8, două ordini 5, garanții 3. []{.pace at=35}
:::

---

# Scenariul S1 (înscriere confirmată)

**Din I** (2 locuri libere, nicio înscriere): `înscrie(c1, P1, A)`; expeditorul răspunde `trimis`.

| Pas | Apel sau răspuns | Ce înregistrează registrul |
|:----|:--------------------------------------|:----------------------------|
| 1 | Site → Registru: `înscrie(c1, P1, A)` | — |
| 2 | Registru: c1 nou, P1 neînscris, loc liber → **acceptă** | 1 loc liber; (c1, P1, A); confirmare `în așteptare` |
| 3 | Registru → Expeditor: `trimite(mesaj)` | — |
| 4 | Expeditor → Registru: `trimis` | confirmare `trimisă` |
| 5 | Registru → Site: `acceptat` | — |

Decizia și înregistrarea (pasul 2) preced apelul expeditorului (pasul 3). **Ce știe registrul între pașii 3 și 4?**

::: notes
Între 3 și 4, registrul știe că înscrierea există și că răspunsul confirmării nu a venit încă; de aceea confirmarea are o valoare proprie, `în așteptare`, nu lipsește. Tabelul interacțiunii este reprezentarea pe care o verificăm: fiecare rând spune cine acționează și ce rămâne înregistrat. Nu desenăm încă o diagramă de secvență; tabelul conține aceleași informații, plus coloana înregistrărilor.

**Organizare:** 5 min, cu întrebarea. []{.pace dur=5}
:::

---

# Scenariul S2 (confirmare eșuată)

**R4 (confirmare):** eșecul confirmării nu anulează înscrierea; site-ul primește `acceptat`.

**Din I** (2 locuri libere, nicio înscriere): `înscrie(c1, P1, A)`; expeditorul răspunde `esec`.

| Pas | Apel sau răspuns | Ce înregistrează registrul |
|:----|:--------------------------------------|:----------------------------|
| 1 | Site → Registru: `înscrie(c1, P1, A)` | — |
| 2 | Registru: **acceptă** | 1 loc liber; (c1, P1, A); confirmare `în așteptare` |
| 3 | Registru → Expeditor: `trimite(mesaj)` | — |
| 4 | Expeditor → Registru: `esec` | confirmare **`netrimisă`** |
| 5 | Registru → Site: `acceptat` | — |

**La `esec`, diferă numai confirmarea înregistrată. Înscrierea rămâne acceptată.**

::: notes
Faptul că eșecul se vede numai în coloana înregistrărilor este intenționat: regula beneficiarului spune că înscrierea nu depinde de confirmare. Ceea ce rămâne de rezolvat este confirmarea `netrimisă`; o rezolvăm în etapa următoare, nu ascunzând-o. Nu presupunem că mesajul nu a ajuns (R6).

**Organizare:** 4 min. []{.pace dur=4}
:::

---

# Reîncercarea după eșec și după succes

**R5 (reîncercare):** identificatorul deja înregistrat aduce același `acceptat`, fără alt loc sau înscriere. La `trimisă`, expeditorul nu este apelat. **Alegerea noastră pentru acest exercițiu:** la `netrimisă`, îl apelăm o dată și înregistrăm rezultatul. R5 permite această alegere, fără să o impună.

**Scenariul S3 (reîncercare după eșec):** continuarea lui S2 (1 loc liber; (c1, P1, A) cu confirmare `netrimisă`): `înscrie(c1, P1, A)`; expeditorul răspunde `trimis`, dacă este apelat.

**Scenariul S4 (reîncercare după succes):** continuarea lui S1 (1 loc liber; (c1, P1, A) cu confirmare `trimisă`): `înscrie(c1, P1, A)`.

Pe hârtie, apoi discutăm: scrieți pașii fiecărui scenariu ca în tabelele anterioare. **Câte rânduri au „Registru → Expeditor”? Ce se schimbă în înregistrări?**

::: notes
S3: Site → Registru; registrul găsește c1 înregistrat, confirmare `netrimisă`; Registru → Expeditor `trimite`; Expeditor → Registru `trimis`; confirmarea devine `trimisă`; Registru → Site `acceptat`. Un rând cu expeditorul; locurile rămân 1; nu apare altă înscriere. S4: Site → Registru; c1 înregistrat, confirmare `trimisă`; Registru → Site `acceptat`. Niciun rând cu expeditorul; nimic nu se schimbă. În ambele, răspunsul este același ca prima dată, cum cere R5.

**Organizare:** 8 min: 3 pe hârtie, 5 discuție. []{.pace dur=8}
:::

---

# Două ordini ale pașilor

**R4 (confirmare):** eșecul confirmării nu anulează înscrierea. **R6 (graniță):** `esec` nu înseamnă că mesajul nu a ajuns.

**Pornire:** c1 nou, P1 neînscris, un loc liber. **Fluxul F (exemplu didactic):** apelează întâi expeditorul; înregistrează numai la `trimis`, iar la `esec` întoarce `refuz`.

| Expeditor | Înregistrăm, apoi trimitem | Fluxul F |
|:---------|:-----------------------------|:-----------------------------|
| `trimis` | `acceptat`; înscriere, confirmare `trimisă` | `acceptat`; înscriere |
| `esec` | `acceptat`; înscriere, confirmare `netrimisă` | `refuz`; nicio înscriere; mesaj posibil livrat |

Ce încalcă F? Ce ar crede P1 dacă a primit totuși mesajul?

::: notes
F încalcă R4: un `esec` anulează înscrierea, deși beneficiarul a cerut invers. R6 arată o consecință suplimentară: dacă mesajul a ajuns, P1 are o confirmare fără loc, exact cazul pe care centrul voia să îl evite. Ordinea pașilor nu este un detaliu de implementare: ea decide ce promite operația. Nu discutăm aici căderea registrului între pași (R1 o exclude); argumentul ține și fără ea.

**Organizare:** 5 min: discuție cu toată clasa. []{.pace dur=5}
:::

---

# Ce garantează registrul și ce nu

**Context:** apeluri secvențiale, fără erori tehnice în registru; expeditorul răspunde la fiecare apel.

| Garantăm | Nu garantăm |
|:-----------------------------------|:-----------------------------------|
| o cerere acceptată consumă exact un loc | că participantul a primit mesajul |
| o reîncercare primește același rezultat și nu consumă alt loc | că participantul l-a citit |
| rezultatul confirmării este înregistrat la fiecare înscriere | reluarea după o cădere a registrului |
| un refuz nu modifică nimic și nu produce mesaje | înscrieri concurente |

Garanțiile depind de granița și presupunerile enunțului.

::: notes
A spune ce nu garantăm este parte din proiectare, nu o scuză: cine citește contractul știe ce trebuie adăugat dacă una dintre limite devine cerință (de exemplu, o confirmare de citire). Căderea registrului între pași ar cere un mecanism de reluare, exclus de R1; îl numim ca limită, nu îl inventăm.

**Organizare:** 3 min; ajungem la minutul 60. []{.pace dur=3}
:::

---

# Comparăm variante de recuperare {.transition}

Expeditorul a răspuns `esec`. Cine reîncearcă trimiterea și când?

::: notes
Urmărim un flux care greșește la reîncercare, apoi comparăm trei variante de recuperare după `esec`, cu presupunerile și costurile lor.

**Organizare:** minutul 60 din 100; interval 60–80 (20 min): fluxul G 8, variante 4, exercițiu 5, decizie 3. []{.pace at=60}
:::

---

# Un flux care înregistrează de două ori

**Fluxul G (exemplu didactic, construit pentru verificare):** registrul **nu înregistrează identificatorul cererii** și verifică numai dacă există loc liber; înregistrează, apoi apelează expeditorul.

**Reguli:** o reîncercare (același identificator) nu consumă alt loc și primește același `acceptat`; o cerere nouă a unui participant înscris este refuzată.

**Din I** (2 locuri libere, nicio înscriere), sub G: `înscrie(c1, P1, A)` cu `esec`; apoi reîncercarea `înscrie(c1, P1, A)`; apoi `înscrie(c2, P2, A)`.

Pe hârtie, apoi discutăm: după fiecare cerere, **locurile libere, înscrierile și răspunsul**. Ce regulă încalcă G și la care pas? Dacă G ar verifica și „participantul nu este înscris”, ce ar răspunde la reîncercare?

::: notes
Sub G: prima cerere → `acceptat`, 1 loc, înscrierea lui P1 (confirmare `netrimisă`); reîncercarea este tratată ca o cerere nouă → `acceptat`, 0 locuri, a doua înscriere a lui P1; P2 → `refuz`, deși un singur participant este înscris. G încalcă R5 la pasul 2 și R3 (P1 era deja înscris). Cu verificarea participantului, G ar răspunde `refuz` la reîncercare: corect pentru locuri, dar site-ul ar afișa un refuz pentru o înscriere reușită, fără să poată deosebi „deja înscris” de „fără loc”. Identificatorul cererii este ceea ce face reîncercarea recunoscută.

**Organizare:** 8 min: 3 pe hârtie, 5 discuție. []{.pace dur=8}
:::

---

# Trei variante după `esec`

**R4 (confirmare):** eșecul nu anulează înscrierea. **R6 (graniță):** `esec` nu înseamnă că mesajul nu a ajuns.

| Varianta | Ce face registrul | Presupune | Cost |
|:------|:-------------------------|:------------------|:------------------------|
| **A** | reîncearcă imediat, de cel mult două ori | eșecul poate fi trecător | site-ul așteaptă; mesajul se poate dubla |
| **B** | păstrează `netrimisă`; oferă o operație de retrimitere | cineva o apelează | apelant suplimentar; eșec sau mesaj duplicat |
| **C** | anulează înscrierea | `esec` înseamnă „mesajul nu a ajuns” | încalcă R4; confirmare posibilă fără loc |

Retrimiterea nu garantează livrarea; alegerea stabilește **cine** suportă costul eșecului.

::: notes
A și B respectă R4 și se pot combina: o reîncercare imediată, apoi B. În B, retrimiterea este o operație separată a registrului; cine o apelează (un program periodic, un operator) este de notat. C este fluxul F de mai devreme, privit ca strategie de recuperare. Costurile nu sunt egale: A mută așteptarea la utilizator, B adaugă o responsabilitate nouă în sistem. Nu există variantă fără presupuneri; întrebarea este care presupuneri sunt scrise.

**Organizare:** 4 min. []{.pace dur=4}
:::

---

# Care variantă și cu ce justificare?

**R4 (confirmare):** eșecul nu anulează înscrierea. **R6 (graniță):** `esec` nu stabilește dacă mesajul a ajuns. **R5 (reîncercare):** o cerere deja acceptată primește același `acceptat`.

**Variantele:** A, reîncercare imediată a trimiterii; B, confirmare `netrimisă` și retrimitere printr-o operație separată; C, anularea înscrierii.

Individual, apoi discutăm:

1. Care variante respectă R4 și R6? Ce presupune fiecare despre expeditor?
2. În B, cine răspunde de retrimitere? Ce se întâmplă dacă nimeni nu apelează operația?
3. Ce ar trebui să înregistreze registrul ca A și B să poată fi verificate pe scenarii?

::: notes
1: A și B respectă R4; C nu. A mizează pe un eșec trecător, fără să îl garanteze; B cere un apelant al retrimiterii. Atât A, cât și B pot produce mesaje duplicate. C încalcă R4 indiferent dacă mesajul a ajuns. 2: registrul oferă operația; cine o apelează (un program periodic, un operator) este o decizie de notat, altfel B degenerează în „niciodată”. 3: rezultatul confirmării la fiecare înscriere; pentru A, trasarea arată și câte apeluri s-au făcut. Contorul poate fi local operației; enunțul nu cere un jurnal persistent al încercărilor.

**Organizare:** 5 min: 2 individual, 3 discuție. []{.pace dur=5}
:::

---

# Decizia noastră: varianta B

**R4 (confirmare):** înscrierea rămâne acceptată la `esec`. **R5 (reîncercare):** putem retrimite o confirmare `netrimisă`. **R6 (graniță):** nu cunoaștem livrarea efectivă.

**Alegem B: retrimitere ulterioară**, cu responsabilități explicite:

- `înscrie` apelează expeditorul o dată la acceptare și o dată la reîncercare dacă rezultatul este `netrimisă`;
- propunem `retrimite confirmările()`, apelată de operator, care încearcă o dată fiecare confirmare `netrimisă` și actualizează rezultatul;
- păstrăm înscrierile și locurile; amânarea cere un operator și poate produce mesaje duplicate.

**C contrazice R4.** A rămâne o alternativă; ar cere precizarea numărului de încercări și noi trasări.

::: notes
Aceasta este o decizie de proiectare pentru exemplul nostru, nu o regulă deja cerută de beneficiar. Operația separată este o extensie propusă, apelată secvențial cu înscrierile. Nu adăugăm o stare nouă: `netrimisă` exista deja. Scenariile S1–S6 rămân neschimbate; pentru extensie, din starea de după S2, un apel al operatorului cu răspuns `trimis` schimbă numai rezultatul confirmării. Un al doilea apel nu mai trimite acel mesaj. Dacă operatorul nu intervine, nu promitem retrimiterea; niciun număr finit de încercări nu garantează livrarea.

**Organizare:** 3 min; ajungem la minutul 80. []{.pace dur=3}
:::

---

# Verificăm un flux delegat {.transition}

Un tabel al interacțiunii propus de altcineva spune cine coordonează?

::: notes
Analizăm capturi reale, obținute înaintea cursului: Claude Haiku 4.5, prin Claude Code 2.1.322, la 12 noiembrie 2026, fără unelte și fără contextul proiectului. Evaluatorul (agent AI de revizuire) a primit într-un context nou enunțul, sarcina și răspunsul integral. Am rulat câte două încercări și am ales câte una pentru discuție; selecția nu descrie performanța tipică a modelului. Toate încercările sunt în arhiva capturilor. La curs nu rulăm instrumente.

**Organizare:** minutul 80 din 100; interval 80–95 (15 min): sarcină 3, analiză 4, promptul evaluatorului AI 2, revizuire 4, decizie 2. []{.pace at=80}
:::

---

# Ce cerem asistentului AI?

> Propune tabelul interacțiunii pentru inscrie: pașii în ordine, cine apelează pe cine, ce se trimite, ce se întoarce și ce înregistrează registrul la fiecare pas, inclusiv cazul în care expeditorul răspunde esec și cazul unei reîncercări. Repartizează responsabilitățile între site, registru și expeditor. Precizează ce garantează registrul și ce presupune despre expeditor. Verifică S1–S6 […]. Nu scrie cod. Răspunde în română, în maximum 450 de cuvinte.

**Context:** regulile R1–R7 de mai devreme, integral: identificatorul cererii, acceptarea, confirmarea care nu anulează înscrierea, reîncercarea, granița, efectul limitat.

**Date:** I = 2 locuri libere, nicio înscriere; scenariile S1–S6: înscrierea confirmată, confirmarea eșuată, reîncercarea după eșec și după succes, cererea nouă a unui participant înscris, locurile epuizate.

::: notes
Instrucțiunea este cea trimisă efectiv, urmată de enunțul integral; omisiunea marcată din citat este enumerarea datelor de verificat pentru fiecare scenariu. Un evaluator (agent AI de revizuire) a primit apoi și sarcina exactă.

**Organizare:** 3 min. []{.pace dur=3}
:::

---

# Ce propune analistul AI?

**Analistul AI — Claude Haiku 4.5, captură din 12 noiembrie 2026; fragmente:**

> **4. Acceptare și solicitare confirmare**
> - Registru consumă un loc […]
> - Registru înregistrează: `(c, p, a, stare_confirmare = pendentă)`
> - Registru apelează Expeditor: `trimite(mesaj_pentru_p)` […]
>
> **5. Procesare reîncercare** […] Dacă `(p, a) ≠ (p', a')` → Pasul 6 (refuz pentru protecție) […]
>
> **Registrul garantează:** O cerere c acceptată modifică starea **o singură dată** (atomicitate) […]

**Reguli:** înscrierea se înregistrează la acceptare, iar eșecul confirmării nu o anulează — R4 (confirmare); o reîncercare primește același `acceptat` — R5 (reîncercare); enunțul nu spune ce se întâmplă cu un identificator refolosit pentru alt participant sau atelier.

În ce ordine sunt înregistrarea și apelul expeditorului? **Refuzul „pentru protecție” este cerut de enunț?**

::: notes
Ordinea este cea cerută: locul consumat și înscrierea înregistrată (cu confirmarea în așteptare, numită „pendentă”) înaintea apelului expeditorului; S1–S6 din răspunsul integral sunt corecte. Refuzul de la pasul 5 este o adăugire: enunțul nu descrie un identificator refolosit cu alt conținut; adăugirea este defensabilă, dar trebuie etichetată ca întrebare pentru beneficiar, nu ca regulă. Termenul „atomicitate” este folosit greșit: atomicitatea cere ca efectele unei operații să se producă integral sau deloc. Evitarea unei înscrieri duplicate la reîncercare privește idempotența efectului asupra înscrierilor. În plus, notificarea se poate modifica la reîncercare; nu întregul registru rămâne neschimbat. Cealaltă analiză păstrată înregistrează înscrierea abia după răspunsul expeditorului.

**Organizare:** 4 min: răspuns individual, apoi discuție. []{.pace dur=4}
:::

---

# Promptul evaluatorului AI

**Evaluator (agent AI de revizuire), context nou:** enunțul, sarcina analistului AI și răspunsul integral; fără observațiile noastre.

**Instrucțiunea exactă, la începutul promptului:**

> Ești evaluator (agent AI de revizuire). Verifică propunerea exclusiv față de enunț și sarcină. Pentru fiecare observație indică fragmentul, regula și un scenariu concret, cu starea de pornire și rezultatul așteptat. Verifică ordinea pașilor, momentul înregistrării înscrierii față de apelul expeditorului, tratarea răspunsului esec, reîncercarea, consumul locurilor, responsabilitățile și presupunerile despre expeditor. Confirmă și afirmațiile corecte; nu presupune că trebuie să existe greșeli. Nu scrie cod. Răspunde în română, în maximum 350 de cuvinte.

**Predicție, înainte de a vedea răspunsul:** site-ul păstrează identificatorul și conținutul la reîncercare, iar propunerea adaugă un refuz pentru același identificator cu alt conținut, caz nespecificat în enunț. Va semnala evaluatorul AI această adăugire?

::: notes
Instrucțiunea cere verificarea ordinii pașilor și a presupunerilor; nu îi semnalăm ce am observat noi și nu îi cerem un număr minim de defecte.

**Sursă:** instrucțiunea integrală din `evaluator-instructiune.md`; intrarea completă în `evaluator-prompt.md`, arhiva din 12 noiembrie 2026.

**Organizare:** 2 min; predicții prin ridicarea mâinii, fără discuție. []{.pace dur=2}
:::

---

# O revizuire care lasă decizia oamenilor

**Evaluatorul AI — Claude Haiku 4.5, captură din 12 noiembrie 2026; fragmente:**

> Pasul 4 respectă R4: *după* o acceptare (înregistrare), registrul apelează expeditorul; eșecul confirmării nu anulează înscrierea. ✓
>
> ### 1. Protecție ne-modelată în Pasul 5 […] Fără această clarificare, protecția e rezonabilă dar **depășeşte specificația**.
>
> Singura abatere de la enunț este protecția în Pasul 5 […], care e **plauzibilă dar non-specificată**.

**Reguli:** înregistrarea precede apelul expeditorului, iar eșecul nu anulează înscrierea — R4 (confirmare); identificatorul cererii este generat de site, unic pentru fiecare cerere nouă — R2 (cerere); enunțul nu descrie refolosirea lui cu alt conținut.

Observația 1 este susținută de enunț? **Ce rămâne de decis, și cine decide?**

::: notes
Observația este corectă: regulile nu descriu cazul, deci refuzul este o propunere, nu o cerință. Evaluatorul AI nu decide în locul nostru: spune că protecția este plauzibilă și că enunțul ar fi trebuit să o precizeze. Rămân de decis două lucruri, de către oameni: dacă acceptăm adăugirea (și o ducem beneficiarului ca întrebare) și dacă interpretarea „poate” → „va reapela” din R5 este cea dorită, semnalată tot de evaluator. Cealaltă revizuire păstrată confirmă adăugirea ca „validare defensivă rezonabilă”, fără să o deosebească de reguli. O revizuire bună nu este una care găsește multe greșeli, ci una care spune ce este susținut și ce nu.

**Organizare:** 4 min: răspunsuri individuale, apoi discuție. []{.pace dur=4}
:::

---

# Decizia noastră

**Păstrăm** din propunere ordinea pașilor (înregistrare, apoi apelul expeditorului), reîncercarea fără alt loc, refuzul fără apel și verificarea S1–S6: toate sunt susținute de reguli.

**Acceptăm** observația evaluatorului AI: refuzul unui identificator refolosit cu alt conținut nu este în enunț. Îl păstrăm **ca întrebare pentru beneficiar**, nu ca regulă; până la răspuns, site-ul rămâne responsabil să nu refolosească identificatorul.

**Corectăm termenul:** evitarea unei înscrieri duplicate privește **idempotența** efectului asupra înscrierilor. **Atomicitatea** înseamnă că efectele operației se produc integral sau deloc. Notificarea se poate modifica la reîncercare; nu promitem atomicitate între registru și expeditor.

::: notes
Verdictul aparține oamenilor și se sprijină pe regulă și scenariu. O propunere bună și o revizuire bună nu scurtează decizia: ele o fac verificabilă. Întrebarea pentru beneficiar se notează cu fișierele pe care le-ar atinge, ca în `docs/open-questions.md` pentru curs.

**Organizare:** 2 min; încheierea etapei la minutul 95. []{.pace dur=2}
:::

---

# Transferăm granița {.transition}

Aceleași întrebări, alt serviciu extern.

::: notes
Transferăm metoda: granița, presupunerile, ce garantăm local; nu regulile centrului cultural.

**Organizare:** minutul 95 din 100; interval 95–100 (5 min): exercițiu și încheiere. []{.pace at=95}
:::

---

# Diplomele și tipografia

**Enunț nou:** secretariatul eliberează diplome și cere unei **tipografii externe** tipărirea fiecăreia, prin `comanda(diploma)`, care întoarce `primit` sau `esec`. O diplomă eliberată rămâne eliberată, indiferent de tipărire. Secretariatul poate retrimite o comandă.

Scrieți, în câte o propoziție:

1. Ce componente proiectăm și ce componentă este în afara graniței.
2. Ce presupunem despre tipografie și ce **nu** presupunem când răspunde `esec`.
3. Ce garantăm local după `esec`? Ajunge un identificator al comenzii ca să evităm două tipăriri sau trebuie un contract suplimentar cu tipografia?

::: notes
1: registrul diplomelor eliberate și comenzile sunt în interior; tipografia, în exterior. 2: presupunem că răspunde `primit` sau `esec`; nu presupunem că `esec` înseamnă că nu tipărește. 3: diploma rămâne eliberată; propunem înregistrarea rezultatului `esec`, fără să deducem că nu s-a tipărit. Același identificator permite recunoașterea retrimiterii, dar nu garantează singur o singură tipărire. Tipografia trebuie să promită prin contract recunoașterea identificatorului și evitarea repetării tipăririi; enunțul nu oferă această garanție. La laborator reunim ciclul de viață din cursul 7 cu interacțiunea de azi. Feedbackul pentru proiect poate fi cerut oricând.

**Organizare:** 5 min, încheiere la minutul 100. []{.pace dur=5}
:::
