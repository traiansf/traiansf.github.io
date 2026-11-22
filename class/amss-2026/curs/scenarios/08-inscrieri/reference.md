# Raționament de referință — înscrieri

Analiză de pregătire pentru [enunț](brief.md), nu captură AI.

## Granița și responsabilitățile

În interiorul sistemului nostru: registrul de locuri, cu operația `înscrie` și datele lui (locuri libere, înscrieri cu identificatorul cererii și rezultatul confirmării). În exterior: site-ul, care trimite cereri și afișează rezultatul, participantul și serviciul de mesagerie. Despre mesagerie cunoaștem numai interfața `trimite(mesaj)` cu rezultatele `trimis` și `eșec` și presupunerea R6: răspunde la fiecare apel. Nu presupunem nimic despre livrare.

| Componentă | Responsabilitate |
|---|---|
| Site | interpretează formularul, generează identificatorul cererii, reîncearcă cu același identificator, afișează rezultatul. |
| Registru | decide acceptarea, consumă locul, înregistrează înscrierea și identificatorul, apelează mesageria, înregistrează rezultatul confirmării, răspunde site-ului. |
| Mesagerie | încearcă trimiterea și răspunde `trimis` sau `eșec`. |

Registrul coordonează: site-ul nu apelează mesageria, iar mesageria nu cunoaște locurile. Dacă site-ul ar trimite confirmarea, ar trebui să cunoască rezultatul deciziei și regula R4, iar o confirmare ar putea pleca fără înscriere.

## Fluxul de lucru pentru `înscrie(c, p, a)`

1. Site → Registru: `înscrie(c, p, a)`.
2. Registru: dacă c este înregistrat, verifică rezultatul confirmării: la `netrimisă` continuă cu pasul 4; la `trimisă`, cu pasul 7. Altfel verifică: p neînscris la a și loc liber. Dacă nu: întoarce `refuz`, fără modificări, fără apelul mesageriei (sfârșit).
3. Registru: consumă locul; înregistrează înscrierea (c, p, a) cu confirmarea `în așteptare`.
4. Registru → Mesagerie: `trimite(mesaj pentru p)`.
5. Mesagerie → Registru: `trimis` sau `eșec`.
6. Registru: înregistrează confirmarea `trimisă`, respectiv `netrimisă`.
7. Registru → Site: `acceptat` (sfârșit).

Pe slide-uri, pașii 2–3 de aici sunt pasul 2 (decizia și înregistrarea), iar pașii 5–6 sunt pasul 4. La reîncercare, pasul 3 nu se repetă. Registrul verifică întâi identificatorul: un registru care ar verifica întâi înscrierea ar răspunde `refuz` la orice reîncercare. Am ales un singur apel al mesageriei pentru o confirmare `netrimisă`; regulile nu o cer și nu o interzic. `în așteptare` este o valoare intermediară, iar `netrimisă` consemnează răspunsul `eșec`, nu nelivrarea.

Înregistrarea precedă apelul mesageriei. Fluxul F (trimitere, apoi înregistrare numai la `trimis`) încalcă R4 la `eșec`: înscrierea nu există, locul nu este consumat, dar este posibil ca mesajul să fi ajuns (R6). Participantul ar avea o confirmare fără loc, exact ce beneficiarul vrea să evite.

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

Exercițiul „Ce răspunde registrul?” pornește din starea de după S2 (1 loc liber; (c1, P1, A), confirmare `netrimisă`), cu trei cereri în ordine. Rândul 1, `înscrie(c2, P2, A)` cu `eșec`: `acceptat`, 0 locuri, mesageria apelată, confirmare `netrimisă`. Rândul 2, reîncercarea `înscrie(c2, P2, A)`: `acceptat`, 0 locuri; c2 este înregistrat, deci locurile nu se mai verifică, iar apelul mesageriei nu este nici cerut, nici interzis. Rândul 3, `înscrie(c3, P3, A)` de două ori: `refuz` de ambele dăți, fără apelul mesageriei; a doua cerere nu intră sub R5, fiindcă refuzul nu a înregistrat c3, ci este judecată din nou după R3, cu același rezultat numai pentru că locurile nu se eliberează (R1).

Ce garantează registrul, în limitele R1: o cerere acceptată consumă exact un loc; o reîncercare nu consumă alt loc și primește același rezultat; rezultatul confirmării este înregistrat la fiecare înscriere; un refuz nu modifică nimic și nu produce mesaje. Ce nu garantează: că participantul a primit sau a citit mesajul; ce se întâmplă la o cădere a registrului între pașii 3 și 6; înscrieri concurente.

