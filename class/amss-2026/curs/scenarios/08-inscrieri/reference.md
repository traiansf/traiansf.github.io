# Raționament de referință — înscrieri

Analiză de pregătire pentru [enunț](brief.md), nu captură AI.

## Granița și responsabilitățile

În interiorul sistemului nostru: registrul de locuri, cu operația `înscrie` și datele lui (locuri libere, înscrieri cu identificatorul cererii și rezultatul confirmării). În exterior: site-ul, care trimite cereri și afișează rezultatul, participantul și serviciul de mesagerie. Despre mesagerie cunoaștem numai interfața `trimite(mesaj)` cu rezultatele `trimis` și `eșec expediție` și presupunerea R6: răspunde la fiecare apel. Nu presupunem nimic despre livrare.

| Componentă | Responsabilitate |
|---|---|
| Site | interpretează formularul, generează identificatorul cererii, reîncearcă cu același identificator, afișează rezultatul. |
| Registru | decide acceptarea, consumă locul, înregistrează înscrierea și identificatorul, apelează mesageria, înregistrează rezultatul confirmării, răspunde site-ului. |
| Mesagerie | încearcă trimiterea și răspunde `trimis` sau `eșec expediție`. |

Registrul coordonează: site-ul nu apelează mesageria, iar mesageria nu cunoaște locurile. Dacă site-ul ar trimite confirmarea, ar trebui să cunoască rezultatul deciziei și regula R4, iar o confirmare ar putea pleca fără înscriere.

## Interacțiunea pentru `înscrie(c, p, a)`

1. Site → Registru: `înscrie(c, p, a)`.
2. Registru: dacă c este înregistrat, verifică rezultatul confirmării: la `netrimisă` continuă cu pasul 4; la `trimisă`, cu pasul 7. Altfel verifică: p neînscris la a și loc liber. Dacă nu: întoarce `refuz`, fără modificări, fără apelul mesageriei (sfârșit).
3. Registru: consumă locul; înregistrează înscrierea (c, p, a) cu confirmarea `în așteptare`.
4. Registru → Mesagerie: `trimite(mesaj pentru p)`.
5. Mesagerie → Registru: `trimis` sau `eșec expediție`.
6. Registru: înregistrează confirmarea `trimisă`, respectiv `netrimisă`.
7. Registru → Site: `acceptat` (sfârșit).

La reîncercare, pasul 3 nu se repetă. Am ales un singur apel al mesageriei pentru o confirmare `netrimisă`; R5 permite această alegere, fără să o impună. `în așteptare` este o valoare intermediară, iar `netrimisă` consemnează răspunsul `eșec expediție`, nu nelivrarea.

Înregistrarea precede apelul mesageriei. Fluxul F (trimitere, apoi înregistrare numai la `trimis`) încalcă R4 la `eșec expediție`: înscrierea nu există, locul nu este consumat, dar este posibil ca mesajul să fi ajuns (R6). Participantul ar avea o confirmare fără loc, exact ce beneficiarul vrea să evite.

Un flux care apelează întâi mesageria și înregistrează apoi înscrierea, oricare ar fi răspunsul, întoarce în limitele lui R1 aceleași rezultate și lasă aceleași înregistrări ca al nostru. Diferă numai dacă operația se întrerupe între cei doi pași: ordinea noastră lasă o înscriere fără confirmare, cealaltă un mesaj posibil livrat fără înscriere. Preferința beneficiarului din R4 alege ordinea noastră; R1 exclude întreruperea, deci aceasta este justificarea ordinii, nu o garanție.

## Rezultatele scenariilor

S1 și S2 pornesc din I: 2 locuri libere, nicio înscriere. S3 continuă S2; S4, S5 și S6 continuă independent S1.

| Scenariu | Rezultat |
|---|---|
| S1 | `acceptat`; 1 loc liber; (c1, P1, A) cu confirmare `trimisă`. |
| S2 | `acceptat`; 1 loc liber; (c1, P1, A) cu confirmare `netrimisă`. |
| S3 | `acceptat` (reîncercare); 1 loc liber; aceeași înscriere; mesageria apelată din nou → `trimisă`. |
| S4 | `acceptat` (reîncercare); 1 loc liber; aceeași înscriere; mesageria nu este apelată. |
| S5 | `refuz` (P1 deja înscris); rămân exact înregistrările de după S1; mesageria nu este apelată. |
| S6 | `acceptat` pentru P2; 0 locuri; apoi `refuz` pentru P3; nimic nu se modifică. |

Ce garantează registrul, în limitele R1: o cerere acceptată consumă exact un loc; o reîncercare nu consumă alt loc și primește același rezultat; rezultatul confirmării este înregistrat la fiecare înscriere; un refuz nu modifică nimic și nu produce mesaje. Ce nu garantează: că participantul a primit sau a citit mesajul; ce se întâmplă la o cădere a registrului între pașii 3 și 6; înscrieri concurente.

## Contraexemplul didactic

Fluxul G, construit pentru verificare, nu înregistrează identificatorul cererii și verifică numai locurile libere. Din I: `înscrie(c1, P1, A)` cu `eșec expediție` → acceptat, 1 loc; reîncercarea `înscrie(c1, P1, A)` este tratată ca o cerere nouă → a doua înscriere pentru P1, 0 locuri. Apoi `înscrie(c2, P2, A)` primește `refuz`, deși un singur participant este înscris. G încalcă R5 (o reîncercare nu consumă alt loc) și, prin lipsa verificării „p neînscris”, R3. Chiar cu verificarea „p neînscris”, fără identificatorul cererii registrul ar răspunde `refuz` la reîncercare, deși P1 este înscris: site-ul nu ar putea distinge „deja înscris” de „fără loc”.

