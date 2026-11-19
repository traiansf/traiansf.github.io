# Cursul 5 — ghid de predare

[Prezentarea](05-responsabilitati.md) are **33 de slide-uri cu copertă**, pentru **100 de minute**. [Enunțul](scenarios/05-colete/brief.md) și [raționamentul de referință](scenarios/05-colete/reference.md) sunt surse pentru pregătire. La curs folosim numai prezentarea, hârtia și discuția, fără rulări AI, cod executat sau fișe separate.

## Parcurs

| Minute | Activitate |
|---|---|
| 0–15 | Orientare, citatul, problema, alegerea inițială a locului verificării, ce este o responsabilitate. |
| 15–30 | Reguli, responsabilități, coeziune și cuplare prin exemple. |
| 30–55 | Reguli copiate versus operație comună; valori-limită; două repartizări care pot fi justificate. |
| 55–75 | C1: limita plicului crește, pragul de preț rămâne. |
| 75–95 | Fiecare canal delegat unei sesiuni AI separate: două funcții, aceleași reguli, rezultate diferite; C1 în două sesiuni; cine răspunde de regulă. |
| 95–100 | Transfer la reducerea biletelor. |

Marcajele de ritm dublează reperele din note. Duratele includ tranzițiile și discuțiile. Protejați cele 7 minute ale primului exercițiu, cele 8 pentru limita plicului și cele 8 pentru C1; comprimați numărul explicațiilor în plen dacă este necesar. Nu transformați coeziunea și cuplarea într-un catalog de metrici sau șabloane.

## Întrebările care conduc discuția

O responsabilitate se explică prin rezultat și informația necesară. Canalul interpretează textul și prezintă rezultatul; operația comună decide acceptarea și prețul. Un canal poate verifica anticipat pentru confort, dar operația nu trebuie să accepte un apel direct care încalcă regulile.

O operație comună poate fi o simplă funcție, de exemplu într-o bibliotecă folosită de ambele canale. Nu introducem implicit infrastructură de rețea. Variantele cu o singură funcție ori două funcții interne, una pentru acceptare și una pentru preț, sunt ambele acceptabile dacă păstrează aceleași rezultate și dacă sunt explicate costurile. „Mai multe module” nu este un argument suficient pentru coeziune.

La 1000 g, plicul este permis și costă 10 lei. La 1001 g, plicul se refuză, iar cutia costă 18 lei. Un rezultat comun greșit în cele două canale respectă concordanța, dar nu regulile: verificăm ambele aspecte.

C1 schimbă limita ambalajului la 1500 g, nu pragul de preț. Plicurile de 1200 și 1500 g costă 18 lei; 1501 g este refuzat. Egalitatea inițială a valorilor nu face identice sensurile. Schimbarea poate cere actualizarea textelor de ajutor din canale; nu promitem că atinge un singur fișier.

## Segmentul AI: delegarea separată diverge

Lecția AI a cursului, după decizia din 19 noiembrie 2026 (fiecare curs are altă lecție despre AI, în alt format; vezi `docs/ai-lessons-and-lab-diagrams.md`): **când fiecare canal este delegat unei sesiuni AI separate, fiecare sesiune scrie propria copie a regulii, iar copiile se despart; nicio componentă nu răspunde de regulă.** Formatul: două ieșiri independente, comparate pe aceleași intrări; nu există analist AI și evaluator (agent AI de revizuire).

Prezentarea folosește [capturi reale Claude Haiku 4.5 din 19.11.2026](scenarios/05-colete/captures/2026-11-19/README.md), prin Claude Code 2.1.328, fără unelte și fără contextul proiectului; prompturile sunt și în [`scenarios/05-colete/ai/`](scenarios/05-colete/ai/README.md). Câte șase rulări pentru site (JavaScript) și ghișeu (Python), cu aceleași reguli R1–R6, apoi unsprezece sesiuni noi pentru C1. Codul capturat a fost rulat înainte de curs pe aceleași intrări (`scenarii-executie.md`); slide-ul cu rezultatele spune că este rularea noastră, nu răspunsul AI.

| Slide | Conținut | Minute |
|---|---|---|
| 25 | Tranziția „Fiecare canal, delegat separat” (minutul 75). | 1 |
| 26 | Cele două instrucțiuni exacte, aceleași reguli; predicție. | 3 |
| 27 | Funcția site-ului (rularea 3): studenții urmăresc patru intrări. | 3 |
| 28 | Funcția ghișeului (rularea 1): aceleași intrări, unde diferă. | 3 |
| 29 | Rezultatele rulate: S1–S5 la fel, „1000,5” și „Plic” diferit; R1 și R5. | 3 |
| 30 | C1 în sesiuni noi: ghișeul 2, unde prețul plicului depindea de limită. | 4 |
| 31 | Comparația și decizia noastră: operația comună decide; canalele primesc interfața. | 3 |

Răspunsuri așteptate: plic „1000” → 10 lei și „1001” → refuz în ambele canale; „1000,5” → 10 lei pe site (`parseInt` citește 1000), cerere de corectare la ghișeu; „Plic” → refuz pe site, 10 lei la ghișeu (`lower()`). „1000,5” încalcă R1 pe site și R5 între canale; pentru „Plic” enunțul nu spune dacă majuscula contează, deci întrebăm firma. La C1, ghișeul 2 avea `pret = 10` în ramura plicului, corect numai cât limita plicului și pragul de preț aveau aceeași valoare; sesiunea C1 l-a corectat. Toate sesiunile C1 au fost corecte: lecția nu este o greșeală a modelului, ci faptul că schimbarea a trebuit cerută și verificată pentru fiecare canal, iar „1000,5” a rămas.

**Selecția nu este tipică:** numai una dintre cele șase funcții ale site-ului acceptă „1000,5”; trei funcții din douăsprezece transformă „Plic” în „plic”. Am ales perechea care diferă în ambele sensuri. Toate funcțiile trec S1–S5. Nu prezentați rezultatul ca frecvență.

Varianta cu reguli copiate din partea a doua (`masa < 1000` / `masa <= 1000`) rămâne un exemplu didactic construit, etichetat ca atare; segmentul AI arată aceeași organizare produsă real. Capturile din [27.10.2026](scenarios/05-colete/captures/2026-10-27/README.md) (analist AI și evaluator) rămân arhivate; prezentarea nu le mai folosește.

## Feedback aplicat

Fiecare comparație și exercițiu reia regulile necesare pe același slide. Nu cereți studenților să rețină numerele R1–R6. Când proiectați ulterior fragmente AI noi, păstrați rezumatul regulilor alături de fragment. După predare, notați dificultățile privind separarea limitei ambalajului de pragul de preț și timpul efectiv al discuțiilor.
