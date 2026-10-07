Răspunde în română, numai prin text; nu folosi instrumente.

# Sistem informatic pentru bibliotecă — enunț pentru pregătirea Cursului 2

Sursă pentru profesor și pentru contextul transmis agentului AI. Nu este o fișă de distribuit studenților. Enunțul, regulile, scenariile și exercițiile necesare la curs apar în prezentarea principală `../../02-intelegere.md`; studenții lucrează pe coli albe, fără calculator. La actualizare, păstrați aceleași reguli și aceleași stări inițiale în ambele surse.

## Mai întâi: cererea beneficiarului

Biblioteca este beneficiarul sistemului informatic. Bibliotecarul o reprezintă și ne prezintă cererea:

„Avem nevoie de un sistem informatic pentru gestionarea împrumuturilor și returnărilor de cărți. Membrii ar trebui să poată și depune o cerere de împrumut pentru o carte atunci când aceasta este împrumutată.”

Înainte de a consulta un asistent AI:

1. Scrieți două întrebări ale căror răspunsuri ar putea schimba proiectarea.
2. Descrieți o situație concretă de împrumut.
3. Numiți un lucru pe care l-ați exclude din prima versiune.

Alegeți una dintre întrebările formulate și explicați cum ar putea răspunsul beneficiarului să influențeze proiectarea. Faceți acest lucru înainte de a citi clarificările de mai jos.

## Reguli clarificate pentru acest exercițiu

Regulile sunt precizări ale bibliotecarului care reprezintă beneficiarul fictiv. Ele definesc acest exemplu, nu toate bibliotecile.

- **R1 — Identitate.** Titlurile, exemplarele și membrii au identificatori distincți. Un titlu poate avea mai multe exemplare; fiecare exemplar aparține unui titlu. Catalogul și membrii există deja. Un exemplar este disponibil dacă nu are nici împrumut activ, nici rezervare activă.
- **R2 — Împrumut.** Pentru un exemplar și un membru cunoscuți, se acceptă împrumutul dacă exemplarul este disponibil sau rezervat chiar acelui membru. Se creează un împrumut nou care leagă exemplarul de membru; cel mult unul activ pe exemplar. La ridicarea exemplarului rezervat se încheie rezervarea și cererea este îndeplinită. Dacă exemplarul este împrumutat sau rezervat altcuiva, operația se respinge fără modificarea stării.
- **R3 — Returnare.** Se închide împrumutul activ și se păstrează în istoric. În aceeași operație, exemplarul este rezervat primei cereri în așteptare pentru titlul său, conform R5; dacă nu există una, devine disponibil. Fără împrumut activ, returnarea se respinge fără modificarea stării.
- **R4 — Cerere de împrumut.** Un membru cunoscut cere un titlu cunoscut, fără a alege exemplarul. Se acceptă cererea numai dacă nu există exemplare disponibile ale titlului și nici o cerere neîncheiată a aceluiași membru pentru el. Se înregistrează membrul, titlul și ordinea depunerii; cererea intră în așteptare. Cererile în așteptare sau cu exemplar rezervat sunt neîncheiate. Duplicatul și cererea pentru un titlu cu exemplar disponibil se resping fără modificarea stării. După îndeplinirea unei cereri, o nouă cerere este posibilă dacă respectă aceste condiții.
- **R5 — Ordinea și rezervarea.** Cererile în așteptare pentru fiecare titlu sunt servite în ordinea înregistrării. Fiecare exemplar returnat este alocat primei cereri încă în așteptare și rezervat solicitantului. Cererea reține exemplarul alocat și nu mai participă la alocarea altuia. Un exemplar are cel mult o rezervare activă; o cerere are cel mult un exemplar rezervat. Rezervarea activă și împrumutul activ nu coexistă pe același exemplar. Doar solicitantul poate ridica exemplarul (R2).
- **R6 — Delimitare.** Sunt incluse împrumutul, returnarea, cererea de împrumut, ordinea de așteptare, rezervarea la returnare și ridicarea care îndeplinește cererea. Identificatorii sunt cunoscuți și toate operațiile se procesează pe rând; ordinea procesării cererilor stabilește prioritatea. Expirarea/anularea cererilor și rezervărilor, notificările, amenzile, prelungirile, autentificarea și modificarea catalogului sunt excluse. În exercițiu, rezervarea rămâne până la ridicare. Aceste limite trebuie reanalizate pentru un serviciu complet.

## Întrebări pentru proiectare

- De ce cererea privește titlul, dar rezervarea și împrumutul privesc exemplarul?
- Cine verifică dreptul de a ridica exemplarul rezervat?
- Ce se schimbă la returnare și la ridicare? Ce păstrează o respingere?
- Cum deosebim o cerere care încă așteaptă alocarea de una care are un exemplar rezervat?
- Ce ar trebui decis pentru expirarea sau anularea unei rezervări?

