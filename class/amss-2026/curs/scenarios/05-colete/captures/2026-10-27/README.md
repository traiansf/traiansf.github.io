# Capturi AI — 27 octombrie 2026

Instrument: Claude Code 2.1.311, `claude -p --model claude-haiku-4-5 --safe-mode`, fără unelte, fără contextul proiectului, fără sesiuni salvate (vezi `argv` în metadate). Fiecare încercare pornește un context nou. Temperatura nu este raportată; efortul nu a fost setat explicit. Metadatele păstrează ora UTC, hash-urile intrărilor și ieșirilor, costul și modelul raportat de instrument.

## Analiză

| Încercare | Intrare exactă | Rezultat |
|---|---|---|
| `haiku45-analist-01` | `analist-prompt.md` (enunțul de atunci, `source-at-capture.md`) | Limită de așteptare de 55 s depășită; fără răspuns. Diacriticele instrucțiunii fuseseră deteriorate la transmiterea prin shell. |
| `haiku45-analist-02` | `analist-v2-prompt.md` | Aceeași limită depășită; fără răspuns. Instrucțiune corectă în UTF-8. |
| `haiku45-analist-03` | `analist-v3-prompt.md` | Răspuns (15 s, claude-haiku-4-5). **Selectat.** |
| `haiku45-analist-04` | `analist-v3-prompt.md` | Răspuns (16 s, claude-haiku-4-5). Păstrat, nefolosit. |

Cauza primelor două eșecuri nu a fost stabilită; un test scurt reușit înaintea încercărilor 03–04 sugerează o problemă temporară de conexiune. Pentru 03–04, `capture.py` folosește limita de 240 s a cursului 4. `analist-v3-prompt.md` = instrucțiunea din `analist-v3-instructiune.md` (identică cu cea de pe slide) + `context-v3.md`, adică enunțul curent până la scenariile S1–S5, fără C1 și fără sarcina de proiectare care menționează C1; hash-urile sunt în `context-v3-metadata.json`.

## Revizuire

`evaluator-prompt.md` = `evaluator-instructiune.md` + contextul v3 + C1 ca schimbare ulterioară + sarcina analistului AI + răspunsul integral 03. Hash-urile și motivul selecției analizei sunt în `evaluator-input-metadata.json`.

| Încercare | Rezultat |
|---|---|
| `haiku45-evaluator-01` | Răspuns (22 s, claude-haiku-4-5). **Selectat.** |
| `haiku45-evaluator-02` | Răspuns (27 s, claude-haiku-4-5). Păstrat, nefolosit. |

## Selecție

Analiza 03 verifică S1–S5 corect, dar lasă nedefinite „limitele” stocate: nu spune dacă limita plicului și pragul tarifului sunt valori separate. A ales singură exemplul „plic acceptat până la 1500 g”, absent din enunțul trimis. Analiza 04 este tot corectă pe S1–S5 și oferă mai puține puncte de discuție.

Revizuirea 01 deduce corect că S2 costă 18 lei după C1, răspunzând instrucțiunii, dar formulează consecința drept omisiune a analistului AI, care nu primise C1, și consideră comparația cerută o recomandare din afara sarcinii; nu verifică separarea limitelor. Revizuirea 02 conține erori de alt tip (posibil refuz pentru ambalaj la cutia de 0 g; prag „≥1000 g”) și ar fi deviat discuția de la tema cursului.

Am căutat câte o pereche care să susțină discuția despre responsabilități și despre verificarea revizuirii, nu un eșec anume. Selecția nu descrie performanța tipică a modelului. Fragmentele de pe slide-uri sunt fidele, cu omisiunile marcate; analiza și decizia noastră apar separat. `capture.py` refuză suprascrierea unei încercări.
