# Pregătirea analizei și revizuirii AI — dulapuri

**Prompturi pregătite.** Pe baza lor s-au obținut la 27 octombrie 2026 capturi reale Claude Haiku 4.5, folosite pe slide-uri; vezi [arhiva capturilor](../captures/2026-10-27/README.md). Fișierele de aici rămân sursa pentru o rulare live sau pentru capturi noi.

`analist-prompt.md` reunește instrucțiunea și enunțul fără soluția de referință. `context.md` este contextul furnizat, cu versiunea identificată prin hash în `context-metadata.json`.

După obținerea unui răspuns real, transmiteți într-un context nou instrucțiunea de mai jos, contextul, instrucțiunea exactă de analiză și răspunsul integral:

> Ești evaluator (agent AI de revizuire). Verifică propunerea exclusiv față de enunț și sarcină. Pentru fiecare observație indică fragmentul, regula și un scenariu concret. Verifică precondițiile, condițiile de succes, fiecare rezultat, efectul limitat și invarianții. Confirmă și afirmațiile corecte; nu presupune că trebuie să existe greșeli. Nu scrie cod. Răspunde în română, în maximum 350 de cuvinte.

Păstrați în `../captures/<data>/` prompturile exacte, versiunea contextului, răspunsurile integrale și metadatele efective, inclusiv toate încercările. Alegeți fragmente numai după verificare și consemnați motivul selecției. La curs se proiectează materiale pregătite; nu se rulează instrumente live.

## Verificarea circulară — 19 noiembrie 2026

De la 19 noiembrie 2026, segmentul AI al cursului predă verificarea circulară (vezi `docs/ai-lessons-and-lab-diagrams.md`); prompturile analistului și evaluatorului de mai sus rămân pentru arhiva din 27 octombrie 2026.

- `din-cod-prompt.md` = `din-cod-instructiune.md` + `context-cod.md`: cererea A, contractul și cinci teste pentru operația `atribuie` greșită din etapa 55–80 a cursului (elimină întâi asocierea veche a vizitatorului, apoi refuză dacă dulapul este ocupat). Contextul dă unicitatea, contextul R1 pe scurt și B, dar **nu** R3–R5.
- `din-enunt-prompt.md` = `din-enunt-instructiune.md` + `context-enunt.md`: cererea B, aceeași instrucțiune, „din regulile de mai jos”, cu regulile R1–R5 și B din enunț, fără tabelul scenariilor (care ar da rezultatele așteptate) și fără pseudocod.
- `context-circular-metadata.json`: hash-urile contextelor și prompturilor și hash-ul enunțului la data pregătirii.

Fiecare cerere se trimite într-un context nou, cu `capture.py`. Capturile și motivul selecției sunt în [`../captures/2026-11-19/`](../captures/2026-11-19/README.md).
