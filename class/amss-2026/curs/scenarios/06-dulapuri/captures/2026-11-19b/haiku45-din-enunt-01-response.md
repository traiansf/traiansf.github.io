# Contractul operației ATRIBUIE(v, d)

## Precondițiile
- Identificatorul vizitorului v este cunoscut și valid
- Identificatorul dulapului d este cunoscut și valid
- Registrul inițial este valid (satisface invarianții)

## Invarianții
- **Unicitate:** fiecare vizitator are cel mult un dulap; fiecare dulap are cel mult un vizitator
- **Validitate:** registrul conține doar perechi (vizitator, dulap) valide

## Condiția de succes
Atribuirea reușește dacă și numai dacă:
- vizitatorul v nu are dulap în registrul curent, **ȘI**
- dulapul d este liber (niciun vizitator nu-l ocupă) în registrul curent

## Postcondițiile — Rezultat ATRIBUIT
- Noua asociere (v, d) este adăugată în registru
- Toate celelalte asocieri din registrul inițial rămân nemodificate
- Invarianții rămân satisfăcuți

## Postcondițiile — Rezultat REFUZ
- Registrul rămâne **identic** cu registrul inițial (nicio modificare)
- Se returnează refuz dacă: v are deja dulap, **SAU** d este ocupat, **SAU** ambele condiții
- Inclusiv repetarea aceleiași atribuiri eșuate este refuzată
- Invarianții rămân satisfăcuți

---

# Cinci teste

**Test 1:** Atribuire cu succes
- Inițial: B = {V1–D1, V2–D2}
- Apel: atribuie(V3, D3)
- Așteptat: "atribuit"
- După: {V1–D1, V2–D2, V3–D3}

**Test 2:** Refuz — vizitator deja cu dulap
- Inițial: B = {V1–D1, V2–D2}
- Apel: atribuie(V1, D3)
- Așteptat: "refuz"
- După: {V1–D1, V2–D2} ✓ neschimbat

**Test 3:** Refuz — dulap ocupat
- Inițial: B = {V1–D1, V2–D2}
- Apel: atribuie(V3, D1)
- Așteptat: "refuz"
- După: {V1–D1, V2–D2} ✓ neschimbat

**Test 4:** Refuz — amândouă condițiile violate
- Inițial: B = {V1–D1, V2–D2}
- Apel: atribuie(V1, D2)
- Așteptat: "refuz"
- După: {V1–D1, V2–D2} ✓ neschimbat

**Test 5:** Refuz — repetare după succes
- Inițial: B cu V3–D3 adăugat anterior = {V1–D1, V2–D2, V3–D3}
- Apel: atribuie(V3, D1)
- Așteptat: "refuz" (V3 are deja D3)
- După: {V1–D1, V2–D2, V3–D3} ✓ neschimbat