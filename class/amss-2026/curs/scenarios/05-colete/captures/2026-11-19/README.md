# Capturi AI reale — 19 noiembrie 2026: delegare separată pe canale

Lecția AI a cursului 5, conform deciziei din 19 noiembrie 2026 (`docs/ai-lessons-and-lab-diagrams.md`): **delegarea separată diverge**. Câte o sesiune nouă a scris funcția fiecărui canal (site în JavaScript, ghișeu în Python) din aceleași reguli; apoi, în alte sesiuni noi, funcțiile selectate au primit schimbarea C1 (limita plicului). Capturile din [27 octombrie 2026](../2026-10-27/README.md) rămân neschimbate.

## Intrări

- [Contextul](context-reguli.md): R1–R6 din [enunțul curent](../../brief.md), fără scenariile S1–S5, fără C1 și fără sarcina de proiectare (care numește operația comună). R1 este reformulată: „Valorile interpretate se verifică conform R2–R3” în loc de „Operația verifică valorile primite…”, ca să nu sugereze o componentă comună; R5 nu mai trimite la R6.
- Site: [`site-instructiune.md`](site-instructiune.md), prompt complet [`site-prompt.md`](site-prompt.md).
- Ghișeu: [`ghiseu-instructiune.md`](ghiseu-instructiune.md), prompt complet [`ghiseu-prompt.md`](ghiseu-prompt.md).
- C1: [`c1-instructiune.md`](c1-instructiune.md) + contextul + blocul de cod, literal, din răspunsul canalului: [`c1-site-03-prompt.md`](c1-site-03-prompt.md), [`c1-ghiseu-01-prompt.md`](c1-ghiseu-01-prompt.md), [`c1-ghiseu-02-prompt.md`](c1-ghiseu-02-prompt.md). Instrucțiunea spune „un plic este acceptat acum până la 1500 g inclusiv. Celelalte reguli rămân neschimbate.”, fără să numească pragul de preț.

| Fișier | SHA-256 |
|---|---|
| `context-reguli.md` | `501c1d87cbf9f20d71a13cd729ed7df72cc508a0f37e51e2374473f1a713d2c7` |
| `site-prompt.md` | `f3c95d2d64b56069b878ff2e7356155facf21d74dca6420d9d9f3c16c8e51a7d` |
| `ghiseu-prompt.md` | `20caec715aaa0127aee376b7c0f43952848af2b485faa84b86622c2e8d720a49` |
| `c1-site-03-prompt.md` | `9225ce89ab4a2d85638bba19a81b875285d93632fa819fb0d02a62552beccc5f` |
| `c1-ghiseu-01-prompt.md` | `5ace3b2e1412ec12f94aecfa0bd14b3392fbd52e90afee66908cc0963e5b8395` |
| `c1-ghiseu-02-prompt.md` | `21e74024b96e469ebe08bedfd27eca4bc5e4f6d8a17efcd3bb274f9dc6dfc170` |

`capture.py` este copia nemodificată a celui din 27 octombrie 2026: Claude Code 2.1.328, `claude -p --model claude-haiku-4-5 --safe-mode`, fără unelte, MCP, setări sau sesiuni salvate; fiecare rulare pornește un context nou într-un director temporar gol. Modelul raportat: `claude-haiku-4-5`. Temperatura nu este raportată; efortul nu a fost setat.

## Execuția codului, înainte de curs

[`ruleaza-scenarii.py`](ruleaza-scenarii.py) extrage blocul de cod din fiecare răspuns, nemodificat, și îl rulează (Node.js 24.19.0, Python 3.10.11) pe aceleași intrări, trimise ca text: S1–S5, plicul de 1500 g, „1000,5”, „1000 g”, „1000.0” și „Plic” de 500 g. Rezultatul este [`scenarii-executie.md`](scenarii-executie.md). Ghișeul 02 și 03 așteaptă o masă numerică: pe text, Python ridică `TypeError`; asta arată doar că acele funcții nu interpretează textul. Pentru ghișeul 02 și sesiunile lui C1 am verificat separat, cu mase numerice, că plicurile de 1200 și 1500 g costă 18 lei după C1.

