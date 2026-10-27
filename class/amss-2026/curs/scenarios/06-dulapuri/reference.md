# Raționament de referință — dulapuri

Analiză de pregătire pentru [enunț](brief.md), nu captură AI.

## Contractul operației publice

Notăm registrul de dinainte cu A și pe cel de după cu A'. A este o mulțime de perechi (vizitator, dulap). R2 impune unicitatea pe ambele poziții. Invariantul trebuie să fie adevărat în starea inițială și la fiecare întoarcere a operațiilor; nu pretindem că orice instrucțiune internă intermediară păstrează o reprezentare stabilă.

Precondiții: identificatori cunoscuți, registru valid, apeluri seriale (R1). Acestea delimitează promisiunea exercițiului. Dacă o precondiție nu este îndeplinită, acest contract nu specifică rezultatul; nu deducem nici refuz sigur, nici permisiunea de a corupe un produs real. O extindere poate specifica explicit identificatorii necunoscuți.

Pentru `atribuie(v,d)`, condiția de succes este ca v să nu aibă dulap în A, iar d să fie liber în A. Dacă ea este adevărată, rezultatul este `atribuit`, iar A' = A ∪ {(v,d)}. Altfel, rezultatul este `refuz`, iar A' = A. Ecuațiile includ efectul limitat: nicio asociere străină nu se pierde. Un apel pentru un dulap ocupat satisface R1 și primește un refuz convenit; nu este o încălcare de precondiție.

Pentru `elibereaza(v)`, dacă (v,d) aparține lui A, rezultatul este `eliberat`, iar A' = A fără acea pereche. În absența unei asemenea perechi, rezultatul este `fara_dulap` și A' = A. R2 face perechea unică. Repetarea are același efect asupra registrului, dar **nu același rezultat întors**.

## Contraexemple

O operație construită didactic elimină mai întâi asocierea veche a vizitatorului, apoi verifică dacă dulapul cerut este ocupat. În S4 întoarce `refuz`, dar produce {V2–D2}. Invarianții R2 rămân adevărați; garanția R3 de păstrare a întregii stări este încălcată. În S3 ar putea înlocui asocierea V1–D1 cu V1–D3, deși atribuirea nu are această funcție. Soluția de proiectare este să decidă succesul înainte de modificare, în limitele apelurilor seriale; nu pretindem că aceasta rezolvă concurența sau erorile de stocare.

Un contract care spune doar „V3 are D3 după S1” permite ștergerea asocierii V2–D2. R5 o interzice. Verificăm atât asocierea vizată, cât și registrul complet. Un invariant singur nu precizează efectul unei operații.

## Justificarea conservării

Asocierea unui vizitator fără dulap cu un dulap liber păstrează unicitatea. Eliminarea unei perechi nu introduce duplicate. Ramurile fără modificări păstrează un registru deja valid. Acesta este un argument despre modelul propus; exemplele finite îl ilustrează, fără a verifica automat orice implementare.

## Transfer

Pentru împrumutul unei singure truse de către fiecare tehnician, ideea de unicitate se poate transfera dacă noul enunț o cere. Exercițiul de pe slide stabilește alt rezultat la repetarea aceluiași împrumut: deja_imprumutat, fără modificări, în locul refuzului muzeului. Conflictele cu alte împrumuturi produc refuz fără modificări. Politica se citește din noul enunț; nu se importă automat din muzeu.
