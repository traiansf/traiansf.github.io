# Terminal de bibliotecă — exercițiu pentru Cursul 2

## Mai întâi: cererea beneficiarului

„Avem nevoie de un terminal de bibliotecă. Membrii împrumută și returnează cărți. Ar trebui să poată și solicita o carte atunci când aceasta este împrumutată.”

Înainte de a consulta un asistent:

1. Scrieți două întrebări ale căror răspunsuri ar putea schimba proiectarea.
2. Descrieți o situație concretă de împrumut.
3. Numiți un lucru pe care l-ați lăsa în afara primei versiuni.

Explicați de ce contează unul dintre răspunsuri. Faceți acest lucru înainte de a citi clarificările de mai jos.

## Reguli clarificate pentru acest exercițiu

Aceste reguli sunt furnizate de beneficiarul fictiv. Ele definesc acest exemplu didactic, nu funcționarea bibliotecilor în general.

- **R1 — Identitate.** Un titlu poate avea mai multe exemplare fizice. Fiecare titlu, exemplar și membru are un identificator distinct. Fiecare exemplar aparține unui singur titlu. Catalogul și evidența membrilor există deja.
- **R2 — Împrumut.** Pentru un exemplar și un membru cunoscuți, împrumutul reușește dacă exemplarul nu are niciun împrumut activ. Se înregistrează un nou împrumut care leagă exemplarul de membru. Un exemplar are cel mult un împrumut activ. Încercarea de a împrumuta un exemplar deja împrumutat este respinsă fără modificarea împrumuturilor.
- **R3 — Returnare.** Returnarea unui exemplar cu un împrumut activ închide acel împrumut. Istoricul împrumuturilor se păstrează. Returnarea unui exemplar fără împrumut activ este respinsă fără modificarea împrumuturilor.
- **R4 — Solicitare.** Un membru cunoscut poate înregistra o solicitare pentru un titlu cunoscut. Solicitarea nu identifică un anumit exemplar. În această parte a sistemului se înregistrează cel mult o solicitare pentru fiecare pereche membru/titlu; duplicatele se resping fără modificarea solicitărilor.
- **R5 — Independență.** Solicitările pot exista indiferent dacă exemplarele sunt împrumutate sau disponibile. Înregistrarea unei solicitări nu rezervă un exemplar și nu împiedică alt membru să împrumute un exemplar disponibil. Returnarea unui exemplar nu șterge solicitările.
- **R6 — Delimitare.** Această parte a sistemului înregistrează împrumuturi, returnări și solicitări de titluri. Alocarea exemplarelor, prioritatea în coadă, satisfacerea/anularea solicitărilor, notificările, amenzile, prelungirile și autentificarea nu sunt incluse. În exercițiu, operațiile folosesc identificatori cunoscuți și sunt procesate pe rând. Un sistem mai amplu trebuie să reanalizeze explicit aceste limite.

## Întrebări pentru proiectare

- Ce concepte trebuie să rămână distincte și de ce?
- Cui îi revine responsabilitatea de a impune regula împrumutului activ?
- Ce garantează un împrumut reușit? Ce se întâmplă la respingere?
- Ce poate coexista: o solicitare pentru un titlu, un exemplar disponibil și un exemplar împrumutat?
- Ce ar trebui decis înainte de a extinde această parte într-un serviciu de bibliotecă mai complet?

Sunt suficiente un glosar, un tabel, o schiță sau puțin pseudocod. Diagrama de clase este opțională. Nu implementați o aplicație.

## Situații concrete de verificat

Starea inițială: titlul T are exemplarele C1 și C2; membrii M1, M2 și M3 există; nu există împrumuturi sau solicitări. S1 pornește din această stare. S2, S3 și S4 continuă independent starea de după S1; nu se execută unul după altul. S5 pornește din nou din starea inițială.

**S1 — Două exemplare.** Titlul T are exemplarele C1 și C2. Membrul M1 împrumută C1. C2 rămâne disponibil. Explicați cum reprezintă proiectarea această stare.

**S2 — O solicitare alături de un împrumut.** După S1, membrul M2 solicită T. Apoi M3 împrumută C2. Ambele operații trebuie să reușească potrivit R4–R5. Solicitarea continuă să existe.

**S3 — Același exemplar, din nou.** După S1, M2 încearcă să împrumute C1. Respingeți încercarea și păstrați împrumutul existent neschimbat.

**S4 — Păstrarea istoricului la returnare.** După S1, C1 este returnat. Vechiul său împrumut rămâne în istoric, dar nu mai este activ. O a doua returnare este respinsă. Un împrumut ulterior creează o nouă înregistrare de împrumut.

**S5 — Solicitare duplicată.** M2 solicită T de două ori. Înregistrați o singură solicitare și respingeți a doua încercare fără a o modifica pe prima.

## Exercițiu de încheiere

Fără AI, explicați de ce titlul și exemplarul sunt distincte, enunțați o regulă pe care împrumutul trebuie să o păstreze și precizați ce dovezi ați cere înainte de a accepta o constatare dintr-o revizuire (review).
