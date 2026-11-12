# Capturi AI — înscrieri (Cursul 8), 12 noiembrie 2026

Instrument: Claude Code 2.1.322, `claude -p --model claude-haiku-4-5 --safe-mode`, fără unelte, fără contextul proiectului, fără sesiuni salvate (vezi `argv` în metadate). Fiecare încercare pornește un context nou. Temperatura nu este raportată; efortul nu a fost setat explicit. Metadatele păstrează ora UTC, hash-urile intrărilor și ieșirilor, costul și modelul raportat de instrument.

`analist-prompt.md` = `analist-instructiune.md` + `context.md` (copii ale fișierelor pregătite din `../../ai/`; hash-ul enunțului în `context-metadata.json`, calculat pe textul cu terminatori LF). `evaluator-prompt.md` = `evaluator-instructiune.md` + context + sarcina analistului AI + răspunsul integral selectat; hash-urile și motivul selecției sunt în `evaluator-input-metadata.json`. `capture.py` refuză suprascrierea unei încercări. Cheia `status: prepared_not_executed` din `context-metadata.json` este moștenită de la pregătire și nu descrie rularea. Enunțul trimis (`context.md`) coincide cu versiunea inițială din 12 noiembrie 2026 a `../../brief.md`; enunțul curent a fost retușat ulterior, fără modificarea capturilor (vezi `../../ai/README.md`).

| Încercare | Rezultat |
|---|---|
| `haiku45-analist-01` | Răspuns (53 s, claude-haiku-4-5). **Selectat.** |
| `haiku45-analist-02` | Răspuns (30 s, claude-haiku-4-5). |
| `haiku45-evaluator-01` | Răspuns (27 s, claude-haiku-4-5). |
| `haiku45-evaluator-02` | Răspuns (28 s, claude-haiku-4-5). **Selectat.** |

## Selecție

Analiza 01 descrie pașii în ordinea cerută de R4 (locul consumat și înscrierea înregistrată, cu confirmarea „pendentă”, înaintea apelului expeditorului), deosebește reîncercarea și verifică corect S1–S6; adaugă un refuz neconvenit în enunț pentru o reîncercare cu alt participant sau atelier („pentru protecție”) și folosește termeni neglosați („atomicitate”). Analiza 02 are pașii ca tabel, cu înscrierea înregistrată abia după răspunsul expeditorului, și folosește „idempotență”, termen evitat în curs; păstrată, nefolosită.

Revizuirea 02 confirmă ordinea pașilor și reîncercarea, semnalează adăugirea de la pasul 5 ca „plauzibilă dar non-specificată”, observă o verificare redundantă și interpretarea „poate” → „va reapela” din R5, și lasă decizia oamenilor. Revizuirea 01 confirmă totul și numește adăugirea „validare defensivă rezonabilă”, cerând doar clarificare; păstrată, nefolosită.

Am căutat o pereche care să arate o propunere bună și o revizuire bună, cu o adăugire de decis de oameni, nu un eșec anume. Selecția nu descrie performanța tipică a modelului. Fragmentele de pe slide-uri sunt fidele, cu omisiunile marcate; analiza și decizia noastră apar separat.
