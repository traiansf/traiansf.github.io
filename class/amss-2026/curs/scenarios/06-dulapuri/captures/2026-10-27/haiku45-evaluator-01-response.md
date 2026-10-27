# Verificare propunere — Contracte pentru atribuie și elibereaza

## Conformitate cu sarcina

Propunerea respectă structura solicitată: separă precondițiile (R1), condiția de succes, postcondițiile pe rezultate, invarianți și ceea ce rămâne neschimbat. Răspunsul nu conține cod. Observații:

---

## Confirmare — Puncte corecte

1. **Precondițiile pentru atribuie** (R1): identificatori valizi și registru valid sunt corect presupuse. ✓

2. **Condiția de succes pentru atribuie**: „v nu are dulap ȘI d este liber" corespunde exact R3 („reușește exact când"). ✓

3. **Postcondițiile pentru eșec — atribuie**: „registrul este identic cu cel inițial" este esențial și corect din R3. ✓

4. **Repetarea — atribuie**: observația că „repetarea aceleiași atribuiri se refuză" confirmă R3 („Inclusiv repetarea"). ✓

5. **Condiția de succes — elibereaza**: „v are exact o asociere" corespunde singurei situații în care R4 întoarce `eliberat`. ✓

6. **Postcondițiile pentru eșec — elibereaza**: „repetarea nu este eroare" parafrazează corect R4 („nu este o eroare tehnică"). ✓

7. **Invarianții unicității**: ambele operații conservă proprietatea „un vizitator ↔ cel mult un dulap" (R2). ✓

8. **Efectul limitat (R5)**: postcondițiile pentru eșec și pentru succes (păstrarea asocierilor neimplicate) sunt corect formulate. ✓

9. **Verificare S1–S6**: toate 6 scenariile sunt analizate corect:
   - S1, S5.1 reușesc (condiții satisfăcute).
   - S2–S4, S5.2, S6 se refuză (condiții nesatisfăcute); registrul rămâne identic.
   - ✓

---

## Observație minoră

**Pentru atribuie — enumerarea cazurilor de eșec** (fragment: „v deja ocupat, d deja ocupat, sau ambele"):

Enumerarea este incompletă din perspectiva logicii. Eșecul se întâmplă dacă:
- v are dulap **ȘI** d liber, **SAU**
- v liber **ȘI** d ocupat, **SAU**
- v ocupat **ȘI** d ocupat.

Formularea „trei cazuri" este neclară; „ambele" nu este caz independent, ci intersecția primelor două. Mai precis: eșecul se întâmplă dacă **(v ocupat) ∨ (d ocupat)**. Propunerea ar fi mai clară cu această formă logică.

---

## Concluzie

Contractele sunt corect proiectate și complete. Precondițiile, condițiile de succes, postcondițiile și invarianții sunt separați riguros. Toate scenariile S1–S6 se verifică. Singura ușoară imprecizie este în enumerarea cazurilor de eșec pentru atribuie, dar nu afectează corectitudinea analizei.