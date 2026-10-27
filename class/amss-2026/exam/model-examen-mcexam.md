# AMSS 2026/2027 — Model de examen

## Încadrarea problemei și cerințe

### Rezervarea terenurilor de tenis

Un club are trei terenuri. Membrii rezervă un teren pentru o oră întreagă, între 8:00 și 22:00.

- **R1:** un membru poate avea cel mult două rezervări viitoare.
- **R2:** o rezervare se face cu cel mult 7 zile înainte.
- **R3:** anularea este gratuită dacă se face cu **cel puțin 24 de ore** înaintea orei rezervate; altfel rezervarea rămâne taxată.
- **R4:** clubul confirmă sau refuză o cerere de rezervare în cel mult 2 secunde, pentru 95% dintre cereri.

Administratorul adaugă: „Membrii se plâng că nu găsesc terenuri libere seara.”

#### Care afirmație se sprijină pe o **presupunere** care nu rezultă din enunț?
- [ ] Un membru poate avea cel mult două rezervări viitoare.
- [ ] O rezervare durează o oră întreagă.
- [ ] O anulare făcută cu 30 de ore înainte este gratuită.
- [x] Membrii nu găsesc terenuri seara pentru că unii rezervă terenuri pe care nu le folosesc.

#### Azi este marți, ora 18:30. Membrul M are o rezervare **azi, 18:00–19:00**, și una joi. M cere acum o rezervare pentru sâmbătă, la 10:00. Ce informație lipsește pentru a decide dacă cererea respectă R1?
- [x] Dacă o rezervare aflată în desfășurare se mai numără printre rezervările viitoare.
- [ ] Dacă sâmbătă la 10:00 se află în intervalul permis de R2.
- [ ] Dacă anularea rezervării de joi ar fi gratuită.
- [ ] Dacă răspunsul la cerere sosește în cel mult 2 secunde.

#### O rezervare este pentru **sâmbătă, ora 10:00**. Care scenariu verifică R3 **exact la limită**, cu rezultatul așteptat corect?
- [ ] Anulare joi la 10:00 → gratuită.
- [ ] Anulare vineri la 10:00 → taxată.
- [x] Anulare vineri la 10:00 → gratuită.
- [ ] Anulare vineri la 11:00 → gratuită.

#### Administratorul cere ulterior: „Membrii cu abonament premium pot avea cel mult patru rezervări viitoare.” Ce efect are cererea asupra enunțului?
- [x] Modifică R1 și cere o informație nouă despre membri; scenariile cu a treia sau a patra rezervare se reverifică.
- [ ] Reformulează R1 fără să schimbe rezultatul vreunei cereri; scenariile existente rămân valabile.
- [ ] Este o cerință de calitate, de același tip cu R4, deci nu schimbă regulile de rezervare.
- [ ] Modifică numai R2, pentru că membrii cu mai multe rezervări au nevoie de o fereastră mai lungă.

## Modelarea domeniului

### Registrul arborilor din parcuri

Primăria ține un registru al arborilor din parcurile orașului.

- **R1:** fiecare arbore are un număr de inventar unic, care nu se schimbă și nu se refolosește.
- **R2:** un arbore aparține unei specii, de exemplu „tei argintiu”; mai mulți arbori pot avea aceeași specie.
- **R3:** un arbore se află într-un singur parc la un moment dat. Poate fi mutat în alt parc; registrul păstrează parcurile prin care a trecut.
- **R4:** o inspecție privește un singur arbore, are o dată și constată o stare: sănătos, de supravegheat sau periculos. Un arbore poate avea oricâte inspecții, inclusiv niciuna.
- **R5:** un arbore tăiat rămâne în registru, marcat ca tăiat, împreună cu inspecțiile lui.

#### Doi arbori din același parc au aceeași specie, aceeași înălțime și au fost plantați în aceeași zi. Ce îi distinge în registru?
- [ ] Combinația dintre specie, parc și data plantării.
- [x] Numărul de inventar al fiecăruia.
- [ ] Ordinea în care au fost inspectați.
- [ ] Nimic: în registru sunt același arbore.

