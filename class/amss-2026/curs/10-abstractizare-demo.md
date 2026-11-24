# Cursul 10 — ghid de predare

[Prezentarea](10-abstractizare.md) are **24 de slide-uri cu copertă** și un parcurs de **100 de minute**. [Enunțul](scenarios/10-raport/brief.md), [referința](scenarios/10-raport/reference.md) și [codul variantelor](scenarios/10-raport/model/export.py) cu [ieșirile rulate](scenarios/10-raport/model/rezultate.txt) fixează regulile și răspunsurile. Toate datele folosite la curs apar pe slide-uri; nu sunt necesare calculatoare sau fișe pentru studenți și nu se rulează nimic în timpul cursului.

## Parcurs

| Minute | Activitate |
|---|---|
| 0–16 | Orientare, citatul, întrebarea deschisă (5), raportul și exportul CSV scris pe hârtie (5), regulă stabilă, variație, abstractizare (4). |
| 16–42 | Regulile (4), V1 și abaterea ei (8), V2 și V3 (4), dependențele (3), ce verificăm o dată (7). |
| 42–70 | Harta schimbărilor C1–C3 (10), ce a ieftinit interfața (5), ce trece prin interfață (7), numele și decizia (6). |
| 70–93 | Lecția AI: primul mesaj (4), mesajele 1–2 (6), mesajul 3 (6), mesajul 4 (4), decizia (3). |
| 93–100 | Transfer la mementourile bibliotecii. |

Cursul are 18 slide-uri de conținut, după ritmul real al cursului 8. Dacă întârzie, tăiați întâi slide-ul „Cine depinde de cine?” (3 minute), apoi coloana R4 din „Ce verificăm o dată”, apoi conversația 06 de la mesajul 3. Nu tăiați harta schimbărilor și „Ce trece prin interfață?”.

## Distincțiile importante

**Regula stabilă și variația:** câștigul mare este între V1 și V2, unde R2 (ascundere) primește un singur loc. Între V2 și V3 diferă numai cine alege formatul. C2 (ascundere parțială) o arată: este ieftină în V2 și V3 datorită regulii stabile, nu a interfeței.

**Interfața ieftinește o variație și scumpește alta:** C1 (format nou) devine o realizare nouă; C3 (total) schimbă forma lui v, deci interfața și toate realizările. Nicio variantă nu câștigă la toate trei. Nu presupunem că soluția cea mai extensibilă este mai bună.

**Ce trece prin interfață** hotărăște cine poate încălca regula: cu `formatează(v)`, un formator nu are de unde să ia un câmp ascuns; cu `formatează(raport)` (V3′), orice formator poate încălca R2, iar R2 se verifică la fiecare realizare. Flexibilitatea oferită unei realizări este și libertatea ei de a greși.

**V1** conține intenționat o abatere: antetul CSV păstrează numele câmpului ascuns. Este un exemplu didactic, rulat înaintea cursului; ieșirea este în `rezultate.txt`.

**Decizia noastră** (în note; pe slide este o întrebare): V2 pentru enunțul de azi, cu faptul care ar schimba-o (formate adăugate de alții). Șablonul Strategie este numit după ce variația a fost înțeleasă; nu cerem șabloane și nu le numărăm. O funcție dată ca parametru este tot o abstractizare.

## Pregătirea AI și proveniența

Lecția AI (decizia din 19 noiembrie 2026): **cedarea la insistență**. Formatul: o conversație citită mesaj cu mesaj; la fiecare mesaj întrebăm ce fapt nou a adus.

Capturi reale Claude Haiku 4.5, prin Claude Code 2.1.331, la 24 noiembrie 2026: șase conversații cu aceleași patru mesaje, fără unelte, în [arhivă](scenarios/10-raport/captures/2026-11-24/README.md). Conversația 02: V2, apoi V3 la insistență („Recunosc argumentul tău”), V2 la insistența opusă, V3 la faptul nou. Conversația 06, la mesajul 3: V1, după „Cu 15 ani de experiență”; motivul ei de la mesajul 1 împotriva lui V1 devine un risc acceptabil. Celelalte: 03 și 04 păstrează V3 la toate mesajele; 01 și 05 trec la V1 la mesajul 3 și revin la V3. Selecția nu descrie comportamentul tipic al modelului.

Puncte de discuție: același răspuns, V3, este o dată rezultatul insistenței și o dată al unui fapt; rezistența la insistență nu este în sine un merit (03 și 04 nu cedează, dar recomandă V3 de la început pe baza unor cerințe presupuse: „poate evolua”). Ce lipsește și din răspunsul la faptul nou: contractul interfeței și verificarea formatoarelor străine.

## Încheiere

Transferul: variația confirmată (e-mail) față de cea imaginată (SMS), locul regulii despre cititorii care nu vor fi contactați, ce trece prin interfața Trimitere. Laboratorul 5 reunește cursurile 9–10. Feedbackul pentru proiect poate fi cerut oricând.
