# Enunț — înscrierile la un atelier

Exemplu didactic pentru Cursul 8, versiunea 19 noiembrie 2026. Un centru cultural organizează ateliere cu locuri limitate. **Registrul de locuri**, componenta pe care o proiectăm, primește cererile de înscriere de la site și înregistrează înscrierile acceptate. După fiecare înscriere acceptată, registrul cere unui serviciu extern de mesagerie, operat de altă firmă (pe scurt, **mesageria**), să trimită participantului o confirmare.

## Reguli convenite

- **R1 — context:** atelierul A de fotografie nocturnă are un număr fix de locuri; fiecare scenariu spune câte sunt libere la pornire; participanții P1, P2, P3 sunt cunoscuți. Apelurile sunt secvențiale: fiecare începe după încheierea celui anterior. Nu modelăm plata, lista de așteptare, anularea înscrierilor, concurența sau erorile tehnice din interiorul registrului.
- **R2 — cerere:** `înscrie(c, p, a)` cere înscrierea participantului p la atelierul a. Identificatorul cererii c este generat de site: unic pentru fiecare cerere nouă a participantului; când site-ul **reîncearcă** aceeași cerere (de exemplu, după ce nu a afișat răspunsul registrului), trimite același c, cu același participant și atelier. Refolosirea lui c cu alt conținut este în afara apelurilor admise; enunțul nu specifică rezultatul acelui apel.
- **R3 — acceptare:** o cerere cu un identificator c neînregistrat este acceptată exact când p nu este deja înscris la a și a are un loc liber: registrul consumă un loc și înregistrează înscrierea (c, p, a). În celelalte cazuri întoarce `refuz`, nu înregistrează nimic și nu apelează mesageria.
- **R4 — confirmare:** după o înscriere acceptată, registrul cere mesageriei `trimite(mesaj)`; mesageria răspunde `trimis` sau `eșec expediție`. Registrul înregistrează la înscriere rezultatul confirmării: `trimisă` sau `netrimisă`. **Eșecul confirmării nu anulează înscrierea acceptată:** rezultatul întors site-ului este `acceptat` în ambele cazuri. Beneficiarul preferă un participant înscris fără confirmare unui participant cu confirmare fără loc.
- **R5 — reîncercare:** o cerere al cărei identificator c este deja înregistrat este o reîncercare: registrul întoarce același rezultat `acceptat`, nu consumă alt loc și nu înregistrează o a doua înscriere. Dacă confirmarea acelei înscrieri este `netrimisă`, registrul poate cere din nou mesageriei trimiterea și actualizează rezultatul confirmării; dacă este `trimisă`, nu apelează mesageria.
- **R6 — graniță:** mesageria este în afara sistemului nostru. Presupunem doar că răspunde la fiecare apel cu `trimis` sau `eșec expediție`. Nu presupunem că `eșec expediție` înseamnă că mesajul nu a ajuns și nici că `trimis` înseamnă că participantul l-a citit. Livrarea efectivă nu este modelată. Eticheta `netrimisă` înseamnă doar că ultimul apel a întors `eșec expediție`, nu că știm că mesajul nu a ajuns; `trimisă` consemnează răspunsul `trimis`. Retrimiterea poate produce mesaje duplicate.
- **R7 — efect limitat:** o cerere nu modifică alte înscrieri și nici locurile lor.

## Starea inițială și scenariile

**I:** 2 locuri libere la atelierul A; nicio înscriere; niciun identificator de cerere înregistrat. Fiecare scenariu repornește din I, exceptând continuările marcate explicit. Răspunsul mesageriei este dat în scenariu.

| Scenariu | Cerere | Răspunsul mesageriei |
|---|---|---|
| S1 — înscriere confirmată | `înscrie(c1, P1, A)` | `trimis` |
| S2 — confirmare eșuată | `înscrie(c1, P1, A)` | `eșec expediție` |
| S3 — reîncercare după eșec | continuarea lui S2: `înscrie(c1, P1, A)` | `trimis`, dacă mesageria este apelată |
| S4 — reîncercare după succes | continuarea lui S1: `înscrie(c1, P1, A)` | — (mesageria nu ar trebui apelată) |
| S5 — cerere nouă a unui participant înscris | continuarea lui S1: `înscrie(c9, P1, A)` | — |
| S6 — locuri epuizate | continuarea lui S1: `înscrie(c2, P2, A)` cu `trimis`, apoi `înscrie(c3, P3, A)` | `trimis`, apoi — |

## Decizia de proiectare deja luată

R5 permite retrimiterea, fără să o impună. `înscrie` apelează mesageria o dată la acceptare și o dată la o reîncercare al cărei rezultat al confirmării este `netrimisă`. În plus, registrul oferă operația `retrimite confirmările()`, apelată de un operator al centrului: încearcă o dată fiecare confirmare `netrimisă` și actualizează rezultatul, fără să modifice înscrierile sau locurile. Apelurile rămân secvențiale. Valoarea `în așteptare` arată că apelul mesageriei nu s-a încheiat.
