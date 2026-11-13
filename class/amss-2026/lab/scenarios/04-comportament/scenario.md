# Enunț — ridicarea echipamentelor de la ghișeu

Exemplu didactic pentru Laboratorul 4, după cursurile 7–8. Versiune: 12 noiembrie 2026. Discutăm stări, evenimente, interacțiuni și granițe. Nu se cere aplicație, explorare automată a stărilor sau analiză formală.

Serviciul tehnic al facultății împrumută echipamente (proiectoare, camere) pe bază de rezervare, pentru proiecțiile și filmele cluburilor studențești. Studenții își ridică echipamentul de la un **ghișeu cu operator**. Ghișeul apelează un **registru al rezervărilor**, componenta pe care o proiectăm. După fiecare ridicare acceptată, registrul cere unui **expeditor de notificări**, un serviciu extern operat de universitate, să trimită studentului o confirmare a ridicării.

## Reguli convenite

- **R1 — context:** identificatorii rezervărilor, ai studenților și ai cererilor sunt cunoscuți; apelurile sunt secvențiale: fiecare începe după încheierea celui anterior. Nu modelăm returnarea echipamentelor, penalitățile, concurența, erorile tehnice din interiorul registrului sau comanda fizică a dulapurilor.
- **R2 — stări:** o rezervare este în exact una dintre stările **Rezervată**, **Ridicată**, **Anulată**. O rezervare are un titular (studentul care a făcut-o) și un echipament. **Anulată** este o **stare finală intenționată**: nu permite evenimente. **Ridicată** încheie ridicarea fizică, dar permite reîncercarea din R5 și actualizarea notificării; nu este finală în sensul cursului 7.
- **R3 — ridicare:** `ridică(c, r, s)` cere ridicarea rezervării r de către studentul s, cu identificatorul de cerere c. Ghișeul generează un c nou pentru fiecare cerere nouă; când **reîncearcă** aceeași cerere (de exemplu, după ce nu a primit răspuns), trimite același c, cu aceeași rezervare și același student. Refolosirea lui c cu alt conținut este în afara apelurilor admise. O cerere cu c neînregistrat este acceptată exact când r este Rezervată și s este titularul ei: r trece în Ridicată, momentul ridicării și c sunt înregistrate, iar registrul întoarce `ridicat`. În celelalte cazuri întoarce `refuz`, nu înregistrează nimic și nu apelează expeditorul.
- **R4 — notificare:** după o ridicare acceptată, registrul cere expeditorului `trimite(mesaj)`; expeditorul răspunde `trimis` sau `esec`. Registrul înregistrează la rezervare rezultatul notificării: `trimisă` sau `netrimisă`. **Eșecul notificării nu anulează ridicarea acceptată:** rezultatul întors ghișeului este `ridicat` în ambele cazuri.
- **R5 — reîncercare:** o cerere al cărei identificator c este deja înregistrat este o reîncercare: registrul întoarce același rezultat `ridicat`, nu schimbă starea rezervării și nu înregistrează o a doua ridicare. Dacă notificarea este `netrimisă`, registrul cere din nou expeditorului trimiterea și actualizează rezultatul; dacă este `trimisă`, nu apelează expeditorul.
- **R6 — anulare:** `anulează(r)` este permisă numai pentru o rezervare în Rezervată: r trece în Anulată, fără notificare. În celelalte cazuri: `refuz`, fără modificări.
- **R7 — graniță:** expeditorul este în afara sistemului nostru. Presupunem doar că răspunde la fiecare apel cu `trimis` sau `esec`. Nu presupunem că `esec` înseamnă că mesajul nu a ajuns și nici că `trimis` înseamnă că studentul l-a citit. `netrimisă` consemnează răspunsul `esec`, nu o certitudine despre livrare; retrimiterea poate produce mesaje duplicate.
- **R8 — efect limitat:** o cerere nu modifică alte rezervări; datele unei rezervări (titular, echipament, momentul ridicării, identificatorii cererilor) nu se șterg la nicio schimbare de stare.

## Vocabular

Starea completă include etapa rezervării și datele ei; reîncercarea păstrează etapa Ridicată, dar poate modifica rezultatul notificării. Rezervările se numesc A și B, iar titularii lor T1 și T2, ca să nu se confunde cu regulile R1–R8 și cu scenariile S1–S7.

## Starea inițială I

Rezervarea **A** (titular T1, proiector) și rezervarea **B** (titular T2, cameră) sunt în Rezervată; niciun identificator de cerere înregistrat; nicio notificare. Fiecare scenariu repornește din I, exceptând continuările marcate explicit. Răspunsul expeditorului este dat în scenariu.

| Scenariu | Cerere | Răspunsul expeditorului |
|---|---|---|
| S1 — ridicare confirmată | `ridică(c1, A, T1)` | `trimis` |
| S2 — alt student | `ridică(c1, A, T2)` | — |
| S3 — notificare eșuată | `ridică(c1, A, T1)` | `esec` |
| S4 — reîncercare după eșec | continuarea lui S3: `ridică(c1, A, T1)` | `trimis`, dacă expeditorul este apelat |
| S5 — cerere nouă după ridicare | continuarea lui S1: `ridică(c7, A, T1)` | — |
| S6 — anulare după ridicare | continuarea lui S1: `anulează(A)` | — |
| S7 — anulare, apoi ridicare | `anulează(B)`, apoi `ridică(c2, B, T2)` | — |

## Întrebările discuției

Ce evenimente sunt permise în fiecare stare și cu ce condiție? Ce se înregistrează la fiecare tranziție și ce se păstrează? Cine coordonează ridicarea și cine apelează expeditorul? Ce garantează registrul când expeditorul răspunde `esec`? Ce se întâmplă cu o cerere reîncercată și cu o cerere nouă pentru aceeași rezervare?

Puteți schița sau nota idei, fără documente de predat. Etapa AI este o singură analiză și o singură revizuire în plen, conduse de profesor; nu sunt necesare conturi AI pentru studenți.
