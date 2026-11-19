# Capturi AI — verificarea circulară, dulapuri (Cursul 6), 19 noiembrie 2026, cererea B din nou

A doua serie din aceeași zi, numai pentru cererea B (contractul și testele din reguli). R4 numește acum rezultatul eliberării fără asociere `fără_dulap` (cu diacritice), nu `fara_dulap`; contextul cererii B conține R4, deci cererea a fost rulată din nou. Contextul cererii A (`context-cod.md`) nu conține R4 și nu s-a schimbat; capturile A și prima serie B rămân neschimbate în `../2026-11-19/`.

Instrument: Claude Code 2.1.328, `claude -p --model claude-haiku-4-5 --safe-mode`, fără unelte, fără contextul proiectului, fără sesiuni salvate (vezi `argv` în metadate); `capture.py` este copia neschimbată a celui din `../2026-11-19/`. Fiecare încercare pornește un context nou. Temperatura nu este raportată; efortul nu a fost setat explicit. Răspunsurile nu au fost modificate.

## Intrări

| Fișier | Conținut | SHA-256 |
|---|---|---|
| `din-enunt-prompt.md` | cererea B: `din-enunt-instructiune.md` (neschimbată) + `context-enunt.md` (regulile R1–R5 și B din enunț, cu `fără_dulap`; fără scenarii și fără pseudocod) | `c31b8ed4321644e620a623d1c6bc208fab55f06ffe3d57e353797d23c9b05e27` |

Hash-urile contextelor și al enunțului sunt în `context-circular-metadata.json`. Promptul nu s-a schimbat între încercări.

## Încercări

| Încercare | Durată, cost | Rezultat |
|---|---|---|
| `haiku45-din-enunt-01` | 17 s, 0,021 USD | **Selectat.** „reușește dacă și numai dacă: vizitatorul v nu are dulap … ȘI dulapul d este liber”; refuzul lasă registrul identic; testele 2 (`atribuie(V1,D3)`) și 4 (`atribuie(V1,D2)`) cer `refuz`, „✓ neschimbat”. |
| `haiku45-din-enunt-02` | 14 s, 0,019 USD | Corect față de R3; condiția de succes este repetată și printre precondiții; `atribuie(V1,D3)` și `atribuie(V1,D2)` (testul 5) cer `refuz` cu B. |
| `haiku45-din-enunt-03` | 15 s, 0,020 USD | Corect față de R3, cu aceeași repetare printre precondiții; `atribuie(V1,D3)` cere `refuz` cu B; nu testează `atribuie(V1,D2)`. |

## Selecție

Am ales 01 pentru că reproduce exact ce arăta slide-ul înainte de redenumire: condiția de succes completă și testele 2 și 4, care pică pe operația greșită (la `atribuie(V1,D3)` operația întoarce `atribuit`; la `atribuie(V1,D2)` întoarce `refuz`, dar pierde V1–D1). Toate trei încercările sunt corecte față de R3. Pe slide apar fragmente fidele: condiția de succes și testele 2 și 4, integral.
