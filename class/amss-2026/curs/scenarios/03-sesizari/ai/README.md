# Prompturi pregătite — sesizări în campus (Cursul 3)

**Lecția AI a cursului (decizie din 19 noiembrie 2026):** precizia inventată. Numerele, pragurile și țintele de calitate par să aibă o sursă, dar nu au; „specific” nu înseamnă „confirmat”. Agentul AI primește enunțul cu R1–R4 și Q1 și o cerere obișnuită de cerințe de calitate măsurabile. Studenții urmăresc fiecare număr din răspuns până la o regulă a enunțului sau îl marchează nesusținut.

| Fișier | Conținut |
|---|---|
| `context.md` | Secțiunile „Cererea inițială” și „Limite și reguli convenite” din [enunț](../brief.md), copiate integral (R1–R4, Q1, excluderile); fără scenariile discutate și fără soluția profesorului. |
| `calitate-instructiune.md` | Instrucțiunea, citată integral pe slide. |
| `calitate-prompt.md` | Promptul trimis: o propoziție de introducere, `context.md` și instrucțiunea. |
| `context-metadata.json` | Amprenta enunțului la momentul capturii și amprentele contextului și prompturilor. |

Capturile reale din 19 noiembrie 2026 sunt în [`../captures/2026-11-19/`](../captures/2026-11-19/README.md); copiile de acolo sunt intrarea efectivă și au aceleași amprente.

Capturile din 10 octombrie 2026 (`../captures/2026-10-10/`: cerere inițială, analist, evaluator) rămân arhivate neschimbat, cu prompturile lor. Segmentul AI al cursului nu le mai folosește din 19 noiembrie 2026, cu excepția slide-ului „Ce știm și ce rămâne de convenit?”, care citează în continuare trei afirmații din `haiku45-initial-02-response.md` și arată promptul inițial.

Pentru o rulare nouă: regenerați `context.md` din enunțul curent dacă acesta s-a schimbat, salvați noul prompt cu noua amprentă, copiați-l împreună cu `capture.py` într-un dosar nou `../captures/<data>/` și rulați `python capture.py <identificator> calitate-prompt.md`. Păstrați toate încercările și motivul selecției. La curs se proiectează materiale pregătite; nu se rulează instrumente live.
