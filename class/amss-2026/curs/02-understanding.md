---
title: "AMSS 2026/2027 — Cursul 2: Înțelegem înainte de a delega"
author: "Traian-Florin Șerbănuță"
lang: ro-RO
---

# Înțelegem înainte de a delega

Ce trebuie să înțelegem înainte de a cere unei persoane sau unui asistent să propună o soluție?

Astăzi analizăm o problemă mică, comparăm decizii și verificăm ce dovezi le susțin.

::: notes
100 de minute: analiză inițială și întrebări 15; clarificări și delimitare 15; concepte și responsabilități 20; contracte și scenarii 15; delegare și revizuire 20; schimbare și sinteză 10; exercițiu final 5. Aspectele administrative au fost discutate în cursul 1. Acesta este un prim contact cu principiile care vor fi aprofundate în cursurile următoare. Lab 1 se desfășoară după acest curs.
:::

---

# Ideea întâlnirii

> „Simplitatea este o condiție necesară pentru fiabilitate.”

— **Edsger W. Dijkstra**

[Sursa: How do we tell truths that might hurt? — EWD498](https://www.cs.virginia.edu/~evans/cs655/readings/ewd498.html) · traducere din engleză

::: notes
Original: “Simplicity is prerequisite for reliability.”

Transcriere universitară, afirmația marcată ca adnotare manuscrisă; originalul este în arhiva Dijkstra de la UT Austin, EWD498.

Legătura cu tema: O descriere pe care o putem înțelege și verifica înainte de delegare.
:::

---

# Pornim de la o solicitare

> „Avem nevoie de un terminal de bibliotecă. Membrii împrumută și returnează cărți. Ar trebui să poată solicita o carte și cât timp aceasta este împrumutată.”

Înainte să cereți unui agent să construiască ceva:

**Ce ar trebui să înțelegeți?**

::: notes
Este o solicitare intenționat incompletă a beneficiarului, nu o specificație completă. Nu arătați încă precizările. Fișa studenților: scenarios/01-library-kiosk/brief.md. Exercițiul inițial apare integral și pe slide-uri.
:::

---

# Exercițiu: întrebări înainte de soluții

Lucrați cu un coleg, inițial **fără AI**.

1. Scrieți două întrebări ale căror răspunsuri ar putea schimba proiectarea.
2. Descrieți o situație concretă de împrumut.
3. Numiți un lucru pe care l-ați exclude din prima versiune.

Pregătiți-vă să explicați **de ce contează unul dintre răspunsuri**.

::: notes
Acordați trei minute, apoi ascultați trei contribuții diferite. Întrebări utile: „carte” înseamnă un titlu sau un exemplar, ce promite o solicitare și ce se întâmplă când doi membri vor același exemplar? Alegerea unui framework pentru interfață privește implementarea; încă nu este incertitudinea cu cea mai mare miză.

Nu evaluați răspunsurile prin potrivirea cu o listă ascunsă. Întrebați cum influențează fiecare întrebare limitele sistemului, comportamentul sau o decizie de proiectare.
:::

---

# Ce precizează bibliotecarul

Pentru acest exercițiu:

- Un titlu poate avea mai multe exemplare fizice, identificate distinct.
- Un împrumut înregistrează **ce exemplar** a împrumutat un membru.
- Un exemplar are cel mult un împrumut activ.
- O solicitare se referă la un **titlu**, nu la un anumit exemplar.
- Solicitările pot exista simultan cu împrumuturile.

::: notes
Acestea sunt informații furnizate de beneficiar, nu adevăruri de presupus pentru orice bibliotecă. Regulile complete din scenarios/01-library-kiosk/brief.md precizează și solicitările duplicate, returnările și limitele exercițiului. Explicați că înregistrarea unei solicitări și promisiunea alocării unui exemplar sunt cerințe diferite.
:::

---

# Și delimitarea funcționalității este o decizie

Această primă parte a sistemului înregistrează:

- Împrumutarea unui exemplar disponibil și returnarea lui.
- Solicitarea unui titlu de către un membru.

În acest exercițiu, o solicitare înregistrată **nu rezervă un exemplar și nu împiedică împrumutarea**.

Alocarea exemplarelor, prioritatea în coadă, notificările, amenzile și prelungirea împrumutului rămân decizii viitoare.

::: notes
Această delimitare explicită îi împiedică pe studenți să inventeze reguli de așteptare sau alocare și apoi să evalueze soluțiile pe baza lor. Descrie un exercițiu restrâns; nu susține că un serviciu complet de bibliotecă nu are nevoie de o politică de alocare.

O „decizie viitoare” poate deveni critică înainte de extinderea funcționalității. Afirmația că o soluție este pregătită pentru implementare trebuie să precizeze partea acoperită.
:::

---

# Analiză: înțelegem problema

Trebuie să distingem:

- **Fapte:** informații furnizate sau confirmate de beneficiar.
- **Presupuneri:** ipoteze de lucru care trebuie încă verificate.
- **Întrebări deschise:** decizii care nu au fost încă luate.
- **Cerințe:** rezultate și restricții pe care sistemul convenit trebuie să le respecte.

„Folosește o bază de date relațională” nu răspunde la „ce este o carte?”

::: notes
Introduceți analiza pornind de la ceea ce au făcut studenții. O tehnologie poate fi o restricție externă reală, dacă este impusă de beneficiar; nu predați ideea că tehnologia nu poate apărea niciodată în cerințe. Aici nu a fost furnizată o asemenea restricție.
:::

---

# Modelarea domeniului

| Concept | Ce identifică |
|---|---|
| Titlu | Lucrarea din catalog pe care o pot solicita membrii |
| Exemplar | Un obiect fizic pe care îl pot împrumuta membrii |
| Împrumut | Împrumutarea unui exemplar de către un membru |
| Solicitare | Interesul înregistrat al unui membru pentru un titlu |

Un titlu, două exemplare: unul poate fi împrumutat, iar celălalt disponibil.

::: notes
Un model al domeniului surprinde concepte, relații și reguli relevante. Acest tabel este deja un model. Nu impune patru clase, patru tabele într-o bază de date sau o anumită implementare.

Cereți unui student să indice conceptul afectat de returnarea unui exemplar. Titlul continuă să existe, iar regulile date nu anulează automat o solicitare.
:::

---

# Proiectare: cine răspunde de fiecare lucru?

**Decizie:** operația de împrumutare asigură respectarea regulii privind împrumuturile active.

Ea trebuie să:

1. Identifice exemplarul și membrul selectați.
2. Stabilească faptul că exemplarul nu are un împrumut activ.
3. Înregistreze noul împrumut, păstrând regula.

Interfața poate afișa disponibilitatea; soluția trebuie să protejeze regula și în momentul împrumutării.

::: notes
Introduceți responsabilitatea ca asumare a unui comportament și a respectării regulilor. O poate prelua un obiect, o funcție, un serviciu sau alt mecanism. Nu am ales încă unul.

Anticipați coeziunea: păstrați împreună deciziile necesare acestei responsabilități. Anticipați cuplarea: identificați informațiile și operațiile de care depinde. Nu impuneți un sistem distribuit sau un mecanism concret de blocare în acest exemplu introductiv.
:::

---

# Contracte și invariante: reguli verificabile

**Invariantă:** un exemplar are cel mult un împrumut activ.

**Operația de împrumutare:**

- La succes, exemplarul are un nou împrumut activ către membrul solicitant.
- Dacă exemplarul este deja împrumutat, cererea este respinsă, iar împrumuturile rămân neschimbate.

**Contraexemplu de exclus:** două împrumuturi active acceptate pentru același exemplar.

::: notes
O invariantă este o condiție care trebuie să fie adevărată în stările valide relevante. Un contract precizează obligațiile și rezultatele observabile ale unei operații. Vom defini mai precis precondițiile, postcondițiile, comportamentul la eșec și sensul unei „stări valide”.

Distingeți această condiție a domeniului de o proiectare completă pentru concurență. Dacă încercările concurente de împrumutare intră în domeniul de aplicare, planul de implementare trebuie să explice cum păstrează invarianta.
:::

---

# Comportament: urmărim ce se poate întâmpla

Pentru un exemplar:

| Înainte | Eveniment | După |
|---|---|---|
| Disponibil | Împrumut acceptat | Împrumutat |
| Împrumutat | Returnare | Disponibil |
| Împrumutat | O nouă încercare de împrumut | Împrumutat; cerere respinsă |

O solicitare privește un titlu. Ea poate exista în oricare dintre stările unui exemplar.

::: notes
Acest tabel de tranziții este un model comportamental. Comparați-l cu un singur câmp „AVAILABLE / ON_LOAN / REQUESTED” pe titlu: acel câmp nu poate descrie exemplul dat, cu două exemplare în stări diferite și o solicitare simultană.

Nu afirmați că orice model de stări trebuie reprezentat printr-un singur enum. Reprezentarea trebuie să servească distincțiilor și regulilor.
:::

---

# Un model ne ajută să răspundem la o întrebare

- Un glosar distinge conceptele.
- Un contract explicitează promisiunile unei operații.
- Un tabel de stări arată tranzițiile permise și interzise.
- O schiță poate clarifica responsabilități sau limite.
- Un model executabil mic poate explora consecințele.

Alegeți reprezentarea care face decizia mai ușor de verificat.

::: notes
Diagramele și limbajele lor sunt instrumente ajutătoare. Cursul nu cere o anumită notație, iar stăpânirea notației nu înlocuiește înțelegerea problemei.

Întrebați ce nu arăta tabelul anterior: ordinea operațiilor, comportamentul la eșec sau cine asigură o regulă. Astfel motivați folosirea mai multor perspective fără a introduce un catalog de diagrame.
:::

---

# AI poate accelera aceste activități

Cereți unui agent să:

- Organizeze faptele furnizate și întrebările deschise.
- Propună soluții de proiectare și să le compare consecințele.
- Construiască scenarii care pun la încercare o regulă.
- Explice o parte nefamiliară a unui sistem existent.
- Revizuiască o soluție pe baza unor criterii explicite.

Aveți în continuare nevoie de cunoștințe pentru a evalua răspunsurile.

::: notes
Nu promiteți că agentul va produce întotdeauna o greșeală utilă pentru discuție. Un răspuns bun este valoros: studenții trebuie să explice de ce satisface enunțul și până unde se întind garanțiile sale.
:::

---

# Proiectăm înainte de a implementa

**Problemă și specificație → proiectare → plan de implementare → implementare → teste → revizuire**

Înainte de implementarea de amploare:

- Stabiliți limitele, regulile și întrebările încă deschise.
- Explicați responsabilitățile, contractele și comportamentul.
- Validați scenariile importante și puneți soluția la încercare.
- Predați explicit sarcina și contextul etapei următoare.

::: notes
Acesta este procesul convenit pentru curs: investim de la început într-o specificație și o soluție de proiectare bine dezvoltate. Testele de după implementare descriu o posibilă ordine de execuție; exemplele de acceptare și întrebările de validare apar și în etapele anterioare. Dezvoltarea dirijată de teste (test-driven development, TDD) este o tehnică posibilă de implementare, nu o cerință a proiectului.

Prototipurile și modelele executabile pot răspunde unor întrebări de proiectare înainte de existența unei aplicații complete. Studenților nu li se cere o aplicație funcțională la acest curs.
:::

---

# Ce face utilă predarea unei sarcini?

Furnizați următorului agent, la predarea sarcinii (**handoff**):

- Limitele convenite și cerințele sursă.
- Deciziile de proiectare și justificarea lor.
- Regulile care trebuie să rămână adevărate.
- Problemele deschise și ce anume blochează.
- Rezultatul cerut și verificările pentru acceptarea lui.

„Construiește aplicația bibliotecii” lasă aceste decizii implicite.

::: notes
Predarea trebuie să susțină etapa următoare fără să devină un transcript imposibil de verificat. În demonstrația introductivă, rezultatul este o descriere concisă a soluției de proiectare. Pentru o etapă reală de implementare, planul ar avea nevoie și de detalii tehnice potrivite funcționalității vizate.
:::

---

# Exercițiu: construiți o propunere înainte de delegare

În perechi, folosind regulile R1–R6:

1. Distingeți titlul, exemplarul, membrul, împrumutul și solicitarea.
2. Alegeți unde se verifică regula unui singur împrumut activ pe exemplar.
3. Explicați cum reprezentați un împrumut încheiat fără să îi pierdeți istoricul.

Sunt suficiente un tabel, o schiță sau pseudocod. Notați o alternativă și motivul alegerii voastre.

::: notes
Alocați aproximativ 8 minute în intervalul pentru concepte și responsabilități. Perechile formulează o propunere proprie înainte de demonstrație. Nu cereți proiectarea completă a bibliotecii și nu adăugați reguli din afara R1–R6.
:::

---

# Exercițiu: respingerea păstrează starea

După S1, C1 este împrumutat lui M1, iar C2 este disponibil.

**Două ramuri independente, fiecare pornind după S1:**

- S3: M2 încearcă să împrumute C1. Ce se respinge și ce rămâne neschimbat?
- S4: C1 este returnat, apoi se încearcă o a doua returnare. Ce rămâne în istoric?

Explicați ce regulă verifică fiecare exemplu și ce afirmații nu poate demonstra singur.

::: notes
Alocați aproximativ 7 minute în intervalul pentru contracte și scenarii. Verificați starea înainte și după fiecare operație. R2 impune respingerea împrumutului repetat fără modificarea împrumuturilor; R3 păstrează istoricul și respinge returnarea repetată. Acestea sunt observații introductive, nu predarea aprofundată a contractelor din cursul 6.
:::

---

# Demonstrație: delegăm o sarcină delimitată

Vom:

1. Furniza unui analist/proiectant enunțul clarificat al bibliotecii.
2. Verifica conceptele, regulile și responsabilitățile propuse.
3. Furniza unui evaluator, într-un context nou, enunțul și soluția.
4. Decide ce constatări sunt susținute de dovezi.

**Sarcina voastră:** explicați o decizie acceptată și puneți la încercare o afirmație.

::: notes
Urmați 02-understanding-demo.md. Demonstrația cere proiectare, nu codul aplicației. Folosește orice asistent disponibil și un context separat pentru revizuire (review); rolurile diferite nu impun furnizori diferiți sau agenți care rulează simultan.

Dacă generarea nu este disponibilă sau durează prea mult, folosiți fallback/01-intro-fallback.pdf sau .html. Este un exemplu didactic pregătit, nu captura unei rulări AI. Precizați explicit acest lucru.

Punerea la încercare a unei afirmații o poate confirma prin verificarea unui scenariu. Studenții nu trebuie să inventeze o eroare dacă rezultatul este corect.
:::

---

# Verificăm și revizuirea

Un evaluator afirmă:

> „Un titlu cu o solicitare activă nu trebuie împrumutat.”

Înainte să acceptați constatarea:

1. Ce regulă furnizată o susține?
2. Ce scenariu concret demonstrează problema?
3. Este un defect, o propunere de regulă nouă sau o întrebare deschisă?

::: notes
În acest exercițiu, constatarea contrazice limitele declarate: solicitările înregistrate nu alocă exemplare și nu blochează împrumutarea. Faptul că soluția permite împrumutarea nu reprezintă un defect.

Un agent separat oferă încă o ocazie de revizuire, nu o garanție de independență sau corectitudine. Dați-i enunțul sursă și criteriile; evaluați dovezile. Același model poate fi folosit într-o sesiune nouă.
:::

---

# Păstrăm o imagine de ansamblu verificabilă

Cereți o sinteză concisă despre:

- Soluția curentă și limitele ei.
- Deciziile schimbate și motivele schimbării.
- Întrebările și riscurile încă neclarificate.
- Verificările efectuate și ce anume stabilesc.

Apoi urmăriți o afirmație importantă până la cerința, detaliul de proiectare sau dovada de validare care o susține.

::: notes
Aceasta este aplicarea ideii de a coordona o echipă. Studenții nu trebuie să citească fiecare token cu aceeași atenție, dar au nevoie de un model mental al sistemului și de acces la detaliile importante.

Cereți agentului să indice fișierul sau secțiunea justificativă ori să reproducă scenariul din spatele unei afirmații. O sinteză fluentă poate omite o condiție; trasabilitatea permite depistarea omisiunii.
:::

---

# Când o presupunere inițială este greșită

Să presupunem că modelăm titlul și exemplarele sale ca un singur lucru.

Alegerea poate afecta:

- Cum selectează un membru obiectul dorit.
- Ce identifică înregistrarea împrumutului.
- Cum se calculează disponibilitatea.
- Ce consideră un test drept o returnare reușită.

Corectarea ulterioară a conceptului poate impune schimbarea tuturor celor patru.

::: notes
Explicați costul unei erori timpurii urmărindu-i consecințele, nu printr-un multiplicator numeric fără justificare. De aceea investim în cerințe și proiectare înainte de a delega implementarea de amploare.

Dacă dovezile ulterioare expun o problemă, revedeți decizia inițială și actualizați ceea ce depinde de ea.
:::

---

# Corecție locală sau reproiectare?

O propunere stochează o singură stare pentru fiecare titlu:

`available | on_loan | requested`

Cineva adaugă un indicator: `has_request`.

**Exercițiu:** se rezolvă astfel cazul cu două exemplare, unul împrumutat și unul disponibil?

De ce distincție mai are nevoie soluția?

::: notes
Acordați un minut pentru raționament individual, apoi discutați. Indicatorul separă existența solicitării de starea împrumutului, dar propunerea tot nu poate reprezenta exemplare împrumutate independent. Lipsește distincția titlu–exemplar și precizarea exemplarului la care se referă fiecare împrumut.

Lecția este să identificăm cerința încălcată înainte de a alege corecția. O corecție locală poate fi potrivită dacă modelul de bază susține deja cerința. O abstractizare generală nu este automat mai bună.
:::

---

# Cinci idei fundamentale

1. **Formularea problemei și cerințele** — ce trebuie rezolvat?
2. **Modelarea domeniului** — ce concepte și reguli contează?
3. **Atribuirea responsabilităților** — cui îi revin comportamentul și dependențele?
4. **Contractele și invariantele** — ce trebuie să garanteze o operație sau o stare?
5. **Stările și comportamentul** — ce se poate întâmpla și în ce ordine?

::: notes
Explicați coeziunea și cuplarea în cadrul atribuirii responsabilităților. Celelalte teme convenite — abstractizare, delimitări, șabloane de proiectare, testare, proiectare pentru schimbare și compromisuri — se vor dezvolta pornind de la aceste baze.
:::

---

# De la concepte la analiză și schimbare

Vom și:

- Valida modele prin scenarii și exemple executabile mici.
- Explora stări, invariante, interblocări (deadlocks) și contraexemple.
- Compara abstractizări și șabloane cu nevoile reale de schimbare.
- Înțelege și revizui soluții existente.
- Coordona sarcini delegate și argumenta decizii de proiectare.

Fiecare temă folosește un alt domeniu restrâns.

::: notes
Cursul despre validare include unul sau două slide-uri introductive despre modelarea formală. Vom explica atât cum se obține un rezultat, cât și limitele lui.

Planul este în docs/redesign-2026-2027.md. Materialele cursurilor ulterioare sunt reorganizate treptat; această întâlnire tehnică introduce principiile care vor fi aprofundate în cursurile 3–13.
:::

---

# Exercițiu final: explicați o decizie

Fără AI, scrieți trei răspunsuri scurte:

1. De ce distingem un titlu de un exemplar fizic?
2. Ce trebuie să rămână adevărat după un împrumut acceptat?
3. Ce dovezi ați cere înainte de a accepta o constatare dintr-o revizuire?

**Cursul următor:** formularea problemei și cerințele.

::: notes
Răspunsuri așteptate: exemplarele au identitate și stare de împrumut independente, iar solicitările privesc titluri; cel mult un împrumut activ pentru fiecare exemplar, cu noul împrumut legat de exemplarul și membrul selectați; o cerință sursă și un scenariu concret sau altă dovadă verificabilă.

Acceptați și alte invariante sau dovezi justificate. „Pentru că așa spune un șablon” sau „agentul a fost de acord” nu sunt argumente suficiente. Folosiți răspunsurile pentru a pregăti întâlnirea următoare; exercițiul nu introduce o nouă regulă de notare a participării.
:::
