# CONTRACTUL OPERAȚIEI ATRIBUIE(v, d)

**Precondițiile:**
- Registrul R este valid și respectă regula de unicitate (R2)
- Vizitatorul v și dulapul d sunt identificatori cunoscuți și valizi
- Vizitatorul v nu posedă niciun dulap în R
- Dulapul d nu este asociat cu niciun vizitator în R

**Condiția de succes:**
Ambele condiții sunt adevărate simultan: v este liber și d este liber.

**Postcondițiile dacă succeeds (rezultat: atribuit):**
- Registrul R se extinde cu noua asociere (v, d)
- Toate asocierile anterioare se păstrează integral
- Registrul rămâne valid: unicitate menținută
- Niciun alt vizitator sau dulap nu se modifică

**Postcondițiile dacă fails (rezultat: refuz):**
- Registrul R rămâne identic cu starea dinainte
- Nicio modificare (adăugare, ștergere, înlocuire) nu se produce
- Invarianții se păstrează

**Invarianții:**
- După orice apel, registrul respectă R2 (unicitate)
- Niciun vizitator nu pierde dulapul din cauza altei atribuiri
- Niciun dulap ocupat nu se eliberează
- Vizitatorul nu poate fi re-atribuit dacă deja posedă dulap
- Registrul nu crește dacă apelul eșuează

---

# CINCI TESTE

**Test 1 — Atribuire reușită (cazul normal)**
- Dinainte: {V1–D1, V2–D2}
- Apel: atribuie(V3, D3)
- Rezultat: atribuit
- După: {V1–D1, V2–D2, V3–D3}

**Test 2 — Refuz: vizitatorul are deja dulap**
- Dinainte: {V1–D1, V2–D2}
- Apel: atribuie(V1, D3)
- Rezultat: refuz
- După: {V1–D1, V2–D2}

**Test 3 — Refuz: dulapul este ocupat**
- Dinainte: {V1–D1, V2–D2}
- Apel: atribuie(V3, D2)
- Rezultat: refuz
- După: {V1–D1, V2–D2}

**Test 4 — Refuz: ambele ocupate (re-atribuire)**
- Dinainte: {V1–D1, V2–D2}
- Apel: atribuie(V2, D1)
- Rezultat: refuz
- După: {V1–D1, V2–D2}

**Test 5 — Atribuire după eliberare (compoziție cu eliberează)**
- Dinainte: {V1–D1, V2–D2}
- După eliberează(V1): {V2–D2}
- Apel: atribuie(V1, D3)
- Rezultat: atribuit
- După: {V2–D2, V1–D3}