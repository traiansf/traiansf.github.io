# Arhiva fotografică — raționament de referință

Analiză a profesorului, derivată din [regulile scenariului](brief.md). Nu este un răspuns capturat de la un agent AI.

Fotografia are identitate stabilă și legendă modificabilă. Versiunea are identitate proprie, conținut păstrat și apartenență la exact o fotografie. Originalul este rolul unicei versiuni create la catalogare; nu impune o clasă separată. Legenda nu identifică fotografia și nu aparține fiecărei versiuni.

| Relație | Restricție |
|---|---|
| Fotografie–versiune | O fotografie are cel puțin o versiune; o versiune aparține exact unei fotografii. |
| Fotografie–original | Exact unul per fotografie, păstrat. |
| Versiune–sursă | Originalul nu are sursă; fiecare derivată are exact una, existentă anterior și din aceeași fotografie. |
| Sursă–derivate directe | Zero sau mai multe: R4 permite reeditarea oricărei versiuni existente. |

S1 modifică numai legenda lui F1; păstrează toate identitățile și F2. S2 pornește din nou din situația inițială, cu legenda „Curte”: adaugă V3 în F1, cu sursa V1, fără să suprascrie V1. Fotografia are încă o versiune, iar V1 este acum sursă; se păstrează identitățile, legenda, conținutul și relațiile existente. S3 continuă S2 și adaugă V4 tot din V1, fără a transforma sursa în V3. S4 este inadmisibil: V5 pentru F2 nu poate avea sursa V1 din F1. Pentru S5 nu există o politică de import repetat; egalitatea fișierelor nu stabilește un rezultat. R6 delimitează exercițiul, fără a interzice acele funcții într-un produs real.

Pentru fiecare fotografie, pornim cu un original și adăugăm fiecare derivată cu o singură sursă existentă, păstrând legăturile anterioare. Relațiile de sursă formează astfel un arbore cu rădăcina în original. Întreaga arhivă poate avea mai mulți arbori, câte unul per fotografie. Un graf orientat fără cicluri poate permite și o derivată cu două surse, ceea ce R4 exclude. Nu cerem studenților o demonstrație formală sau terminologie suplimentară de grafuri: este suficient contraexemplul V6 cu sursele V3 și V4, ambele având sursa V1. Săgețile „are sursa” pleacă din derivată spre versiunea anterioară.

Referințele între obiecte și înregistrările legate prin identificatori sunt reprezentări posibile ale aceluiași model. O reprezentare nu garantează singură regulile: de exemplu, simpla existență a unui câmp opțional de sursă nu impune unicul original și apartenența comună. Algoritmii de validare, baza de date și responsabilitățile software se discută ulterior, când există o sarcină de implementare.

## Discuția capturilor

Analistul AI 02 descrie corect identitățile, cardinalitățile și exemplele S1–S4, apoi generalizează nejustificat la „orice orice configurație DAG”. Păstrăm partea susținută de reguli și corectăm generalizarea. Nu pretindem că întregul răspuns este greșit.

Evaluatorul AI 03 observă ramurile și faptul că un DAG poate avea mai mulți părinți. Proiectăm doar observația despre DAG și o verificăm prin R4, comparând sursa comună a lui V3 și V4 cu cele două surse propuse pentru V6. În răspunsul integral, observația despre „doi copaci independenți” nu răspunde unei afirmații explicite a analistului AI, iar citatul din analiză este inexact. Cererile despre mecanisme de garantare a unicității și ștergere depășesc nivelul sarcinii: unicitatea trebuie exprimată în model, iar implementarea și ștergerea nu sunt cerute. Formula sa despre restricția „pe întreg arhiva” nu înlocuiește regula precisă „exact un original pentru fiecare fotografie”.

Rularea analistului AI 01 este o alternativă cu relațiile corect exprimate; o păstrăm pentru comparație. Niciuna dintre aceste selecții nu este o estimare a frecvenței erorilor modelului. Proveniența completă este în [arhiva capturilor](captures/2026-10-10/README.md).