#### Un model propune o singură înregistrare pentru fiecare arbore, fără o listă de inspecții: *număr de inventar, specie, parcurile prin care a trecut (cu datele mutărilor), starea constatată la ultima inspecție („necunoscută” înaintea primei inspecții), tăiat (da/nu)*. În care situație modelul pierde informație cerută de enunț?
- [ ] Doi arbori diferiți au aceeași specie.
- [x] Arborele 105 este găsit sănătos în martie și periculos în septembrie.
- [ ] Un arbore plantat ieri, încă neinspectat, este adăugat în registru.
- [ ] Arborele 105 este mutat din parcul Tineretului în parcul Titan.

#### Care afirmație despre inspecții este susținută de enunț?
- [ ] O inspecție poate privi mai mulți arbori din același parc.
- [ ] La tăierea unui arbore, inspecțiile lui se șterg.
- [x] După mutarea unui arbore, inspecțiile lui se păstrează; mutarea nu creează un arbore nou.
- [ ] Un arbore nu poate fi înregistrat înaintea primei inspecții.

#### Arborele 212 a fost tăiat. În același loc se plantează un tei nou. Ce număr de inventar primește teiul nou?
- [ ] 212, pentru că ocupă același loc.
- [ ] 212, după ce arborele tăiat este șters din registru.
- [ ] Niciunul, până la prima inspecție.
- [x] Un număr nefolosit până atunci; 212 rămâne la arborele tăiat.

## Contracte și invarianți

### Cardul de călătorie

Un card de călătorie are un **sold** în lei (număr întreg) și o **stare**: activ sau blocat. Operațiile se apelează pe rând, numai pentru carduri cunoscute, cu sume întregi.

| Operație | Când reușește și ce face | Altfel |
|---|---|---|
| `incarca(c, s)` | c este activ și 1 ≤ s ≤ 200: soldul crește cu s; întoarce `incarcat`. | `refuz`, fără nicio modificare. |
| `valideaza(c)` | c este activ și soldul ≥ 3: soldul scade cu 3; întoarce `calatorie`. | `refuz`, fără nicio modificare. |
| `blocheaza(c)` | Întotdeauna: c devine blocat, soldul se păstrează; întoarce `blocat`. | — |

**Invariant:** soldul fiecărui card este ≥ 0. Nicio operație nu modifică alte carduri.

#### Cardul K este activ și are soldul 2. Se apelează `valideaza(K)`. Ce rezultat respectă regulile?
- [ ] `calatorie`; K activ, sold −1.
- [ ] `calatorie`; K activ, sold 0.
- [x] `refuz`; K activ, sold 2.
- [ ] `refuz`; K activ, sold 0.

#### Ce rol are condiția „soldul ≥ 3” în contractul lui `valideaza`?
- [x] Este o condiție de succes: când nu este îndeplinită, contractul promite `refuz` fără nicio modificare.
- [ ] Este o precondiție: apelantul trebuie să o asigure, iar altfel rezultatul nu este specificat.
- [ ] Este un invariant pe care îl respectă toate cardurile, în orice stare.
- [ ] Este o postcondiție a lui `incarca`, garantată după orice încărcare reușită.

#### O implementare propusă pentru `incarca` este: *„dacă c este activ: soldul crește cu s și întoarce `incarcat`; altfel întoarce `refuz`”*. Care apel arată că implementarea încalcă contractul, **deși invariantul rămâne adevărat**?
- [ ] K activ, sold 10: `incarca(K, 50)`.
- [ ] K blocat, sold 10: `incarca(K, 50)`.
- [ ] K activ, sold 0: `incarca(K, -5)`.
- [x] K activ, sold 10: `incarca(K, 250)`.

#### O implementare greșită a lui `valideaza` are o singură abatere de la contract: când refuză, blochează cardul. Rezultatul întors și soldul sunt cele prevăzute de contract. Cardul K este activ și are soldul 2; se apelează `valideaza(K)`. Ce verificare deosebește implementarea corectă de cea greșită?
- [ ] Rezultatul întors este `refuz`.
- [x] K rămâne activ după apel.
- [ ] Soldul lui K după apel este 2.
- [ ] Soldul lui K după apel este ≥ 0.

