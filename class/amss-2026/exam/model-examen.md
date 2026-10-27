---
title: "AMSS 2026/2027 — Model de examen"
author: "Traian-Florin Șerbănuță"
lang: ro-RO
---

# Despre acest model

Modelul arată tipul întrebărilor de la examenul individual, notat cu **3 puncte** din nota finală. Examenul verifică raționamentul despre probleme și artefacte date: cerințe, modele, contracte, stări, repartizarea responsabilităților și validare. Nu verifică notații, instrumente sau cunoștințe despre un anumit model AI.

- **24 de întrebări**, fiecare cu **un singur răspuns corect** din patru variante. Durata propusă este de **60 de minute**; numărul întrebărilor și durata se confirmă pe Teams înaintea examenului.
- Nota examenului: **3 × (răspunsuri corecte) / 24**. Un răspuns greșit sau lipsă nu se depunctează.
- La examen, fiecare student primește o variantă proprie, cu o foaie de răspuns corectată automat. Întrebările unui caz rămân împreună și în aceeași ordine, dar variantele de răspuns apar în altă ordine pe fiecare foaie.
- Lucrați fără materiale și fără calculator. Toate datele necesare sunt în enunțuri; nu presupuneți reguli nedate.
- Fiecare întrebare se rezolvă independent de celelalte. Dacă nu se precizează altfel, fiecare întrebare pornește din starea descrisă în enunțul cazului sau în întrebare.
- Situațiile, numele și sumele sunt inventate pentru examen.

La restanță și la mărire, examenul are mai multe întrebări din aceleași domenii și valorează **9 puncte**, plus punctul din oficiu.

---

# Cazul A — Rezervarea terenurilor de tenis

Un club are trei terenuri. Membrii rezervă un teren pentru o oră întreagă, între 8:00 și 22:00.

- **R1:** un membru poate avea cel mult două rezervări viitoare.
- **R2:** o rezervare se face cu cel mult 7 zile înainte.
- **R3:** anularea este gratuită dacă se face cu **cel puțin 24 de ore** înaintea orei rezervate; altfel rezervarea rămâne taxată.
- **R4:** clubul confirmă sau refuză o cerere de rezervare în cel mult 2 secunde, pentru 95% dintre cereri.

Administratorul adaugă: „Membrii se plâng că nu găsesc terenuri libere seara.”

**1.** Care afirmație se sprijină pe o **presupunere** care nu rezultă din enunț?

A. Un membru poate avea cel mult două rezervări viitoare.

B. O rezervare durează o oră întreagă.

C. O anulare făcută cu 30 de ore înainte este gratuită.

D. Membrii nu găsesc terenuri seara pentru că unii rezervă terenuri pe care nu le folosesc.

**2.** Azi este marți, ora 18:30. Membrul M are o rezervare **azi, 18:00–19:00**, și una joi. M cere acum o rezervare pentru sâmbătă, la 10:00. Ce informație lipsește pentru a decide dacă cererea respectă R1?

A. Dacă o rezervare aflată în desfășurare se mai numără printre rezervările viitoare.

B. Dacă sâmbătă la 10:00 se află în intervalul permis de R2.

C. Dacă anularea rezervării de joi ar fi gratuită.

D. Dacă răspunsul la cerere sosește în cel mult 2 secunde.

**3.** O rezervare este pentru **sâmbătă, ora 10:00**. Care scenariu verifică R3 **exact la limită**, cu rezultatul așteptat corect?

A. Anulare joi la 10:00 → gratuită.

B. Anulare vineri la 10:00 → taxată.

C. Anulare vineri la 10:00 → gratuită.

D. Anulare vineri la 11:00 → gratuită.

**4.** Administratorul cere ulterior: „Membrii cu abonament premium pot avea cel mult patru rezervări viitoare.” Ce efect are cererea asupra enunțului?

A. Modifică R1 și cere o informație nouă despre membri; scenariile cu a treia sau a patra rezervare se reverifică.

B. Reformulează R1 fără să schimbe rezultatul vreunei cereri; scenariile existente rămân valabile.

C. Este o cerință de calitate, de același tip cu R4, deci nu schimbă regulile de rezervare.

D. Modifică numai R2, pentru că membrii cu mai multe rezervări au nevoie de o fereastră mai lungă.

---

# Cazul B — Registrul arborilor din parcuri

Primăria ține un registru al arborilor din parcurile orașului.

