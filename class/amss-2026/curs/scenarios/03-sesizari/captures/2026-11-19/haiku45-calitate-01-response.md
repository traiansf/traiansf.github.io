# Cerințe de calitate pentru versiunea 1

**CQ1 — Înregistrare validă**
La transmiterea unei sesizări cu locul și descrierea ambele completate, sistemul creează o înregistrare cu identificator unic și o afișează în starea „înregistrată". La omiterea unuia dintre câmpuri, afișează eroarea specifică și nu creează sesizarea.
Măsurare: 100% dintre sesizările complete sunt create cu identificator; 0% dintre sesizările incomplete sunt acceptate; eroarea se afișează în max 1 secundă.
Condiții: rol student autentificat; transmitere conform R1.

**CQ2 — Acces controlat — student**
Studentul vizualizează numai propriile sesizări. Modificarea stării prin interfață, URL sau API este respinsă imediat fără schimbare.
Măsurare: 100% dintre sesizările vizibile sunt propriile sesizări; 0% modificări de stare acceptate; răspunsul de respingere apare în max 1 secundă.
Condiții: rol student; portofoliu mixt cu sesizări proprii și ale altor utilizatori.

**CQ3 — Acces controlat — administrație**
Administrația vizualizează toate sesizările. Tranzițiile valide (înregistrată→în lucru, în lucru→rezolvată) sunt acceptate. Orice altă tranziție, inclusiv reafirmarea stării curente, este respinsă cu motiv, fără schimbare.
Măsurare: 100% dintre sesizările sistemului sunt vizibile; 100% din tranzițiile valide sunt aplicate în max 1 secundă; 100% din tranzițiile invalide sunt respinse cu mesaj.
Condiții: rol administrație; sesizări în toate stările; teste de tranziție valide și invalide.

**CQ4 — Independență sesizări**
Crearea sau actualizarea unei sesizări nu afectează alte sesizări, chiar dacă descriu aceeași defecțiune.
Măsurare: După 1.000 de operații pe sesizări diferite, 100% dintre sesizările neafectate păstrează identificatorul și starea anterioară.
Condiții: identificatori distincți; operații paralele.

**CQ5 — Performanță de consultare (Q1)**
Consultarea sesizărilor proprii de student sub încărcare maximă afișează starea corectă și complet.
Măsurare: Cu 10.000 sesizări în sistem și 20 consultări simultane, minimum 950 din 1.000 consultări valide afișează starea corectă în maxim 2 secunde; 0 erori de acces neautorizat; 100% dintre sesizările returnate sunt ale utilizatorului.
Condiții: 20 utilizatori simultani; fiecare cu 50 sesizări în portofoliu; bază de date cu 10.000 înregistrări; măsurare din acțiunea de consultare la afișare completă.

**CQ6 — Corectitudine sub concurență**
Actualizări simultane ale stării aceleași sesizări rezultă în stare validă și consistentă.
Măsurare: 0 stări invalide; 100% consistență după operații concurente.
Condiții: 2+ cereri de schimbare de stare în paralel pe aceeași sesizare.