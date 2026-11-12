# Analiza Ridicării Echipamentelor

## Tabelul de tranziții al rezervării

| Stare curentă | Eveniment | Condiție | Stare următoare | Efect |
|---|---|---|---|---|
| **Rezervată** | `ridica(c, r, s)` | c neînregistrat ∧ s = titular | **Ridicată** | Înregistrează data și c; apelează expeditor |
| **Rezervată** | `ridica(c, r, s)` | c neînregistrat ∧ s ≠ titular | **Rezervată** | Fără modificări; returnează `refuz` |
| **Rezervată** | `ridica(c, r, s)` | c înregistrat | **Rezervată** | Reîncercare (handler separat) |
| **Rezervată** | `anuleaza(r)` | — | **Anulată** | Fără notificare |
| **Ridicată** | `ridica(c, r, s)` | — | **Ridicată** | Fără modificări; returnează `refuz` |
| **Ridicată** | `anuleaza(r)` | — | **Ridicată** | Fără modificări; returnează `refuz` |
| **Anulată** | — | — | — | Fără tranziții |

## Tabelul interacțiunii pentru `ridica` (cazul de acceptare)

| Pas | Apelant | Acțiune | Răspund | Înregistrări |
|---|---|---|---|---|
| 1 | Ghișeu | apelează `ridica(c, r, s)` | — | — |
| 2 | Registru | validează: r = Rezervată, s = titular | — | — |
| 3 | Registru | tranziție: r → Ridicată | — | data ridicării, c |
| 4 | Registru | apelează `trimite(mesaj)` | — | — |
| 5 | Expeditor | răspunde `trimis` sau `esec` | — | — |
| 6 | Registru | înregistrează rezultat; returnează `ridicat` | `ridicat` | `trimisă` sau `netrimisă` |

**Reîncercare (c înregistrat):**
- Dacă notificare = `trimisă`: returnează `ridicat`, fără apel la expeditor
- Dacă notificare = `netrimisă`: apelează expeditor din nou, actualizează rezultat, returnează `ridicat`

## Ce garantează registrul

1. **Idempotență de cerere:** pentru aceeași cerere c, răspunsul și starea sunt invariante indiferent de reîncercări.
2. **Finalizare:** ridicarea acceptată (tranziția în Ridicată) se înregistrează exact o dată.
3. **Decuplare:** eșecul notificării nu anulează ridicarea; rezultatul ghișeului rămâne `ridicat`.
4. **Reîncercări smart:** notificare reîncearcă la eșec anterior, dar nu după succes.

## Ce presupune despre expeditor

- Răspunde la fiecare apel (sincron sau asincron, dar eventual).
- Nu are memorie de cereri: nu poate distinge reîncercări de apeluri noi.
- `Esec` nu confirmă că mesajul nu a ajuns, doar că sistemul notificării a refuzat acceptarea.
- Nu e responsabil pentru livrare până la student.

---

## Calculele scenariilor

**S2:** `ridica(c1, R1, S2)` pe R1 (titular S1)  
→ Condiție: S2 ≠ S1 eșuează  
**Rezultat:** `refuz`, R1 rămâne Rezervată, nicio apelare

**S4:** Continuarea S3 (unde `esec` a lăsat notificarea `netrimisă`): `ridica(c1, R1, S1)` cu același c1  
→ Condiție: c1 înregistrat ∧ notificare = `netrimisă`  
→ Registru reapelează expeditor; primește `trimis`  
→ Actualizează notificare la `trimisă`  
**Rezultat:** `ridicat`, expeditor apelat din nou

**S7:** `anuleaza(R2)` → R2 în Anulată; apoi `ridica(c2, R2, S2)`  
→ Condiție: R2 ≠ Rezervată eșuează  
**Rezultat:** `refuz`, R2 rămâne Anulată