## Variante de recuperare după `eșec expediție`

| Variantă | Presupune | Cost |
|---|---|---|
| A: retrimiterea imediată, de cel mult două ori, în aceeași operație | merită încercat din nou, fără succes garantat | site-ul așteaptă; mesajul se poate dubla; după ultimul `eșec expediție`, confirmarea rămâne `netrimisă` |
| B: înregistrăm `netrimisă`; o operație separată `retrimite confirmările()` reia mai târziu | cineva sau ceva apelează operația | o operație și un apelant în plus; trimiterea poate eșua din nou sau produce un mesaj duplicat |
| C: anulăm înscrierea la `eșec expediție` | `eșec expediție` înseamnă „mesajul nu a ajuns” | încalcă R4; confirmare posibilă fără loc |

A și B respectă R4; C contrazice regula beneficiarului, indiferent dacă mesajul a ajuns. Alegem B: un singur apel al mesageriei în `înscrie`, inclusiv la reîncercarea cu rezultat `netrimisă`. Propunem separat `retrimite confirmările()`, apelată de un operator al centrului, care încearcă o dată fiecare confirmare `netrimisă` și actualizează rezultatul, fără să modifice înscrierile sau locurile. Apelurile rămân secvențiale. Nu apare o valoare nouă a rezultatului confirmării; `netrimisă` exista deja. După S2, un apel cu răspuns `trimis` schimbă numai rezultatul confirmării; următorul apel nu mai trimite acel mesaj. Fără intervenția operatorului nu promitem retrimiterea. A rămâne alternativă, dar necesită un număr explicit de încercări și recalcularea scenariilor.

## Idempotență și atomicitate

Idempotența privește efectul repetării asupra înscrierilor; egalitatea răspunsurilor este o cerință suplimentară din R5. Eliberarea repetată din cursul 6 era idempotentă, deși întorcea alt rezultat (`fara_dulap`). Rezultatul confirmării se poate modifica la reîncercare; de aceea spunem că `înscrie` este idempotentă față de înscrieri. Atomicitatea înseamnă că efectele unei operații se produc integral sau deloc; nu promitem atomicitate între registru și mesagerie. Capturile AI folosesc impropriu acest termen: „atomicitate pe cerere” pentru evitarea înscrierilor duble (12 noiembrie 2026), „atomicitate pe participant” pentru unicitatea înscrierii, un invariant (19 noiembrie 2026); corecția noastră îl deosebește explicit de idempotență și de invarianți. Pentru sensul atomicității, vezi [PostgreSQL, Transactions](https://www.postgresql.org/docs/current/tutorial-transactions.html); exemplul nostru nu impune o bază de date. Pentru distincția efect–răspuns, vezi [RFC 9110, §9.2.2](https://www.rfc-editor.org/rfc/rfc9110.html#section-9.2.2).

## Cine oferă fiecare garanție

Referința auditului din secțiunea AI (capturi din 19 noiembrie 2026, arhiva `captures/2026-11-19b/`):

| Afirmația | Cine o oferă | Sprijin |
|---|---|---|
| locul rămâne la `eșec expediție`; nicio a doua înscriere; nu mai mulți participanți decât locuri | registrul | R3, R4, R5 |
| „sistemul vă va recunoaște” la reîncercare | registrul, dacă site-ul trimite același identificator | R5, R2; o cerere nouă a unui participant înscris primește `refuz` |
| „atomicitate pe participant” (cel mult o înscriere per atelier) | registrul, dar proprietatea este un invariant (unicitatea) | R3 |
| „veți primi o confirmare” | nimeni; mesageria promite doar un răspuns | R6 |
| livrarea, „responsabilitatea serviciului extern” | nimeni; R6 nu o atribuie mesageriei | R6 |
| retrimitere „automată” sau „periodică” | nimeni; registrul nu află livrarea, retrimiterea o cere site-ul la reîncercare sau un operator | R5, varianta B |
| „garantăm … răspunsurile mesageriei” | nimeni; este presupunerea R6 | R6 |
| „confirmările nelivrate” pentru `eșec expediție` | confuzie exclusă de R6 | R6 |
| „nu garantăm că participantul a primit efectiv mesajul” | limită corect enunțată | R6 |

O garanție mai puternică despre livrare se cere furnizorului mesageriei, în interfața lui; registrul nu o poate scrie în locul lui.

## Transfer

Tipărirea diplomelor la un serviciu extern, prin `comandă(d)`: în interior, registrul diplomelor aprobate; în exterior, tipografia. Presupunem că răspunde `primit` sau `eșec comandă` la fiecare comandă; nu presupunem că `eșec comandă` înseamnă că nu tipărește. Garantăm local că o diplomă aprobată rămâne înregistrată ca aprobată. Propunem înregistrarea rezultatului `eșec comandă` și folosirea aceluiași identificator al comenzii la retrimitere. Identificatorul singur nu împiedică două tipăriri: tipografia trebuie să promită, în interfața ei, că îl recunoaște și nu repetă tipărirea. Această garanție nu este dată în enunț. Spre deosebire de mesajul duplicat, acceptat de centru drept cost, o diplomă tipărită de două ori nu este acceptabilă: idempotența trebuie cerută componentei din exterior. Regulile se citesc din noul enunț.
