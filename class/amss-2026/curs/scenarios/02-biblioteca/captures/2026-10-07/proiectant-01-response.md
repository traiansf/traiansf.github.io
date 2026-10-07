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