# Revizuire: Analiza responsabilităților, contractelor și invarianților

## Observații pozitive

Propunerea este **corectă și bine structurată**. Repartizarea responsabilităților (registrul ca gatekeeper; formular și import ca clienți) respectă principiul sursei unice de adevăr. Contractele celor trei operații sunt precis formulate și corespund regulilor R2–R4.

## Verificări detaliate

**REZERVA:** Precondiții și efecte sunt corecte. Precondițiile (id nou, q > 0, D ≥ q) sunt necesare și suficiente; refuzul atomicității este garantat.

**RIDICA:** Calculul D este subtil și corect. Propunerea notează: „D nemodificat (se scade q din ambii termeni)". Aceasta respectă R3: cantitatea disponibilă nu se schimbă, dar stocul fizic și rezervările active scad cu aceeași valoare. ✓

**ANULEAZA:** Efectele (R ↓, D ↑, F neschimbat) și invarianții sunt corecți. ✓

## Calculele scenariilor

| Scenariu | Verificare | Rezultat |
|---|---|---|
| **S2: `rezerva(B, 7)`** | D=6 < 7 → precondițiile nu se îndeplinesc | **REFUZ corect**; stare I neschimbată ✓ |
| **S3: `ridica(A)`** | A activ; F: 10→6, R: 4→0, D: 6→6 | Calcule corecte; istoric păstrat ✓ |
| **S5: `ridica(A)`, `anuleaza(A)`** | După ridica, A devine ridicat (inactiv). Anuleaza cere stare activă | **REFUZ corect** pentru anuleaza; F, R, D rămân după ridicare ✓ |

## Consistența cu enunțul

Propunerea respectă integral R1–R5:
- Identificatorii nu se reutilizează ✓
- Refuzul nu modifică starea ✓
- Istoricul se păstrează ✓
- O operație nu afectează alte rezervări ✓

## Observații minore

1. Precondițiile RIDICA notează: „(F ≥ q garantat dacă invarianți respectați)". Aceasta e adevărată, dar e o observație de optimizare, nu o precondiție obligatorie — nu schimbă corectitudinea.

2. Comparația formular vs. import e precisă: aceleași reguli, diferență doar în interactivitate și cumulare a refuzurilor.

3. Ar fi util explicit: S6 (`anuleaza(A)`, `rezerva(A, 2)`) ar refuza pe a doua operație, fiindcă A e în istoric. Propunerea nu-l calculează, dar nu era cerut.

## Concluzie

Propunerea este **validă**. Contractele sunt complete, calculele exacte, și invarianții sunt menținuți corect. Nici o eroare conceptuală detectată.