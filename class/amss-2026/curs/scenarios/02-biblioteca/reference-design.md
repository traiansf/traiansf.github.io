# Sistem informatic pentru bibliotecă — referință pentru profesor

Exemplu pregătit pentru predare, nu răspuns AI capturat și nici singura proiectare acceptabilă. [Enunțul](brief.md) definește R1–R6 și S1–S6. Studenții folosesc prezentarea principală, fără fișe sau calculator.

## Concepte și informații

| Concept | Informații relevante |
|---|---|
| Titlu | Identificator și informații din catalog |
| Exemplar | Identificator și titlul căruia îi aparține |
| Membru | Identificator |
| Împrumut | Identificator, exemplar, membru, stare activ/închis |
| Cerere de împrumut | Identificator, membru, titlu, ordine, stare în așteptare/cu exemplar rezervat/îndeplinită |
| Rezervare | Legătura activă dintre o cerere și exemplarul alocat |

Rezervarea poate fi o entitate separată sau exemplarul asociat cererii aflate în starea „cu exemplar rezervat”. Nu impuneți clase, tabele sau servicii distincte pentru fiecare concept. Păstrarea cererilor îndeplinite ca istoric este o alegere a acestei referințe; păstrarea istoricului împrumuturilor este cerută de R3.

## Responsabilități și invarianți

- **Înregistrarea cererii:** verifică disponibilitatea titlului și absența altei cereri neîncheiate pentru membru/titlu; stabilește ordinea și introduce cererea în așteptare.
- **Returnarea și alocarea:** închid împrumutul și atribuie exemplarul primei cereri încă în așteptare pentru același titlu, ca parte a aceleiași operații.
- **Împrumutarea/ridicarea:** verifică exemplarul și dreptul membrului de a-l ridica; creează împrumutul și, dacă există o rezervare pentru membru, încheie rezervarea și cererea.

Un exemplar are cel mult un împrumut activ sau o rezervare activă, niciodată ambele. O cerere are cel mult un exemplar rezervat, aparținând titlului cerut. Un membru are cel mult o cerere neîncheiată pentru un titlu. Cererile care au deja un exemplar rezervat nu mai participă la alocare. Un exemplar disponibil nu are nici împrumut activ, nici rezervare activă.

În stările accesibile din starea inițială, o cerere în așteptare nu coexistă cu un exemplar disponibil al aceluiași titlu: R4 verifică disponibilitatea la depunere, iar R3–R5 alocă exemplarul chiar la returnare. Catalogul nu se modifică și operațiile sunt secvențiale. Aceasta este o consecință a regulilor, nu o soluție implicită pentru concurență.

## Contractele celor trei operații

Datele de intrare sunt identificatori cunoscuți; operațiile se procesează pe rând (R6). Semnăturile de mai jos sunt orientative.

- **`Request(title, member)`:** dacă există un exemplar disponibil sau o cerere neîncheiată pentru perechea membru/titlu, respinge fără modificarea stării. Altfel, creează o cerere în așteptare, cu următoarea poziție în ordinea înregistrării. Nu alocă încă un exemplar și nu creează un împrumut (R4).
- **`Return(copy)`:** fără împrumut activ, respinge fără modificări. Altfel, închide împrumutul, îl păstrează și caută prima cerere în așteptare pentru titlul exemplarului. Dacă există, rezervă exemplarul acelei cereri și o trece în starea „cu exemplar rezervat”; altfel, exemplarul devine disponibil (R3, R5). Rezervarea nu este un împrumut nou.
- **`Borrow(copy, member)`:** dacă exemplarul este împrumutat sau rezervat altcuiva, respinge fără modificări. Altfel, creează un împrumut activ nou pentru exemplar și membru. Dacă exemplarul era rezervat acestui membru, încheie rezervarea și marchează cererea îndeplinită (R2). Alte împrumuturi și rezervări nu se schimbă.

Înregistrarea ordinului poate folosi un număr crescător. Nu este obligatorie o anumită structură de date pentru coadă. Pentru un sistem concurent ar trebui stabilit și mecanismul prin care aceste verificări și actualizări se păstrează împreună; R6 nu rezolvă acel caz.

## Parcurgerea scenariilor

Stare inițială: T are C1 și C2 disponibile; M1–M4 există; fără împrumuturi, cereri sau rezervări. S1 pornește de aici. S2–S6 pornesc fiecare independent după S1.

- **S1:** se creează L1 pentru M1/C1. C2 rămâne disponibil.
- **S2:** M3 împrumută C2 (L2), apoi cererea Q1 a lui M2 pentru T intră în așteptare. Returnarea lui C1 închide L1 și leagă rezervarea C1 de Q1. M3 nu poate împrumuta C1; încercarea nu modifică L1, L2, Q1 sau rezervarea. Ridicarea de către M2 creează L3, încheie rezervarea și îndeplinește Q1. L1 rămâne în istoric, L2 rămâne activ pe C2.
- **S3:** M2 încearcă să împrumute C1. L1 rămâne singurul împrumut activ al lui C1; nu se creează altul.
- **S4:** returnarea închide și păstrează L1. C1 devine disponibil, pentru că nu există cereri. A doua returnare se respinge. Împrumutul ulterior pentru M2 creează o înregistrare nouă; nu reactivează L1.
- **S5:** cererea lui M2 se respinge cât C2 este disponibil. După împrumutul lui C2 de către M3, se creează Q1 pentru M2/T. Repetarea cererii se respinge; Q1 își păstrează identitatea și ordinea. La final există o singură cerere în așteptare.
- **S6:** după împrumutul lui C2 de către M3, Q1 a lui M2 și Q2 a lui M4 intră în așteptare, în această ordine. Returnarea lui C2 îl rezervă pentru Q1; returnarea lui C1 îl rezervă pentru Q2. Q1 nu primește două exemplare. M4 poate ridica C1 înainte de venirea lui M2: se îndeplinește Q2, iar rezervarea lui Q1 pe C2 rămâne.

Acestea sunt parcurgeri ale proiectării. Nu pretindeți că sunt teste executate pe o aplicație.

## Revizuire: ce acceptăm și ce respingem

**Defect susținut:** un împrumut care identifică doar titlul nu precizează exemplarul; o cerere marcată „rezervată” fără legătura cu un exemplar nu permite verificarea ridicării. R1–R2 și R5 cer aceste distincții. În momentul relevant din S2, C1 este rezervat lui M2, iar C2 este împrumutat lui M3.

**Constatare nesusținută:** „M4 nu poate ridica niciun exemplar înainte să vină M2, fiindcă M2 a depus primul cererea.” S6 respectă prioritatea la alocare: C2 merge la M2, apoi C1 la M4. R2 permite fiecăruia ridicarea propriului exemplar. Agentul AI de revizuire a confundat ordinea alocării cu ordinea ridicării.

**Extindere de discutat:** „Ce facem dacă M2 nu mai vine?” Expirarea/anularea și notificările sunt excluse prin R6; constituie decizii necesare unui sistem mai amplu, nu defecte față de enunțul acestui exercițiu.

## Predarea către etapa următoare

Agentul AI următor poate propune un plan pentru cele trei operații și fluxul cerere–rezervare–împrumut. Primește regulile, conceptele, contractele, scenariile, deciziile de revizuire și limitele. Nu presupune rezolvate expirarea, anularea, notificările, concurența, autentificarea sau punerea în producție.
