# Raționament de referință — înscrieri

Analiză de pregătire pentru [enunț](brief.md), nu captură AI.

## Granița și responsabilitățile

În interiorul sistemului nostru: registrul de locuri, cu operația `inscrie` și datele lui (locuri libere, înscrieri cu identificatorul cererii și rezultatul confirmării). În exterior: site-ul, care trimite cereri și afișează rezultatul, participantul și expeditorul de confirmări. Despre expeditor cunoaștem numai interfața `trimite(mesaj)` cu rezultatele `trimis` și `esec` și presupunerea R6: răspunde la fiecare apel. Nu presupunem nimic despre livrare.

| Componentă | Responsabilitate |
|---|---|
| Site | interpretează formularul, generează identificatorul cererii, reîncearcă cu același identificator, afișează rezultatul. |
| Registru | decide acceptarea, consumă locul, înregistrează înscrierea și identificatorul, apelează expeditorul, înregistrează rezultatul confirmării, răspunde site-ului. |
| Expeditor | încearcă trimiterea și răspunde `trimis` sau `esec`. |

Registrul coordonează: site-ul nu apelează expeditorul, iar expeditorul nu cunoaște locurile. Dacă site-ul ar trimite confirmarea, ar trebui să cunoască rezultatul deciziei și regula R4, iar o confirmare ar putea pleca fără înscriere.

## Interacțiunea pentru `inscrie(c, p, a)`

1. Site → Registru: `inscrie(c, p, a)`.
2. Registru: dacă c este înregistrat, verifică rezultatul confirmării: la `netrimisă` continuă cu pasul 4; la `trimisă`, cu pasul 7. Altfel verifică: p neînscris la a și loc liber. Dacă nu: întoarce `refuz`, fără modificări, fără apelul expeditorului (sfârșit).
3. Registru: consumă locul; înregistrează înscrierea (c, p, a) cu confirmarea `în așteptare`.
4. Registru → Expeditor: `trimite(mesaj pentru p)`.
5. Expeditor → Registru: `trimis` sau `esec`.
6. Registru: înregistrează confirmarea `trimisă`, respectiv `netrimisă`.
7. Registru → Site: `acceptat` (sfârșit).

La reîncercare, pasul 3 nu se repetă. Am ales un singur apel al expeditorului pentru o confirmare `netrimisă`; R5 permite această alegere, fără să o impună. `în așteptare` este o valoare intermediară, iar `netrimisă` consemnează răspunsul `esec`, nu nelivrarea.

Înregistrarea precede apelul expeditorului. Ordinea inversă (trimitere, apoi înregistrare numai la `trimis`) încalcă R4 la `esec`: înscrierea nu există, locul nu este consumat, dar este posibil ca mesajul să fi ajuns (R6). Participantul ar avea o confirmare fără loc, exact ce beneficiarul vrea să evite.

## Rezultatele scenariilor

S1 și S2 pornesc din I: 2 locuri libere, nicio înscriere. S3 continuă S2; S4, S5 și S6 continuă independent S1.

| Scenariu | Rezultat |
|---|---|
| S1 | `acceptat`; 1 loc liber; (c1, P1, A) cu confirmare `trimisă`. |
| S2 | `acceptat`; 1 loc liber; (c1, P1, A) cu confirmare `netrimisă`. |
| S3 | `acceptat` (reîncercare); 1 loc liber; aceeași înscriere; expeditorul apelat din nou → `trimisă`. |
| S4 | `acceptat` (reîncercare); 1 loc liber; aceeași înscriere; expeditorul nu este apelat. |
| S5 | `refuz` (P1 deja înscris); exact starea de după S1; expeditorul nu este apelat. |
| S6 | `acceptat` pentru P2; 0 locuri; apoi `refuz` pentru P3; nimic nu se modifică. |

Ce garantează registrul, în limitele R1: o cerere acceptată consumă exact un loc; o reîncercare nu consumă alt loc și primește același rezultat; rezultatul confirmării este înregistrat la fiecare înscriere; un refuz nu modifică nimic și nu produce mesaje. Ce nu garantează: că participantul a primit sau a citit mesajul; ce se întâmplă la o cădere a registrului între pașii 3 și 6; înscrieri concurente.