Sunt suficiente un glosar, un tabel, o schiță sau pseudocod. Nu se cere o aplicație sau o anumită diagramă.

## Situații concrete de verificat

**Stare inițială:** titlul T are exemplarele C1 și C2 disponibile; membrii M1, M2, M3 și M4 există; niciun împrumut, nicio cerere de împrumut, nicio rezervare.

**S1 — Două exemplare.** Din starea inițială, M1 împrumută C1; C2 rămâne disponibil.

**S2–S6 pornesc fiecare independent din starea de după S1**, fără cereri sau rezervări. Nu se execută unul după altul.

**S2 — Cerere, rezervare, ridicare.** M3 împrumută C2; M2 depune o cerere de împrumut pentru T. Cererea este acceptată, deoarece nu mai există exemplare disponibile. M1 returnează C1: împrumutul său se închide și C1 este rezervat lui M2. M3 încearcă să împrumute C1: operația se respinge fără modificări. M2 ridică C1: apare un împrumut nou, rezervarea încetează și cererea este îndeplinită. C2 rămâne împrumutat lui M3.

**S3 — Împrumut repetat.** M2 încearcă să împrumute C1. Operația este respinsă, iar împrumutul lui M1 rămâne neschimbat.

**S4 — Returnare și istoric.** M1 returnează C1. Împrumutul închis rămâne în istoric, iar C1 devine disponibil, deoarece nu există cereri în așteptare. A doua returnare se respinge fără modificări. M2 împrumută C1: apare o înregistrare nouă, distinctă de împrumutul închis.

**S5 — Disponibilitate și duplicat.** M2 depune o cerere pentru T cât C2 este disponibil: cererea se respinge fără modificări. M3 împrumută C2. M2 depune o cerere pentru T, apoi o repetă. Se acceptă doar prima dintre aceste două cereri; a doua se respinge fără a o modifica. La final, ambele exemplare sunt împrumutate și o singură cerere M2/T este în așteptare.

**S6 — Ordinea alocării.** M3 împrumută C2. M2 depune o cerere pentru T, apoi M4 depune una. M3 returnează C2: acesta este rezervat lui M2. M1 returnează C1: acesta este rezervat lui M4, deoarece cererea lui M2 are deja un exemplar. M4 poate ridica C1 înainte ca M2 să vină; cererea lui M4 se îndeplinește și rezervarea lui M2 rămâne. Ordinea depunerii stabilește alocarea, nu ordinea ridicării.

## Exercițiu de încheiere

Fără AI, explicați distincția titlu–exemplar, ce verificăm înainte de împrumutul unui exemplar care poate fi rezervat și ce justificare cereți înainte de a accepta o constatare dintr-o revizuire.


## Proiectarea de examinat

Proiectarea separă **titlul**, pe care îl solicită membrul, de **exemplarul fizic**, care se împrumută sau se rezervă. Cele trei operații sunt împrumutul, returnarea și depunerea cererii; ridicarea unui exemplar rezervat este un caz al împrumutului.

**Concepte și responsabilități**

| Concept | Rol și informații necesare |
|---|---|
| Titlu | Identificator propriu; grupează exemplarele aceleiași cărți. |
| Exemplar | Identificator propriu; aparține unui singur titlu. |
| Membru | Identificator propriu; poate avea împrumuturi și cereri. |
| Împrumut | Înregistrare distinctă care leagă membrul de exemplar; activă sau închisă. Împrumuturile închise rămân în istoric. |
| Cerere de împrumut | Leagă membrul de titlu și păstrează ordinea depunerii; este în așteptare, cu exemplar rezervat sau îndeplinită. |
| Rezervare | Alocă un exemplar unei cereri și solicitantului ei; rămâne activă până la ridicare. |

Disponibilitatea exemplarului se determină din absența unui împrumut activ și a unei rezervări active (R1). Cererea privește titlul deoarece membrul solicită cartea, fără să aleagă copia fizică; alocarea identifică ulterior exemplarul.

**Cele trei operații**

