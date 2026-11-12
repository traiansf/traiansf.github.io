# Capturi AI — manuscrise (Cursul 7), 12 noiembrie 2026

Instrument: Claude Code 2.1.322, `claude -p --model claude-haiku-4-5 --safe-mode`, fără unelte, fără contextul proiectului, fără sesiuni salvate (vezi `argv` în metadate). Fiecare încercare pornește un context nou. Temperatura nu este raportată; efortul nu a fost setat explicit. Metadatele păstrează ora UTC, hash-urile intrărilor și ieșirilor, costul și modelul raportat de instrument.

`analist-prompt.md` = `analist-instructiune.md` + `context.md` (copii ale fișierelor pregătite din `../../ai/`; hash-ul enunțului în `context-metadata.json`, calculat pe textul cu terminatori LF). `evaluator-prompt.md` = `evaluator-instructiune.md` + context + sarcina analistului AI + răspunsul integral selectat; hash-urile și motivul selecției sunt în `evaluator-input-metadata.json`. `capture.py` refuză suprascrierea unei încercări. Cheia `status: prepared_not_executed` din `context-metadata.json` este moștenită de la pregătire și nu descrie rularea. Enunțul trimis (`context.md`) coincide cu versiunea inițială din 12 noiembrie 2026 a `../../brief.md`; enunțul curent a fost retușat ulterior, fără modificarea capturilor (vezi `../../ai/README.md`).

| Încercare | Rezultat |
|---|---|
| `haiku45-analist-01` | Răspuns (25 s, claude-haiku-4-5). **Selectat.** |
| `haiku45-analist-02` | Răspuns (25 s, claude-haiku-4-5). |
| `haiku45-evaluator-01` | Răspuns (40 s, claude-haiku-4-5). **Selectat.** |
| `haiku45-evaluator-02` | Răspuns (24 s, claude-haiku-4-5). |

## Selecție

Analiza 01 dă tabelul de tranziții corect, cu efectele și datele păstrate, și verifică corect S1–S7; în încheiere răspunde „NU” la accesibilitatea lui Acceptat dintr-o ciornă nouă, citind „accesibil” ca „într-un singur pas”, deși propria trasare S1 ajunge în Acceptat. Analiza 02 are tabel și scenarii la fel de corecte și aceeași lectură, formulată mai prudent („nu este accesibil direct”); păstrată, nefolosită.

Revizuirea 01 declară propunerea „corectă și completă”, confirmă S1 ca lanț valid și confirmă „NU” ca argument „riguros”, fără să le confrunte. Revizuirea 02 confirmă la fel întreaga propunere („nu sunt observații de corectat”); păstrată, nefolosită.

Am căutat câte o pereche care să susțină discuția despre accesibilitate și despre confruntarea verificărilor cu concluziile, nu un eșec anume. Selecția nu descrie performanța tipică a modelului. Fragmentele de pe slide-uri sunt fidele, cu omisiunile marcate; analiza și decizia noastră apar separat.
