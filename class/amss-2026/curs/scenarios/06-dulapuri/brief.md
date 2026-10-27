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
