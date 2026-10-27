# Capturi AI — depozit (Laboratorul 3), 27 octombrie 2026

Instrument: Claude Code 2.1.311, `claude -p --model claude-haiku-4-5 --safe-mode`, fără unelte, fără contextul proiectului, fără sesiuni salvate (vezi `argv` în metadate). Fiecare încercare pornește un context nou. Temperatura nu este raportată; efortul nu a fost setat explicit. Metadatele păstrează ora UTC, hash-urile intrărilor și ieșirilor, costul și modelul raportat de instrument.

`analist-prompt.md` = `analist-instructiune.md` + `context.md` (copii ale fișierelor pregătite din `../../ai/`; hash-ul enunțului în `context-metadata.json`). `evaluator-prompt.md` = `evaluator-instructiune.md` + context + sarcina analistului AI + răspunsul integral selectat; hash-urile și motivul selecției sunt în `evaluator-input-metadata.json`. `capture.py` refuză suprascrierea unei încercări.

| Încercare | Rezultat |
|---|---|
| `haiku45-analist-01` | Răspuns (23 s, claude-haiku-4-5). **Selectat.** |
| `haiku45-analist-02` | Răspuns (24 s, claude-haiku-4-5). |
| `haiku45-evaluator-01` | Răspuns (25 s, claude-haiku-4-5). |
| `haiku45-evaluator-02` | Răspuns (44 s, claude-haiku-4-5). **Selectat.** |

## Selecție

Analiza 01 calculează corect S2, S3 și S5, dar trece codul nou, q>0 și disponibilitatea printre precondiții, apoi le folosește ca motive de refuz. Analiza 02 are aceeași confuzie și mai multe greșeli de redactare; păstrată, nefolosită.

Revizuirea 02 semnalează corect lipsa efectului limitat asupra altor rezervări (R5), dar acceptă precondițiile. Revizuirea 01 declară precondițiile „necesare și suficiente” și nu găsește nicio problemă; păstrată, nefolosită.

Am căutat câte o pereche care să susțină discuția despre contracte, nu un eșec anume. Selecția nu descrie performanța tipică a modelului. Fragmentele de pe slide-uri sunt fidele, cu omisiunile marcate; analiza și decizia noastră apar separat.
