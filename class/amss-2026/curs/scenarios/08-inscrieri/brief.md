# Enunț — înscrierile la un atelier

Exemplu didactic pentru Cursul 8, versiunea 12 noiembrie 2026. Un centru cultural organizează ateliere cu locuri limitate. **Registrul de locuri**, componenta pe care o proiectăm, primește cererile de înscriere de la site și înregistrează înscrierile acceptate. După fiecare înscriere acceptată, registrul cere unui **expeditor de confirmări**, un serviciu extern operat de altă firmă, să trimită participantului o confirmare.

## Reguli convenite

- **R1 — context:** atelierul A de fotografie nocturnă are 2 locuri; participanții P1, P2, P3 sunt cunoscuți. Apelurile sunt secvențiale: fiecare începe după încheierea celui anterior. Nu modelăm plata, lista de așteptare, anularea înscrierilor, concurența sau erorile tehnice din interiorul registrului.
- **R2 — cerere:** `inscrie(c, p, a)` cere înscrierea participantului p la atelierul a. Identificatorul cererii c este generat de site: unic pentru fiecare cerere nouă a participantului; când site-ul **reîncearcă** aceeași cerere (de exemplu, după ce nu a afișat răspunsul registrului), trimite același c, cu același participant și atelier. Refolosirea lui c cu alt conținut este în afara apelurilor admise; enunțul nu specifică rezultatul acelui apel.
- **R3 — acceptare:** o cerere cu un identificator c neînregistrat este acceptată exact când p nu este deja înscris la a și a are un loc liber: registrul consumă un loc și înregistrează înscrierea (c, p, a). În celelalte cazuri întoarce `refuz`, nu înregistrează nimic și nu apelează expeditorul.
- **R4 — confirmare:** după o înscriere acceptată, registrul cere expeditorului `trimite(mesaj)`; expeditorul răspunde `trimis` sau `esec`. Registrul înregistrează la înscriere rezultatul confirmării: `trimisă` sau `netrimisă`. **Eșecul confirmării nu anulează înscrierea acceptată:** rezultatul întors site-ului este `acceptat` în ambele cazuri. Beneficiarul preferă un participant înscris fără confirmare unui participant cu confirmare fără loc.
- **R5 — reîncercare:** o cerere al cărei identificator c este deja înregistrat este o reîncercare: registrul întoarce același rezultat `acceptat`, nu consumă alt loc și nu înregistrează o a doua înscriere. Dacă confirmarea acelei înscrieri este `netrimisă`, registrul poate cere din nou expeditorului trimiterea și actualizează rezultatul confirmării; dacă este `trimisă`, nu apelează expeditorul.
- **R6 — granița:** expeditorul este în afara sistemului nostru. Presupunem doar că răspunde la fiecare apel cu `trimis` sau `esec`. Nu presupunem că `esec` înseamnă că mesajul nu a ajuns și nici că `trimis` înseamnă că participantul l-a citit. Livrarea efectivă nu este modelată. Eticheta `netrimisă` înseamnă doar că ultimul apel a întors `esec`, nu că știm că mesajul nu a ajuns; `trimisă` consemnează răspunsul `trimis`. Retrimiterea poate produce mesaje duplicate.
- **R7 — efect limitat:** o cerere nu modifică alte înscrieri și nici locurile lor.

## Starea inițială și scenariile

**I:** atelierul A are 2 locuri libere; nicio înscriere; niciun identificator de cerere înregistrat. Fiecare scenariu repornește din I, exceptând continuările marcate explicit. Răspunsul expeditorului este dat în scenariu.

| Scenariu | Cerere | Răspunsul expeditorului |
|---|---|---|
| S1 — înscriere confirmată | `inscrie(c1, P1, A)` | `trimis` |
| S2 — confirmare eșuată | `inscrie(c1, P1, A)` | `esec` |
| S3 — reîncercare după eșec | continuarea lui S2: `inscrie(c1, P1, A)` | `trimis`, dacă expeditorul este apelat |
| S4 — reîncercare după succes | continuarea lui S1: `inscrie(c1, P1, A)` | — (expeditorul nu ar trebui apelat) |
| S5 — cerere nouă a unui participant înscris | continuarea lui S1: `inscrie(c9, P1, A)` | — |
| S6 — locuri epuizate | continuarea lui S1: `inscrie(c2, P2, A)` cu `trimis`, apoi `inscrie(c3, P3, A)` | `trimis`, apoi — |

## Alegeri de proiectare folosite în exemple

R5 permite retrimiterea, fără să o impună. În trasările de referință alegem un singur apel al expeditorului la fiecare reîncercare cu confirmare `netrimisă`. Valoarea intermediară `în așteptare` arată că apelul expeditorului nu s-a încheiat; nu este rezultatul final al operației. O operație separată de retrimitere este discutată ca extensie, nu ca regulă a enunțului inițial.

## Sarcina de proiectare

Propuneți tabelul interacțiunii pentru `inscrie`: pașii în ordine, cine apelează pe cine, ce se trimite, ce se întoarce și ce înregistrează registrul la fiecare pas, inclusiv cazul în care expeditorul răspunde `esec` și cazul unei reîncercări. Repartizați responsabilitățile între site, registru și expeditor. Precizați ce garantează registrul și ce presupune despre expeditor. Verificați scenariile S1–S6: rezultatul întors, locurile libere, înscrierile înregistrate și rezultatul confirmării de după fiecare pas. Nu se cere cod sau o reprezentare particulară.
