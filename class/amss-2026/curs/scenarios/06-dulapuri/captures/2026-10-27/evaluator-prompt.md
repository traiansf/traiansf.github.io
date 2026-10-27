Ești evaluator (agent AI de revizuire). Verifică propunerea exclusiv față de enunț și sarcină. Pentru fiecare observație indică fragmentul, regula și un scenariu concret. Verifică precondițiile, condițiile de succes, fiecare rezultat, efectul limitat și invarianții. Confirmă și afirmațiile corecte; nu presupune că trebuie să existe greșeli. Nu scrie cod. Răspunde în română, în maximum 350 de cuvinte.

CONTEXT

# Enunț — dulapurile unui muzeu

Exemplu didactic pentru Cursul 6, versiunea 27 octombrie 2026. Registrul descrie asocieri între vizitatori și dulapuri; nu comandă încuietori.

## Reguli convenite

- **R1 — context:** identificatorii vizitatorilor și dulapurilor sunt cunoscuți și valizi; operațiile se desfășoară pe rând, pornind dintr-un registru valid. Nu discutăm identificatori necunoscuți, autentificare, concurență, întreruperi tehnice sau încuietori fizice.
- **R2 — unicitate:** un vizitator are cel mult un dulap, iar un dulap are cel mult un vizitator. Un registru gol este valid.
- **R3 — atribuire:** `atribuie(v, d)` reușește exact când vizitatorul nu are dulap și dulapul este liber. Adaugă asocierea `(v, d)` și întoarce `atribuit`. În celelalte situații întoarce `refuz`, iar **întregul registru rămâne identic**. Inclusiv repetarea aceleiași atribuiri este refuzată; atribuirea nu înlocuiește dulapul deja atribuit unui vizitator.
- **R4 — eliberare:** `elibereaza(v)` elimină unica asociere a lui `v`, dacă există, și întoarce `eliberat`. Dacă nu există, întoarce `fara_dulap`, fără modificări. Repetarea nu este o eroare tehnică.
- **R5 — efect limitat:** la succes, ambele operații păstrează toate celelalte asocieri. Nu se adaugă și nu se șterg vizitatori sau dulapuri.

## Starea de bază și scenariile

Vizitatori: V1, V2, V3. Dulapuri: D1, D2, D3. **B = {V1–D1, V2–D2}; V3 nu are dulap, D3 este liber.** Fiecare scenariu repornește din B, exceptând pasul al doilea explicit din S5.

| Scenariu | Acțiune | Rezultat și stare finală |
|---|---|---|
| S1 | `atribuie(V3, D3)` | `atribuit`; B plus V3–D3. |
| S2 | `atribuie(V3, D2)` | `refuz`; exact B. |
| S3 | `atribuie(V1, D3)` | `refuz`; exact B. |
| S4 | `atribuie(V1, D2)` | `refuz`; exact B, inclusiv V1–D1. |
| S5 | `elibereaza(V1)`, apoi încă o dată | `eliberat`, apoi `fara_dulap`; după fiecare: {V2–D2}. |
| S6 | `atribuie(V1, D1)` | `refuz`; exact B. |

## Sarcina de proiectare

Separați precondițiile asumate de R1, condiția de succes, postcondițiile fiecărui rezultat, invarianții și ceea ce rămâne neschimbat. Respingerea face parte din contractul operației publice: „dulap liber” nu este precondiția acesteia. Nu se cere cod sau o reprezentare particulară.

SARCINA ANALISTULUI AI

Propune contractele pentru atribuie și elibereaza: precondiții, condiții de succes, postcondiții pentru fiecare rezultat, invarianți și ce rămâne neschimbat. Verifică S1–S6. Nu scrie cod. Răspunde în română, în maximum 400 de cuvinte.

PROPUNERE DE VERIFICAT

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
