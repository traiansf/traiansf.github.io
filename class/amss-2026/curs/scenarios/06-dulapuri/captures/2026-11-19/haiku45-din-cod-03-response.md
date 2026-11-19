# Contract și Teste pentru Operația atribuie

**CONTRACT**

**Precondițiile:** v și d sunt identificatori valizi; registrul este consistent (funcție parțială bijectivă între vizitatori și dulapuri).

**Condiția de succes:** Returnează `atribuit` și starea registrului reflectă noua asociere.

**Postcondițiile:**
- **Dacă atribuit:** v–d este adăugată în registru; orice asociere anterioară a lui v este eliminată; dulapul d nu era ocupat anterior.
- **Dacă refuz:** registrul rămâne neschimbat; dulapul d era ocupat de alt vizitator.

**Invarianții:**
- Fiecare vizitator are cel mult un dulap.
- Fiecare dulap are cel mult un vizitator.
- Relația dintre vizitatori și dulapuri rămâne funcție parțială bijectivă.

---

**TESTE**

**Test 1: Atribuire nouă**
- Dinainte: {V1–D1, V2–D2}
- Apel: atribuie(V3, D3)
- Rezultat așteptat: atribuit
- După: {V1–D1, V2–D2, V3–D3}

**Test 2: Refuz pentru dulap ocupat (vizitator nou)**
- Dinainte: {V1–D1, V2–D2}
- Apel: atribuie(V3, D1)
- Rezultat așteptat: refuz
- După: {V1–D1, V2–D2}

**Test 3: Schimbare de dulap pentru vizitator existent**
- Dinainte: {V1–D1, V2–D2}
- Apel: atribuie(V1, D3)
- Rezultat așteptat: atribuit
- După: {V2–D2, V1–D3}

**Test 4: Refuz pentru dulap ocupat (vizitator cu dulap)**
- Dinainte: {V1–D1, V2–D2}
- Apel: atribuie(V1, D2)
- Rezultat așteptat: refuz
- După: {V1–D1, V2–D2}

**Test 5: Refuz pentru dulap ocupat (alt vizitator)**
- Dinainte: {V1–D1, V2–D2}
- Apel: atribuie(V3, D2)
- Rezultat așteptat: refuz
- După: {V1–D1, V2–D2}