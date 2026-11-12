# Pregătirea demonstrației AI comune — ghișeul de echipamente

**Prompturi pregătite.** Pe baza lor s-au obținut la 12 noiembrie 2026 capturi reale Claude Haiku 4.5, folosite pe slide-uri; vezi [arhiva capturilor](../captures/2026-11-12/README.md). Fișierele de aici păstrează intrarea istorică, anterioară corectării stării Ridicată; nu le folosim nemodificate la o rulare nouă. Enunțul trimis atunci numea rezervările R1 și R2, iar studenții S1 și S2; enunțul curent folosește A și B, respectiv T1 și T2, ca să nu se confunde cu etichetele regulilor și scenariilor.

## Analiză

Pentru o rulare nouă, reuniți `analist-instructiune.md` cu [enunțul curent](../scenario.md); `analist-prompt.md` păstrează promptul istoric. `context.md` și hash-ul lui din `context-metadata.json` identifică versiunea pregătită. Nu adăugați soluția din referință. Cereți studenților predicția pentru S4 (reîncercare după eșec) înainte să afișați răspunsul.

## Revizuire

Deschideți un context nou, cu același enunț, sarcina analistului AI și propunerea integrală, folosind instrucțiunea din `evaluator-instructiune.md`:

> Ești evaluator (agent AI de revizuire). Verifică propunerea față de enunț și sarcina de analiză. Pentru fiecare observație indică fragmentul, regula relevantă și un scenariu cu starea de pornire și rezultatul așteptat. Verifică tranzițiile și condițiile, evenimentele refuzate, ordinea pașilor interacțiunii, tratarea răspunsului esec, reîncercarea și presupunerile despre expeditor. Confirmă și afirmațiile corecte. Nu presupune un număr de greșeli și nu scrie cod. Răspunde în română, în maximum 350 de cuvinte.

Salvați promptul efectiv cu propunerea inclusă înainte de rulare, apoi răspunsul integral. Înregistrați data, instrumentul, modelul declarat și setările cunoscute; nu inventați metadate care nu sunt disponibile. Pentru capturi pregătite creați un dosar datat în `../captures/`, păstrând toate încercările și motivul selecției.

## Fără rulare live

Folosiți [capturile pregătite](../prepared-fixture.md): răspunsuri reale Claude Haiku 4.5, cu fragmente fidele și sursa lor. Regulile rezumate rămân pe ecran, alături de fragmentul analizat. Nu distribuiți încercări separate studenților dacă instrumentul profesorului nu funcționează.

Pentru o analiză nouă, reuniți `analist-instructiune.md` cu [enunțul curent](../scenario.md). Furnizați evaluatorului AI exact aceeași versiune, sarcina și răspunsul integral. Salvați noul prompt și noul hash separat; nu suprascrieți metadatele capturilor existente.
