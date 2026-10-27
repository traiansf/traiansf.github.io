# Cursul 6 — ghid de predare

[Prezentarea](06-contracte.md) are **28 de slide-uri cu copertă** și un parcurs de **100 de minute**. [Enunțul](scenarios/06-dulapuri/brief.md) și [referința](scenarios/06-dulapuri/reference.md) fixează regulile și răspunsurile. Toate datele, regulile relevante și sarcinile folosite la curs apar pe slide-uri; nu sunt necesare calculatoare sau fișe pentru studenți.

## Parcurs

| Minute | Activitate |
|---|---|
| 0–10 | Două refuzuri, două registre finale; predicție înainte de terminologie. |
| 10–30 | Precondiție, condiție de succes, postcondiție și invariant. |
| 30–55 | Contractele atribuirii și eliberării, efectul limitat, repetarea. |
| 55–80 | Pseudocod greșit, trasare manuală, corecție și conservarea unicității. |
| 80–95 | Sarcină AI pregătită, contract de revizuit și decizie. |
| 95–100 | Transfer la truse și tehnicieni. |

Duratele exercițiilor includ discuția. În etapa 30–55, acordați 7 minute atribuirii, 8 scenariilor, 4 eliberării și repetării, 6 contractului incomplet. Marcajul de 6 minute de pe ultimul slide al etapei privește numai activitatea de pe acel slide. Tranzițiile sunt incluse în intervale.

## Distincțiile importante

Identificatorii cunoscuți, registrul valid și apelurile seriale sunt precondițiile/contextul promis. „Vizitator fără dulap și dulap liber” este condiția de succes a operației publice: ocuparea trebuie să producă un refuz specificat. Dacă am muta această condiție doar în precondiție, am retrage tocmai promisiunea cerută pentru dulapurile ocupate.

R2 descrie o stare validă; R3–R5 descriu relația dintre starea inițială, rezultatul întors și starea finală. Un refuz care pierde V1–D1 poate păstra unicitatea și totuși încălca contractul. La succes, „V3 are D3” nu exclude pierderea lui V2–D2; de aceea precizăm efectul exact și păstrarea restului.

S1–S4 și S6 repornesc independent din B={V1–D1,V2–D2}, cu V3 fără dulap și D3 liber. S5 are două eliberări succesive: prima întoarce `eliberat`, a doua `fara_dulap`; starea după fiecare este {V2–D2}. Repetarea aceleiași atribuiri este refuzată, potrivit condiției de succes, chiar dacă asocierea cerută există deja. Alte politici sunt posibile în alte enunțuri, dar nu le introducem tacit aici.

Trasarea pseudocodului greșit este manuală, nu un jurnal de execuție. Eliminarea vechii asocieri înaintea verificării șterge asocierea vizitatorului la refuz și poate înlocui dulapul deja atribuit. Corecția decide înainte de modificare. Argumentul este limitat la apelurile seriale și absența întreruperilor tehnice din enunț.

## Pregătirea AI și proveniența

Prezentarea folosește **capturi reale** Claude Haiku 4.5, obținute la 27 octombrie 2026 prin Claude Code 2.1.311, fără unelte și fără contextul proiectului; [arhiva](scenarios/06-dulapuri/captures/2026-10-27/README.md) păstrează promptul exact, contextul, răspunsurile integrale, metadatele și ambele încercări pentru fiecare rol.

Am ales analiza 01: separă corect precondițiile de condiția de succes și formulează refuzul cu registrul identic, dar trece păstrarea celorlalte asocieri și a mulțimilor de vizitatori și dulapuri și printre invarianți, deși ele compară două stări. În încheiere numără a doua eliberare din S5 printre refuzuri, deși întoarce `fara_dulap`. Analiza 02 afirmă că operațiile sunt „idempotente”, termen pe care cursul îl evită. Evaluatorul (agent AI de revizuire) a primit într-un context nou enunțul, sarcina și răspunsul integral. Am ales revizuirea 02, care declară propunerea „complet corectă” și confirmă conținutul fragmentului față de R5, fără să conteste eticheta de invariant; revizuirea 01 confirmă la fel contractul și semnalează doar o formulare neclară a motivelor de refuz. Selecția nu descrie performanța tipică a modelului.

Discuția nu cere găsirea unui defect cu orice preț: analistul AI separă corect condiția de succes, iar slide-ul o confirmă. Corecția noastră privește numai clasificarea efectului limitat și rezultatul celei de-a doua eliberări din S5. Pseudocodul trasat în etapa 55–80 rămâne exemplu didactic construit.

## Încheiere și calibrare

Transferul la truse folosește regulile explicit date, nu presupune că toate domeniile au aceeași politică de repetare. La repetarea aceluiași împrumut, noul enunț cere deja_imprumutat fără modificări; muzeul cere refuz. Același invariant de unicitate permite ambele politici, dar nu le stabilește. La laborator, distincția se reia cu cantități și o singură analiză/revizuire AI în plen. După curs, notați dacă studenții confundă încă condiția de succes cu precondiția; folosiți acea observație pentru ritmul laboratorului.
