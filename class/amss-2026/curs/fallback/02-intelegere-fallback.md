---
title: "AMSS 2026/2027 — Cursul 2: Exercițiu pregătit de proiectare și revizuire"
subtitle: "Cerere de împrumut, rezervare și ridicare"
author: "Exemplu didactic pregătit"
lang: ro-RO
---

# Despre acest exemplu

Acesta este un **exemplu didactic pregătit**, nu un răspuns AI capturat.

Cererea de împrumut are un rezultat concret: rezervarea unui exemplar returnat și împrumutul la ridicare.

La curs, aceste reguli, scenarii și exemple sunt integrate în prezentarea principală. Această copie servește pregătirii profesorului.

::: notes
Sursa principală pentru predare este ../02-intelegere.md. Studenții folosesc doar prezentarea proiectată și coli albe. La actualizare, păstrați identice regulile și scenariile din aceste două prezentări și din ../scenarios/02-biblioteca/brief.md.
:::

---

# Ce precizează bibliotecarul: identitate

**R1 — Identitate**

- Fiecare titlu, exemplar și membru are un identificator distinct.
- Un titlu poate avea mai multe exemplare fizice; fiecare exemplar aparține unui singur titlu.
- Catalogul și evidența membrilor există deja.

Un exemplar este **disponibil** dacă nu este nici împrumutat, nici rezervat.

::: notes
Regulile R1–R6 sunt precizările beneficiarului pentru acest exercițiu, nu reguli universale ale bibliotecilor. Toate apar pe slide-uri; nu cereți studenților un document separat.
:::

---

# Ce precizează bibliotecarul: împrumut

**R2 — Împrumut**

- Se poate împrumuta un exemplar disponibil sau unul rezervat chiar membrului care îl ridică.
- Se creează un împrumut care leagă exemplarul de membru. Un exemplar are cel mult un împrumut activ.
- La ridicarea exemplarului rezervat, rezervarea încetează și cererea de împrumut este îndeplinită.
- Dacă exemplarul este împrumutat sau rezervat altcuiva, operația se respinge fără modificarea stării.

**Rezervarea păstrează exemplarul pentru membru; împrumutul începe la ridicare.**

---

# Ce precizează bibliotecarul: returnare

**R3 — Returnare**

- Returnarea închide împrumutul activ al exemplarului și păstrează istoricul.
- În aceeași operație, exemplarul este rezervat primei cereri în așteptare pentru titlul său, conform R5.
- Dacă nu există cereri în așteptare, exemplarul devine disponibil.
- Fără împrumut activ, returnarea se respinge fără modificarea stării.

Returnarea poate face exemplarul **rezervat**, nu neapărat disponibil.

---

# Ce precizează bibliotecarul: cerere de împrumut

**R4 — Cerere de împrumut**

- Membrul cere un **titlu**, fără să aleagă un exemplar.
- Cererea se acceptă numai dacă titlul nu are exemplare disponibile și membrul nu are deja o cerere neîncheiată pentru el.
- Se înregistrează membrul, titlul și ordinea depunerii; cererea intră în așteptare.
- O cerere în așteptare sau cu exemplar rezervat este **neîncheiată**. Duplicatul și cererea pentru un titlu disponibil se resping fără modificări.

Cererea dă prioritate la următorul exemplar returnat; nu este o căutare în catalog.

---

# Ce precizează bibliotecarul: rezervare

**R5 — Ordinea cererilor și rezervarea**

- Pentru fiecare titlu, cererile în așteptare sunt servite în ordinea înregistrării.
- Primul exemplar returnat este rezervat primei cereri în așteptare. Cererea reține acum exemplarul alocat.
- O cerere cu exemplar deja rezervat nu mai participă la alocarea următorului exemplar.
- Un exemplar are cel mult o rezervare activă și nu poate fi simultan împrumutat și rezervat.

Doar solicitantul poate ridica exemplarul rezervat; atunci cererea se încheie (R2).

---

# Și delimitarea funcționalității este o decizie

**R6 — Delimitare.** Includem:

- Împrumutul și returnarea, cu păstrarea istoricului.
- Cererea de împrumut, ordinea de așteptare și rezervarea la returnare.
- Ridicarea exemplarului rezervat și încheierea cererii.

Operațiile folosesc identificatori cunoscuți și se procesează **pe rând**, inclusiv înregistrarea cererilor.

Rămân în afara exercițiului: expirarea/anularea rezervărilor și cererilor, notificările, amenzile, prelungirile, autentificarea și modificarea catalogului.

::: notes
Cererea are un rezultat util complet: prioritate, exemplar rezervat, împrumut la ridicare. Ordinea procesării departajează cererile fără a cere ceasuri perfect sincronizate. Expirarea și notificările sunt importante pentru un serviciu real, dar nu sunt necesare pentru parcurgerea acestui flux. În limitele exercițiului, rezervarea rămâne până la ridicare. Nu pretindeți că acesta este un sistem complet de bibliotecă.
:::

---

# S1: un titlu, două exemplare

**Stare inițială:** T are C1 și C2 disponibile; membrii M1–M4 există; niciun împrumut, nicio cerere, nicio rezervare.

