# Enunț — ridicarea echipamentelor de la ghișeu

Exemplu didactic pentru Laboratorul 4, după cursurile 7–8. Versiune: 12 noiembrie 2026. Discutăm stări, evenimente, interacțiuni și granițe. Nu se cere aplicație, explorare automată a stărilor sau analiză formală.

Serviciul tehnic al facultății împrumută echipamente (proiectoare, camere) pe bază de rezervare, pentru proiecțiile și filmele cluburilor studențești. Studenții își ridică echipamentul de la un **ghișeu cu operator**. Ghișeul apelează un **registru al rezervărilor**, componenta pe care o proiectăm. După fiecare ridicare acceptată, registrul cere unui **serviciu de mesagerie** (pe scurt, mesageria), un serviciu extern operat de universitate, să anunțe ridicarea coordonatorului clubului pentru care s-a făcut rezervarea. Studentul știe că a ridicat echipamentul, fiindcă îl primește la ghișeu; coordonatorul, care răspunde de echipament în fața serviciului tehnic, nu este de față.

## Reguli convenite

- **R1 — context:** identificatorii rezervărilor, ai studenților și ai cererilor sunt cunoscuți; apelurile sunt secvențiale: fiecare începe după încheierea celui anterior. Nu modelăm returnarea echipamentelor, penalitățile, concurența sau erorile tehnice din interiorul registrului.
- **R2 — stări:** o rezervare este în exact una dintre stările **Rezervată**, **Ridicată**, **Anulată**. O rezervare are un titular (studentul care a făcut-o) și un echipament. **Anulată** este o **stare finală intenționată**: nu permite evenimente. **Ridicată** încheie ridicarea fizică, dar permite reîncercarea din R5 și actualizarea notificării; nu este finală în sensul cursului 7.
- **R3 — ridicare:** `ridică(c, r, s)` cere ridicarea rezervării r de către studentul s, cu identificatorul de cerere c. Ghișeul generează un c nou pentru fiecare cerere nouă; când **reîncearcă** aceeași cerere (de exemplu, după ce nu a primit răspuns), trimite același c, cu aceeași rezervare și același student. Refolosirea lui c cu alt conținut este în afara apelurilor admise. O cerere cu c neînregistrat este acceptată exact când r este Rezervată și s este titularul ei: r trece în Ridicată, momentul ridicării și c sunt înregistrate, iar registrul întoarce `ridicat`. În celelalte cazuri întoarce `refuz`, nu înregistrează nimic și nu apelează mesageria.
- **R4 — notificare:** după o ridicare acceptată, registrul cere mesageriei `trimite(mesaj)`; mesageria răspunde `trimis` sau `eșec expediție`. Registrul înregistrează la rezervare rezultatul notificării: `trimisă` sau `netrimisă`. **Eșecul notificării nu anulează ridicarea acceptată:** rezultatul întors ghișeului este `ridicat` în ambele cazuri.
- **R5 — reîncercare:** o cerere al cărei identificator c este deja înregistrat este o reîncercare: registrul întoarce același rezultat `ridicat`, nu schimbă starea rezervării și nu înregistrează o a doua ridicare. Dacă notificarea este `netrimisă`, registrul cere din nou mesageriei trimiterea și actualizează rezultatul; dacă este `trimisă`, nu apelează mesageria.
- **R6 — anulare:** `anulează(r)` este permis numai pentru o rezervare în Rezervată: r trece în Anulată, fără notificare. În celelalte cazuri: `refuz`, fără modificări.
- **R7 — graniță:** mesageria este în afara sistemului nostru. Presupunem doar că răspunde la fiecare apel cu `trimis` sau `eșec expediție`. Nu presupunem că `eșec expediție` înseamnă că mesajul nu a ajuns și nici că `trimis` înseamnă că coordonatorul l-a citit. `netrimisă` consemnează răspunsul `eșec expediție`, nu o certitudine despre livrare; retrimiterea poate produce mesaje duplicate.
- **R8 — efect limitat:** o cerere nu modifică alte rezervări; datele unei rezervări (titular, echipament, momentul ridicării, identificatorii cererilor) nu se șterg la nicio schimbare de stare.

## Vocabular

Ca în cursul 7, starea unei rezervări este etapa ei cu nume (Rezervată, Ridicată, Anulată); celelalte valori înregistrate (titularul, echipamentul, momentul ridicării, identificatorii cererilor, rezultatul notificării) sunt datele ei. Reîncercarea păstrează starea Ridicată, dar poate modifica o dată: rezultatul notificării. Rezervările se numesc A și B, iar titularii lor T1 și T2, ca să nu se confunde cu regulile R1–R8 și cu scenariile S1–S7.

## Starea inițială I

Rezervarea **A** (titular T1, proiector) și rezervarea **B** (titular T2, cameră) sunt în Rezervată; niciun identificator de cerere înregistrat; nicio notificare. Fiecare scenariu repornește din I, exceptând continuările marcate explicit. Răspunsul mesageriei este dat în scenariu.

| Scenariu | Cerere | Răspunsul mesageriei |
|---|---|---|
| S1 — ridicare notificată | `ridică(c1, A, T1)` | `trimis` |
| S2 — alt student | `ridică(c1, A, T2)` | — |
| S3 — notificare eșuată | `ridică(c1, A, T1)` | `eșec expediție` |
| S4 — reîncercare după eșec | continuarea lui S3: `ridică(c1, A, T1)` | `trimis`, dacă mesageria este apelată |
| S5 — cerere nouă după ridicare | continuarea lui S1: `ridică(c7, A, T1)` | — |
| S6 — anulare după ridicare | continuarea lui S1: `anulează(A)` | — |
| S7 — anulare, apoi ridicare | `anulează(B)`, apoi `ridică(c2, B, T2)` | — |

## Întrebările discuției

Ce evenimente sunt permise în fiecare stare și cu ce condiție? Ce se înregistrează la fiecare tranziție și ce se păstrează? Cine coordonează ridicarea și cine apelează mesageria? Ce garantează registrul când mesageria răspunde `eșec expediție`? Ce se întâmplă cu o cerere reîncercată și cu o cerere nouă pentru aceeași rezervare? Ce presupune registrul despre ghișeu și ce se întâmplă când presupunerea nu este respectată?

Puteți schița sau nota idei, fără documente de predat. În atelierul de diagrame, fiecare desenează diagrama de stări a unei rezervări după [specificația diagramei de stări](../../diagrame/stari.md); cine termină desenează diagrama de secvență a lui `ridică` pentru scenariile S3 și S4, după [specificația diagramei de secvență](../../diagrame/secventa.md). Diagramele se fac de mână, în Mermaid sau cu un asistent AI, revizuite față de acest enunț; asistentul AI este opțional și nu sunt necesare conturi AI.
