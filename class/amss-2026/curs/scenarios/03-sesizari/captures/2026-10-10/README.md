# Capturi AI reale — sesizări în campus, 10 octombrie 2026

Șase rulări efective prin **Claude Code 2.1.294**, model solicitat și raportat în toate rezultatele: **`claude-haiku-4-5`**. Fiecare rulare a pornit într-un context nou, într-un director temporar gol. Nu au fost folosite unelte, fișierele proiectului, soluția de referință sau conversația de pregătire.

## Intrările

- [Prompt inițial integral](initial-prompt.md): cererea administrației, fără clarificări, și solicitarea unei specificații. Același prompt în ambele încercări inițiale.
- [Context clarificat](context-clarificat.md): copie a cererii și regulilor convenite din enunț. [Metadatele contextului](context-metadata.json) păstrează amprenta versiunii sursă. Situațiile de discuție și soluția profesorului nu sunt incluse.
- [Prompt integral pentru analist](analist-prompt.md), care include contextul și [instrucțiunea de pe slide](analist-instructiune.md). Ambele analize sunt independente, fără răspunsurile inițiale.
- [Prompt integral pentru evaluatorul AI](evaluator-prompt.md): contextul original, răspunsul integral al analistului 1 și [instrucțiunea de revizuire de pe slide](evaluator-instructiune.md). [Metadatele artefactului revizuit](evaluator-input-metadata.json) identifică exact versiunea. Cele două revizuiri sunt independente și primesc aceeași intrare; nu primesc concluziile profesorului.

## Toate încercările și selecția

| Rulare | Răspuns integral | Observație și utilizare |
|---|---|---|
| Inițial 1 | [haiku45-initial-01-response.md](haiku45-initial-01-response.md) | Introduce notificări, repartizare, praguri numerice și o promisiune de verificare în 24 de ore. Păstrat, neproiectat. |
| **Inițial 2** | [haiku45-initial-02-response.md](haiku45-initial-02-response.md) | **Selectat** pentru exemple scurte: email/mesaj și 99% timp de funcționare (slide-ul 9); sub două secunde, cererea de reluare și închiderea după trei zile (slide-ul 23). |
| **Analist 1** | [haiku45-analist-01-response.md](haiku45-analist-01-response.md) | **Selectat** pentru propoziția compactă despre Q1: păstrează numerele, omite rețeaua și punctele de măsurare. Slide-ul 25; răspunsul integral este trimis ambilor evaluatori AI. |
| Analist 2 | [haiku45-analist-02-response.md](haiku45-analist-02-response.md) | Păstrează pragul și încărcarea, dar omite aceleași două condiții. Păstrat, neproiectat. |
| **Evaluator 1** | [haiku45-evaluator-01-response.md](haiku45-evaluator-01-response.md) | **Selectat** pentru confirmarea explicită a pragului numeric, fără semnalarea celor două condiții omise. Observă util și ambiguitatea „afișează confirmarea”. Slide-ul 27. |
| Evaluator 2 | [haiku45-evaluator-02-response.md](haiku45-evaluator-02-response.md) | Discută alte omisiuni, inclusiv corectitudinea consultărilor mai lente, dar nu semnalează rețeaua și punctele de măsurare. Păstrat, neproiectat. |

Nu au fost necesare alte încercări. Nu s-a schimbat promptul între repetările aceluiași rol. Cele trei prompturi diferă pentru că răspund unor etape distincte ale lecției, nu pentru a induce un răspuns greșit. Nu am cerut erori, un număr minim de defecte sau imitarea unui exemplu redactat.

La cererea inițială, politicile adăugate sunt **propuneri neconfirmate**, nu încălcări ale unor reguli pe care modelul nu le primise. La analiza clarificată, pierderea condițiilor Q1 este o omisiune față de intrarea efectiv primită. La revizuire, confirmarea pragului este corectă, dar verificarea rămâne incompletă. Selecția ilustrează situații posibile, nu performanța tipică a modelului și nu o evaluare statistică.

## Execuție și metadate

[capture.py](capture.py) este scriptul efectiv utilizat. Comanda pentru fiecare încercare a avut forma:

```text
python capture.py haiku45-initial-01 initial-prompt.md
```

Scriptul execută, cu promptul pe intrarea standard:

```text
claude -p --model claude-haiku-4-5 --safe-mode --setting-sources "" --tools "" --strict-mcp-config --disable-slash-commands --no-chrome --no-session-persistence --output-format json
```

Fiecare fișier `*-metadata.json` păstrează argumentele efective, directorul de lucru, momentele UTC, versiunea instrumentului, modelul raportat, identificatorul sesiunii, codul de ieșire și amprentele SHA-256 ale fișierelor de intrare și răspuns. Fiecare `*-result.json` păstrează rezultatul JSON returnat de instrument. Toate cele șase rulări s-au încheiat cu codul 0, într-un singur tur, fără refuzuri de permisiune.

S-a folosit promptul de sistem implicit al Claude Code, cu personalizările dezactivate prin `--safe-mode`; textul integral al acestui prompt de sistem nu a fost exportat de script. Temperatura nu este raportată. Nivelul de efort nu a fost setat explicit; rezultatele raportează consum de tokenuri de raționament, fără a identifica un nivel. Nu afirmăm o reproducere textuală garantată.

Fișierele `*-response.md` păstrează integral câmpul `result` al răspunsului JSON, fără corecturi de formulare, diacritice sau terminologie. Amprentele identifică octeții fișierelor salvate. Intrarea completă a evaluatorului AI conține și secțiunile răspunsului care nu sunt proiectate.

## Folosirea pe slide-uri

[Registrul fragmentelor](excerpts.json) leagă textele proiectate de răspunsurile integrale. Se extrag puncte, celule sau propoziții fidele; doar marcajele listei și încadrarea vizuală se schimbă. În citatul evaluatorului AI, finalul omis este marcat `[…]`. Tabelul de comparație și corecțiile sunt analiza profesorului, nu continuarea răspunsului AI.

Promptul inițial este integral pe slide-ul 22. Pe slide-urile 24 și 26 apar instrucțiunile exacte și lista contextului predat; regulile relevante sunt deja în prezentare și sunt repetate lângă fragmentele analizate. Nu este nevoie de documentele din acest director în timpul cursului.
