# Tabelul interacțiunii pentru `inscrie`

## Pași în ordine

**1. Primire cererii** — Site apelează `inscrie(c, p, a)` pe Registru, transmițând identificatorul c, participantul p și atelierul a.

**2. Verificare identitate cererii** — Registru căută c în memoria sa. Dacă c este necunoscut → Pasul 3. Dacă c este cunoscut → Pasul 5 (reîncercare).

**3. Verificare eligibilitate** — Se controlează simultan trei condiții: p nu este deja înscris la a, a are cel puțin un loc liber, c nu a fost înregistrat anterior. **Dacă toate sunt adevărate** → Pasul 4. **Altfel** → Pasul 6 (refuz).

**4. Acceptare și solicitare confirmare**
- Registru consumă un loc: `locuri(a) -= 1`
- Registru înregistrează: `(c, p, a, stare_confirmare = pendentă)`
- Registru apelează Expeditor: `trimite(mesaj_pentru_p)`
- Expeditor răspunde: `trimis` sau `esec`
- Registru actualiza starea: `trimisă` (dacă `trimis`) sau `netrimisă` (dacă `esec`)
- Pasul 7

**5. Procesare reîncercare**
- Registru caută `(c, p', a', stare)` înregistrat anterior
- Dacă `(p, a) ≠ (p', a')` → Pasul 6 (refuz pentru protecție)
- Dacă stare = `trimisă` → Pasul 7 **fără a apela Expeditor din nou**
- Dacă stare = `netrimisă` → Registru reapelează Expeditor, actualiza starea, Pasul 7

**6. Refuz** — Registru nu consumă loc, nu înregistrează cerere, **nu apelează Expeditor**. Pasul 7.

**7. Răspuns Site** — `acceptat` (din Pasul 4 sau 5) sau `refuz` (din Pasul 6).

---

## Repartizare responsabilități

| Actor | Responsabilitate |
|-------|---|
| **Site** | Generează c unic pentru fiecare încercare nouă; transmite același c la reîncercări |
| **Registru** | Memoreaza locuri libere și cereri acceptate cu stări de confirmare; verifică eligibilitate; consumă locuri; apelează Expeditor; garantează atomicitate |
| **Expeditor** | Răspunde întotdeauna la apel cu `trimis` sau `esec` |

---

## Garanții și presupuneri

**Registrul garantează:**
- O cerere c acceptată modifică starea **o singură dată** (atomicitate)
- Dacă `(c, p, a)` este acceptat, p nu poate fi acceptat la a cu alt identificator
- Reîncercarea nu consumă loc suplimentar

**Registrul presupune despre Expeditor:**
- `trimis`/`esec` codifică succes transmisiei, nu livrare efectivă
- Răspunsul nu modelează confirmare de citire, doar acceptare transmisiei

---

## Verificare scenarii

| Scenariu | Caz | Rezultat | Locuri după | Înscrierea | Stare confirmare |
|---|---|---|---|---|---|
| **S1** | Nouă, trimis | `acceptat` | 1 | (c1, P1, A) | trimisă |
| **S2** | Nouă, esec | `acceptat` | 1 | (c1, P1, A) | netrimisă |
| **S3** | Reînc. c1, netrimisă→trimis | `acceptat` | 1 | (c1, P1, A) | trimisă |
| **S4** | Reînc. c1, trimisă | `acceptat` | 1 | (c1, P1, A) | trimisă |
| **S5** | Nouă c9, P1 deja la A | `refuz` | 1 | — | — |
| **S6.1** | Nouă c2, trimis | `acceptat` | 0 | (c2, P2, A) | trimisă |
| **S6.2** | Nouă c3, 0 locuri | `refuz` | 0 | — | — |