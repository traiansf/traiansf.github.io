# Pregătirea analizei și revizuirii AI — manuscrise

**Prompturi pregătite.** Pe baza lor s-au obținut la 12 noiembrie 2026 capturi reale Claude Haiku 4.5, folosite pe slide-uri; vezi [arhiva capturilor](../captures/2026-11-12/README.md). Fișierele de aici rămân sursa pentru capturi noi.

`analist-prompt.md` reunește instrucțiunea (`analist-instructiune.md`) și enunțul fără soluția de referință. `context.md` este contextul furnizat, cu versiunea identificată prin hash în `context-metadata.json`.

După obținerea unui răspuns real, transmiteți într-un context nou instrucțiunea din `evaluator-instructiune.md`, contextul, instrucțiunea exactă de analiză și răspunsul integral:

> Ești evaluator (agent AI de revizuire). Verifică propunerea exclusiv față de enunț și sarcină. Pentru fiecare observație indică fragmentul, regula și un scenariu concret, cu starea de pornire și rezultatul așteptat. Verifică fiecare rând al tabelului de tranziții, condițiile, efectele, evenimentele refuzate, datele păstrate, stările finale intenționate și accesibilitatea lui Acceptat. Confirmă și afirmațiile corecte; nu presupune că trebuie să existe greșeli. Nu scrie cod. Răspunde în română, în maximum 350 de cuvinte.

Păstrați în `../captures/<data>/` prompturile exacte, versiunea contextului, răspunsurile integrale și metadatele efective, inclusiv toate încercările. Alegeți fragmente numai după verificare și consemnați motivul selecției. La curs se proiectează materiale pregătite; nu se rulează instrumente live.

Observație pentru capturi viitoare: ambele analize și ambele revizuiri din 12 noiembrie 2026 au citit „accesibil” ca „într-un singur pas”. Dacă se dorește evitarea acestei lecturi, enunțul poate defini termenul; capturile actuale păstrează enunțul trimis atunci.