| Operație | Verificări și rezultat la succes | Respingere |
|---|---|---|
| Împrumut | Pentru membrul și exemplarul cunoscuți, verifică disponibilitatea sau existența unei rezervări pentru acel membru. Creează un împrumut nou. La ridicarea exemplarului rezervat, încheie rezervarea și îndeplinește cererea (R2). | Dacă exemplarul este împrumutat sau rezervat altcuiva, păstrează întreaga stare. |
| Returnare | Verifică existența împrumutului activ, îl închide și îl păstrează în istoric. În aceeași operație, alocă exemplarul primei cereri în așteptare pentru titlu; în lipsa ei, exemplarul devine disponibil (R3, R5). | Fără împrumut activ, păstrează întreaga stare. |
| Depunere cerere | Pentru membrul și titlul cunoscuți, verifică absența exemplarelor disponibile și a unei cereri neîncheiate a aceluiași membru pentru titlu. Înregistrează cererea în așteptare și ordinea depunerii (R4). | Dacă există un exemplar disponibil sau un duplicat neîncheiat, păstrează întreaga stare. |

Operația de împrumut verifică dreptul solicitantului de a ridica exemplarul rezervat; simpla existență a rezervării nu permite împrumutul către alt membru.

Cererile sunt alocate în ordinea înregistrării, separat pentru fiecare titlu. O cerere cu exemplar rezervat nu mai participă la alocări. Ordinea ridicării poate fi diferită de ordinea alocării (R5).

Se păstrează permanent următoarele condiții:

- Cel mult un împrumut activ și cel mult o rezervare activă pe exemplar; acestea nu coexistă.
- Cel mult un exemplar rezervat pentru fiecare cerere.
- Cel mult o cerere neîncheiată pentru aceeași pereche membru–titlu.
- O cerere îndeplinită permite ulterior o cerere nouă, dacă sunt îndeplinite condițiile R4.

**Verificarea scenariilor**

S1 pornește din starea inițială. S2–S6 pornesc fiecare independent după S1: C1 este împrumutat lui M1, C2 este disponibil și nu există cereri sau rezervări.

| Scenariu | Decizie și stare rezultată | Reguli |
|---|---|---|
| S1 | Împrumutul C1 către M1 este acceptat. C2 rămâne disponibil. | R1, R2 |
| S2 | M3 împrumută C2; cererea M2/T este acceptată. Returnarea C1 închide împrumutul lui M1 și rezervă C1 lui M2. Încercarea lui M3 asupra C1 este respinsă fără modificări. Ridicarea de către M2 creează un împrumut nou, încheie rezervarea și îndeplinește cererea. C2 rămâne la M3. | R2–R5 |
| S3 | Împrumutul C1 către M2 este respins; împrumutul activ al lui M1 rămâne neschimbat. | R2 |
| S4 | Prima returnare închide împrumutul și face C1 disponibil. A doua este respinsă fără modificări. Împrumutul ulterior către M2 creează o înregistrare nouă; cea închisă rămâne în istoric. | R2, R3 |
| S5 | Prima cerere este respinsă deoarece C2 este disponibil. După împrumutarea C2 către M3, cererea M2/T este acceptată; repetarea ei este respinsă. La final există două împrumuturi active și o singură cerere în așteptare. | R2, R4 |
| S6 | După împrumutarea C2, se acceptă cererile M2/T și M4/T, în această ordine. Returnarea C2 îl rezervă lui M2; returnarea C1 îl rezervă lui M4. M4 poate ridica primul C1, fără să afecteze rezervarea lui M2. | R2–R5 |

**Cerințe, alegeri și întrebări deschise**

Cerințele sunt regulile R1–R6: identități distincte, condițiile de acceptare, istoric, prioritatea cererilor și păstrarea stării la respingere. Operațiile se procesează pe rând.

Alegerile acestei proiectări sunt reprezentarea explicită a celor trei stări ale cererii, folosirea unui număr de ordine pentru depunere și calcularea disponibilității din împrumuturi și rezervări. Fiecare operație aplică împreună toate schimbările sale, pentru a păstra condițiile de mai sus.

Pentru un serviciu complet rămân deschise politica de expirare sau anulare, realocarea exemplarului eliberat și eventualele limite de împrumut. Acestea nu se introduc în exercițiu. Conform R6, sunt excluse și notificările, amenzile, prelungirile, autentificarea și modificarea catalogului.

Etapei următoare i se pot preda glosarul, relațiile dintre concepte, stările și tranzițiile, condițiile celor trei operații și S1–S6 drept criterii de acceptare. Orice constatare de revizuire trebuie justificată printr-o regulă și o situație concretă care arată încălcarea ei. Soluția acoperă domeniul delimitat de R6; presupune identificatori cunoscuți, procesare secvențială și rezervări care rămân active până la ridicare.

## Sarcina

Revizuiește proiectarea față de regulile și scenariile date, fără să o modifici.

Pentru fiecare constatare, indică afirmația vizată, regula și un scenariu sau o altă justificare verificabilă.

Distinge defectele de alternativele de proiectare și de întrebările despre extinderi. Nu adăuga cerințe excluse prin R6. Dacă nu găsești defecte, precizează ce ai verificat și limitele revizuirii.
