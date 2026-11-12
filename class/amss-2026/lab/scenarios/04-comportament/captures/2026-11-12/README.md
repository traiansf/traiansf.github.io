# Capturi AI — ghișeul de echipamente (Laboratorul 4), 12 noiembrie 2026

Instrument: Claude Code 2.1.322, `claude -p --model claude-haiku-4-5 --safe-mode`, fără unelte, fără contextul proiectului, fără sesiuni salvate (vezi `argv` în metadate). Fiecare încercare pornește un context nou. Temperatura nu este raportată; efortul nu a fost setat explicit. Metadatele păstrează ora UTC, hash-urile intrărilor și ieșirilor, costul și modelul raportat de instrument.

`analist-prompt.md` = `analist-instructiune.md` + `context.md` (copii ale fișierelor pregătite din `../../ai/`; hash-ul enunțului în `context-metadata.json`, calculat pe textul cu terminatori LF). `evaluator-prompt.md` = `evaluator-instructiune.md` + context + sarcina analistului AI + răspunsul integral selectat; hash-urile și motivul selecției sunt în `evaluator-input-metadata.json`. `capture.py` refuză suprascrierea unei încercări. Cheia `status: prepared_not_executed` din `context-metadata.json` este moștenită de la pregătire și nu descrie rularea. Enunțul trimis (`context.md`) coincide cu versiunea inițială din 12 noiembrie 2026 a `../../scenario.md`; enunțul curent corectează starea Ridicată și numește rezervările A și B, iar titularii T1 și T2, fără modificarea capturilor (vezi `../../ai/README.md`).

| Încercare | Rezultat |
|---|---|
| `haiku45-analist-01` | Răspuns (24 s, claude-haiku-4-5). **Selectat.** |
| `haiku45-analist-02` | Răspuns (20 s, claude-haiku-4-5). |
| `haiku45-evaluator-01` | Răspuns (25 s, claude-haiku-4-5). |
| `haiku45-evaluator-02` | Răspuns (43 s, claude-haiku-4-5). **Selectat.** |

## Selecție

Analiza 01 calculează corect S2, S4 și S7 și descrie corect interacțiunea (tranziția înaintea apelului expeditorului, reîncercarea deosebită după rezultatul notificării), dar tabelul de tranziții pune reîncercarea în Rezervată, unde identificatorul nu poate fi înregistrat, și refuză orice `ridica` în Ridicată, contrazicând propriul calcul al lui S4 și R5; adaugă presupuneri despre expeditor care nu sunt în enunț („nu are memorie de cereri”, „sincron sau asincron”). Analiza 02 are aceeași așezare greșită a rândului de reîncercare, fără contradicția cu S4, și scenarii corecte; păstrată, nefolosită.

Revizuirea 02 observă că rândul reîncercării („handler separat”) este vag, cere explicitarea refuzului în tabelul interacțiunii și a cazului `esec` repetat, confirmă „idempotența”, dar nu confruntă rândul „Ridicată | ridica | refuz” cu S4 și nu observă starea greșită a rândului. Revizuirea 01 declară propunerea „corectă și completă” și confirmă inclusiv presupunerile suplimentare; păstrată, nefolosită.

Am căutat câte o pereche care să susțină discuția despre starea în care sosește o reîncercare și despre confruntarea tabelului cu scenariile, nu un eșec anume. Selecția nu descrie performanța tipică a modelului. Fragmentele de pe slide-uri sunt fidele, cu omisiunile marcate; analiza și decizia noastră apar separat.
