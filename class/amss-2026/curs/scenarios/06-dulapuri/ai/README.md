# Pregătirea analizei și revizuirii AI — dulapuri

Acest dosar conține **prompturi pregătite, nu capturi AI**. Nu a fost executată o analiză sau o revizuire pentru acest enunț. Exemplele din prezentare sunt construite didactic și etichetate ca atare.

`analist-prompt.md` reunește instrucțiunea și enunțul fără soluția de referință. `context.md` este contextul furnizat, cu versiunea identificată prin hash în `context-metadata.json`.

După obținerea unui răspuns real, transmiteți într-un context nou instrucțiunea de mai jos, contextul, instrucțiunea exactă de analiză și răspunsul integral:

> Ești evaluator (agent AI de revizuire). Verifică propunerea exclusiv față de enunț și sarcină. Pentru fiecare observație indică fragmentul, regula și un scenariu concret. Verifică precondițiile, condițiile de succes, fiecare rezultat, efectul limitat și invarianții. Confirmă și afirmațiile corecte; nu presupune că trebuie să existe greșeli. Nu scrie cod. Răspunde în română, în maximum 350 de cuvinte.

Păstrați în `../captures/<data>/` prompturile exacte, versiunea contextului, răspunsurile integrale și metadatele efective, inclusiv toate încercările. Alegeți fragmente numai după verificare și consemnați motivul selecției. La curs se proiectează materiale pregătite; nu se rulează instrumente live.
