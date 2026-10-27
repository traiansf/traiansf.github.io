# Cursul 5 — ghid de predare

[Prezentarea](05-responsabilitati.md) are **29 de slide-uri cu copertă**, pentru **100 de minute**. [Enunțul](scenarios/05-colete/brief.md) și [raționamentul de referință](scenarios/05-colete/reference.md) sunt surse pentru pregătire. La curs folosim numai prezentarea, hârtia și discuția, fără rulări AI, cod executat sau fișe separate.

## Parcurs

| Minute | Activitate |
|---|---|
| 0–10 | Problema, citatul, alegerea inițială a locului verificării. |
| 10–30 | Reguli, responsabilități, coeziune și cuplare prin exemple. |
| 30–55 | Reguli copiate versus operație comună; valori-limită; două repartizări defensabile. |
| 55–75 | C1: limita plicului crește, pragul de preț rămâne. |
| 75–95 | Sarcină delegată, propunere, revizuire și decizie umană. |
| 95–100 | Transfer la reducerea biletelor. |

Marcajele de ritm dublează reperele din note. Duratele includ tranzițiile și discuțiile. Protejați cele 7 minute ale primului exercițiu, cele 8 pentru praguri și cele 8 pentru C1; comprimați numărul explicațiilor în plen dacă este necesar. Nu transformați coeziunea și cuplarea într-un catalog de metrici sau șabloane.

## Întrebările care conduc discuția

O responsabilitate se explică prin rezultat și informația necesară. Formularul interpretează textul și prezintă rezultatul; operația comună decide acceptarea și prețul. Un formular poate verifica anticipat pentru confort, dar operația nu trebuie să accepte un apel direct care încalcă regulile.

O operație comună poate fi o funcție locală. Nu introducem implicit infrastructură de rețea. Variantele cu o singură funcție ori două funcții interne, una pentru eligibilitate și una pentru preț, sunt ambele acceptabile dacă păstrează aceleași rezultate și dacă sunt explicate costurile. „Mai multe module” nu este un argument suficient pentru coeziune.

La 1000 g, plicul este permis și costă 10 lei. La 1001 g, plicul se refuză, iar cutia costă 18 lei. Un rezultat comun greșit în cele două canale respectă concordanța, dar nu politica: verificăm ambele aspecte.

C1 modifică limita ambalajului la 1500 g, nu pragul tarifului. Plicurile de 1200 și 1500 g costă 18 lei; 1501 g este refuzat. Egalitatea inițială a valorilor nu face identice sensurile. Schimbarea poate cere actualizarea textelor de ajutor din interfețe; nu promitem că atinge un singur fișier.

## Pregătirea AI și proveniența

Prezentarea folosește **capturi reale** Claude Haiku 4.5, obținute la 27 octombrie 2026 prin Claude Code 2.1.311, fără unelte și fără contextul proiectului; [arhiva](scenarios/05-colete/captures/2026-10-27/README.md) păstrează toate încercările. Primele două încercări de analiză s-au încheiat fără răspuns după limita de așteptare de 55 s; prima avea și diacritice deteriorate. Următoarele două, cu enunțul curent fără C1 și limita de așteptare a cursului 4 (240 s), au răspuns în circa 15 s.

Am ales analiza 03: verifică S1–S5 corect, dar lasă nedefinite „limitele” stocate, adică nu spune dacă limita plicului și pragul tarifului sunt valori separate. Exemplul de schimbare din răspuns (plic până la 1500 g) a fost ales de model; enunțul trimis nu conține valoarea. Evaluatorul (agent AI de revizuire) a primit într-un context nou enunțul, sarcina, răspunsul integral și C1. Am ales revizuirea 01: deduce corect că S2 costă 18 lei după C1, răspunzând instrucțiunii, dar formulează consecința drept omisiune a analistului AI, care nu primise C1, și consideră comparația cerută o recomandare din afara sarcinii. Nu verifică separarea celor două limite; decizia noastră o adaugă. Revizuirea 02 are erori diferite (posibil refuz pentru ambalaj la cutia de 0 g; prag „≥1000 g”). Selecția nu descrie performanța tipică a modelului.

Pe slide-uri apar fragmente fidele, cu omisiunile marcate; analiza și decizia noastră sunt separate de răspunsuri. Varianta cu reguli copiate (`masa < 1000` / `masa <= 1000`) rămâne un exemplu didactic construit, etichetat ca atare.

## Feedback aplicat

Fiecare comparație și exercițiu reia regulile necesare pe același slide. Nu cereți studenților să rețină numerele R1–R6. Când proiectați ulterior fragmente AI noi, păstrați rezumatul regulilor alături de fragment. După predare, notați dificultățile privind separarea limitei ambalajului de pragul tarifului și timpul efectiv al discuțiilor.
