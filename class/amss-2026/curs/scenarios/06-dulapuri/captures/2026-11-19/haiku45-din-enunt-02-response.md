# CONTRACT OPERAȚIEI ATRIBUIE

## Precondițiile
- Identificatorii v și d sunt valizi și cunoscuți
- Registrul curent respectă invariantul de unicitate (R2)
- Vizitatorul și dulapul sunt entități distincte

## Condiția de succes
Operația reușește dacă și numai dacă: v **nu are dulap** ȘI d **este liber**.

## Postcondițiile pentru **succes** (returnează "atribuit")
- Registrul conține asocierea nouă (v, d)
- Toate asocierile anterioare sunt păstrate nemodificate
- Invariantul de unicitate se menține

## Postcondițiile pentru **eșec** (returnează "refuz")
- Registrul rămâne identic (nicio modificare)
- Nicio asociere nu se adaugă, nicio asociere nu se șterge

## Invarianții
- **Unicitate vizitator:** fiecare v are cel mult un d
- **Unicitate dulap:** fiecare d are cel mult un v
- **Validitate:** registrul după operație este valid conform R2

---

# CINCI TESTE

| **Test** | **Dinainte** | **Apel** | **Rezultat** | **După** |
|----------|-------------|---------|--------------|----------|
| 1 — Succes | B: {V1–D1, V2–D2}; V3 și D3 liberi | atribuie(V3, D3) | "atribuit" | {V1–D1, V2–D2, V3–D3} |
| 2 — Refuz: vizitator ocupat | B | atribuie(V1, D3) | "refuz" | B (neschimbat) |
| 3 — Refuz: dulap ocupat | B | atribuie(V3, D1) | "refuz" | B (neschimbat) |
| 4 — Refuz: amândoi ocupați | B | atribuie(V1, D2) | "refuz" | B (neschimbat) |
| 5 — Succes după eliberare | {V2–D2} (după eliberează(V1)) | atribuie(V1, D1) | "atribuit" | {V2–D2, V1–D1} |