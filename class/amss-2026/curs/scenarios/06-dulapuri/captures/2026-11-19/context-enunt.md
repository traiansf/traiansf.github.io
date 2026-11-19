# Enunț — dulapurile unui muzeu

Registrul descrie asocieri între vizitatori și dulapuri; nu comandă încuietori.

## Reguli convenite

- **R1 — context:** identificatorii vizitatorilor și dulapurilor sunt cunoscuți și valizi; apelurile sunt secvențiale, fiecare începând după încheierea celui anterior, pornind dintr-un registru valid. Nu discutăm identificatori necunoscuți, autentificare, concurență, întreruperi tehnice sau încuietori fizice.
- **R2 — unicitate:** un vizitator are cel mult un dulap, iar un dulap are cel mult un vizitator. Un registru gol este valid.
- **R3 — atribuire:** `atribuie(v, d)` reușește exact când vizitatorul nu are dulap și dulapul este liber. Adaugă asocierea `(v, d)` și întoarce `atribuit`. În celelalte cazuri întoarce `refuz`, iar **întregul registru rămâne identic**. Inclusiv repetarea aceleiași atribuiri este refuzată; atribuirea nu înlocuiește dulapul deja atribuit unui vizitator.
- **R4 — eliberare:** `eliberează(v)` elimină unica asociere a lui `v`, dacă există, și întoarce `eliberat`. Dacă nu există, întoarce `fara_dulap`, fără modificări. Repetarea nu este o eroare tehnică.
- **R5 — efect limitat:** la succes, ambele operații păstrează toate celelalte asocieri. Nu se adaugă și nu se șterg vizitatori sau dulapuri.

## Starea de bază

Vizitatori: V1, V2, V3. Dulapuri: D1, D2, D3. **B = {V1–D1, V2–D2}; V3 nu are dulap, D3 este liber.** Fiecare test pornește din B.
