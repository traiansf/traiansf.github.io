# Prompturi pregătite — biblioteca (Cursul 2)

**Lecția AI a cursului (decizie din 19 noiembrie 2026):** agentul AI completează golurile pe care nu le-ați observat. Aceeași sarcină se trimite de două ori, în contexte noi: o dată numai cu solicitarea bibliotecarei, o dată cu solicitarea și regulile R1–R6. Studenții listează ce a hotărât agentul AI în locul bibliotecii.

| Fișier | Conținut |
|---|---|
| `instructiune.md` | Instrucțiunea comună, identică în ambele prompturi. |
| `cerere-simpla-prompt.md` | Promptul A: solicitarea bibliotecarei și instrucțiunea. |
| `cerere-cu-reguli-prompt.md` | Promptul B: solicitarea, propoziția „La întrebările noastre, bibliotecara a precizat regulile de mai jos.”, R1–R6 copiate integral din [enunț](../brief.md) și instrucțiunea. |
| `context-metadata.json` | Amprenta enunțului la momentul capturii și amprentele prompturilor. |

Capturile reale din 19 noiembrie 2026, obținute cu aceste prompturi, sunt în [`../captures/2026-11-19/`](../captures/2026-11-19/README.md); copiile prompturilor de acolo sunt intrarea efectivă și au aceleași amprente.

Capturile mai vechi folosesc alte prompturi, păstrate lângă răspunsuri: `../captures/2026-10-07/` (analist și evaluator, `gpt-6.1-sol`; folosite de vechiul segment AI al cursului, înlocuit la 19 noiembrie 2026) și `../captures/2026-10-09/` (conversația în trei mesaje despre titlu și exemplar, folosită în continuare în etapa „Revedem deciziile și sintetizăm”). Nu le modificați.

Pentru o rulare nouă: copiați promptul și `capture.py` într-un dosar nou `../captures/<data>/`, rulați `python capture.py <identificator> <fișier-prompt>` (Claude Code, `claude-haiku-4-5`, context nou, fără unelte) și păstrați toate încercările, cu motivul selecției. Dacă enunțul s-a schimbat, regenerați promptul B din enunțul curent și consemnați noua amprentă; nu suprascrieți metadatele capturilor existente. La curs se proiectează materiale pregătite; nu se rulează instrumente live.
