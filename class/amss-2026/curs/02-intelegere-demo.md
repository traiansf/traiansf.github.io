# Exemplu pregătit pentru Cursul 2 — Înțelegem înainte de a delega

Ghid pentru profesor; nu se distribuie studenților. Exemplul ocupă aproximativ 13–16 minute din etapa de 25 de minute dedicată delegării și revizuirii. Totul este inclus în `02-intelegere.md`: profesorul afișează slide-urile, fără rulări live, calculator personal sau autentificare în instrumente AI. Studenții folosesc coli albe, fără dispozitive sau fișe. Demonstrațiile live pot fi folosite la laborator.

## Capturile folosite

Prezentarea folosește [două răspunsuri AI reale](scenarios/02-biblioteca/captures/2026-10-07/README.md), generate la 7 octombrie 2026 prin Codex CLI 0.160.1, model declarat `gpt-6.1-sol`: o proiectare și o revizuire într-un context separat. Prompturile exacte, contextul integral, răspunsurile și metadatele sunt păstrate lângă această înregistrare. Prima rulare a fiecărui rol a fost suficientă pentru obiectivul ales; nu au existat încercări suplimentare.

Generați direct capturi reale când pregătiți exemple noi. Nu este necesară inventarea prealabilă a unor exemple didactice. Dacă un răspuns nu ilustrează bine obiectivul, repetați rularea și selectați unul potrivit; păstrați toate încercările, modificările promptului și motivul selecției. Selecția nu constituie o măsurare a performanței tipice a modelului. Nu corectați tacit răspunsurile: fragmentele sunt fidele, omisiunile marcate, explicațiile profesorului separate.

Contextul proiectantului este `scenarios/02-biblioteca/brief.md` și promptul de pe slide. Evaluatorul AI primește într-un context nou același enunț, proiectarea integrală și promptul de revizuire. Nu trimiteți soluția profesorului din `reference-design.md` în aceste contexte. Rolurile pot folosi același model.

## 1. Contextul și sarcina (2–3 minute)

Arătați „Exemplu pregătit: delegare și verificare”, apoi „Ce îi cerem agentului AI cu rol de proiectant”. Precizați proveniența reală. Enunțul, regulile și scenariile delimitează o sarcină de proiectare, fără codul aplicației. Studenții discută promptul; nu îl trimit unui serviciu AI.

## 2. Verificarea propunerii (3 minute)

Lăsați pe ecran „Proiectare AI: ce permite reprezentarea?”. Fragmentul capturat, situația S2, regulile și întrebarea sunt vizibile împreună. Studenții notează legăturile necesare pentru decizia asupra lui M3: C1 → rezervare → cerere → M2. M3 nu poate ridica C1; împrumutul său pentru C2 nu îi dă acest drept.

Proiectarea păstrează informația necesară. Nu impunem găsirea unui defect într-un fragment corect.

## 3. Revizuire și decizie (7–8 minute)

Pe „Ce predăm evaluatorului AI”, discutați ce ar lipsi dintr-o cerere generică „verifică dacă e corect”. Contextul separat face explicită predarea, dar nu garantează corectitudinea revizuirii.

„Verificăm și revizuirea” conține afirmația reală despre S6. Studenții o verifică prin R2 și R5: M4 ridică C1, iar C2 rămâne rezervat lui M2. Ordinea alocării nu impune ordinea ridicării. Concluzia evaluatorului AI este susținută de scenariu.

Arătați apoi „Decizia noastră asupra revizuirii”: acceptăm proiectarea ca bază pentru etapa următoare, în limitele R6. „Nu am identificat defecte” nu înseamnă că există deja o implementare verificată. Evaluatorul AI precizează această limită în răspunsul capturat.

## 4. Sinteza (1–2 minute)

„Păstrăm o imagine de ansamblu verificabilă” citează paragraful real despre ordinea cererilor. Formula prea scurtă „cererile sunt servite în ordine” ar pierde distincția dintre alocare și ridicare. Cereți regula și scenariul care justifică distincția.

## Verificare înainte de curs

- Fiecare exercițiu poate fi rezolvat doar din proiecție, pe o coală albă.
- Regulile și scenariile din prezentare și enunț sunt coerente.
- Citatele corespund capturilor, iar explicațiile profesorului sunt distincte.
- Toate slide-urile sunt lizibile în HTML și PDF.
- Nu sunt necesare rulări live, fișe, descărcări sau autentificări în instrumente AI.

Vechiul exemplu construit din `fallback/02-intelegere-fallback.md` rămâne doar un material separat de contrast, cu eticheta sa originală; nu este sursa capturilor actuale și nu trebuie deschis la curs.
