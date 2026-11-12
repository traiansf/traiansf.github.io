# Verificare propunere — Ridicarea echipamentelor

## Observații pozitive

Propunerea structurează corect modelul cu **tabel de tranziții** și **tabel de interacțiune**, acoperind scenariile critique. Calculele S2, S4, S7 sunt corecte.

---

## Observații critice

**1. Rândul 3 al tabelului de tranziții (c înregistrat în Rezervată)**

Fragment: *"Rezervată | `ridica(c, r, s)` | c înregistrat | Rezervată | Reîncercare (handler separat)"*

Regulă relevantă: **R5** — reîncercare cu c deja înregistrat trebuie să returneze *același rezultat* (`ridicat`), fără modificări de stare.

**Problem**: Notația "handler separat" e vagă. Ar trebui explicit că:
- Dacă notificare = `trimisă`: returnează `ridicat`, **fără apel la expeditor**
- Dacă notificare = `netrimisă`: apelează expeditor **din nou**, actualizează rezultat, returnează `ridicat`

Stare și răspuns sunt invariante, dar acțiuni diferă pe caz. Tabelul nu deosebeşte.

---

**2. Pas 2 al tabelului de interacțiune — lipsă claritate pe cale eșec**

Fragment: *"Pas 2 | Registru | validează: r = Rezervată, s = titular"*

Regulă relevantă: **R3** — condiția e `c neînregistrat ∧ s = titular`; în caz contrar, `refuz`, nicio apelare la expeditor.

**Problem**: Tabelul nu face explicit că validarea eșuată ➜ **ieșire cu `refuz` și stop — niciun pas 4–5**. Tabelul arată fluxul de acceptare, dar interdependența cu refuzul e într-un tabel separat. Ar trebui o notă "Dacă validare eșuează: returnează `refuz`, tranziție 0 la pas 4".

---

**3. Reîncercare după eșec cu `esec` din nou (S4 extins)**

Fragment: *"Dacă notificare = `netrimisă`: apelează expeditor din nou, actualizează rezultat"*

**Clarificare lipsă**: Dacă expeditorul răspunde **din nou `esec`**, rezultatul rămâne `netrimisă`, dar se returnează totuși `ridicat` ghișeului (**R4** + **R5**)? Răspunsul e implicit corect (R5 nu diferențiază cine răspunde expeditorul), dar ar trebui notat explicit pentru S4.

---

## Afirmații confirmate

✓ **Idempotență** (R3 + R5): Același c ➜ același răspuns invariant  
✓ **Decuplare** (R4): Eșec notificare ≠ anulare ridicare  
✓ **Presupuneri despre expeditor** (R7): Corect — nu are memorie, `esec` nu e livrare  
✓ **Scenario S7**: Anulare în Anulată + refuz ridicare — corect  

---

## Recomandare finală

Propunerea e solidă, dar ar beneficia de o notă comună la ambele tabele: **"Validare eșuează ➜ ieșire `refuz` imediat, salt la pas 6 fără notificare. Reîncercare cu `netrimisă` apelează expeditor, dar răspunsul (trimis/esec) nu afectează valoarea returnată ghișeului: `ridicat` în ambele cazuri."**