- **R1:** fiecare arbore are un număr de inventar unic, care nu se schimbă și nu se refolosește.
- **R2:** un arbore aparține unei specii, de exemplu „tei argintiu”; mai mulți arbori pot avea aceeași specie.
- **R3:** un arbore se află într-un singur parc la un moment dat. Poate fi mutat în alt parc; registrul păstrează parcurile prin care a trecut.
- **R4:** o inspecție privește un singur arbore, are o dată și constată o stare: sănătos, de supravegheat sau periculos. Un arbore poate avea oricâte inspecții, inclusiv niciuna.
- **R5:** un arbore tăiat rămâne în registru, marcat ca tăiat, împreună cu inspecțiile lui.

**5.** Doi arbori din același parc au aceeași specie, aceeași înălțime și au fost plantați în aceeași zi. Ce îi distinge în registru?

A. Combinația dintre specie, parc și data plantării.

B. Numărul de inventar al fiecăruia.

C. Ordinea în care au fost inspectați.

D. Nimic: în registru sunt același arbore.

**6.** Un model propune o singură înregistrare pentru fiecare arbore, fără o listă de inspecții: *număr de inventar, specie, parcurile prin care a trecut (cu datele mutărilor), starea constatată la ultima inspecție („necunoscută” înaintea primei inspecții), tăiat (da/nu)*. În care situație modelul pierde informație cerută de enunț?

A. Doi arbori diferiți au aceeași specie.

B. Arborele 105 este găsit sănătos în martie și periculos în septembrie.

C. Un arbore plantat ieri, încă neinspectat, este adăugat în registru.

D. Arborele 105 este mutat din parcul Tineretului în parcul Titan.

**7.** Care afirmație despre inspecții este susținută de enunț?

A. O inspecție poate privi mai mulți arbori din același parc.

B. La tăierea unui arbore, inspecțiile lui se șterg.

C. După mutarea unui arbore, inspecțiile lui se păstrează; mutarea nu creează un arbore nou.

D. Un arbore nu poate fi înregistrat înaintea primei inspecții.

**8.** Arborele 212 a fost tăiat. În același loc se plantează un tei nou. Ce număr de inventar primește teiul nou?

A. 212, pentru că ocupă același loc.

B. 212, după ce arborele tăiat este șters din registru.

C. Niciunul, până la prima inspecție.

D. Un număr nefolosit până atunci; 212 rămâne la arborele tăiat.

---

# Cazul C — Cardul de călătorie

Un card de călătorie are un **sold** în lei (număr întreg) și o **stare**: activ sau blocat. Operațiile se apelează pe rând, numai pentru carduri cunoscute, cu sume întregi.

| Operație | Când reușește și ce face | Altfel |
|---|---|---|
| `incarca(c, s)` | c este activ și 1 ≤ s ≤ 200: soldul crește cu s; întoarce `incarcat`. | `refuz`, fără nicio modificare. |
| `valideaza(c)` | c este activ și soldul ≥ 3: soldul scade cu 3; întoarce `calatorie`. | `refuz`, fără nicio modificare. |
| `blocheaza(c)` | Întotdeauna: c devine blocat, soldul se păstrează; întoarce `blocat`. | — |

**Invariant:** soldul fiecărui card este ≥ 0. Nicio operație nu modifică alte carduri.

**9.** Cardul K este activ și are soldul 2. Se apelează `valideaza(K)`. Ce rezultat respectă regulile?

A. `calatorie`; K activ, sold −1.

B. `calatorie`; K activ, sold 0.

C. `refuz`; K activ, sold 2.

D. `refuz`; K activ, sold 0.

**10.** Ce rol are condiția „soldul ≥ 3” în contractul lui `valideaza`?

A. Este o condiție de succes: când nu este îndeplinită, contractul promite `refuz` fără nicio modificare.

B. Este o precondiție: apelantul trebuie să o asigure, iar altfel rezultatul nu este specificat.

C. Este un invariant pe care îl respectă toate cardurile, în orice stare.

D. Este o postcondiție a lui `incarca`, garantată după orice încărcare reușită.

**11.** O implementare propusă pentru `incarca` este: *„dacă c este activ: soldul crește cu s și întoarce `incarcat`; altfel întoarce `refuz`”*. Care apel arată că implementarea încalcă contractul, **deși invariantul rămâne adevărat**?

A. K activ, sold 10: `incarca(K, 50)`.

B. K blocat, sold 10: `incarca(K, 50)`.

C. K activ, sold 0: `incarca(K, -5)`.

