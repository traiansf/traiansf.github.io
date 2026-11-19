# Pregătirea secțiunii AI — înscrieri

## Garanțiile la graniță (de la 19 noiembrie 2026)

Lecția AI a cursului, după decizia din 19 noiembrie 2026: **garanții pe care nu le oferă nimeni**. Studenții auditează afirmațiile unui text generat: pentru fiecare garanție, cine o oferă (registrul, site-ul, expeditorul sau nimeni) și ce regulă a enunțului o susține.

`context-garantii.md` este enunțul curent (`../brief.md`, regulile R1–R7, starea inițială și scenariile, fără „Alegeri de proiectare” și „Sarcina de proiectare”) plus decizia B a cursului; hash-urile sunt în `context-garantii-metadata.json`. Trei instrucțiuni, fiecare urmată de context în fișierul `*-prompt.md` corespunzător:

- `nota-operare-instructiune.md`: notă de proiectare pentru echipa de operare, cu o secțiune „Garanții”;
- `garantii-instructiune.md`: interacțiunea și garanțiile pentru echipa de dezvoltare (consistența datelor, livrarea confirmărilor, repetarea cererilor);
- `promisiuni-instructiune.md`: paragraful „Ce vă garantăm la înscriere” pentru participanți, cu justificare tehnică.

Capturile reale (20 de rulări) și motivul selecției sunt în [arhiva din 19 noiembrie 2026](../captures/2026-11-19/README.md). Pentru capturi noi, păstrați aceleași fișiere sau salvați prompturi noi cu hash propriu, într-un dosar datat nou.

## Analiza și revizuirea din 12 noiembrie 2026 (arhivate, nefolosite pe slide-uri)

**Prompturi pregătite.** Pe baza lor s-au obținut la 12 noiembrie 2026 capturi reale Claude Haiku 4.5, folosite pe slide-uri până la 19 noiembrie 2026; vezi [arhiva capturilor](../captures/2026-11-12/README.md). Prompturile, contextul și hash-ul de aici păstrează intrarea istorică; nu includ corecțiile ulterioare ale enunțului.

`analist-prompt.md` reunește instrucțiunea (`analist-instructiune.md`) și enunțul fără soluția de referință. `context.md` este contextul furnizat, cu versiunea identificată prin hash în `context-metadata.json`.

După obținerea unui răspuns real, transmiteți într-un context nou instrucțiunea din `evaluator-instructiune.md`, contextul, instrucțiunea exactă de analiză și răspunsul integral:

> Ești evaluator (agent AI de revizuire). Verifică propunerea exclusiv față de enunț și sarcină. Pentru fiecare observație indică fragmentul, regula și un scenariu concret, cu starea de pornire și rezultatul așteptat. Verifică ordinea pașilor, momentul înregistrării înscrierii față de apelul expeditorului, tratarea răspunsului esec, reîncercarea, consumul locurilor, responsabilitățile și presupunerile despre expeditor. Confirmă și afirmațiile corecte; nu presupune că trebuie să existe greșeli. Nu scrie cod. Răspunde în română, în maximum 350 de cuvinte.

Păstrați în `../captures/<data>/` prompturile exacte, versiunea contextului, răspunsurile integrale și metadatele efective, inclusiv toate încercările. Alegeți fragmente numai după verificare și consemnați motivul selecției. La curs se proiectează materiale pregătite; nu se rulează instrumente live.

Pentru o analiză nouă, reuniți `analist-instructiune.md` cu [enunțul curent](../brief.md). Furnizați evaluatorului AI exact aceeași versiune, sarcina și răspunsul integral. Salvați noul prompt și noul hash separat; nu suprascrieți metadatele capturilor existente.

**Denumiri (19 noiembrie 2026, după capturi):** enunțul curent numește serviciul extern „mesageria” (serviciul de mesagerie), rezultatul lui de eșec `eșec expediție` și lasă numărul de locuri ca parametru în R1. Prompturile din acest dosar și capturile din 12 și 19 noiembrie 2026 folosesc denumirile anterioare („expeditor de confirmări”, `esec`, „2 locuri”) și rămân neschimbate; o rulare nouă pornește de la [enunțul curent](../brief.md).