**S1:** M1 împrumută C1. C1 devine împrumutat lui M1; C2 rămâne disponibil.

**R1–R2:** exemplarele sunt distincte; împrumutul privește un exemplar.

S2–S6 pornesc fiecare **independent după S1**, nu unul după altul.

---

# S2: de la cerere la împrumut

**După S1:** C1 este la M1, C2 disponibil; fără cereri sau rezervări.

| Pas | Rezultat cerut |
|---|---|
| M3 împrumută C2; M2 cere împrumutul titlului T | Ambele exemplare împrumutate; cererea lui M2 așteaptă |
| M1 returnează C1 | Împrumut închis; C1 rezervat lui M2 |
| M3 încearcă să împrumute C1 | Respingere; rezervarea rămâne |
| M2 ridică C1 | Împrumut nou; cerere îndeplinită; rezervare încheiată |

**R4–R5:** cererea așteaptă un exemplar și primește primul returnat. **R2:** exemplarul rezervat poate fi ridicat doar de solicitant.

---

# Exercițiu: respingerea păstrează starea

După S1, C1 este împrumutat lui M1, C2 este disponibil; nu există cereri sau rezervări.

**Două ramuri independente, fiecare pornind după S1:**

- S3: M2 încearcă să împrumute C1. Ce se respinge și ce rămâne neschimbat?
- S4: C1 este returnat, apoi se încearcă o a doua returnare. Ce rămâne în istoric?

**R2:** împrumutul unui exemplar deja împrumutat se respinge fără modificarea împrumuturilor.

**R3:** returnarea închide împrumutul activ și păstrează istoricul; fără împrumut activ se respinge fără modificări.

Notați pe hârtie starea după fiecare pas și regula aplicată. Ce se înregistrează la un nou împrumut după returnare?

::: notes
Alocați aproximativ 4 minute aici, 2 minute pentru S5 și 3 minute pentru S6; restul intervalului acoperă parcurgerea S1–S2. Lăsați acest slide pe ecran. S3 și S4 pornesc independent după S1, nu după S2. Verificați starea înainte și după fiecare operație. În S4, un împrumut ulterior creează o înregistrare nouă. Întrebați și ce afirmații nu poate demonstra un singur scenariu. Acestea sunt observații introductive, nu tratarea aprofundată a contractelor din cursul 6.
:::

---

# Exercițiu: S5 — când acceptăm cererea?

**După S1:** C1 este la M1, C2 disponibil; fără cereri sau rezervări. M2 și M3 sunt membri cunoscuți.

1. M2 depune o cerere de împrumut pentru T.
2. M3 împrumută C2.
3. M2 depune o cerere de împrumut pentru T, apoi o repetă.

**R4:** acceptăm o cerere numai dacă nu există exemplare disponibile și nici altă cerere neîncheiată a aceluiași membru pentru titlu. Respingerea nu modifică starea.

Pe hârtie: ce se acceptă, ce se respinge și câte cereri rămân?

::: notes
Lăsați slide-ul pe ecran. Prima cerere se respinge: C2 este disponibil. După împrumutul lui C2 se acceptă o cerere M2/T; repetarea se respinge. La final, o singură cerere așteaptă. S5 pornește independent după S1.
:::

---

# Exercițiu: S6 — cine primește exemplarul?

**După S1:** C1 este la M1, C2 disponibil; fără cereri sau rezervări. M1–M4 sunt membri cunoscuți.

1. M3 împrumută C2.
2. M2 depune o cerere pentru împrumutul lui T, apoi M4 depune una.
3. M3 returnează C2, apoi M1 returnează C1.

**R5:** fiecare exemplar returnat merge la prima cerere încă în așteptare. O cerere care are deja un exemplar rezervat nu mai primește altul.

Pe hârtie: cui îi rezervăm fiecare exemplar? Poate M4 să-l ridice pe al său înainte de M2? **R2:** fiecare ridică exemplarul rezervat propriei cereri.

::: notes
Lăsați slide-ul pe ecran. C2 este rezervat lui M2, C1 lui M4; niciun împrumut nou până la ridicare. M4 poate ridica C1 înainte de M2: ordinea depunerii decide alocarea, nu ordinea venirii la bibliotecă. Această distincție pregătește exercițiul de revizuire. S6 pornește independent după S1.
:::

---

# Proiectare pregătită: găsiți limita reprezentării

| Concept | Informații propuse |
|---|---|
| Carte | Titlu; o singură stare: disponibilă / împrumutată / rezervată |
| Împrumut | Membru, titlu; activ / închis |
| Cerere de împrumut | Membru, titlu, ordine; în așteptare / rezervată / îndeplinită |

**Moment din S2:** C1 a fost returnat și rezervat lui M2; C2 este încă împrumutat lui M3.

**R1–R2:** împrumutul identifică exemplarul. **R5:** rezervarea leagă un exemplar de cerere; numai solicitantul îl poate ridica.

Pe hârtie: ce informație lipsește pentru a verifica ridicarea lui C1?