## Contraexemplul didactic

Fluxul G, construit pentru verificare, are două lipsuri: nu înregistrează identificatorul cererii și nu verifică dacă participantul este deja înscris; acceptă ori de câte ori există loc liber. Din I: `înscrie(c1, P1, A)` cu `eșec` → `acceptat`, 1 loc; reîncercarea `înscrie(c1, P1, A)` este tratată ca o cerere nouă → a doua înscriere pentru P1, 0 locuri. Apoi `înscrie(c2, P2, A)` primește `refuz`, deși un singur participant este înscris. G încalcă R5 (o reîncercare nu consumă alt loc) și, prin lipsa verificării „p neînscris”, R3. În trasarea de pe slide, a doua înscriere apare numai pentru că lipsesc amândouă: fără identificator, dar cu verificarea, reîncercarea ar primi `refuz` (răspuns greșit după R5, dar o singură înscriere); cu identificator, dar fără verificare, reîncercarea ar fi recunoscută (`acceptat`, fără alt loc). Cele două reparații se deosebesc la o cerere nouă a lui P1: numai verificarea o oprește. Locurile sunt apărate de verificarea din R3; identificatorul hotărăște numai ce răspuns primește o cerere repetată. Fluxul G′, tot fără identificator, răspunde `acceptat`, fără alt loc, oricărei cereri a unui participant deja înscris. La reîncercare se comportă ca regulile noastre: nici R5 nu deosebește prin răspuns prima trimitere de o reîncercare. Diferă numai la o cerere nouă a unui participant înscris (S5): R3 dă `refuz`, G′ `acceptat`. Ambele reguli sunt posibile; alegerea este a beneficiarului. G′ funcționează pentru că un participant are cel mult o înscriere la un atelier; identificatorul devine necesar când două cereri diferite pot avea același conținut (de exemplu, mai multe locuri cerute de același participant).

## Variante de recuperare după `eșec`

| Variantă | Presupune | Cost |
|---|---|---|
| A: retrimiterea imediată, de cel mult două ori, în aceeași operație | merită încercat din nou, fără succes garantat | site-ul așteaptă, dacă răspunsul pleacă după apeluri; până la trei mesaje; după ultimul `eșec`, confirmarea rămâne `netrimisă` |
| B: înregistrăm `netrimisă`; o operație separată `retrimite confirmările()` reia mai târziu | cineva sau ceva apelează operația | o operație și un apelant în plus; trimiterea poate eșua din nou sau produce un mesaj duplicat |
| C: anulăm înscrierea la `eșec` | `eșec` înseamnă „mesajul nu a ajuns” | încalcă R4; confirmare posibilă fără loc |

A și B respectă R4; C contrazice regula beneficiarului, indiferent dacă mesajul a ajuns. Alegem B: un singur apel al mesageriei în `înscrie`, inclusiv la reîncercarea cu rezultatul confirmării `netrimisă`. De ce B și nu A: A ajută numai dacă eșecul trece în câteva clipe (după o oră de răspunsuri `eșec`, A lasă `netrimisă` și nu spune cine mai încearcă), deci tot este nevoie de cineva care să ceară retrimiterea mai târziu; A se poate adăuga peste B. Site-ul nu știe că trimiterea a eșuat, fiindcă primește `acceptat`, deci reîncercarea lui este o ocazie de retrimitere, nu un mecanism de recuperare. Propunem separat operația `retrimite confirmările()`, care încearcă o dată trimiterea fiecărei confirmări `netrimisă` și îi actualizează rezultatul, fără să modifice înscrierile sau locurile; o apelează un operator al centrului. Apelurile rămân secvențiale. Nu apare o valoare nouă a rezultatului confirmării; `netrimisă` exista deja. După S2, un apel cu răspuns `trimis` schimbă numai rezultatul confirmării; următorul apel nu mai trimite acel mesaj. Fără intervenția operatorului nu promitem retrimiterea. Varianta A rămâne o alternativă, dar necesită un număr explicit de încercări și recalcularea scenariilor.

## Idempotență și atomicitate

