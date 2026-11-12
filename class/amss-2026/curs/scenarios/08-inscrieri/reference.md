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
2. Registru: dacă c este înregistrat, sare la pasul 7 (reîncercare). Altfel verifică: p neînscris la a și loc liber. Dacă nu: întoarce `refuz`, fără modificări, fără apelul expeditorului (sfârșit).
3. Registru: consumă locul; înregistrează înscrierea (c, p, a) cu confirmarea `în așteptare`.
4. Registru → Expeditor: `trimite(mesaj pentru p)`.
5. Expeditor → Registru: `trimis` sau `esec`.
6. Registru: înregistrează confirmarea `trimisă`, respectiv `netrimisă`.
7. Registru → Site: `acceptat`. La reîncercare: dacă confirmarea este `netrimisă`, reia pașii 4–6; dacă este `trimisă`, răspunde direct.

Înregistrarea precede apelul expeditorului. Ordinea inversă (trimitere, apoi înregistrare numai la `trimis`) încalcă R4 la `esec`: înscrierea nu există, locul nu este consumat, dar mesajul poate fi ajuns (R6). Participantul ar avea o confirmare fără loc, exact ce beneficiarul vrea să evite.

## Rezultatele scenariilor

Toate pornesc din I: 2 locuri libere, nicio înscriere.

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
| A: reîncercarea imediată a trimiterii, de câteva ori, în aceeași operație | eșecul este trecător | site-ul așteaptă; după ultimul `esec`, confirmarea rămâne `netrimisă` |
| B: înregistrăm `netrimisă`; o operație separată `retrimite_confirmarile()` reia mai târziu | cineva sau ceva apelează operația | o a doua operație și o stare de urmărit; participantul primește confirmarea mai târziu |
| C: anulăm înscrierea la `esec` | `esec` înseamnă „mesajul nu a ajuns” | încalcă R4; confirmare posibilă fără loc |

A și B respectă R4 și se pot combina (o reîncercare imediată, apoi B). C contrazice politica beneficiarului și presupunerea R6. Decizia noastră: B, cu cel mult o reîncercare imediată; costurile sunt enumerate, nu ascunse.

## Transfer

Tipărirea diplomelor la un serviciu extern: în interior, registrul diplomelor eliberate; în exterior, tipografia. Presupunem că răspunde `primit` sau `esec` la fiecare comandă; nu presupunem că `esec` înseamnă că nu tipărește. Garantăm local: o diplomă eliberată rămâne înregistrată ca eliberată, iar comanda de tipărire poartă identificatorul diplomei, ca o reîncercare să nu producă două tipăriri. Regulile se citesc din noul enunț.