## Contraexemplul didactic

Fluxul G, construit pentru verificare, nu înregistrează identificatorul cererii și verifică numai locurile libere. Din I: `inscrie(c1, P1, A)` cu `esec` → acceptat, 1 loc; reîncercarea `inscrie(c1, P1, A)` este tratată ca o cerere nouă → a doua înscriere pentru P1, 0 locuri. Apoi `inscrie(c2, P2, A)` primește `refuz`, deși un singur participant este înscris. G încalcă R5 (o reîncercare nu consumă alt loc) și, prin lipsa verificării „p neînscris”, R3. Chiar cu verificarea „p neînscris”, fără identificatorul cererii registrul ar răspunde `refuz` la reîncercare, deși P1 este înscris: site-ul nu ar putea distinge „deja înscris” de „fără loc”.

## Variante de recuperare după `esec`

| Variantă | Presupune | Cost |
|---|---|---|
| A: reîncercarea imediată a trimiterii, de cel mult două ori, în aceeași operație | merită încercat din nou, fără succes garantat | site-ul așteaptă; mesajul se poate dubla; după ultimul `esec`, confirmarea rămâne `netrimisă` |
| B: înregistrăm `netrimisă`; o operație separată `retrimite_confirmarile()` reia mai târziu | cineva sau ceva apelează operația | o operație și un apelant în plus; trimiterea poate eșua din nou sau produce un mesaj duplicat |
| C: anulăm înscrierea la `esec` | `esec` înseamnă „mesajul nu a ajuns” | încalcă R4; confirmare posibilă fără loc |

A și B respectă R4; C contrazice regula beneficiarului, indiferent dacă mesajul a ajuns. Alegem B: un singur apel al expeditorului în `inscrie`, inclusiv la reîncercarea cu rezultat `netrimisă`. Propunem separat `retrimite_confirmarile()`, apelată de operator, care încearcă o dată fiecare confirmare `netrimisă` și actualizează rezultatul, fără să modifice înscrierile sau locurile. Apelurile rămân secvențiale. Nu apare o stare nouă; `netrimisă` exista deja. Din starea de după S2, un apel cu răspuns `trimis` schimbă numai confirmarea; următorul apel nu mai trimite acel mesaj. Fără intervenția operatorului nu promitem retrimiterea. A rămâne alternativă, dar necesită un număr explicit de încercări și recalcularea scenariilor.

## Idempotență și atomicitate

Idempotența privește efectul repetării asupra înscrierilor; egalitatea răspunsurilor este o cerință suplimentară din R5. Notificarea se poate modifica la reîncercare. Atomicitatea înseamnă că efectele unei operații se produc integral sau deloc; nu promitem atomicitate între registru și expeditor. Captura AI folosește impropriu acest termen, iar corecția noastră îl deosebește explicit de idempotență. Pentru sensul atomicității, vezi [PostgreSQL, Transactions](https://www.postgresql.org/docs/current/tutorial-transactions.html); exemplul nostru nu impune o bază de date. Pentru distincția efect–răspuns, vezi [RFC 9110, §9.2.2](https://www.rfc-editor.org/rfc/rfc9110.html#section-9.2.2).

## Transfer

Tipărirea diplomelor la un serviciu extern: în interior, registrul diplomelor eliberate; în exterior, tipografia. Presupunem că răspunde `primit` sau `esec` la fiecare comandă; nu presupunem că `esec` înseamnă că nu tipărește. Garantăm local că o diplomă eliberată rămâne înregistrată ca eliberată. Propunem înregistrarea rezultatului `esec` și folosirea aceluiași identificator al comenzii la retrimitere. Identificatorul singur nu împiedică două tipăriri: tipografia trebuie să garanteze prin contract recunoașterea lui și evitarea repetării tipăririi. Această garanție nu este dată în enunț. Regulile se citesc din noul enunț.
