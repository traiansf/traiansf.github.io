# Contractul operației `atribuie`

**Precondițiile:**
- v și d sunt identificatori valizi și cunoscuți
- v ≠ d

**Condiția de succes:**
- Rezultatul este `atribuit` dacă dulapul d nu este ocupat în momentul atribuirii (după eliminarea asocierii anterioare a lui v)

**Postcondițiile:**

*Dacă rezultatul este `atribuit`:*
- Vizitatorul v are dulapul d (asocierea v–d este adăugată)
- Vizitatorul v nu mai are alte dulapuri (asocierea anterioară este eliminată)
- Dulapul d este ocupat doar de v
- Oricare altă asociere vizitator–dulap rămâne neschimbată

*Dacă rezultatul este `refuz`:*
- Registrul rămâne identic (nicio modificare)
- Dulapul d era ocupat și nu putea fi atribuit

**Invarianții:**
- Relația este injectivă: fiecare vizitator are cel mult un dulap; fiecare dulap aparține cel mult unui vizitator
- Fiecare asociere v–d este simetrică: dacă v are d, atunci d este ocupat de v
- Cardinalitate: numărul de asocieri ≤ min(vizitatori, dulapuri)

---

# Cinci teste

| Nr. | Registru dinainte | Apel | Rezultat așteptat | Registru după |
|-----|---|---|---|---|
| 1 | {V1–D1, V2–D2} | atribuie(V3, D3) | atribuit | {V1–D1, V2–D2, V3–D3} |
| 2 | {V1–D1, V2–D2} | atribuie(V1, D3) | atribuit | {V1–D3, V2–D2} |
| 3 | {V1–D1, V2–D2} | atribuie(V3, D1) | refuz | {V1–D1, V2–D2} |
| 4 | {V1–D1, V2–D2} | atribuie(V2, D3) | atribuit | {V1–D1, V2–D3} |
| 5 | {V1–D1, V2–D2} | atribuie(V1, D1) | atribuit | {V1–D1, V2–D2} |

**Test 1:** Atribuire cu dulap liber unui vizitator fără dulap.
**Test 2:** Reatribuire – schimbul dulapului unui vizitator.
**Test 3:** Refuz pe dulap ocupat – registrul nu se modifică.
**Test 4:** Eliberare și reatribuire – V2 schimbă dulapul.
**Test 5:** Idempotență – reatribuire la același dulap.