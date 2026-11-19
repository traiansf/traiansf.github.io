# Prompturi pregătite — estimarea prețului coletelor

**Lecția AI din 19 noiembrie 2026: delegarea separată diverge.** Fiecare canal este delegat unei sesiuni noi a asistentului AI, cu aceleași reguli:

- `context-reguli.md`: R1–R6 din [enunț](../brief.md), fără S1–S5, C1 și sarcina de proiectare; R1 nu mai numește „operația”.
- `site-instructiune.md`: funcția formularului web, în JavaScript; `site-prompt.md` = instrucțiunea, linia `CONTEXT`, contextul.
- `ghiseu-instructiune.md`: funcția aplicației ghișeului, în Python; `ghiseu-prompt.md` la fel.
- `c1-instructiune.md`: schimbarea C1 (plic până la 1500 g inclusiv) trimisă unei sesiuni noi, cu regulile și funcția unui canal; `c1-site-03-prompt.md`, `c1-ghiseu-01-prompt.md`, `c1-ghiseu-02-prompt.md` conțin funcțiile capturate, copiate literal din răspunsuri.

Capturile reale Claude Haiku 4.5, execuția codului pe aceleași intrări, hash-urile, toate încercările și motivul selecției sunt în [`../captures/2026-11-19/`](../captures/2026-11-19/README.md). Fișierele de aici sunt intrarea istorică; nu le suprascrieți.

**Prompturile mai vechi** (analist AI și evaluator, 27 octombrie 2026) rămân în [`../captures/2026-10-27/`](../captures/2026-10-27/README.md); prezentarea nu le mai folosește.

Pentru o rulare nouă: aceeași intrare, în contexte noi, de mai multe ori dacă este nevoie; păstrați toate încercările și notați selecția. La curs nu se rulează nimic live.