::: notes
Exemplu didactic pregătit, nu răspuns AI capturat. Păstrați slide-ul două minute. Lipsesc identitatea exemplarului în împrumut și legătura cerere–exemplar rezervat; o singură stare pe titlu nu distinge C1 rezervat de C2 împrumutat. Nu considerați defecte alte denumiri sau lipsa unei diagrame.
:::

---

# O corecție argumentată

| Concept | Informații păstrate |
|---|---|
| Titlu, exemplar, membru | Identități distincte; exemplarul aparține unui titlu |
| Împrumut | Membru, exemplar; activ/închis; istoric |
| Cerere de împrumut | Membru, titlu, ordine; în așteptare/cu exemplar rezervat/îndeplinită |
| Rezervare | Legătura dintre cerere și exemplarul alocat |

**Returnarea** închide împrumutul și alocă exemplarul primei cereri în așteptare (R3, R5).

**Ridicarea** verifică membrul, încheie rezervarea și cererea, creează împrumutul (R2).

::: notes
O proiectare de referință, nu singura reprezentare corectă. Rezervarea poate fi stocată separat sau prin exemplarul alocat cererii. Înregistrarea cererii verifică lipsa exemplarelor disponibile și unicitatea cererii neîncheiate, apoi îi atribuie ordinea (R4). Responsabilitățile pot fi realizate prin funcții, obiecte sau alte mecanisme.
:::

---

# Verificăm corecția: împrumut și returnare

**Inițial:** T are C1 și C2 disponibile; M1–M4 există; fără cereri, rezervări sau împrumuturi.

| Scenariu | Parcurgere și rezultat |
|---|---|
| S1, din starea inițială | M1 împrumută C1; C2 rămâne disponibil |
| S3, după S1 | M2 încearcă să împrumute C1; respingere, împrumutul lui M1 nemodificat |
| S4, după S1 | Returnăm C1: împrumut închis, păstrat; a doua returnare respinsă; reîmprumutul creează o înregistrare nouă |

S3 și S4 sunt ramuri independente. R2 împiedică împrumutul dublu; R3 păstrează istoricul.

---

# Verificăm corecția: cerere și rezervare

**Pornire pentru fiecare scenariu, independent:** C1 la M1, C2 disponibil; fără cereri sau rezervări.

- **S2:** M3 împrumută C2; M2 cere T; C1 returnat este rezervat lui M2. M3 este refuzat; M2 ridică C1 și încheie cererea.
- **S5:** cererea lui M2 este refuzată cât C2 e disponibil. După împrumutul lui C2 se acceptă o cerere M2/T, nu și duplicatul.
- **S6:** M3 împrumută C2; cereri M2/T, apoi M4/T. Returnăm C2, apoi C1: rezervări pentru M2, respectiv M4.

**R4–R5:** fără duplicate neîncheiate; alocare în ordinea cererilor. **R2:** ridicare numai de către solicitant.

::: notes
Acestea sunt parcurgeri ale proiectării, nu teste executate pe o aplicație. Pentru lucru pe hârtie, reveniți la slide-ul scenariului ales, cu datele și regula împreună pe ecran. În S6, M4 poate ridica C1 înainte de M2 fără să schimbe ordinea alocării.
:::

---

# Verificăm și revizuirea

**Afirmație pregătită a unui evaluator AI:** „Dacă M2 a depus cererea înaintea lui M4, M4 nu poate ridica niciun exemplar până nu vine M2.”

**R5:** ordinea cererilor decide alocarea; o cerere cu exemplar rezervat nu mai așteaptă alocarea altuia. **R2:** fiecare membru poate ridica propriul exemplar rezervat.

**S6:** C2 a fost rezervat lui M2, apoi C1 lui M4. M4 ajunge primul la bibliotecă și cere C1.

Pe hârtie: acceptați constatarea? Indicați regula și rezultatul corect al încercării lui M4.

::: notes
Afirmația este pregătită, nu o captură AI. Este nesusținută: ordinea alocării nu impune ordinea ridicării. M4 poate ridica C1; rezervarea lui M2 pe C2 rămâne. Lăsați slide-ul proiectat cât lucrează studenții. Contextul separat nu garantează corectitudinea evaluatorului AI. În laboratorul 1, studenții clasifică similar constatări, pe alt domeniu.
:::

---

# Decizia noastră asupra revizuirii

| Afirmație examinată | Justificare | Decizie |
|---|---|---|
| Lipsește exemplarul din împrumut și rezervare | R1–R2, R5; C1 rezervat și C2 împrumutat în S2 | Corectăm legăturile |
| M4 trebuie să aștepte ridicarea lui M2 | R2 și S6 permit ridicarea propriului exemplar | Respingem constatarea |

Ordinea **alocării** și ordinea **ridicării** nu sunt aceeași regulă.

**Următorul agent AI:** poate elabora planul pentru fluxul convenit. Expirarea, notificările, concurența și punerea în producție rămân de clarificat.

::: notes
Constatări pregătite pentru predare. Dacă folosiți un răspuns AI real și corect, cereți justificarea lui și discutați o posibilă expirare a rezervării; nu impuneți o cotă de defecte. Nu adăugați expirarea ca cerință deja convenită.
:::