D. K activ, sold 10: `incarca(K, 250)`.

**12.** O implementare greșită a lui `valideaza` are o singură abatere de la contract: când refuză, blochează cardul. Rezultatul întors și soldul sunt cele prevăzute de contract. Cardul K este activ și are soldul 2; se apelează `valideaza(K)`. Ce verificare deosebește implementarea corectă de cea greșită?

A. Rezultatul întors este `refuz`.

B. K rămâne activ după apel.

C. Soldul lui K după apel este 2.

D. Soldul lui K după apel este ≥ 0.

---

# Cazul D — Cererea de decontare

O cerere de decontare a unei cheltuieli începe în starea **Ciornă**. Tabelul conține **toate** tranzițiile permise:

| Stare curentă | Eveniment | Condiție | Stare următoare |
|---|---|---|---|
| Ciornă | trimite | suma > 0 și documentele sunt atașate | Trimisă |
| Ciornă | renunță | — | Anulată |
| Trimisă | aprobă | — | Aprobată |
| Trimisă | respinge | — | Ciornă |
| Trimisă | renunță | — | Anulată |
| Aprobată | plătește | — | Plătită |

Un eveniment fără tranziție în starea curentă, sau cu condiția neîndeplinită, este **respins** și nu schimbă starea. Evenimentele se procesează pe rând. **Plătită** și **Anulată** sunt stări finale intenționate. Suma și documentele nu se schimbă pe parcursul unei secvențe.

**13.** Cererea este în Ciornă, are suma 120 și documentele atașate. Urmează evenimentele: trimite, respinge, trimite, aprobă, renunță. Care sunt starea finală și rezultatul ultimului eveniment?

A. Anulată; ultimul eveniment reușește.

B. Aprobată; ultimul eveniment este respins.

C. Plătită; ultimul eveniment este respins.

D. Ciornă; ultimul eveniment este respins.

**14.** Cererea este în Ciornă, are suma 120, dar **nu** are documente atașate. Ce produce evenimentul trimite?

A. Cererea trece în Trimisă, iar documentele se cer ulterior.

B. Cererea trece în Anulată.

C. Cererea trece în Trimisă, pentru că suma este pozitivă.

D. Evenimentul este respins; cererea rămâne în Ciornă.

**15.** Cererea este în Ciornă și îndeplinește condiția lui trimite. Care secvență o aduce în **Plătită**?

A. trimite, aprobă, plătește.

B. trimite, plătește.

C. aprobă, trimite, plătește.

D. trimite, respinge, aprobă, plătește.

**16.** Un contabil observă: „Nu se mai poate renunța la o cerere aprobată.” Ce afirmație este susținută de tabel?

A. Aprobată este o stare de blocaj, pentru că nu are nicio tranziție de ieșire.

B. Tabelul este incomplet, pentru că orice stare trebuie să permită evenimentul renunță.

C. Aprobată nu este finală: singura ieșire este plătește, iar renunță este respins acolo.

D. Aprobată este o stare finală intenționată, ca Plătită și Anulată.

---

# Cazul E — Cota de întreținere

O asociație de proprietari calculează lunar cota fiecărui apartament.

- **R1:** cheltuielile comune ale lunii se împart proporțional cu suprafața apartamentelor; cota se rotunjește la bani.
- **R2:** cota apare în **lista lunară** afișată la avizier și în **portalul** prin care proprietarii plătesc. Ambele trebuie să arate aceeași sumă pentru același apartament și aceeași lună; formatul afișării poate diferi.

Două organizări sunt în discuție:

- **Varianta X:** lista și portalul calculează fiecare cota după formula din R1.
- **Varianta Y:** lista și portalul apelează aceeași operație `cota(apartament, luna)` și își formatează singure afișarea.

**17.** Asociația vrea ca fiecare regulă de calcul să fie scrisă într-un singur loc. În varianta Y, unde trebuie aplicată rotunjirea la bani?

A. În fiecare canal, la afișare, după aceeași regulă.

B. În portal, pentru că acolo se încasează banii.

C. În listă, pentru că este documentul afișat oficial.

D. În operația comună, care întoarce suma finală de plată.

**18.** Asociația decide: „Apartamentele cu centrală proprie nu plătesc partea de încălzire din cheltuielile comune.” Unde se schimbă regula de calcul?

A. În X: în listă și în portal, care trebuie să rămână concordante; în Y: în operația comună.

B. În X: numai în listă; în Y: în listă și în portal, care apelează operația.

