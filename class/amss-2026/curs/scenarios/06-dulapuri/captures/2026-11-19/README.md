# Capturi AI — verificarea circulară, dulapuri (Cursul 6), 19 noiembrie 2026

Instrument: Claude Code 2.1.328, `claude -p --model claude-haiku-4-5 --safe-mode`, fără unelte, fără contextul proiectului, fără sesiuni salvate (vezi `argv` în metadate). `capture.py` este o copie a celui din `../2026-10-27/`; fiecare încercare pornește un context nou, iar scriptul refuză suprascrierea unei încercări. Temperatura nu este raportată; efortul nu a fost setat explicit. Metadatele păstrează ora UTC, hash-urile intrărilor și ieșirilor, costul și modelul raportat de instrument (`claude-haiku-4-5` la toate încercările). Răspunsurile nu au fost modificate.

Lecția (decizia din 19 noiembrie 2026, `docs/ai-lessons-and-lab-diagrams.md`): un contract sau niște teste scrise după cod descriu ce face codul, cu tot cu defect.

## Intrări

| Fișier | Conținut | SHA-256 |
|---|---|---|
| `din-cod-prompt.md` | cererea A: `din-cod-instructiune.md` + `context-cod.md` (unicitatea, contextul R1 pe scurt, pseudocodul greșit al cursului, B; fără R3–R5) | `39add36fa9c8fde7d38a40472a5ee1d79fa2cd86526e940743cb1778e4b21d95` |
| `din-enunt-prompt.md` | cererea B: `din-enunt-instructiune.md` + `context-enunt.md` (regulile R1–R5 și B din enunț; fără scenarii și fără pseudocod) | `807a2b03df33e939ff16106fad3c56c2f956cfcc62788b0ecf37556665464d8c` |

Hash-urile contextelor și al enunțului la data pregătirii sunt în `context-circular-metadata.json`. Prompturile nu s-au schimbat între încercări.

## Încercări

| Încercare | Prompt | Durată, cost | Rezultat |
|---|---|---|---|
| `haiku45-din-cod-01` | A | 13 s, 0,018 USD | Condiția de succes: numai d liber după eliminare; refuzul „lasă registrul identic” (fals pentru cod la `atribuie(V1,D2)`); testele mută V1 pe D3 și cer `atribuit` la `atribuie(V1,D1)`; nu testează `atribuie(V1,D2)`. |
| `haiku45-din-cod-02` | A | 23 s, 0,023 USD | **Selectat.** Condiția de succes: d liber „la momentul verificării”; refuzul elimină asocierea anterioară a lui v; toate cele cinci teste trec pe cod, inclusiv `atribuie(V1,D2)` → `refuz`, {V2–D2}. Testul 5 pornește din alt registru decât B. |
| `haiku45-din-cod-03` | A | 24 s, 0,030 USD | Refuzul „lasă registrul neschimbat”; testul 4 cere `refuz` cu B la `atribuie(V1,D2)`, deci ar pica pe cod, deși testul 3 cere mutarea lui V1. |
| `haiku45-din-cod-04` | A | 12 s, 0,018 USD | Ca 01: refuzul „neschimbat”, mutarea și `atribuie(V1,D1)` → `atribuit`; nu testează `atribuie(V1,D2)`. |
| `haiku45-din-enunt-01` | B | 14 s, 0,019 USD | Corect față de R3: condiția de succes completă; testele 2 și 4 cer `refuz` cu B. |
| `haiku45-din-enunt-02` | B | 14 s, 0,018 USD | **Selectat.** Corect față de R3: „reușește dacă și numai dacă v nu are dulap ȘI d este liber”; testele 2 (`atribuie(V1,D3)`) și 4 (`atribuie(V1,D2)`) cer `refuz`, „B (neschimbat)”. |

Total: șase încercări, aproximativ 0,125 USD.

## Selecție

Am căutat o încercare A în care contractul și testele să descrie operația greșită cu tot cu defect, astfel încât testele să treacă pe cod: încercarea 02 este singura dintre cele patru care scrie și pierderea asocierii la refuz. Toate patru omit „v nu are dulap” din condiția de succes și cer mutarea lui V1 pe D3 (contrar R3); celelalte trei afirmă însă că refuzul lasă registrul identic, ceea ce codul nu face, iar 03 are un test care ar pica pe cod. Selecția nu descrie comportamentul tipic al modelului. Cele două încercări B sunt la fel de corecte; am ales 02 pentru formularea explicită a condiției de succes și pentru „B (neschimbat)” la testele care pică pe cod.

Pe slide-uri apar fragmente fidele, cu omisiunile marcate: din 02-A condiția de succes, postcondiția refuzului și testele 3 și 4 integral; din 02-B condiția de succes și rândurile testelor 2 și 4. Comparația și decizia noastră apar separat.

**Cererea B, înlocuită pe slide-uri (19 noiembrie 2026):** după redenumirea `fara_dulap` → `fără_dulap` din R4, cererea B a fost rulată din nou; slide-ul „Contractul scris din reguli” folosește acum seria `../2026-11-19b/`. Cererea A, al cărei context nu conține R4, rămâne cea de aici.
