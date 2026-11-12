# Pregătirea analizei și revizuirii AI — înscrieri

**Prompturi pregătite.** Pe baza lor s-au obținut la 12 noiembrie 2026 capturi reale Claude Haiku 4.5, folosite pe slide-uri; vezi [arhiva capturilor](../captures/2026-11-12/README.md). Fișierele de aici rămân sursa pentru capturi noi.

`analist-prompt.md` reunește instrucțiunea (`analist-instructiune.md`) și enunțul fără soluția de referință. `context.md` este contextul furnizat, cu versiunea identificată prin hash în `context-metadata.json`.

După obținerea unui răspuns real, transmiteți într-un context nou instrucțiunea din `evaluator-instructiune.md`, contextul, instrucțiunea exactă de analiză și răspunsul integral:

> Ești evaluator (agent AI de revizuire). Verifică propunerea exclusiv față de enunț și sarcină. Pentru fiecare observație indică fragmentul, regula și un scenariu concret, cu starea de pornire și rezultatul așteptat. Verifică ordinea pașilor, momentul înregistrării înscrierii față de apelul expeditorului, tratarea răspunsului esec, reîncercarea, consumul locurilor, responsabilitățile și presupunerile despre expeditor. Confirmă și afirmațiile corecte; nu presupune că trebuie să existe greșeli. Nu scrie cod. Răspunde în română, în maximum 350 de cuvinte.

Păstrați în `../captures/<data>/` prompturile exacte, versiunea contextului, răspunsurile integrale și metadatele efective, inclusiv toate încercările. Alegeți fragmente numai după verificare și consemnați motivul selecției. La curs se proiectează materiale pregătite; nu se rulează instrumente live.
