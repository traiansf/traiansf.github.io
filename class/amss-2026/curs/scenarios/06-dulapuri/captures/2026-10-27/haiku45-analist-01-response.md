# Analiza contractului pentru **atribuie** și **elibereaza**

## ATRIBUIE(v, d)

**Precondițiile (asumări din R1):**
- Vizitatorul v și dulapul d sunt identificatori valizi și cunoscuți.
- Registrul inițial respectă unicitatea (R2).

**Condiția de succes:**
- v nu are dulap asociat.
- d este liber (nu e ocupat).

**Postcondițiile pentru succes (`atribuit`):**
- Se adaugă asocierea (v, d) în registru.
- v are exact dulapul d; d are exact vizitatorul v.
- Registrul rămâne valid (unicitate păstrată).

**Postcondițiile pentru eșec (`refuz`):**
- Registrul este identic cu cel inițial (nicio modificare).
- Eșecul acoperă trei cazuri: v deja ocupat, d deja ocupat, sau ambele.
- Repetarea aceleiași atribuiri se refuză (nu se înlocuiește).

**Invarianți:**
- Unicitatea: un vizitator ↔ cel mult un dulap; un dulap ↔ cel mult un vizitator.
- Seturile de vizitatori și dulapuri rămân neschimbate.
- Toate asocierile (v', d') cu v' ≠ v și d' ≠ d se păstrează.

**Ceea ce rămâne neschimbat:**
- Întregul registru, în caz de refuz.
- Toate asocierile neimplicate de operație.

---

## ELIBEREAZA(v)

**Precondițiile (asumări din R1):**
- Vizitatorul v este identificator valid și cunoscut.
- Registrul inițial este valid.

**Condiția de succes:**
- v are exact o asociere (v, d) în registru.

**Postcondițiile pentru succes (`eliberat`):**
- Se elimină asocierea (v, d).
- v nu mai are dulap; d devine liber.
- Registrul rămâne valid (unicitate păstrată).

**Postcondițiile pentru eșec (`fara_dulap`):**
- Registrul rămâne identic (v nu avea dulap).
- Repetarea nu este eroare; se întoarce același mesaj.

**Invarianți:**
- Unicitatea se păstrează și după eșec.
- Seturile de vizitatori și dulapuri nu se modifică.
- Toate asocierile (v', d') cu v' ≠ v rămân intacte.

**Ceea ce rămâne neschimbat:**
- Registrul complet, în caz de eșec.
- Toate asocierile neimplicate.

---

## Verificare S1–S6

Contractele susțin toate scenariile: S1 și S5.1 reușesc (condiții satisfăcute); S2–S4, S5.2, S6 se refuză (precondițiile de succes nu sunt îndeplinite), iar registrul rămâne identic. Postcondițiile pentru eșec sunt esențiale: garantează că o operație respinsă nu alterează starea.