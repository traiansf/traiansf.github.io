# Capturi pregătite pentru discuție — ghișeul de echipamente

Material pentru etapa AI, condusă de profesor în plen, când nu folosim o rulare live. Răspunsuri reale Claude Haiku 4.5, din 12 noiembrie 2026 (Claude Code 2.1.322, fără unelte și fără contextul proiectului); enunțul este un exemplu didactic. Fragmentele sunt fidele, cu omisiunile marcate; răspunsurile integrale, metadatele și toate încercările sunt în [arhivă](captures/2026-11-12/README.md). Selecția nu descrie performanța tipică a modelului.

## Sarcina analistului AI

Context: [enunțul efectiv trimis](captures/2026-11-12/context.md).

> Propune tabelul de tranziții al rezervării (stare curentă, eveniment, condiție, stare următoare, efect) și tabelul interacțiunii pentru ridica: pașii în ordine, cine apelează pe cine, ce se întoarce și ce înregistrează registrul la fiecare pas, inclusiv cazul în care expeditorul răspunde esec și cazul unei reîncercări. Precizează ce garantează registrul și ce presupune despre expeditor. Calculează S2, S4 și S7. Nu scrie cod. Răspunde în română, în maximum 450 de cuvinte.

Fragmente din [analistul AI 01](captures/2026-11-12/haiku45-analist-01-response.md), tabelul de tranziții și scenariul S4; restul răspunsului este omis:

> | **Rezervată** | `ridica(c, r, s)` | c înregistrat | **Rezervată** | Reîncercare (handler separat) |
>
> | **Ridicată** | `ridica(c, r, s)` | — | **Ridicată** | Fără modificări; returnează `refuz` |
>
> **S4:** […] Condiție: c1 înregistrat ∧ notificare = `netrimisă` → Registru reapelează expeditor; primește `trimis` […] **Rezultat:** `ridicat`, expeditor apelat din nou

Înainte de revizuire: în ce stare se află rezervarea când sosește reîncercarea din S4? Ce răspuns dă tabelul pentru S4 și ce răspuns dă calculul?

## Sarcina de revizuire

Într-un context nou, evaluatorul (agent AI de revizuire) primește enunțul, sarcina analistului AI și răspunsul integral. Instrucțiunea exactă:

> Ești evaluator (agent AI de revizuire). Verifică propunerea față de enunț și sarcina de analiză. Pentru fiecare observație indică fragmentul, regula relevantă și un scenariu cu starea de pornire și rezultatul așteptat. Verifică tranzițiile și condițiile, evenimentele refuzate, ordinea pașilor interacțiunii, tratarea răspunsului esec, reîncercarea și presupunerile despre expeditor. Confirmă și afirmațiile corecte. Nu presupune un număr de greșeli și nu scrie cod. Răspunde în română, în maximum 350 de cuvinte.

Fragmente din [evaluatorul AI 02](captures/2026-11-12/haiku45-evaluator-02-response.md); restul răspunsului este omis:

> **1. Rândul 3 al tabelului de tranziții (c înregistrat în Rezervată)** […] **Problem**: Notația "handler separat" e vagă. […]
>
> ✓ **Idempotență** (R3 + R5): Același c ➜ același răspuns invariant
>
> Propunerea e solidă […]

## Decizia noastră

Confirmăm calculele S2, S4 și S7 și ordinea pașilor interacțiunii: tranziția și înregistrarea identificatorului preced apelul expeditorului, iar `esec` lasă răspunsul `ridicat` (R4). Acceptăm observația evaluatorului AI că rândul reîncercării este vag. Corectăm ce nu a observat nici evaluatorul AI: reîncercarea sosește în **Ridicată**, nu în Rezervată, pentru că identificatorul se înregistrează numai la acceptare (R3); rândul „Ridicată | ridica | refuz” contrazice calculul lui S4 și R5: în Ridicată, o reîncercare primește `ridicat`, iar o cerere nouă `refuz`. „Idempotență” este cuvântul modelului pentru R5; îl glosăm, nu îl reproșăm. Presupunerile suplimentare despre expeditor („nu are memorie de cereri”) nu sunt în enunț și nu le preluăm.

Într-o rulare live folosim propunerea și observațiile efective. Dacă acestea sunt deja complete, le confirmăm; nu atribuim omisiunile acestor capturi unui alt răspuns.
