# Modelul de stări și interacțiuni pentru ridicare

## Tabelul tranziții de stări

| Stare curentă | Eveniment | Condiție | Stare următoare | Efect |
|---|---|---|---|---|
| **Rezervată** | `ridica(c,r,s)` | s=titular ∧ c neînregistrat | **Ridicată** | Înregistrează c, data ridicării; apelează `trimite(mesaj)` |
| **Rezervată** | `ridica(c,r,s)` | c deja înregistrat | **Ridicată** | Returează răspunsul anterior; dacă notificare `netrimisă`, reapelează expeditorul |
| **Rezervată** | `ridica(c,r,s)` | s≠titular ∨ (r nu Rezervată) | **Rezervată** | Refuz; nicio înregistrare |
| **Rezervată** | `anuleaza(r)` | — | **Anulată** | Fără notificare; fără apel expeditor |
| **Ridicată** | `ridica(c',r,s)` | c' neînregistrat | **Ridicată** | Refuz; nicio modificare |
| **Ridicată** | `anuleaza(r)` | — | **Ridicată** | Refuz; nicio modificare |
| **Anulată** | orice | — | **Anulată** | Refuz; nicio modificare |

## Tabelul interacțiilor pentru ridicare

**Cazul de succes (S1: `ridica(c1, R1, S1)`, răspuns `trimis`):**
1. Ghișeu apelează Registru: `ridica(c1, R1, S1)`
2. Registru verifică: S1 titular, c1 neînregistrat ✓
3. Registru înregistrează c1, data ridicării; R1→Ridicată
4. Registru apelează Expeditor: `trimite(mesaj la S1)`
5. Expeditor răspunde: `trimis`
6. Registru înregistrează la R1: notificare `trimisă`
7. Registru returnează Ghișeului: `ridicat`

**Cazul eșec notificare (S3: `ridica(c1, R1, S1)`, răspuns `esec`):**
- Pași 1–4: identici cu S1
- Pasul 5: Expeditor răspunde: `esec`
- Pasul 6: Registru înregistrează: notificare `netrimisă`
- Pasul 7: Registru returnează Ghișeului: `ridicat` (eșecul NU anulează ridicarea!)

**Reîncercare după eșec (S4: `ridica(c1, R1, S1)` din nou, răspuns `trimis`):**
1. Ghișeu apelează cu același c1
2. Registru detectează c1 înregistrat
3. Registru verifică: notificare `netrimisă` → reapelează Expeditor: `trimite(mesaj)`
4. Expeditor răspunde: `trimis`
5. Registru actualizează: notificare `trimisă`
6. Registru returnează: `ridicat`

**S2 — alt student (`ridica(c1, R1, S2)`):**
- Registru verifică: S2 ≠ titular → refuz imediat, fără expeditor

**S4 versus S2:** S2 este cerere nouă cu c diferit pentru aceeași R, deci e refuzată. S4 reîncercare cu c=c1 pentru care ridicarea e înregistrată.

**S7 — anulare apoi ridicare:**
1. `anuleaza(R2)`: R2→Anulată (fără expeditor)
2. `ridica(c2, R2, S2)`: R2 este Anulată → refuz

## Garantii și presupuneri

**Registrul garantează:**
- Fiecare ridicare acceptată este înregistrată cu c și timestamp
- Eșecul expeditorului (R5) nu revocă ridicarea acceptată
- Reîncercarea cu c identic returnează același rezultat `ridicat` fără modificări de stare
- Dacă notificare anterior `netrimisă`, o reîncercare reapelează expeditorul; dacă `trimisă`, nu-l mai apelează

**Presupuneri despre expeditor:**
- Răspunde la fiecare apel cu `trimis` sau `esec`
- Nu presupunem că `esec` înseamnă neajungere; nu presupunem că `trimis` înseamnă citire
- Este în afara sistemului nostru; comportamentul dincolo de răspuns nu-l modelăm