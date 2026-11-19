# Pregătirea analizei și revizuirii AI — manuscrise

**Prompturi pregătite.** Pe baza lor s-au obținut la 12 noiembrie 2026 capturi reale Claude Haiku 4.5, folosite pe slide-uri; vezi [arhiva capturilor](../captures/2026-11-12/README.md). Prompturile, contextul și hash-ul de aici păstrează intrarea istorică; nu includ corecțiile ulterioare ale enunțului.

`analist-prompt.md` reunește instrucțiunea (`analist-instructiune.md`) și enunțul fără soluția de referință. `context.md` este contextul furnizat, cu versiunea identificată prin hash în `context-metadata.json`.

După obținerea unui răspuns real, transmiteți într-un context nou instrucțiunea din `evaluator-instructiune.md`, contextul, instrucțiunea exactă de analiză și răspunsul integral:

> Ești evaluator (agent AI de revizuire). Verifică propunerea exclusiv față de enunț și sarcină. Pentru fiecare observație indică fragmentul, regula și un scenariu concret, cu starea de pornire și rezultatul așteptat. Verifică fiecare rând al tabelului de tranziții, condițiile, efectele, evenimentele refuzate, datele păstrate, stările finale intenționate și accesibilitatea lui Acceptat. Confirmă și afirmațiile corecte; nu presupune că trebuie să existe greșeli. Nu scrie cod. Răspunde în română, în maximum 350 de cuvinte.

Păstrați în `../captures/<data>/` prompturile exacte, versiunea contextului, răspunsurile integrale și metadatele efective, inclusiv toate încercările. Alegeți fragmente numai după verificare și consemnați motivul selecției. La curs se proiectează materiale pregătite; nu se rulează instrumente live.

Observație pentru capturi viitoare: ambele analize și ambele revizuiri din 12 noiembrie 2026 au citit „accesibil” ca „într-un singur pas”. Enunțul curent definește explicit termenul; capturile actuale păstrează enunțul trimis atunci.

Pentru o analiză nouă, reuniți `analist-instructiune.md` cu [enunțul curent](../brief.md). Furnizați evaluatorului AI exact aceeași versiune, sarcina și răspunsul integral. Salvați noul prompt și noul hash separat; nu suprascrieți metadatele capturilor existente.

## Diagrama de stări generată — 19 noiembrie 2026

De la 19 noiembrie 2026, segmentul AI al cursului predă că o diagramă randată nu este o diagramă corectă (vezi `docs/ai-lessons-and-lab-diagrams.md`); prompturile analistului și evaluatorului de mai sus rămân pentru arhiva din 12 noiembrie 2026.

`context-diagrama.md` este enunțul curent fără titlul de versiune și fără sarcina de proiectare (care cere tabelul de tranziții); hash-urile sunt în `context-diagrama-metadata.json`. Fiecare prompt `diagrama*-prompt.md` = instrucțiunea corespunzătoare + `context-diagrama.md`:

- `diagrama-instructiune.md`: diagrama de stări în Mermaid (stateDiagram-v2), cu stări, tranziții, evenimente și condiții;
- `diagrama-v2-instructiune.md`: în plus, cerința de randare fără erori, cu `state "Nume" as X` pentru nume cu spații sau diacritice (adăugată după ce primele cinci răspunsuri nu s-au randat);
- `diagrama-v3-instructiune.md`: etichete UML „eveniment [condiție] / efect asupra datelor”;
- `diagrama-v4-instructiune.md`: o diagramă „compactă”, cu permisiunea unei stări compuse; prompt folosit pe slide-uri.

Capturile și motivul selecției sunt în [`../captures/2026-11-19/`](../captures/2026-11-19/README.md).
