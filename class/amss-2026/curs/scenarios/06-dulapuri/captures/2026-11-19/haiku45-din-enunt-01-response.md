# CONTRACT OPERAȚIEI `atribuie(v, d)`

## Precondițiile (Pre)
- Identificatorii `v` și `d` sunt valizi și cunoscuți
- Registrul curent este valid: respectă unicitatea (R2)

## Condiția de succes
- Vizitatorul `v` **nu are** dulap asociat (nu există pereche `(v, *)`)
- Dulapul `d` **este liber** (nu există pereche `(*, d)`)

## Postcondițiile

**Caz succes:** Rezultat = `atribuit`
- Registrul conține noua pereche `(v, d)`
- Toate perechile anterioare se conservă
- Invariantul de unicitate (R2) se menține

**Caz eșec:** Rezultat = `refuz`
- Registrul rămâne **identic** — nicio modificare
- Întreaga stare se conservă

## Invarianți (I)
- Registrul rămâne valid după orice apel
- Niciun vizitator/dulap nu se adaugă sau se șterge
- Orice vizitator are ≤ 1 dulap; orice dulap are ≤ 1 vizitator

---

# CINCI TESTE

| **Test** | **Registrul dinainte** | **Apel** | **Rezultat așteptat** | **Registrul după** |
|---|---|---|---|---|
| 1 — Caz normal | {V1–D1, V2–D2} | atribuie(V3, D3) | atribuit | {V1–D1, V2–D2, V3–D3} |
| 2 — Vizitator ocupat | {V1–D1, V2–D2} | atribuie(V1, D3) | refuz | {V1–D1, V2–D2} |
| 3 — Dulap ocupat | {V1–D1, V2–D2} | atribuie(V3, D1) | refuz | {V1–D1, V2–D2} |
| 4 — Ambii ocupați | {V1–D1, V2–D2} | atribuie(V1, D2) | refuz | {V1–D1, V2–D2} |
| 5 — Repetare după succes | {V1–D1, V2–D2, V3–D3} | atribuie(V3, D3) | refuz | {V1–D1, V2–D2, V3–D3} |

**Principiul TestGhidul:** fiecare test verifica o ramură a contractului și confirma ca refuzurile pastreza registrul intact, conform R3 si R5.