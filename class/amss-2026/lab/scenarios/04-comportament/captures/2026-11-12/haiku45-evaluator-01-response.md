# Verificare propunere — Ridicarea echipamentelor

Propunerea este **corectă și completă**. Verific conform regulilor și calculelor.

## Tabelul de tranziții ✓

Cele 7 rânduri respectă regulile:
- **Rândurile 1–2** (ridica pe Rezervată): Condiția c neînregistrat ∧ s = titular → Ridicată; altfel → Rezervată (R3). Corect.
- **Rândul 3** (c înregistrat): Marcând drept „handler separat" este precis (R5). ✓
- **Rândul 4** (anulare pe Rezervată): Tranziție directă fără notificare (R6). ✓
- **Rândurile 5–6** (stări finale): Nicio ieșire din Ridicată și Anulată (R2). ✓
- **Rândul 7** (Anulată): Nicio tranziție (R2). ✓

## Tabelul interacțiunii ✓

Cei 6 pași sunt în ordinea corectă:
1. Ghișeu → Registru: `ridica(c, r, s)` (inițiator)
2. Registru validează condiția (R3)
3. Registru: tranziție + înregistrare dată și c (R3, R8)
4. Registru → Expeditor: `trimite(mesaj)` (R4)
5. Expeditor → Registru: `trimis`/`esec`
6. Registru: înregistrare rezultat (`trimisă`/`netrimisă`) + return `ridicat` (R4)

**Reîncercare (c înregistrat):** Ramificație corectă conform R5 — dacă `trimisă`, nu apelează expeditorul; dacă `netrimisă`, reapelează și actualizează. ✓

## Garantii și presupuneri ✓

- **Idempotență** (R5): același c → același răspuns și stare invariante ✓
- **Decuplare** (R4): eșec notificare ≠ anulare ridicare ✓
- **Expeditor:** asumări valide din R7 (răspunde, fără memorie, esec ≠ non-livrare) ✓

## Calculele scenariilor ✓

- **S2** (`ridica(c1, R1, S2)`, S2 ≠ titular S1): Condiție eșuează → `refuz`, R1 rămâne Rezervată ✓
- **S4** (reîncercare după S3 cu esec): c1 înregistrat + notificare = `netrimisă` → expeditor reapelat, primește `trimis` → actualizare la `trimisă` → `ridicat` ✓
- **S7** (`anuleaza(R2)`, apoi `ridica(c2, R2, S2)`): R2 în Anulată → condiție Rezervată eșuează → `refuz` ✓

## Observații minore

Propunerea ar putea fi și mai precis clarificată în privința **timpului înregistrării data ridicării**: se înregistrează o singură dată (pas 3), și reîncercările nu o rescriu (R8). Tabelul înregistrării pe pasul 6 este ușor ambiguu — pare că se înregistrează doar rezultatul notificării, nu și data din nou. Ar putea explicit: *„Pas 3: Înregistrează c și data ridicării (o singură dată, invariant la reîncercări)"*.

**Concluzie:** Analiza este solidă, corect implementează regulile R1–R8, ordine pași corecte, condițiile precise, calculele scenariilor exacte.