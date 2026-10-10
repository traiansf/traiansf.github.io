# Capturi AI reale — 10 octombrie 2026

Sunt păstrate **5 rulări reale**. Pe slide-uri apar analistul AI 02 și evaluatorul (agent AI de revizuire) 03. Scenariul este construit de profesor; răspunsurile sunt generate efectiv, fără intervenții în textul lor.

## Intrări și execuție

- [Contextul trimis](context.md) și [sursa la momentul capturării](source-at-capture.md); hashurile sunt în `context-metadata.json`.
- [Instrucțiunea analistului AI](analist-instructiune.md) și [promptul complet](analist-prompt.md).
- [Instrucțiunea finală de revizuire](evaluator-v2-instructiune.md) și [promptul complet](evaluator-v2-prompt.md), cu sarcina analistului AI și răspunsul său integral.
- `excerpts.json` mapează fragmentele fidele la slide-uri; restul răspunsurilor nu este proiectat. Elipsele marchează intervalele omise între două fragmente.

Fiecare rulare pornește Claude Code într-un director temporar gol, fără unelte, MCP, setări personale/de proiect sau persistența sesiunii. `capture.py` păstrează răspunsul integral, rezultatul JSON și metadatele; refuză suprascrierea încercărilor. Se folosește promptul de sistem implicit al CLI, care nu este exportat integral; nu pretindem că lipsește orice context de sistem. Model cerut și declarat: `claude-haiku-4-5`. Temperatura nu este raportată, efortul nu a fost setat explicit; versiunea CLI și argumentele exacte apar în fiecare fișier de metadate.

## Toate încercările

| Rulare | Prompt | Selecție |
|---|---|---|
| [haiku45-analist-01](haiku45-analist-01-response.md) | [analist-prompt.md](analist-prompt.md) | Păstrată pentru trasabilitate; nu este proiectată. |
| [haiku45-analist-02](haiku45-analist-02-response.md) | [analist-prompt.md](analist-prompt.md) | Fragment pe slide. |
| [haiku45-evaluator-01](haiku45-evaluator-01-response.md) | [evaluator-prompt.md](evaluator-prompt.md) | Păstrată pentru trasabilitate; nu este proiectată. |
| [haiku45-evaluator-02](haiku45-evaluator-02-response.md) | [evaluator-prompt.md](evaluator-prompt.md) | Păstrată pentru trasabilitate; nu este proiectată. |
| [haiku45-evaluator-03](haiku45-evaluator-03-response.md) | [evaluator-v2-prompt.md](evaluator-v2-prompt.md) | Fragment pe slide. |

## Schimbarea inputului și selecția

Primele revizuiri au primit instrucțiunea cu diacritice înlocuite accidental cu „?” la transferul prin shell. Contextul și răspunsul analizat au rămas intacte. Fișierele și rezultatele acestor încercări sunt păstrate nemodificate. Rularea finală folosește `evaluator-v2-prompt.md`: repară transmiterea instrucțiunii și include explicit sarcina analistului AI, necesară ca revizuirea să poată aprecia corect limitele cerute. Nu comparăm cele două versiuni ca experiment controlat asupra modelului.

Analistul AI 02 a fost ales pentru combinația dintre identități și exemple corecte și generalizarea nejustificată la „orice DAG”. Analistul AI 01 exprimă relațiile mai consecvent și rămâne o alternativă utilă. Evaluatorul AI 03 identifică ramurile și limita unui DAG general; interpretarea profesorului verifică observația prin R4. Primele două revizuiri mai conțin afirmații discutabile (de exemplu, evaluatorul AI 01 spune greșit că un DAG permite cicluri); nu le folosim pentru a introduce teme suplimentare.

Exemplele au fost selectate pentru discuție, fără prompturi care să ceară introducerea unor greșeli. Nu estimăm frecvența erorilor, nu evaluăm statistic modelul și nu garantăm repetarea aceluiași output. Analiza și corecțiile profesorului sunt separate de citatele AI.
