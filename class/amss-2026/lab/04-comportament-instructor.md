# Laboratorul 4 — ghid pentru profesor

**100 de minute, după cursurile 7–8; 17 slide-uri cu copertă.** [Prezentarea](04-comportament.md), [enunțul](scenarios/04-comportament/scenario.md), [referința](scenarios/04-comportament/reference.md), [sprijinul facultativ](scenarios/04-comportament/worksheet.md) și specificațiile [diagramei de stări](diagrame/stari.md) și [diagramei de secvență](diagrame/secventa.md) alcătuiesc pachetul. Exercițiile nu cer documente de predat, încărcări, o notă separată sau implementare.

Din 19 noiembrie 2026 laboratorul are formatul cu atelier de diagrame (decizia din `docs/ai-lessons-and-lab-diagrams.md`): prima jumătate discută problema, a doua desenează diagrama de stări a rezervării. Analiza AI în plen, condusă de profesor, nu mai face parte din laborator; folosirea unui asistent AI trece în atelier, unde fiecare student decide dacă îl folosește.

## Parcurs

| Minute | Activitate | Intervenția profesorului |
|---|---|---|
| 0–10 | Problema, citatul și recapitularea. | Clarificați: starea spune ce este permis acum; reîncercarea are același identificator. |
| 10–28 | Predicții S2, S7, S6, 6 min; tabelul de tranziții, individual, apoi în plen, 12 min. | „În ce stare sosește reîncercarea?” |
| 28–50 | Interacțiunea S1 și S3, 10 min; reîncercările S4 și S5, 12 min. | Cereți pasul în care se schimbă starea față de apelul mesageriei. |
| 50–70 | Atelier: sarcina, 2 min; diagrama de stări, individual, 16 min; autoverificare cu lista, 2 min. | Treceți printre bănci; „ce regulă susține această săgeată?” Alegeți voluntarii. |
| 70–80 | Verificarea în plen a unei diagrame sau a două. | Un voluntar arată, un coleg verifică punct cu punct; fiecare observație numește punctul și regula. |
| 80–87 | Corectare; extensia (diagrama de secvență) pentru cine a terminat. | Răspundeți la întrebări individuale. |
| 87–95 | Diagrama de referință, comparată cu diagrama corectată în plen. | Variantele acceptabile față de greșeli. |
| 95–100 | Încheiere. | Două-trei exemple scurte. |

Studenții lucrează individual, apoi explică în plen: un voluntar explică, iar alt coleg verifică, fără prezentări formale. Nu cereți explorarea automată a stărilor, analiza formală sau concurența, care urmează în cursul 9.

**Repere de timp:** minutul 10 (prima tranziție), 28 (interacțiunea), 50 (atelierul), 70 (verificarea în plen), 87 (referința), 95 (încheierea). Dacă discuția din prima jumătate întârzie, scurtați explicațiile S4/S5 (ascultați un singur coleg), nu atelierul: atelierul are nevoie de cel puțin 15 minute de lucru individual și de verificarea în plen.

## Răspunsuri și dificultăți de urmărit

Starea inițială **I**: A (titular T1, proiector) și B (titular T2, cameră) în Rezervată; niciun identificator de cerere înregistrat. Majoritatea scenariilor repornesc din I; continuările sunt marcate explicit.

| Scenariu | Rezultat |
|---|---|
| S1: `ridică(c1, A, T1)`, `trimis` | `ridicat`; A Ridicată, c1 înregistrat, notificare `trimisă`. |
| S2: `ridică(c1, A, T2)` | `refuz` (condiția titularului); exact I; mesageria nu este apelată. |
| S3: `ridică(c1, A, T1)`, `eșec` | `ridicat`; A Ridicată, c1 înregistrat, notificare `netrimisă`. |
| S4 (după S3): `ridică(c1, A, T1)`, `trimis` | `ridicat` (reîncercare); o singură ridicare; mesageria apelată din nou; notificare `trimisă`. |
| S5 (după S1): `ridică(c7, A, T1)` | `refuz` (cerere nouă, A nu mai este Rezervată); nimic nu se modifică. |
| S6 (după S1): `anulează(A)` | `refuz`; A rămâne Ridicată. |
| S7: `anulează(B)`, apoi `ridică(c2, B, T2)` | Anulare acceptată, B Anulată; ridicare refuzată (stare finală); fără notificare. |