## Toate încercările

Costul total: 0,42 USD pentru 23 de rulări, toate reușite.

| Rulări | Rezultat pe S1–S5 | Diferențe observate |
|---|---|---|
| [site-01](haiku45-site-01-response.md) | corect | normalizează „Plic”; cere corectarea textelor neîntregi |
| [site-02](haiku45-site-02-response.md), [site-04](haiku45-site-04-response.md), [site-05](haiku45-site-05-response.md) | corect | cer corectarea textelor neîntregi; refuză „Plic” |
| [**site-03**](haiku45-site-03-response.md) | corect | `parseInt`: „1000,5”, „1000 g”, „1000.0” → 10 lei; refuză „Plic”. **Pe slide-uri.** |
| [site-06](haiku45-site-06-response.md) | corect | `Number`: „1000.0” → 10 lei; refuză „Plic” |
| [**ghiseu-01**](haiku45-ghiseu-01-response.md) | corect | `int(text)`: cere corectarea; normalizează „Plic” → 10 lei. **Pe slide-uri.** |
| [ghiseu-02](haiku45-ghiseu-02-response.md) | corect (mase numerice) | nu interpretează textul; normalizează „Plic”; în ramura plicului scrie `pret = 10`. **Pe slide-ul C1.** |
| [ghiseu-03](haiku45-ghiseu-03-response.md) | corect (mase numerice) | nu interpretează textul; verifică ambalajul înaintea masei |
| [ghiseu-04](haiku45-ghiseu-04-response.md), [ghiseu-05](haiku45-ghiseu-05-response.md), [ghiseu-06](haiku45-ghiseu-06-response.md) | corect | `int(...)`; refuză „Plic” |
| [c1-site-03-01…04](haiku45-c1-site-03-01-response.md) | corect după C1 | schimbă numai limita plicului; „1000,5” rămâne 10 lei |
| [c1-ghiseu-01-01…03](haiku45-c1-ghiseu-01-01-response.md) | corect după C1 | schimbă numai limita plicului |
| [c1-ghiseu-02-01](haiku45-c1-ghiseu-02-01-response.md), 02, 04 | corect după C1 | rescriu `pret = 10` ca `10 if masa <= 1000 else 18`. **01 pe slide-ul C1.** |
| [c1-ghiseu-02-03](haiku45-c1-ghiseu-02-03-response.md) | corect după C1 | mută calculul prețului după ramurile ambalajului |

## Selecție

Toate cele douăsprezece funcții dau aceleași rezultate pe scenariile S1–S5 (inclusiv plicul de 1000 g și cel de 1001 g); C1 a fost aplicată corect în toate cele unsprezece sesiuni. Divergența apare la intrări pe care niciun scenariu nu le fixează: textul neîntreg și majuscula ambalajului. Am ales perechea site-03 / ghișeu-01 pentru că diferă în ambele sensuri: „1000,5” acceptat pe site, refuzat la ghișeu; „Plic” refuzat pe site, acceptat la ghișeu. **Selecția nu este tipică:** numai site-03 acceptă „1000,5”; patru din șase funcții ale site-ului cer corectarea. Ghișeul 02 apare pe slide-ul C1 pentru că este singura funcție în care prețul plicului depindea de limita plicului (`pret = 10` în ramura plicului), exact confuzia limită/prag din curs; sesiunea C1 a corectat-o.

Rularea codului este o verificare făcută de noi, nu parte a răspunsurilor AI; slide-ul o etichetează astfel. Fragmentele de cod de pe slide-uri sunt literale, cu omisiunile marcate (`// […]`, `# […]`, `[…]` în șiruri), iar analiza și decizia noastră apar separat.
