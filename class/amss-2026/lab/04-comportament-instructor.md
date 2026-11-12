# Laboratorul 4 — ghid pentru profesor

**100 de minute, după cursurile 7–8; 17 slide-uri cu copertă.** [Prezentarea](04-comportament.md), [enunțul](scenarios/04-comportament/scenario.md), [referința](scenarios/04-comportament/reference.md) și [sprijinul facultativ](scenarios/04-comportament/worksheet.md) alcătuiesc pachetul. Exercițiile nu cer documente de predat, încărcări, o notă separată sau implementare.

## Parcurs

| Minute | Activitate | Intervenția profesorului |
|---|---|---|
| 0–10 | Problema, citatul și recapitularea. | Clarificați: starea spune ce este permis acum; reîncercarea are același identificator. |
| 10–30 | Predicții S2, S7, S5; tabelul de tranziții, individual, apoi în plen. | „În ce stare sosește reîncercarea?” |
| 30–55 | Interacțiunea S1 și S3, 12 min; reîncercările S4 și S5, 13 min. | Cereți pasul în care se schimbă starea față de apelul expeditorului. |
| 55–75 | O analiză AI, o revizuire și decizia, în plen. | Conduceți demonstrația; studenții prezic și verifică. |
| 75–100 | Exercițiul final, individual, apoi în plen, 15 min; încheiere 10 min. | Colegul care verifică privește primul dacă expeditorul a fost apelat. |

Studenții lucrează individual, apoi explică în plen: un voluntar explică, iar alt coleg verifică, fără prezentări formale. Cine vrea poate compara răspunsul cu un vecin, dar nu cerem asta. Nu cereți explorarea automată a stărilor, analiza formală sau concurența, care urmează în cursul 9.

## Răspunsuri și dificultăți de urmărit

Starea inițială **I**: A (titular T1, proiector) și B (titular T2, cameră) în Rezervată; niciun identificator de cerere înregistrat. Majoritatea scenariilor repornesc din I; continuările sunt marcate explicit.

| Scenariu | Rezultat |
|---|---|
| S1: `ridica(c1, A, T1)`, `trimis` | `ridicat`; A Ridicată, c1 înregistrat, notificare `trimisă`. |
| S2: `ridica(c1, A, T2)` | `refuz` (condiția titularului); exact I; expeditorul nu este apelat. |
| S3: `ridica(c1, A, T1)`, `esec` | `ridicat`; A Ridicată, c1 înregistrat, notificare `netrimisă`. |
| S4 (după S3): `ridica(c1, A, T1)`, `trimis` | `ridicat` (reîncercare); o singură ridicare; expeditorul apelat din nou; notificare `trimisă`. |
| S5 (după S1): `ridica(c7, A, T1)` | `refuz` (cerere nouă, A nu mai este Rezervată); nimic nu se modifică. |
| S6 (după S1): `anuleaza(A)` | `refuz`; A rămâne Ridicată. |
| S7: `anuleaza(B)`, apoi `ridica(c2, B, T2)` | Anulare acceptată, B Anulată; ridicare refuzată (stare finală); fără notificare. |

Tabelul de tranziții așteptat are trei rânduri: Rezervată + `ridica` cu c nou și s titular → Ridicată; Ridicată + `ridica` cu c înregistrat → Ridicată (reîncercare; notificarea `netrimisă` se reîncearcă); Rezervată + `anuleaza` → Anulată. Orice altă combinație, sau o condiție neîndeplinită, este refuzată fără modificări. Dificultatea principală: reîncercarea este pusă în Rezervată, deși c se înregistrează numai la acceptare, deci sosește în Ridicată; întrebarea colegului care verifică o scoate la iveală. A doua dificultate: cererea nouă cu același conținut (c7) confundată cu reîncercarea (c1); le deosebește numai identificatorul.

Anulată este finală intenționată. Ridicată permite reîncercarea, deci nu este finală în sensul cursului 7; faptul că ridicarea fizică s-a încheiat nu încheie tratarea notificării.

Interacțiunea: tranziția și înregistrarea lui c preced apelul expeditorului; la `esec`, notificarea `netrimisă` este înregistrată, iar răspunsul rămâne `ridicat` (R4). Dacă cineva propune schimbarea stării numai la `trimis`, cereți S3 în acea ordine: studentul pleacă cu echipamentul, iar A rămâne Rezervată, deci registrul ar putea accepta încă o ridicare pentru aceeași rezervare. Despre expeditor presupunem numai că răspunde `trimis` sau `esec` (R7); nu presupunem că `esec` înseamnă nelivrare.

## O singură analiză și o singură revizuire AI

Demonstrația este comună, condusă de profesor; nu cereți studenților să opereze un asistent AI. În celelalte etape, studenții lucrează individual și discută în plen. Nu este necesar să aibă conturi AI.