Tabelul de tranziții așteptat are trei rânduri: Rezervată + `ridică` cu c nou și s titular → Ridicată; Ridicată + `ridică` cu c înregistrat → Ridicată (reîncercare; notificarea `netrimisă` se retrimite); Rezervată + `anulează` → Anulată. Orice altă combinație, sau o condiție neîndeplinită, este refuzată fără modificări. Dificultatea principală: reîncercarea este pusă în Rezervată, deși c se înregistrează numai la acceptare, deci sosește în Ridicată. A doua dificultate: cererea nouă cu același conținut (c7) confundată cu reîncercarea (c1); le deosebește numai identificatorul. Întrebarea „o refuză starea sau condiția?” pentru cererea nouă în Ridicată are două răspunsuri corecte, după rândul față de care o citim; acceptați-le pe amândouă, cu justificare.

Anulată este finală intenționată. Ridicată permite reîncercarea, deci nu este finală în sensul cursului 7; faptul că ridicarea fizică s-a încheiat nu încheie tratarea notificării.

Interacțiunea: tranziția și înregistrarea lui c preced apelul mesageriei; la `eșec`, notificarea `netrimisă` este înregistrată, iar răspunsul rămâne `ridicat` (R4). Dacă cineva propune schimbarea stării numai la `trimis`, cereți S3 în acea ordine: studentul pleacă cu echipamentul, iar A rămâne Rezervată, deci registrul ar putea accepta încă o ridicare pentru aceeași rezervare. Despre mesagerie presupunem numai că răspunde `trimis` sau `eșec` (R7); nu presupunem că `eșec` înseamnă nelivrare.

## Atelierul de diagrame

**Materiale:** enunțul și [specificația diagramei de stări](diagrame/stari.md) (ce întrebări acoperă diagrama, subsetul UML, notația Mermaid și limitele ei, lista de verificare în șapte puncte, erori frecvente, exemplul lucrat al unei comenzi la cantină, un prompt AI și revizuirea lui). Extensia folosește [specificația diagramei de secvență](diagrame/secventa.md). Diagramele de referință, cu justificarea fiecărui element față de reguli, sunt în [referință](scenarios/04-comportament/reference.md).

**Moduri de lucru:** de mână, în Mermaid (mermaid.live sau previzualizarea GitHub) ori generată cu un asistent AI din enunț și specificație și revizuită. Nu impuneți un mod și nu un instrument; nu sunt necesare conturi AI. Cine folosește un asistent AI nu îi dă tabelul discutat sau referința: îi dă enunțul și specificația, apoi verifică fiecare punct al listei față de enunț și corectează direct, fără un prompt nou pentru fiecare corectură.

**Ce urmăriți la bănci (50–70):**

- bucla reîncercării pusă pe Rezervată în loc de Ridicată (punctele 3–4 ale listei); întrebați „când se înregistrează c?”;
- stări pentru notificare („Notificare trimisă / netrimisă”) sau Ridicată împărțită după notificare (punctul 1);
- săgeți sau bucle pentru refuzuri, o stare „Refuzată” sau „Eroare” (punctul 6);
- condiția titularului desenată ca stare intermediară („Titular verificat”) (punctele 1 și 4);
- `Anulată --> [*]` (punctul 6: în UML, obiectul ar ieși din Anulată);
- efecte inventate: ștergerea datelor la anulare, notificare la anulare; sau efecte lipsă: apelul `trimite(mesaj)` (punctul 5);
- casete numite cu verbe („Verifică titularul”): diagramă de activitate în loc de diagramă de stări.

**Erori frecvente ale diagramelor generate cu un asistent AI:** stări suplimentare pentru rezultatul notificării sau pentru erori; o stare finală UML după Anulată și, uneori, după Ridicată; bucle pentru refuzuri, scrise ca „/ refuz”; condiții sau efecte adăugate fără regulă (expirarea rezervării, un termen de ridicare, returnarea echipamentului, „livrare garantată”); punct și virgulă în etichete, care în Mermaid taie eticheta și creează o stare în plus, fără eroare. Acestea sunt erori posibile, nu un rezultat garantat; un răspuns corect este la fel de util, dacă studentul îl verifică punct cu punct. Întrebarea de pus: „ce regulă din enunț susține această stare sau săgeată?”.

