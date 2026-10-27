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

[Arhiva din 27 octombrie](scenarios/05-colete/captures/2026-10-27/README.md) păstrează două încercări de analiză, ambele încheiate fără răspuns după limita de așteptare. Prima instrucțiune a avut diacritice deteriorate la transmitere; a doua are instrucțiunea corectă, verificată în UTF-8. Nu există răspuns AI selectat sau revizuire AI executată pentru acest pachet.

Prezentarea poate fi predată integral folosind **exemplele didactice etichetate**: o propunere cu operație comună, dar cu o constantă comună pentru două sensuri, și o observație de revizuire care combină separarea necesară a celor două sensuri cu alegerea facultativă a două funcții interne. Acestea nu sunt capturi și nu susțin afirmații despre performanța unui model. Instrucțiunea pregătită poate fi folosită ulterior pentru obținerea unui răspuns real, păstrând toate încercările. Nu este necesar ca răspunsul să aibă greșeli.

Arhiva păstrează exact enunțul încercărilor inițiale. Formulările curente clarifică rolul aplicației ghișeului, intrările și sensul concordanței dintre canale; nu rescriem retrospectiv prompturile arhivate.

Pentru o captură ulterioară: folosiți versiunea curentă a enunțului fără C1 în analiza AI; păstrați răspunsul integral. Evaluatorul (agent AI de revizuire) primește într-un context nou enunțul, sarcina, răspunsul și C1 ca schimbare ulterioară, cerând fragment, regulă și scenariu pentru fiecare observație. Integrați fragmente fidele pe slide-uri, cu sursă și omisiuni; păstrați corecțiile umane distincte. Nu înlocuiți eticheta unui exemplu didactic cu un nume de model.

## Feedback aplicat

Fiecare comparație și exercițiu reia regulile necesare pe același slide. Nu cereți studenților să rețină numerele R1–R6. Când proiectați ulterior fragmente AI noi, păstrați rezumatul regulilor alături de fragment. După predare, notați dificultățile privind separarea limitei ambalajului de pragul tarifului și timpul efectiv al discuțiilor.
