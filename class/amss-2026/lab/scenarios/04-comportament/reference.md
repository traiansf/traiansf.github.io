# Raționament de referință — ghișeul de echipamente

Material de pregătire pentru [enunț](scenario.md), construit didactic; nu captură AI.

## Tabelul de tranziții al rezervării

| Stare curentă | Eveniment | Condiție | Stare următoare | Efect |
|---|---|---|---|---|
| Rezervată | `ridică(c, r, s)` | c neînregistrat, s este titularul | Ridicată | momentul ridicării, c înregistrat, notificare `trimisă`/`netrimisă` |
| Ridicată | `ridică(c, r, s)` | c înregistrat la r (reîncercare) | Ridicată | notificarea poate trece din `netrimisă` în `trimisă` |
| Rezervată | `anulează(r)` | — | Anulată | — |

Orice altă combinație, sau o condiție neîndeplinită, este refuzată: `refuz`, fără modificări, fără apelul expeditorului. Anulată este finală intenționată. Ridicată permite reîncercarea, deci nu este finală în sensul cursului 7. Al doilea rând nu schimbă starea; îl scriem ca să fie vizibil că reîncercarea este permisă în Ridicată, spre deosebire de o cerere nouă (c neînregistrat), care este refuzată acolo.

Condiția „s este titularul” depinde de date, nu de stare: o cerere greșită lasă rezervarea Rezervată, cu toate datele. Starea și datele decid ce evenimente sunt permise. Titularul, echipamentul, momentul ridicării și identificatorul înregistrat se păstrează; rezultatul notificării poate fi actualizat (R5).

## Interacțiunea pentru `ridică(c, r, s)`

1. Ghișeu → Registru: `ridică(c, r, s)`.
2. Registru: dacă c este înregistrat la r, verifică notificarea: la `netrimisă` continuă cu pasul 4; la `trimisă`, cu pasul 7. Altfel verifică: r Rezervată și s titular. Dacă nu: `refuz`, fără modificări și fără apelul expeditorului (sfârșit).
3. Registru: r devine Ridicată; înregistrează momentul ridicării și c; notificarea `în așteptare`.
4. Registru → Expeditor: `trimite(mesaj pentru s)`.
5. Expeditor → Registru: `trimis` sau `esec`.
6. Registru: notificarea `trimisă`, respectiv `netrimisă`.
7. Registru → Ghișeu: `ridicat` (sfârșit). La reîncercare nu se repetă pasul 3. Valoarea `în așteptare` din pasul 3 este intermediară; apelurile secvențiale și răspunsul garantat al expeditorului exclud o nouă cerere în acel moment.

Tranziția (pasul 3) precede apelul expeditorului. Dacă registrul ar schimba starea numai după `trimis`, la `esec` studentul ar pleca cu echipamentul, iar rezervarea ar rămâne Rezervată: registrul ar putea accepta încă o ridicare pentru aceeași rezervare, iar R4 ar fi încălcată. Registrul coordonează; ghișeul nu apelează expeditorul.

## Rezultatele scenariilor

S1, S2, S3 și S7 pornesc din I: A (T1, proiector) și B (T2, cameră) în Rezervată. S4 continuă S3; S5 și S6 continuă independent S1. Rezervarea neindicată de apel rămâne identică.

| Scenariu | Rezultat |
|---|---|
| S1 | `ridicat`; A Ridicată, c1 înregistrat, notificare `trimisă`; B neschimbată. |
| S2 | `refuz` (T2 nu este titularul lui A); exact I; expeditorul nu este apelat; c1 nu se înregistrează. |
| S3 | `ridicat`; A Ridicată, c1 înregistrat, notificare `netrimisă`. |
| S4 | `ridicat` (reîncercare); A rămâne Ridicată, o singură ridicare; expeditorul apelat din nou → `trimisă`. |
| S5 | `refuz` (c7 este cerere nouă, iar A nu mai este Rezervată); exact starea și datele de după S1. |
| S6 | `refuz` (anularea cere Rezervată); A rămâne Ridicată. |
| S7 | `anulează(B)` acceptată: B Anulată; `ridică(c2, B, T2)` refuzată: B rămâne Anulată; fără notificare. |

Ce garantează registrul, în limitele R1: o rezervare este ridicată cel mult o dată; o reîncercare primește același rezultat și nu produce o a doua ridicare; rezultatul notificării este înregistrat; un refuz nu modifică nimic și nu produce mesaje. Ce nu garantează: livrarea sau citirea mesajului; comportamentul la o cădere între pașii 3 și 6; cereri concurente.

## Dificultăți de urmărit

- Confundarea cererii noi (c7, refuzată) cu reîncercarea (c1, acceptată din nou): identificatorul cererii este ceea ce le deosebește, nu conținutul.
- Propunerea de a anula ridicarea la `esec`: încalcă R4 și presupune că `esec` înseamnă „mesajul nu a ajuns”, contrar lui R7.
- Scrierea condiției „s este titularul” ca stare separată: este o verificare de date în starea Rezervată.
- Tratarea lui S2 ca eveniment care schimbă ceva: cererea refuzată nu se înregistrează.
- Cererea nouă pentru o rezervare Ridicată (S5): citită față de rândul din Rezervată, o refuză starea; citită față de rândul reîncercării din Ridicată, o refuză condiția (c nu este înregistrat). Ambele lecturi sunt corecte.

## Exercițiul final (trasări manuale)

Din I, ghișeul trimite `ridică(c1, A, T1)`, iar expeditorul răspunde `trimis`. Răspunsul registrului nu ajunge la ghișeu, deci operatorul nu predă încă proiectorul; ghișeul trimite `ridică(c8, A, T1)`, cu un identificator nou. Rezultate: `ridicat` (A Ridicată, c1 înregistrat, notificare `trimisă`: studentul primește mesajul despre ridicare înainte să aibă proiectorul), apoi `refuz` (c8 este cerere nouă, iar A nu mai este Rezervată); nimic nu se modifică, expeditorul nu este apelat.

Ce știe operatorul: numai `refuz`, același rezultat pe care l-ar fi primit pentru alt student, pentru o rezervare anulată sau pentru una ridicată de altă cerere. Nu poate deosebi „ridicată prin cererea mea” de celelalte. Registrul consemnează A ca Ridicată, deși echipamentul este încă la ghișeu. Pentru A mai este acceptată numai reîncercarea cu c1 (care ar primi `ridicat`, fără alt apel al expeditorului); `anulează(A)` este refuzat (R6). Dacă ghișeul nu mai are c1, niciun eveniment permis nu îl ajută.

Refuzul ar fi fost evitat dacă ghișeul și-ar fi îndeplinit responsabilitatea pe care R3 o presupune: păstrează identificatorul până primește răspunsul și reîncearcă cu același c. Ghișeul este, ca expeditorul, în afara graniței: despre el avem numai o presupunere, iar garanțiile registrului („o reîncercare primește același rezultat”) țin cât timp presupunerea este respectată. Întrebări pentru beneficiar, pe care nu le decidem noi: refuzul ar trebui să își spună motivul (cum făcea rezultatul `fara_dulap` în cursul 6)? Ar trebui ca ghișeul să poată afla starea și datele unei rezervări? Ce face operatorul care a pierdut identificatorul? Nu adăugăm reguli; notăm întrebările.
