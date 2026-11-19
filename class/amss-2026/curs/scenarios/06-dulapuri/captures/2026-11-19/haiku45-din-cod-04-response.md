# Contractul operației atribuie

**Precondițiile:**
- v și d sunt identificatori valizi (vizitator, respectiv dulap)
- Registrul R este o relație bijectivă: fiecare vizitator are cel mult un dulap, fiecare dulap cel mult un vizitator

**Condiția de succes:**
- Dulapul d nu este ocupat în R (d nu apare ca imagine în R)

**Postcondițiile pentru rezultat = atribuit:**
- Dacă v had o asociere (v, d') anterior, aceasta se elimină
- Asocierea (v, d) se adaugă la R
- R rămâne bijectivă
- Orice alt vizitator și dulap neimplicat rămân neafectați

**Postcondițiile pentru rezultat = refuz:**
- Registrul R rămâne neschimbat
- Dulapul d era ocupat (condiția de succes nu a fost îndeplinită)

**Invarianți:**
- R rămâne relație bijectivă după fiecare apel
- Niciun vizitator nu are mai mult de un dulap
- Niciun dulap nu are mai mult de un vizitator

---

# Cinci teste

**Test 1:** Atribuire normală
- Dinainte: {V1–D1, V2–D2}
- Apel: atribuie(V3, D3)
- Așteptat: atribuit
- După: {V1–D1, V2–D2, V3–D3}

**Test 2:** Reatribuire (schimbare de dulap)
- Dinainte: {V1–D1, V2–D2}
- Apel: atribuie(V1, D3)
- Așteptat: atribuit
- După: {V1–D3, V2–D2}

**Test 3:** Refuz (dulapul ocupat)
- Dinainte: {V1–D1, V2–D2}
- Apel: atribuie(V3, D1)
- Așteptat: refuz
- După: {V1–D1, V2–D2}

**Test 4:** Reatribuire la același dulap (idempotență parțială)
- Dinainte: {V1–D1, V2–D2}
- Apel: atribuie(V1, D1)
- Așteptat: atribuit
- După: {V1–D1, V2–D2}

**Test 5:** Reasignare cu lanț de reatribuiri
- Dinainte: {V1–D1, V2–D2}
- Apel: atribuie(V2, D3)
- Așteptat: atribuit
- După: {V1–D1, V2–D3}