Idempotența privește efectul repetării asupra înscrierilor; egalitatea răspunsurilor este o cerință suplimentară din R5. Eliberarea repetată din cursul 6 era idempotentă, deși întorcea alt rezultat (`fără_dulap`). Rezultatul confirmării se poate modifica la reîncercare; de aceea spunem că `înscrie` este idempotentă față de înscrieri. Atomicitatea înseamnă că efectele unei operații se produc integral sau deloc; nu promitem atomicitate între registru și mesagerie. Capturile AI folosesc impropriu acest termen: „atomicitate pe cerere” pentru evitarea înscrierilor duble (12 noiembrie 2026), „atomicitate pe participant” pentru unicitatea înscrierii, un invariant (19 noiembrie 2026), „atomicitate pentru acceptare” pentru înscrierea și confirmarea luate împreună, deși eșecul confirmării nu anulează înscrierea (20 noiembrie 2026); corecția noastră, de pe slide-ul „Decizia noastră”, definește atomicitatea și o deosebește de garanția din R4; deosebirea de idempotență și de invarianți rămâne în notele profesorului. Pentru sensul atomicității, vezi [PostgreSQL, Transactions](https://www.postgresql.org/docs/current/tutorial-transactions.html); exemplul nostru nu impune o bază de date. Pentru distincția efect–răspuns, vezi [RFC 9110, §9.2.2](https://www.rfc-editor.org/rfc/rfc9110.html#section-9.2.2).

## Cine oferă fiecare garanție

Referința auditului din secțiunea AI (capturi din 20 noiembrie 2026, arhiva `captures/2026-11-20/`):

| Afirmația | Cine o garantează | Ce o susține sau o limitează |
|---|---|---|
| acceptarea; locul rămâne la `eșec`; nicio a doua înscriere; niciun loc în plus | registrul | R3, R4, R5 |
| „veți primi din nou răspunsul «acceptat»” la reîncercare | registrul, dacă site-ul trimite același identificator | R5, R2; o cerere nouă a unui participant înscris primește `refuz` |
| „atomicitate pentru acceptare” (înscrierea și apelul de confirmare „o unitate”, dar eșecul nu anulează înscrierea) | registrul oferă partea din R4 și face amândouă la acceptare; atomicitatea nu există între registru și mesagerie, iar efectul apelului rămâne în afară | R4 |
| „veți primi o confirmare … imediat” | nimeni; mesageria promite doar un răspuns | R6 |
| livrarea, „răspunderea mesageriei” (neproiectat) | nimeni; R6 nu o atribuie mesageriei | R6 |
| „echipa noastră va încerca din nou trimiterea” | operatorul centrului, nu registrul: registrul oferă operația, decizia B numește apelantul, deci centrul și-o poate asuma | varianta B: numai confirmările `netrimisă`; nici B, nici textul nu spun când |
| apelurile mesageriei care „nu se modifică după prima acceptare” (neproiectat) | nimeni; registrul este determinist, dar la `netrimisă` reîncercarea apelează din nou mesageria, la `trimisă` nu | R5, varianta B |
| „confirmările pierdute” pentru `netrimisă` (neproiectat) | confuzie exclusă de R6 | R6 |
| „livrarea efectivă și citirea nu sunt garantate”; mesaje duplicate posibile | limite corect enunțate | R6 |

Rândurile marcate „neproiectat” privesc fragmente scoase de pe slide-uri în runda de revizuire din 20 noiembrie 2026; rămân în arhivă. O garanție mai puternică despre livrare se cere furnizorului mesageriei, în interfața lui; registrul nu o poate scrie în locul lui.

## Transfer

Tipărirea diplomelor la un serviciu extern, prin `comandă(d)`: în interior, registrul diplomelor aprobate, care coordonează (înregistrează la fiecare diplomă rezultatul ultimei comenzi; cine declanșează retrimiterea rămâne de notat, ca la varianta B); în exterior, tipografia. Presupunem că răspunde `primit` sau `eșec` la fiecare comandă; nu presupunem că `eșec` înseamnă că nu tipărește. Garantăm local că o diplomă aprobată rămâne înregistrată ca aprobată. Propunem înregistrarea rezultatului `eșec` și folosirea aceluiași identificator al comenzii la retrimitere. Identificatorul singur nu împiedică două tipăriri: tipografia trebuie să promită, în interfața ei, că îl recunoaște și nu repetă tipărirea. Această garanție nu este dată în enunț. Spre deosebire de mesajul duplicat, acceptat de centru drept cost, o diplomă tipărită de două ori nu este acceptabilă: idempotența trebuie cerută componentei din exterior. Dacă o diplomă se tipărește o singură dată, d poate ține locul identificatorului comenzii, ca în fluxul G′. Regulile se citesc din noul enunț.
