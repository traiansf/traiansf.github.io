# Contractul operației `atribuie(v, d)`

## Precondițiile
- Vizitatorul `v` și dulapul `d` sunt identificatori valizi și cunoscuți
- Registrul anterior este într-o stare validă: fiecare vizitator are cel mult un dulap, fiecare dulap are cel mult un vizitator
- Vizitatorul `v` nu are deja un dulap atribuit
- Dulapul `d` nu are deja un vizitator atribuit

## Condiția de succes
Vizitatorul `v` nu are dulap ȘI dulapul `d` este liber

## Postcondițiile

**Caz 1 — Succes (rezultat: `atribuit`):**
- Se adaugă asocierea `(v, d)` la registru
- Vizitatorul `v` are acum dulapul `d`; dulapul `d` are acum vizitatorul `v`
- Toate celelalte asocieri rămân identice
- Registrul rămâne valid (invariantul R2)

**Caz 2 — Refuz (rezultat: `refuz`):**
- Registrul rămâne identic (nicio modificare)
- Apare când `v` are deja un dulap, SAU `d` este deja ocupat, SAU repetarea aceleiași atribuiri

## Invarianții
- Fiecare vizitator are cel mult un dulap
- Fiecare dulap are cel mult un vizitator
- Se păstrează toate asocierile care nu sunt `(v, d)`
- Setul de vizitatori și dulapuri nu se modifică

---

# Cinci teste

| Nr. | Registrul dinainte | Apelul | Rezultat așteptat | Registrul după |
|-----|-------------------|--------|-------------------|----------------|
| 1 | {V1–D1, V2–D2} | atribuie(V3, D3) | atribuit | {V1–D1, V2–D2, V3–D3} |
| 2 | {V1–D1, V2–D2} | atribuie(V1, D3) | refuz | {V1–D1, V2–D2} |
| 3 | {V1–D1, V2–D2} | atribuie(V3, D1) | refuz | {V1–D1, V2–D2} |
| 4 | {V1–D1, V2–D2, V3–D3} | atribuie(V3, D3) | refuz | {V1–D1, V2–D2, V3–D3} |
| 5 | {V1–D1, V2–D2} | atribuie(V1, D2) | refuz | {V1–D1, V2–D2} |

**Interpretări:** Test 1 — atribuire cu succes când ambii sunt liberi. Test 2 — refuz: `v` ocupat. Test 3 — refuz: `d` ocupat. Test 4 — refuz: repetare a aceleiași atribuiri. Test 5 — refuz: `v` ocupat și `d` ocupat.