C. În X și în Y: numai în portal, pentru că acolo se plătește cota.

D. În Y: nicăieri, pentru că operația comună nu depinde de canale.

**19.** În varianta Y, portalul transmite operației comune obiectul care descrie **pagina de plată**, iar operația citește din el apartamentul și luna. Care este consecința?

A. Niciuna: cât timp suma rămâne aceeași, dependențele operației nu contează.

B. Cuplarea scade: operația primește de la portal toate datele de care ar putea avea nevoie.

C. Operația depinde de structura paginii de plată; lista ar trebui să construiască un asemenea obiect ca să o apeleze.

D. Coeziunea operației crește: calculul și citirea paginii de plată sunt acum în același loc.

**20.** Un coleg propune ca operația comună să fie împărțită în patru componente: suprafețe, cheltuieli, împărțirea cheltuielilor și rotunjire. Asociația își schimbă anual regulile de împărțire; rotunjirea nu s-a schimbat niciodată. Ce argument este susținut de aceste date?

A. Cele patru componente sunt justificate, pentru că fiecare va avea o singură sarcină.

B. Izolarea regulilor de împărțire este justificată de schimbările anuale; rotunjirea nu are un motiv dat.

C. Nicio separare nu este justificată, pentru că ambele canale trebuie să arate aceeași sumă.

D. Rotunjirea trebuie separată prima, pentru că afectează sumele afișate în ambele canale.

---

# Cazul F — Sasul unui laborator

Un sas are două uși: **U1**, spre hol, și **U2**, spre laborator. Fiecare ușă este închisă (Î) sau deschisă (D); starea sasului se scrie (U1, U2), iar starea inițială este (Î, Î). Modelul are numai aceste acțiuni, executate pe rând, și presupune că ușile execută comenzile:

- `deschide(Ui)`: permisă numai dacă Ui este închisă **și cealaltă ușă este închisă**;
- `inchide(Ui)`: permisă numai dacă Ui este deschisă.

**Proprietatea P:** în nicio stare accesibilă cele două uși nu sunt deschise simultan.

**21.** O versiune greșită a modelului permite `deschide(U2)` și când U1 este deschisă. Explorarea modelului găsește traseul (Î, Î) → `deschide(U1)` → (D, Î) → `deschide(U2)` → (D, D). Ce stabilește acest traseu?

A. Că proprietatea P este încălcată în modelul greșit, printr-o execuție concretă.

B. Că sasul real din laborator va avea accidente.

C. Că modelul greșit are o stare de blocaj.

D. Că proprietatea P este adevărată, pentru că starea inițială o respectă.

**22.** Modelului corect i se adaugă acțiunea `alarma()`, permisă în orice stare a ușilor: ambele uși se închid, iar sasul intră în starea **Blocat**, în care nu mai este permisă nicio acțiune. Specificația spune că sasul rămâne blocat până la o intervenție manuală, care nu face parte din model. Explorarea raportează: „Starea Blocat nu are acțiuni permise.” Ce concluzie este corectă?

A. Este un blocaj neintenționat (deadlock); modelul trebuie corectat.

B. Proprietatea P este încălcată în starea Blocat, deci alarma este greșită.

C. Explorarea este greșită: orice stare a unui model trebuie să aibă o acțiune.

D. Este o stare finală intenționată; verificăm că se ajunge în ea numai prin `alarma()`.

**23.** Explorarea **completă** a modelului corect (fără `alarma()`) vizitează toate stările accesibile și nu găsește nicio încălcare a lui P. Ce stabilește această explorare, singură?

A. Că ușile sasului real nu vor fi niciodată deschise simultan.

B. Că nu rezultă nimic, pentru că explorarea nu a folosit sasul real.

C. Că P este adevărată în toate execuțiile acestui model finit, în ipotezele lui.

D. Că P este adevărată și pentru un sas cu trei uși, al cărui model nu a fost explorat.

**24.** Apare o cerință nouă: „U2 se poate deschide numai după ce U1 a stat închisă cel puțin un minut.” Ce trebuie revizuit?

A. Numai textul afișat lângă U2; modelul și proprietatea P rămân neschimbate.

B. Modelul reține timpul de la închiderea lui U1; `deschide(U2)` primește o condiție nouă; P se reverifică.

C. Nimic: proprietatea P garantează deja că U1 stă închisă un minut.

D. Numai condiția lui `deschide(U1)`, care trebuie să aștepte un minut.
