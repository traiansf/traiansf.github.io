# REVIZUIRE: Analiză contractelor și responsabilităților — Conformă, cu observații de claritate

## Confirmări majore

✓ **Repartizarea responsabilităților** (R—sursa de adevăr; formular/import—clienți) respectă R5.
✓ **Contractele operațiilor** (REZERVA, RIDICA, ANULEAZA) urmăresc fidel R2–R4.
✓ **Calculele S2, S3, S5** sunt exacte:
  - S2: `rezerva(B, 7)` → REFUZ (D=6 < 7), stare neschimbată ✓
  - S3: `ridica(A)` → SUCCES (F=6, R=0, D=6 nemodificat) ✓
  - S5: `anuleaza(A)` după ridicare → REFUZ (A nu mai activ) ✓
✓ **Invarianții și refuzurile atomice** sunt corect formulate.

## Observații de claritate

**1. Precondițiile RIDICA — implicit vs. explicit**
Propunerea notează "(F ≥ q garantat dacă invarianți respectați)". Asta e adevărat, dar e *consecință* a invarianților (R ≤ F), nu *precondițiune* validată. R3 nu impune F ca verificare de intrare. **Sugestie:** distinge între validări la intrare (id activ) și proprietăți garantate de sistem.

**2. Reutilizarea ID-urilor — cazul S6**
Scenario: din I, `anuleaza(A)` apoi `rezerva(A, 2)`. Stare după anuleaza: A este *inactiv* dar *înregistrat*. Propunerea zice "id nu apare deja în registru" — asta exclude A, deci REFUZ ✓. Corect, dar explicit că "înregistrat" = inactiv + istoric, nu doar "activ".

**3. Efect asupra altor rezervări**
Propunerea nu enumeră explicit "alte rezervări rămân neschimbate". Scenariul: după I, `ridica(A)` marchează A ridicată; orice alt id B rămâne neschimbat. Implicit ✓, dar ar fi util să formuleze: "o operație modifică doar starea și datele din registrul id-ului respectiv".

**4. Lipsuri de acoperire (nu sunt erori)**
Sarcina ceruse S2, S3, S5. Nu include:
- S1: `rezerva(B, 6)` → SUCCES (D=6 ≥ 6), F=10, R=10, D=0
- S4: `anuleaza(A)` → SUCCES, F=10, R=0, D=10
- S7: `rezerva(B, 0)` → REFUZ (q=0 < 1)

Acestea ar completa validarea pe *succes* și refuz non-disponibilitate.

## Concluzie

Propunerea e substantiv corectă. Contractele sunt coerent formulate, calculele precise, iar concluzia privind identitatea comportamentului formular–import (gatekeeper unic în registru) este validă. Recomand doar clarificări redacționale: marca distincția validare–garanție la RIDICA, și enumeră explicit "alte rezervări stabile" în efecte generale. Nu sunt remedieri logice necesare.