## Stări și comportament

### Cererea de decontare

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

#### Cererea este în Ciornă, are suma 120 și documentele atașate. Urmează evenimentele: trimite, respinge, trimite, aprobă, renunță. Care sunt starea finală și rezultatul ultimului eveniment?
- [ ] Anulată; ultimul eveniment reușește.
- [x] Aprobată; ultimul eveniment este respins.
- [ ] Plătită; ultimul eveniment este respins.
- [ ] Ciornă; ultimul eveniment este respins.

#### Cererea este în Ciornă, are suma 120, dar **nu** are documente atașate. Ce produce evenimentul trimite?
- [ ] Cererea trece în Trimisă, iar documentele se cer ulterior.
- [ ] Cererea trece în Anulată.
- [ ] Cererea trece în Trimisă, pentru că suma este pozitivă.
- [x] Evenimentul este respins; cererea rămâne în Ciornă.

#### Cererea este în Ciornă și îndeplinește condiția lui trimite. Care secvență o aduce în **Plătită**?
- [x] trimite, aprobă, plătește.
- [ ] trimite, plătește.
- [ ] aprobă, trimite, plătește.
- [ ] trimite, respinge, aprobă, plătește.

#### Un contabil observă: „Nu se mai poate renunța la o cerere aprobată.” Ce afirmație este susținută de tabel?
- [ ] Aprobată este o stare de blocaj, pentru că nu are nicio tranziție de ieșire.
- [ ] Tabelul este incomplet, pentru că orice stare trebuie să permită evenimentul renunță.
- [x] Aprobată nu este finală: singura ieșire este plătește, iar renunță este respins acolo.
- [ ] Aprobată este o stare finală intenționată, ca Plătită și Anulată.

## Responsabilități, coeziune și cuplare

### Cota de întreținere

O asociație de proprietari calculează lunar cota fiecărui apartament.

- **R1:** cheltuielile comune ale lunii se împart proporțional cu suprafața apartamentelor; cota se rotunjește la bani.
- **R2:** cota apare în **lista lunară** afișată la avizier și în **portalul** prin care proprietarii plătesc. Ambele trebuie să arate aceeași sumă pentru același apartament și aceeași lună; formatul afișării poate diferi.

Două organizări sunt în discuție:

- **Varianta X:** lista și portalul calculează fiecare cota după formula din R1.
- **Varianta Y:** lista și portalul apelează aceeași operație `cota(apartament, luna)` și își formatează singure afișarea.

#### Asociația vrea ca fiecare regulă de calcul să fie scrisă într-un singur loc. În varianta Y, unde trebuie aplicată rotunjirea la bani?
- [ ] În fiecare canal, la afișare, după aceeași regulă.
- [ ] În portal, pentru că acolo se încasează banii.
- [ ] În listă, pentru că este documentul afișat oficial.
- [x] În operația comună, care întoarce suma finală de plată.

#### Asociația decide: „Apartamentele cu centrală proprie nu plătesc partea de încălzire din cheltuielile comune.” Unde se schimbă regula de calcul?
- [x] În X: în listă și în portal, care trebuie să rămână concordante; în Y: în operația comună.
- [ ] În X: numai în listă; în Y: în listă și în portal, care apelează operația.
- [ ] În X și în Y: numai în portal, pentru că acolo se plătește cota.
- [ ] În Y: nicăieri, pentru că operația comună nu depinde de canale.

#### În varianta Y, portalul transmite operației comune obiectul care descrie **pagina de plată**, iar operația citește din el apartamentul și luna. Care este consecința?
- [ ] Niciuna: cât timp suma rămâne aceeași, dependențele operației nu contează.
- [ ] Cuplarea scade: operația primește de la portal toate datele de care ar putea avea nevoie.
- [x] Operația depinde de structura paginii de plată; lista ar trebui să construiască un asemenea obiect ca să o apeleze.
- [ ] Coeziunea operației crește: calculul și citirea paginii de plată sunt acum în același loc.

