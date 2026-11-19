# Raționament de referință — Cursul 3

Material redactat pentru pregătirea profesorului, pe baza [enunțului](brief.md). Nu este răspuns AI capturat. Rezultatele sunt raționamente despre cerințe, fără implementare sau execuție de teste.

Un exemplu de acceptare precizează rezultatul prin care sistemul respectă cerința. O cerere respinsă corect este un astfel de exemplu, chiar dacă utilizatorul nu obține schimbarea solicitată.

## Decizia despre sesizări repetate

R1 și R2 stabilesc deja crearea unei sesizări la fiecare raportare validă și accesul studentului numai la propriile sesizări. Varianta în care Bogdan urmărește sesizarea Anei fără să primească una nouă ar modifica ambele reguli. R3 confirmă păstrarea raportărilor separate; nu presupunem că alternativa comună ar fi fost permisă de regulile inițiale.

## De la sursă la rezultat

| Scenariu independent | Rezultat și justificare |
|---|---|
| Student identificat, loc și descriere prezente | R1: sesizare nouă, număr unic, autorul păstrat, stare „înregistrată”; numărul și starea sunt afișate. |
| Lipsește locul sau descrierea | R1: respingere, informația lipsă indicată, nicio sesizare creată. |
| Daria din administrație cere „în lucru” pentru S41 „înregistrată” | R2 și R4: acceptare, S41 devine „în lucru”. |
| Ana cere aceeași schimbare | R2: respingere prin rol, cu motiv; S41 rămâne „înregistrată”. |
| Daria cere direct „rezolvată” pentru S41 „înregistrată” | R4: respingere prin schimbare nepermisă, cu motiv; starea se păstrează. |
| Daria cere „înregistrată” pentru S41 deja „înregistrată” | R4: repetarea stării curente este respinsă, cu motiv; starea se păstrează. |
| Bogdan raportează robinetul deja descris de S41, aflată „în lucru” | R1 și R3: o nouă sesizare, de exemplu S42, a lui Bogdan, „înregistrată”; S41 rămâne a Anei, „în lucru”. R2: fiecare student o consultă pe a sa. |
| Lotul A: 950/1.000 afișări corecte în cel mult 2 secunde | Îndeplinește Q1, exact la prag. Nu generalizăm la orice încărcare. |
| Lotul B: 949/1.000 la timp | Nu îndeplinește Q1. O medie bună nu înlocuiește pragul convenit. |

Nu inferăm o schemă de baze de date sau un număr de clase din aceste reguli. S41 și S42 sunt identificatori ilustrativi.

## Precizia inventată: capturile din 19 noiembrie 2026

Arhiva [din 19 noiembrie 2026](captures/2026-11-19/README.md) păstrează trei rulări Claude Haiku 4.5 cu același prompt: enunțul (R1–R4, Q1, excluderile) și cererea unor cerințe de calitate verificabile. Prezentarea folosește rularea 1. Tabelul de proveniență al profesorului:

| Număr din răspuns (rularea 1) | Sursa în enunț | Verdict |
|---|---|---|
| 100% / 0% (CQ1, CQ3, CQ4) | R1–R4: regula se aplică fiecărei cereri | Susținut; se poate scrie „fiecare” / „niciuna”. |
| Max 1 secundă (CQ1, CQ2, CQ3) | Niciuna; Q1 fixează timpul numai pentru consultare | Nesusținut; întrebare pentru administrație. |
| 10.000; 20 de consultări simultane; 950 din 1.000; 2 secunde (CQ5) | Q1 | Susținut; lipsește rețeaua campusului. |
| 20 de utilizatori simultani (CQ5) | Q1 spune 20 de consultări simultane | Schimbat față de sursă; se corectează. |
| 50 de sesizări pe utilizator (CQ5) | Niciuna; Q1 lasă setul de date nestabilit | Nesusținut; propunere pentru planul de verificare. |
| 1.000 de operații (CQ4) | Niciuna; R3 cere rezultatul | Nesusținut; propunere pentru planul de verificare. |
| 2+ cereri în paralel, 0 stări invalide (CQ6) | Niciuna; enunțul nu analizează concurența actualizărilor | Nesusținut; cerință nouă, nu se păstrează. |

Rularea 2 păstrează Q1 integral, dar alege dimensiuni de test (10 combinații, 15 tranziții valide și 10 invalide). Rularea 3 nu adaugă alt prag de timp. Nu generalizăm din trei rulări.

## Analiza capturilor AI din 10 octombrie 2026

Din 19 noiembrie 2026, prezentarea folosește din această arhivă numai cele trei afirmații ale răspunsului inițial 2 de pe slide-ul „Ce știm și ce rămâne de convenit?”. Analiza de mai jos rămâne pentru arhivă.

Arhiva [din 10 octombrie 2026](captures/2026-10-10/README.md) păstrează șase rulări independente cu Claude Haiku 4.5. Raționamentele de mai jos sunt ale profesorului, distincte de răspunsurile capturate.

- **Inițial 2:** pragul sub două secunde și închiderea după trei zile fără răspuns nu provin din cererea administrației. Le tratăm ca propuneri care necesită acord, nu ca încălcări ale R1–R4 sau Q1, pe care modelul nu le primise. După clarificare, unicitatea se confirmă prin R1, iar notificările prin email/mesaj rămân excluse.
- **Analist 1:** propoziția despre Q1 păstrează 10.000 de sesizări, 20 de consultări simultane și pragul 950/1.000 în cel mult două secunde, dar omite rețeaua campusului și măsurarea de la acțiunea în browser până la afișarea stării. Un control al timpului serverului ar putea satisface rezumatul fără să verifice cerința originală. Analistul 2 face aceleași omisiuni.
- **Corecție:** în rețeaua campusului, cu 10.000 de sesizări și 20 de consultări simultane, cel puțin 950 din 1.000 de consultări valide ale propriilor sesizări afișează starea corectă în cel mult două secunde de la acțiunea de consultare în browser. Toate consultările rămân supuse cerințelor funcționale și de acces.
- **Evaluator 1:** confirmă corect transcrierea pragului numeric, dar nu semnalează rețeaua și intervalul măsurat. Este o revizuire incompletă; nu îi atribuim afirmația mai largă că toate condițiile ar fi fost păstrate. Revizuirea observă util și că „afișează confirmarea” nu cere explicit afișarea numărului și a stării. Evaluatorul 2 discută alte omisiuni, fără să identifice cele două condiții.
- **Decizia profesorului:** se restabilesc condițiile Q1 înainte de predare. Răspunsurile AI rămân neschimbate în arhivă; corecția nu este prezentată ca ieșire a modelului.

## Exercițiul de transfer

Datele despre consultații stabilesc un singur loc pe interval și exclud anularea. Dacă Ana ocupă 10:00–10:15, încercarea ulterioară a lui Bogdan este respinsă, iar înscrierea Anei se păstrează. Un mesaj explicit de indisponibilitate este o propunere rezonabilă de completare, nu o formulare deja impusă de enunț.

Pentru „ușor”, întâi stabilim utilizatorii, sarcina și dificultatea pe care dorim să o evităm. Abia apoi propunem un criteriu observabil și îl convenim. Nu atribuim beneficiarului un număr de clicuri inventat de noi.
