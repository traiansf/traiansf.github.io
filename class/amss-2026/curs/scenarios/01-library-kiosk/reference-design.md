# Terminal de bibliotecă — referință pentru cadrul didactic

Acesta este un exemplu de referință pregătit pentru predare, nu o transcriere a unei conversații cu AI și nici singura proiectare acceptabilă. Citiți mai întâi [enunțul](brief.md). Identificatorii regulilor și scenariilor trimit la acel enunț.

## O proiectare compactă

| Concept | Informații relevante |
|---|---|
| Titlu | Identificatorul titlului și informații din catalog |
| Exemplar | Identificatorul exemplarului și identificatorul titlului său |
| Membru | Identificatorul membrului |
| Împrumut | Identificatorul împrumutului, exemplarul, membrul și starea activ sau închis |
| Solicitare | Membrul și titlul; cel mult una pentru fiecare pereche în această parte a sistemului |

Acestea sunt distincții conceptuale, nu cerințe de a folosi clase, tabele, servicii sau fișiere separate.

Responsabilități propuse:

- **Căutarea în catalog:** identifică exemplarul indicat și titlul său. Informațiile existente în catalog sunt date de intrare.
- **Gestionarea împrumuturilor:** impune cel mult un împrumut activ pentru fiecare exemplar, înregistrează un împrumut și închide împrumutul activ la returnare, păstrând istoricul.
- **Înregistrarea solicitărilor:** impune unicitatea perechii membru/titlu și înregistrează solicitarea fără a modifica disponibilitatea exemplarelor sau istoricul împrumuturilor.

În acest model delimitat, disponibilitatea unui exemplar rezultă din absența unui împrumut activ. Este posibilă și o proiectare care stochează separat disponibilitatea, dacă enunță și păstrează regula de consistență; simpla existență a unui câmp nu este o eroare.

## Contractele operațiilor

Datele de intrare sunt identificatori cunoscuți, iar operațiile sunt procesate pe rând, conform R6. Semnăturile de mai jos folosesc denumiri în engleză pentru operații și parametri.

- **Împrumut — `Borrow(copy, member)`:** dacă nu există un împrumut activ pentru exemplar, creează unul care leagă exemplarul de membru. Altfel, respinge operația și lasă împrumuturile neschimbate. Solicitările rămân neschimbate. R2 și R5.
- **Returnare — `Return(copy)`:** dacă există un împrumut activ, îl închide și îl păstrează în istoric. Altfel, respinge operația și lasă împrumuturile neschimbate. Solicitările rămân neschimbate. R3 și R5.
- **Solicitare — `Request(title, member)`:** dacă perechea nu există, o înregistrează. Altfel, respinge operația și lasă solicitările neschimbate. Împrumuturile rămân neschimbate. R4 și R5.

## Verificări prin scenarii

Folosiți starea inițială și ramurile independente precizate în enunț: S2–S4 continuă fiecare separat S1; S5 pornește fără solicitări existente.

- **S1:** L1 leagă M1 de C1. Niciun împrumut activ nu face referire la C2. Titlul rămâne T pentru ambele exemplare.
- **S2:** solicitarea Q1 leagă M2 de T. Noul împrumut L2 leagă M3 de C2. L1, L2 și Q1 pot coexista; o singură stare pe T nu poate exprima aceste fapte independente.
- **S3:** C1 apare deja în împrumutul activ L1. Încercarea lui M2 este respinsă; nu apare un al doilea împrumut activ.
- **S4:** L1 se închide și se păstrează. La a doua returnare nu mai există un împrumut activ de închis. Un împrumut ulterior creează L3, păstrând L1 în istoric.
- **S5:** a doua solicitare are aceeași pereche membru/titlu. Este respinsă fără a înlocui sau duplica prima solicitare.

Aceste parcurgeri explică comportamentul proiectării de referință. Nu constituie o demonstrație că o implementare încă inexistentă sau una oarecare va păstra proprietățile.

## Constatări din revizuire (review) de discutat

**Defect susținut de enunț:** „O singură stare pe un titlu nu poate reprezenta S2. R1 permite împrumutarea independentă a exemplarelor, iar R5 permite existența simultană a unei solicitări pentru titlu.” Explicați distincțiile lipsă înainte de a alege corecția.

**Constatare nesusținută:** „O solicitare activă pentru un titlu trebuie să blocheze orice împrumut.” R5 precizează explicit contrariul în acest exercițiu. Agentul de revizuire poate propune o regulă pentru viitor, dar aceasta nu este o cerință a părții studiate.

**Întrebare despre extinderea domeniului de lucru:** „Ce se întâmplă dacă două cereri de împrumut sosesc simultan?” R6 limitează acest model la operații secvențiale. Înainte de extinderea domeniului de lucru, planul de implementare are nevoie de un mecanism care să păstreze R2 în cazul încercărilor concurente. Nu pretindeți că verificarea secvențială rezolvă deja concurența.

**Alternative acceptabile:** funcțiile cu stare explicită, obiectele care colaborează, reprezentările relaționale sau o altă reprezentare clară pot exprima toate aceste decizii. Punctajul integral depinde de respectarea regulilor și scenariilor, nu de reproducerea denumirilor de mai sus.

## Pregătirea și predarea sarcinii către etapa următoare (handoff)

Referința explicitează conceptele, regulile, atribuirea responsabilităților, rezultatele operațiilor și comportamentul din scenarii. Un agent următor poate elabora un plan detaliat de implementare pentru această parte delimitată. O aplicație de producție ar avea nevoie de cerințe și decizii de proiectare suplimentare, inclusiv pentru aspectele excluse intenționat: ciclul de viață, accesul, concurența, erorile și punerea în producție.

Nu cereți arhitectură suplimentară doar pentru ca referința să pară mai sofisticată. Identificați mai întâi cerința sau incertitudinea pe care ar aborda-o.