#### Un coleg propune ca operația comună să fie împărțită în patru componente: suprafețe, cheltuieli, împărțirea cheltuielilor și rotunjire. Asociația își schimbă anual regulile de împărțire; rotunjirea nu s-a schimbat niciodată. Ce argument este susținut de aceste date?
- [ ] Cele patru componente sunt justificate, pentru că fiecare va avea o singură sarcină.
- [x] Izolarea regulilor de împărțire este justificată de schimbările anuale; rotunjirea nu are un motiv dat.
- [ ] Nicio separare nu este justificată, pentru că ambele canale trebuie să arate aceeași sumă.
- [ ] Rotunjirea trebuie separată prima, pentru că afectează sumele afișate în ambele canale.

## Validarea modelului și schimbarea

### Sasul unui laborator

Un sas are două uși: **U1**, spre hol, și **U2**, spre laborator. Fiecare ușă este închisă (Î) sau deschisă (D); starea sasului se scrie (U1, U2), iar starea inițială este (Î, Î). Modelul are numai aceste acțiuni, executate pe rând, și presupune că ușile execută comenzile:

- `deschide(Ui)`: permisă numai dacă Ui este închisă **și cealaltă ușă este închisă**;
- `inchide(Ui)`: permisă numai dacă Ui este deschisă.

**Proprietatea P:** în nicio stare accesibilă cele două uși nu sunt deschise simultan.

#### O versiune greșită a modelului permite `deschide(U2)` și când U1 este deschisă. Explorarea modelului găsește traseul (Î, Î) → `deschide(U1)` → (D, Î) → `deschide(U2)` → (D, D). Ce stabilește acest traseu?
- [x] Că proprietatea P este încălcată în modelul greșit, printr-o execuție concretă.
- [ ] Că sasul real din laborator va avea accidente.
- [ ] Că modelul greșit are o stare de blocaj.
- [ ] Că proprietatea P este adevărată, pentru că starea inițială o respectă.

#### Modelului corect i se adaugă acțiunea `alarma()`, permisă în orice stare a ușilor: ambele uși se închid, iar sasul intră în starea **Blocat**, în care nu mai este permisă nicio acțiune. Specificația spune că sasul rămâne blocat până la o intervenție manuală, care nu face parte din model. Explorarea raportează: „Starea Blocat nu are acțiuni permise.” Ce concluzie este corectă?
- [ ] Este un blocaj neintenționat (deadlock); modelul trebuie corectat.
- [ ] Proprietatea P este încălcată în starea Blocat, deci alarma este greșită.
- [ ] Explorarea este greșită: orice stare a unui model trebuie să aibă o acțiune.
- [x] Este o stare finală intenționată; verificăm că se ajunge în ea numai prin `alarma()`.

#### Explorarea **completă** a modelului corect (fără `alarma()`) vizitează toate stările accesibile și nu găsește nicio încălcare a lui P. Ce stabilește această explorare, singură?
- [ ] Că ușile sasului real nu vor fi niciodată deschise simultan.
- [ ] Că nu rezultă nimic, pentru că explorarea nu a folosit sasul real.
- [x] Că P este adevărată în toate execuțiile acestui model finit, în ipotezele lui.
- [ ] Că P este adevărată și pentru un sas cu trei uși, al cărui model nu a fost explorat.

#### Apare o cerință nouă: „U2 se poate deschide numai după ce U1 a stat închisă cel puțin un minut.” Ce trebuie revizuit?
- [ ] Numai textul afișat lângă U2; modelul și proprietatea P rămân neschimbate.
- [x] Modelul reține timpul de la închiderea lui U1; `deschide(U2)` primește o condiție nouă; P se reverifică.
- [ ] Nimic: proprietatea P garantează deja că U1 stă închisă un minut.
- [ ] Numai condiția lui `deschide(U1)`, care trebuie să aștepte un minut.
