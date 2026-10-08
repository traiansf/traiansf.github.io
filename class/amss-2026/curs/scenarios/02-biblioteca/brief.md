# Sistem informatic pentru bibliotecă — enunț pentru pregătirea Cursului 2

Sursă pentru profesor și pentru contextul transmis agentului AI. Nu este o fișă de distribuit studenților. Enunțul, regulile, scenariile și exercițiile necesare la curs apar în prezentarea principală `../../02-intelegere.md`; studenții lucrează pe coli albe, fără calculator. La actualizare, păstrați aceleași reguli și aceleași stări inițiale în ambele surse.

## Mai întâi: cererea bibliotecarei

Biblioteca este beneficiarul sistemului informatic. Bibliotecara o reprezintă și ne prezintă cererea:

„Avem nevoie de un sistem informatic pentru gestionarea împrumuturilor și returnărilor de cărți. Membrii ar trebui să poată și depune o cerere de împrumut pentru o carte atunci când aceasta este împrumutată.”

Înainte de a consulta un asistent AI:

1. Scrieți două întrebări ale căror răspunsuri ar putea schimba proiectarea.
2. Descrieți o situație concretă de împrumut.
3. Numiți un lucru pe care l-ați exclude din prima versiune.

Alegeți una dintre întrebările formulate și explicați cum ar putea răspunsul bibliotecarei să influențeze proiectarea. Faceți acest lucru înainte de a citi clarificările de mai jos.

## Reguli clarificate pentru acest exercițiu

Regulile sunt precizări ale bibliotecarei care reprezintă biblioteca fictivă. Ele definesc acest exemplu, nu toate bibliotecile.

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
