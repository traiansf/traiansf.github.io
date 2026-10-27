# Analiza responsabilităților și verificarea scenariilor

## Responsabilități și dependențe

**Trei niveluri de responsabilitate:**

1. **Interfață (web, ghișeu)** — interpretează textul intrării (masa, ambalaj), cere corectare dacă masa nu e număr întreg, prezintă rezultatul după propria estetică. Nu validează reguli de domeniu.

2. **Logica de estimare** — aplică R2–R4: validează masa ∈ [1, 5000], validează compatibilitatea ambalaj–masă (R3), calculează preț după R4. Produce un răspuns standardizat: acceptat+preț sau refuz.

3. **Definirea regulilor** — stochează limitele, costurile, restricțiile per ambalaj. Accesibilă ambelor interfețe.

**Dependență critică:** Ambele canale depind de aceeași logică estimare și aceleași reguli. Orice schimbare a R2–R4 trebuie aplicată o singură dată.

## Problema copierii regulilor

Enunțul precizează că "formularul web și aplicația ghișeului folosesc aceleași reguli" (R5), dar textual regulile pot fi "copiate" în fiecare interfață. Aceasta creează:

- **Risc de inconsistență:** dacă R3 se modifică (plic acceptat până la 1500 g), trebuie actualizat în două locuri; greșelile sunt posibile.
- **Dificultate în testare:** scenariile S1–S5 trebuie testate în ambele canale independent.
- **Mentenanță:** duplicarea încalcă principiul DRY.

**Soluție conceptuală:** regulile și logica estimării trebuie **centralizate**, iar interfețele o **invocă**, nu o reimplement.

## Validarea scenariilor

| Scenariu | Validare |
|---|---|
| **S1** — 1000g plic | ✓ Masă în [1, 5000] (R2), plic ≤ 1000g (R3) → 10 lei (R4) |
| **S2** — 1001g plic | ✗ Masă în [1, 5000], dar plic > 1000g (R3) → refuz |
| **S3** — 1001g cutie | ✓ Masă în [1, 5000] (R2), cutie acceptă orice (R3) → 18 lei (R4) |
| **S4** — 0g cutie | ✗ Masă < 1 (R2) → refuz |
| **S5a** — 5000g cutie | ✓ Masă în [1, 5000] (R2) → 18 lei (R4) |
| **S5b** — 5001g cutie | ✗ Masă > 5000 (R2) → refuz |

Ambele canale produc același rezultat pentru aceeași intrare (R5). Textul refuzului poate varia, dar criteriile nu.

## Concluzie

Responsabilitatea estimării trebuie **decuplată** de interfață. O singură implementare a regulilor, invocată de ambele canale, asigură consistență și ușurează evoluția. Testarea scenariilor trebuie acoperă ambele interfețe, dar poate valida logica central pentru a economisi efort.