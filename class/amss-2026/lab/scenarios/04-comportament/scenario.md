# Enunț — ridicarea echipamentelor de la ghișeu

Exemplu didactic pentru Laboratorul 4, după cursurile 7–8. Versiune: 12 noiembrie 2026. Discutăm stări, evenimente, interacțiuni și granițe. Nu se cere aplicație, explorare automată a stărilor sau analiză formală.

Laboratorul facultății împrumută echipamente (proiectoare, camere) pe bază de rezervare. Studenții își ridică echipamentul de la un **ghișeu cu operator**. Aplicația ghișeului apelează un **registru al rezervărilor**, componenta pe care o proiectăm. După fiecare ridicare acceptată, registrul cere unui **expeditor de notificări**, un serviciu extern operat de universitate, să trimită studentului o confirmare a ridicării.

## Reguli convenite

- **R1 — context:** identificatorii rezervărilor, ai studenților și ai cererilor sunt cunoscuți; cererile se procesează secvențial, fiecare începând după încheierea celei anterioare. Nu modelăm returnarea echipamentelor, penalitățile, concurența, erorile tehnice din interiorul registrului sau comanda fizică a dulapurilor.
- **R2 — stări:** o rezervare este în exact una dintre stările **Rezervată**, **Ridicată**, **Anulată**. O rezervare are un titular (studentul care a făcut-o) și un echipament. Ridicată și Anulată sunt **stări finale intenționate**: nu au tranziții de ieșire.
- **R3 — ridicare:** `ridica(c, r, s)` cere ridicarea rezervării r de către studentul s, cu identificatorul de cerere c. Aplicația ghișeului generează un c nou pentru fiecare încercare nouă; când **reîncearcă** aceeași cerere (de exemplu, după ce nu a primit răspuns), trimite același c. O cerere cu c neînregistrat este acceptată exact când r este Rezervată și s este titularul ei: r trece în Ridicată, data ridicării și c sunt înregistrate, iar registrul întoarce `ridicat`. În celelalte cazuri întoarce `refuz`, nu înregistrează nimic și nu apelează expeditorul.
- **R4 — notificare:** după o ridicare acceptată, registrul cere expeditorului `trimite(mesaj)`; expeditorul răspunde `trimis` sau `esec`. Registrul înregistrează la rezervare rezultatul notificării: `trimisă` sau `netrimisă`. **Eșecul notificării nu anulează ridicarea acceptată:** rezultatul întors ghișeului este `ridicat` în ambele cazuri.
- **R5 — reîncercare:** o cerere al cărei identificator c este deja înregistrat este o reîncercare: registrul întoarce același rezultat `ridicat`, nu schimbă starea rezervării și nu înregistrează o a doua ridicare. Dacă notificarea este `netrimisă`, registrul cere din nou expeditorului trimiterea și actualizează rezultatul; dacă este `trimisă`, nu apelează expeditorul.
- **R6 — anulare:** `anuleaza(r)` este permisă numai pentru o rezervare în Rezervată: r trece în Anulată, fără notificare. În celelalte cazuri: `refuz`, fără modificări.
- **R7 — granița:** expeditorul este în afara sistemului nostru. Presupunem doar că răspunde la fiecare apel cu `trimis` sau `esec`. Nu presupunem că `esec` înseamnă că mesajul nu a ajuns și nici că `trimis` înseamnă că studentul l-a citit.
- **R8 — efect limitat:** o cerere nu modifică alte rezervări; datele unei rezervări (titular, echipament, data ridicării, identificatorii cererilor) nu se șterg la nicio schimbare de stare.

## Starea inițială I

Rezervarea **R1** (titular S1, proiector) și rezervarea **R2** (titular S2, cameră) sunt în Rezervată; niciun identificator de cerere înregistrat; nicio notificare. Fiecare scenariu repornește din I, exceptând continuările marcate explicit. Răspunsul expeditorului este dat în scenariu.

| Scenariu | Cerere | Răspunsul expeditorului |
|---|---|---|
| S1 — ridicare confirmată | `ridica(c1, R1, S1)` | `trimis` |
| S2 — alt student | `ridica(c1, R1, S2)` | — |
| S3 — notificare eșuată | `ridica(c1, R1, S1)` | `esec` |
| S4 — reîncercare după eșec | continuarea lui S3: `ridica(c1, R1, S1)` | `trimis`, dacă expeditorul este apelat |
| S5 — cerere nouă după ridicare | continuarea lui S1: `ridica(c7, R1, S1)` | — |
| S6 — anulare după ridicare | continuarea lui S1: `anuleaza(R1)` | — |
| S7 — anulare, apoi ridicare | `anuleaza(R2)`, apoi `ridica(c2, R2, S2)` | — |

## Întrebările discuției

Ce evenimente sunt permise în fiecare stare și cu ce condiție? Ce se înregistrează la fiecare tranziție și ce se păstrează? Cine coordonează ridicarea și cine apelează expeditorul? Ce garantează registrul când expeditorul răspunde `esec`? Ce se întâmplă cu o cerere reîncercată și cu o cerere nouă pentru aceeași rezervare?

Puteți schița sau nota idei, fără documente de predat. Etapa AI este o singură analiză și o singură revizuire în plen, conduse de profesor; nu sunt necesare conturi AI pentru studenți.
