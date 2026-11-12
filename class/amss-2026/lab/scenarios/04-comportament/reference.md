# Raționament de referință — ghișeul de echipamente

Material de pregătire pentru [enunț](scenario.md), construit didactic; nu captură AI.

## Tabelul de tranziții al rezervării

| Stare curentă | Eveniment | Condiție | Stare următoare | Efect |
|---|---|---|---|---|
| Rezervată | `ridica(c, r, s)` | c neînregistrat, s este titularul | Ridicată | data ridicării, c înregistrat, notificare `trimisă`/`netrimisă` |
| Ridicată | `ridica(c, r, s)` | c înregistrat la r (reîncercare) | Ridicată | notificarea poate trece din `netrimisă` în `trimisă` |
| Rezervată | `anuleaza(r)` | — | Anulată | — |

Orice altă combinație, sau o condiție neîndeplinită, este refuzată: `refuz`, fără modificări, fără apelul expeditorului. Anulată este finală intenționată. Ridicată permite reîncercarea, deci nu este finală în sensul cursului 7. Al doilea rând nu schimbă starea; îl scriem ca să fie vizibil că reîncercarea este permisă în Ridicată, spre deosebire de o cerere nouă (c neînregistrat), care este refuzată acolo.

Condiția „s este titularul” depinde de date, nu de stare: o cerere greșită lasă rezervarea Rezervată, cu toate datele. Etapa și datele decid ce evenimente sunt permise. Titularul, echipamentul, data ridicării și identificatorul înregistrat se păstrează; rezultatul notificării poate fi actualizat (R5).

## Interacțiunea pentru `ridica(c, r, s)`

1. Ghișeu → Registru: `ridica(c, r, s)`.
2. Registru: dacă c este înregistrat la r, verifică notificarea: la `netrimisă` continuă cu pasul 4; la `trimisă`, cu pasul 7. Altfel verifică: r Rezervată și s titular. Dacă nu: `refuz`, fără modificări și fără apelul expeditorului (sfârșit).
3. Registru: r devine Ridicată; înregistrează data ridicării și c; notificarea `în așteptare`.
4. Registru → Expeditor: `trimite(mesaj pentru s)`.
5. Expeditor → Registru: `trimis` sau `esec`.
6. Registru: notificarea `trimisă`, respectiv `netrimisă`.
7. Registru → Ghișeu: `ridicat` (sfârșit). La reîncercare nu se repetă pasul 3. Starea `în așteptare` din pasul 3 este intermediară; apelurile secvențiale și răspunsul garantat al expeditorului exclud o nouă cerere în acel moment.

Tranziția (pasul 3) precede apelul expeditorului. Dacă registrul ar schimba starea numai după `trimis`, la `esec` studentul ar pleca cu echipamentul, iar rezervarea ar rămâne Rezervată: registrul ar putea accepta încă o ridicare pentru aceeași rezervare, iar R4 încălcată. Registrul coordonează; ghișeul nu apelează expeditorul.

## Rezultatele scenariilor

S1, S2, S3 și S7 pornesc din I: R1 (S1, proiector) și R2 (S2, cameră) în Rezervată. S4 continuă S3; S5 și S6 continuă independent S1. Rezervarea neindicată de apel rămâne identică.

| Scenariu | Rezultat |
|---|---|
| S1 | `ridicat`; R1 Ridicată, c1 înregistrat, notificare `trimisă`; R2 neschimbată. |
| S2 | `refuz` (S2 nu este titularul lui R1); exact I; expeditorul nu este apelat; c1 nu se înregistrează. |
| S3 | `ridicat`; R1 Ridicată, c1 înregistrat, notificare `netrimisă`. |
| S4 | `ridicat` (reîncercare); R1 rămâne Ridicată, o singură ridicare; expeditorul apelat din nou → `trimisă`. |
| S5 | `refuz` (c7 este cerere nouă, iar R1 nu mai este Rezervată); exact starea de după S1. |
| S6 | `refuz` (anularea cere Rezervată); R1 rămâne Ridicată. |
| S7 | `anuleaza(R2)` acceptată: R2 Anulată; `ridica(c2, R2, S2)` refuzată: R2 rămâne Anulată; fără notificare. |

Ce garantează registrul, în limitele R1: o rezervare este ridicată cel mult o dată; o reîncercare primește același rezultat și nu produce o a doua ridicare; rezultatul notificării este înregistrat; un refuz nu modifică nimic și nu produce mesaje. Ce nu garantează: livrarea sau citirea mesajului; comportamentul la o cădere între pașii 3 și 6; cereri concurente.

## Dificultăți de urmărit

- Confundarea cererii noi (c7, refuzată) cu reîncercarea (c1, acceptată din nou): identificatorul cererii este ceea ce le deosebește, nu conținutul.
- Propunerea de a anula ridicarea la `esec`: încalcă R4 și presupune că `esec` înseamnă „mesajul nu a ajuns”, contrar lui R7.
- Scrierea condiției „s este titularul” ca stare separată: este o verificare de date în starea Rezervată.
- Tratarea lui S2 ca eveniment care schimbă ceva: cererea refuzată nu se înregistrează.

## Exercițiul final (trasări manuale)

Din I, ghișeul trimite `ridica(c1, R1, S1)` cu `esec`, apoi, după ce aplicația nu a afișat răspunsul, `ridica(c8, R1, S1)` cu un identificator nou. Rezultate: `ridicat` (R1 Ridicată, notificare `netrimisă`), apoi `refuz` (R1 nu mai este Rezervată; c8 este cerere nouă). Studentul are echipamentul, rezervarea este ridicată o singură dată, iar notificarea rămâne `netrimisă` până la o reîncercare cu c1; enunțul nu oferă o operație separată de retrimitere. Dacă ghișeul ar fi reîncercat cu c1, iar expeditorul ar fi răspuns `trimis`, ar fi primit `ridicat` și notificarea ar fi devenit `trimisă`. Deosebirea dintre cele două rezultate stă numai în identificatorul cererii.
