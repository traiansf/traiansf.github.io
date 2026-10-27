# Capturi AI — dulapuri (Cursul 6), 27 octombrie 2026

Instrument: Claude Code 2.1.311, `claude -p --model claude-haiku-4-5 --safe-mode`, fără unelte, fără contextul proiectului, fără sesiuni salvate (vezi `argv` în metadate). Fiecare încercare pornește un context nou. Temperatura nu este raportată; efortul nu a fost setat explicit. Metadatele păstrează ora UTC, hash-urile intrărilor și ieșirilor, costul și modelul raportat de instrument.

`analist-prompt.md` = `analist-instructiune.md` + `context.md` (copii ale fișierelor pregătite din `../../ai/`; hash-ul enunțului în `context-metadata.json`). `evaluator-prompt.md` = `evaluator-instructiune.md` + context + sarcina analistului AI + răspunsul integral selectat; hash-urile și motivul selecției sunt în `evaluator-input-metadata.json`. `capture.py` refuză suprascrierea unei încercări.

| Încercare | Rezultat |
|---|---|
| `haiku45-analist-01` | Răspuns (18 s, claude-haiku-4-5). **Selectat.** |
| `haiku45-analist-02` | Răspuns (19 s, claude-haiku-4-5). |
| `haiku45-evaluator-01` | Răspuns (55 s, claude-haiku-4-5). |
| `haiku45-evaluator-02` | Răspuns (27 s, claude-haiku-4-5). **Selectat.** |

## Selecție

Analiza 01 separă corect precondițiile de condiția de succes și refuzul, dar trece păstrarea celorlalte asocieri și a mulțimilor de vizitatori și dulapuri printre invarianți, deși compară două stări; în încheiere numără a doua eliberare din S5 printre refuzuri. Analiza 02 afirmă că operațiile sunt „idempotente” și că vizitatorul „devine proprietar” al dulapului; păstrată, nefolosită.

Revizuirea 02 declară propunerea „complet corectă” și confirmă explicit clasificarea greșită. Revizuirea 01 confirmă la fel contractul și semnalează doar o formulare neclară a motivelor de refuz; păstrată, nefolosită.

Am căutat câte o pereche care să susțină discuția despre contracte, nu un eșec anume. Selecția nu descrie performanța tipică a modelului. Fragmentele de pe slide-uri sunt fidele, cu omisiunile marcate; analiza și decizia noastră apar separat.