**Verificarea în plen (70–80):** alegeți la bănci unul sau doi voluntari, de preferință cu moduri de lucru diferite și cu o greșeală instructivă. Diagrama se arată pe tablă sau ca text Mermaid randat pe proiector. Un coleg o verifică după listă; fiecare observație numește punctul și regula. Slide-ul arată punctele cele mai discriminante, cu regulile lor, și scenariul S4 (reîncercare după eșec) ca test: o diagramă cu bucla pe Rezervată nu are săgeată pentru S4. Dacă diagrama voluntarului este corectă, confirmați-o punct cu punct; nu inventați o greșeală.

**Diagrama de referință (87–95):** comparați diagrama corectată în plen cu referința. Variante acceptabile: bucla reîncercării împărțită în două după notificare, efecte formulate mai scurt, tranziții numerotate cu tabel alăturat (ca în cursul 7). Neacceptabile: stări pentru notificare sau refuz, bucle pentru refuzuri, bucla pe Rezervată, starea finală UML după Anulată, efecte noi. Rezultatul `ridicat`/`refuz` întors ghișeului nu apare pe diagrama de stări.

**Extensia (80–87):** diagrama de secvență a scenariului S3 urmat de S4: ghișeu, registru (în interiorul graniței), mesagerie. De urmărit: nota tranziției înaintea apelului `trimite`; `ridicat` după `eșec`; la reîncercare, nicio a doua tranziție; ghișeul nu apelează mesageria. Referința este în `reference.md`; o puteți arăta celor care termină.

Nu se predau, nu se încarcă și nu se notează diagrame.

## Exercițiu suplimentar (scos de pe slide-uri)

Exercițiul „Ghișeul nu a primit răspunsul” nu mai încape în 100 de minute; rămâne în [sprijinul facultativ](scenarios/04-comportament/worksheet.md), pentru studiu individual, cu răspunsurile în [referință](scenarios/04-comportament/reference.md). Pe scurt: din I, `ridică(c1, A, T1)` cu `trimis` produce `ridicat`; răspunsul nu ajunge la ghișeu, care trimite `ridică(c8, A, T1)`, cu identificator nou: `refuz`, fără apelul mesageriei. Operatorul vede numai `refuz`; pentru A mai este acceptată numai reîncercarea cu c1. Ghișeul, componentă din afara graniței, nu și-a îndeplinit responsabilitatea presupusă de R3: păstrează identificatorul până primește răspunsul. Dacă rămâne timp la încheiere, puteți pune întrebarea în plen.

## Materiale AI arhivate

Demonstrația AI în plen din versiunea de 12 noiembrie 2026 a fost scoasă de pe slide-uri la 19 noiembrie 2026. Prompturile ([`ai/`](scenarios/04-comportament/ai/README.md)), capturile reale Claude Haiku 4.5 ([arhiva](scenarios/04-comportament/captures/2026-11-12/README.md)) și [fragmentele selectate](scenarios/04-comportament/prepared-fixture.md) rămân neschimbate, ca arhivă. Pot servi ca exemplu de discuție dacă un student întreabă cum greșește un asistent AI un tabel de tranziții (analiza pune reîncercarea în Rezervată), dar nu fac parte din plan.

## Varianta online

[Prezentarea online](04-comportament-online.md) păstrează cele 17 slide-uri, regulile, scenariile, diagrama de referință și toate duratele. Întâlnirea Teams se desfășoară numai în plen, fără grupuri separate:

- Predicțiile individuale se scriu în chat și se trimit la semnal.
- Explicațiile se dau în ștafetă: un coleg propune, un coleg numit verifică regula și continuă cu următorul scenariu sau pas.
- **Atelierul:** fiecare lucrează individual, cu aceleași trei moduri; întrebările se pun în chat și primesc răspuns în plen (nu puteți trece printre bănci). Cereți dinainte unui voluntar și unui coleg numit să se pregătească pentru verificare.
- **Verificarea în plen:** voluntarul își partajează ecranul cu diagrama (desen fotografiat, editor Mermaid sau răspunsul AI revizuit) sau trimite textul Mermaid în chat, iar profesorul îl randează în mermaid.live; colegul numit verifică punct cu punct. La diagrama de referință, colegii trimit în chat numărul punctului la care diagrama lor diferă.
- Textul Mermaid și mesajele din chat nu se colectează; camera și partajarea ecranului de către studenți sunt facultative.

Profesorul sau un student poate prezenta slide-urile. Nu faceți push pe `main` în timpul întâlnirii sincronizate: deploy-ul repornește serviciul. Dacă discuția online cere mai mult timp, ascultați mai puține explicații în prima jumătate, păstrând toate scenariile și cel puțin 15 minute de lucru individual în atelier.
