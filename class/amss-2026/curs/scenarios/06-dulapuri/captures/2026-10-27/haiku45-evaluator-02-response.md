# RAPORT DE REVIZUIRE

Propunerea este **complet corectă** și **aliniată precis** cu enunțul și sarcinile. Confirmă și susțin următoarele:

## Separarea corectă a componentelor contractuale

**Fragment: Precondițiile vs. condiția de succes**  
Propunerea distinge corect precondițiile (R1: identificatori valizi, registru valid inițial) de condițiile de succes (`atribuie`: v liber ȘI d liber). Enunțul (sarcina: "Separați precondițiile asumate de R1...") este respectat integral. Aceasta nu este o detaliu minor — eșecul (refuz) se încadrează în contract, nu în precondiția contractului.

**Fragment: Postcondițiile pentru eșec (`refuz` la atribuie)**  
Propunerea: "Registrul este identic cu cel inițial. Eșecul acoperă trei cazuri..." Enunțul (R3): "În celelalte situații întoarce `refuz`, iar **întregul registru rămâne identic**. Inclusiv repetarea aceleiași atribuiri este refuzată." ✓ Corect. Aceasta este esențial pentru înțelegerea faptului că operația nu înlocuiește dulapul deja atribuit unui vizitator.

## Invarianți și efect limitat

**Fragment: Invariantul unicității și efectul limitat (R5)**  
Propunerea: "Seturile de vizitatori și dulapuri rămân neschimbate. Toate asocierile (v', d') cu v' ≠ v și d' ≠ d se păstrează." Enunțul (R5): "la succes, ambele operații păstrează toate celelalte asocieri. Nu se adaugă și nu se șterg vizitatori sau dulapuri." ✓ Corect și precis.

## Verificare scenarii S1–S6

Propunerea susține:
- **S1** (`atribuie(V3, D3)`): V3 liber, D3 liber → succes. ✓
- **S2–S4, S6**: Precondițiile de succes nu sunt îndeplinite → refuz, registru identic. ✓
- **S5.1–S5.2**: Prima eliberare (v are dulap) → `eliberat`; a doua (v fără dulap) → `fara_dulap`. ✓

Enunțul confirmă: "Fiecare scenariu repornește din B", iar S6 repornește cu V1–D1 intact. Corect.

## Afirmații corecte finale

Propunerea: "Postcondițiile pentru eșec sunt esențiale: garantează că o operație respinsă nu alterează starea." — Aceasta sintetizează corect efectul limitat din R5 și tratarea eșecului din R3, R4.

**Concluzie:** Propunerea nu conține erori. Contractele sunt complete, invarianții sunt expliciți, și scenariile sunt verificate corect. Răspunde integral sarcinii de a separa și formaliza condițiile contractuale.