Slide-urile conțin **capturi reale pregătite** Claude Haiku 4.5, din 12 noiembrie 2026 (Claude Code 2.1.322, fără unelte și fără contextul proiectului). [Fragmentele selectate](scenarios/04-comportament/prepared-fixture.md) și [arhiva](scenarios/04-comportament/captures/2026-11-12/README.md) păstrează promptul exact, contextul, răspunsurile integrale și ambele încercări pentru fiecare rol. Analiza 01 calculează corect S2, S4 și S7 și descrie corect interacțiunea, dar tabelul ei pune reîncercarea în Rezervată și refuză orice `ridica` în Ridicată, contrazicând propriul calcul al lui S4 și R5; adaugă și presupuneri despre expeditor care nu sunt în enunț. Revizuirea 02 observă corect că rândul reîncercării este vag, dar nu confruntă rândul „Ridicată | ridica | refuz” cu S4 și confirmă „idempotența”. Selecția nu descrie performanța tipică a modelului. Enunțul trimis avea și o contradicție proprie: R2 numea Ridicată „finală”, deși R5 permite reîncercări. Enunțul curent corectează R2; capturile și intrările lor rămân intacte. Discutați separat eroarea enunțului și contradicția internă a răspunsului. „Idempotență” privește efectul repetării, nu egalitatea răspunsurilor; R5 cere aici și același răspuns.

O rulare live poate înlocui capturile: folosiți [instrucțiunea și contextul](scenarios/04-comportament/ai/README.md) cu instrumentul disponibil al profesorului, fără a impune un model, și nu furnizați referința cu soluții. Discutați atunci rezultatul efectiv, nu omisiunile capturii.

1. **Analiză, 8 min:** cereți fiecărui student predicția pentru scenariul S4 (reîncercare după eșec); S2 și S7 au fost discutate în prima etapă; profesorul trimite o singură sarcină cu enunțul integral. Afișați răspunsul și comparați tabelul de tranziții cu calculul lui S4. Limitați așteptarea la două minute incluse în etapă; dacă instrumentul nu răspunde, folosiți captura pregătită. Nu treceți la configurări de conturi în timpul laboratorului.
2. **Revizuire, 8 min:** într-un context nou, transmiteți evaluatorului (agent AI de revizuire) același enunț, sarcina exactă și propunerea integrală. Cereți afirmații susținute, omisiuni și contradicții, cu fragment, regulă și scenariu; fără număr obligatoriu de defecte. Studenții prezic ce ar trebui să observe evaluatorul AI despre rândul reîncercării înainte de a vedea revizuirea. Dacă analiza a fost live și revizuirea nu răspunde, o puteți revizui între colegi în plen, etichetând corect parcursul.
3. **Decizie, 4 min:** o afirmație acceptată ori corectată, justificată prin regulă și scenariu. Un răspuns corect este suficient pentru o discuție utilă. Nu impuneți rescrierea printr-un nou prompt și nu adăugați alte rulări de analiză în paralel.

**Regulile rămân vizibile:** la afișarea rezultatului live, folosiți două ferestre alăturate, una cu slide-ul de repere și una cu răspunsul. La capturile noi, puneți fragmentele și rezumatul regulilor pe același slide, cu proveniență și omisiuni marcate. Păstrați promptul, contextul, răspunsul integral, data, instrumentul, modelul declarat și setările cunoscute; nu cereți studenților transcrieri.

## Exercițiul final

Din I, `ridica(c1, A, T1)` cu `esec` produce `ridicat`, A Ridicată, notificare `netrimisă`. Cererea `ridica(c8, A, T1)` cu identificator nou este refuzată (A nu mai este Rezervată) și nu apelează expeditorul; notificarea rămâne `netrimisă`. Ramura separată, tot din starea de după primul pas: reîncercarea `ridica(c1, A, T1)` primește `ridicat`, expeditorul este apelat din nou, notificarea devine `trimisă`. Diferența stă numai în identificatorul cererii. Întrebarea de încheiere, pentru discuție: ce ar trebui să facă ghișeul ca să reîncerce cu același identificator?

## Varianta online

[Prezentarea online](04-comportament-online.md) păstrează cele 17 slide-uri, regulile, scenariile, capturile pregătite și toate duratele. Întâlnirea Teams se desfășoară numai în plen, fără grupuri separate:

- Predicțiile individuale se scriu în chat și se trimit la semnal.
- Explicațiile se dau în ștafetă: un coleg propune, un coleg numit verifică regula și continuă cu următorul scenariu sau pas.
- La exercițiul final, un voluntar explică, alt coleg verifică primul dacă expeditorul a fost apelat. Notițele nu se colectează; camera și partajarea ecranului de către studenți sunt facultative.
- **Aceeași demonstrație AI este condusă de profesor**, care partajează analiza și revizuirea, păstrând regulile vizibile. Nu distribuim rolurile de operare AI între studenți și nu pornim analize proprii în paralel.

Profesorul sau un student poate prezenta slide-urile; profesorul conduce în continuare etapa AI. Nu faceți push pe `main` în timpul întâlnirii sincronizate: deploy-ul repornește serviciul. Dacă discuția online cere mai mult timp, ascultați mai puține explicații, păstrând exercițiul final și toate scenariile.
