---
title: "AMSS 2026/2027 — Cursul 2: Înțelegem înainte de a delega"
author: "Traian-Florin Șerbănuță"
lang: ro-RO
---

# Întrebarea de astăzi

Ce trebuie să înțelegem înainte de a cere unei persoane sau unui asistent să propună o soluție?

Astăzi analizăm o problemă mică, comparăm decizii și verificăm ce anume le susține.

::: notes
100 de minute: analiză inițială și întrebări 15; clarificări și delimitare 10; concepte și responsabilități 20; contracte și scenarii 15; delegare și revizuire 25; schimbare și sinteză 10; exercițiu final 5. Aspectele administrative au fost discutate în cursul 1. Acesta este un prim contact cu principiile care vor fi aprofundate în cursurile următoare. Laboratorul 1 se desfășoară după acest curs.
:::

---

# Citatul zilei

> „Simplitatea este o condiție necesară pentru fiabilitate.”
>
> Original: “Simplicity is prerequisite for reliability.”

— **Edsger W. Dijkstra**

[Sursa: How do we tell truths that might hurt? — EWD498](https://www.cs.virginia.edu/~evans/cs655/readings/ewd498.html)

::: notes
Transcriere universitară, afirmația marcată ca adnotare manuscrisă; originalul este în arhiva Dijkstra de la UT Austin, EWD498.

Legătura cu tema: O descriere pe care o putem înțelege și verifica înainte de delegare.
:::

---

# Pornim de la o solicitare

> „Avem nevoie de un terminal de bibliotecă. Membrii împrumută și returnează cărți. Ar trebui să poată și solicita o carte atunci când aceasta este împrumutată.”

Înainte să cereți unui agent să construiască ceva:

**Ce ar trebui să înțelegeți?**

::: notes
Este o solicitare intenționat incompletă a beneficiarului, nu o specificație completă. Nu arătați încă precizările. Fișa studenților: scenarios/02-biblioteca/brief.md. Exercițiul inițial apare integral și pe diapozitive.
:::

---

# Exercițiu: întrebări înainte de soluții

Mai întâi singuri, **fără AI**; apoi comparați răspunsurile cu un coleg.

1. Scrieți două întrebări ale căror răspunsuri ar putea schimba proiectarea.
2. Descrieți o situație concretă de împrumut.
3. Numiți un lucru pe care l-ați exclude din prima versiune.

Pregătiți-vă să explicați **de ce contează unul dintre răspunsuri**.

::: notes
Acordați două minute de lucru individual și un minut de comparare în pereche, apoi ascultați trei răspunsuri diferite. Întrebări utile: „carte” înseamnă titlu sau exemplar? Ce promite o solicitare? Ce se întâmplă când doi membri vor același exemplar? Alegerea unui framework pentru interfață ține de implementare și nu este, deocamdată, incertitudinea cea mai importantă.

Nu evaluați răspunsurile comparându-le cu o listă ascunsă. Întrebați cum influențează fiecare întrebare limitele sistemului, comportamentul sau o decizie de proiectare.
:::

---

# Ce precizează bibliotecarul

- **R1** Un titlu poate avea mai multe exemplare fizice, identificate distinct.
- **R2** Un împrumut leagă **un exemplar** de un membru; un exemplar are cel mult un împrumut activ.
- **R3** Returnarea închide împrumutul activ; istoricul împrumuturilor se păstrează.
- **R4** O solicitare se referă la un **titlu**, nu la un exemplar; duplicatele se resping.
- **R5** Solicitările pot exista simultan cu împrumuturile și nu rezervă exemplare.
- **R6** Operațiile se procesează pe rând; alocarea, notificările și amenzile rămân în afara exercițiului.

[Regulile complete și scenariile S1–S5](https://github.com/traiansf/traiansf.github.io/blob/main/class/amss-2026/curs/scenarios/02-biblioteca/brief.md)

::: notes
Acestea sunt informații date de beneficiar, nu adevăruri valabile pentru orice bibliotecă. Pe diapozitiv, regulile sunt condensate; formularea completă și scenariile S1–S5 sunt în scenarios/02-biblioteca/brief.md. Explicați că a înregistra o solicitare și a promite alocarea unui exemplar sunt cerințe diferite.
:::

---

# Și delimitarea funcționalității este o decizie

Această primă parte a sistemului înregistrează:

- Împrumutarea unui exemplar disponibil și returnarea lui.
- Solicitarea unui titlu de către un membru.

În acest exercițiu, o solicitare înregistrată **nu rezervă un exemplar și nu împiedică împrumutarea**.

Alocarea exemplarelor, prioritatea în coadă, notificările, amenzile și prelungirea împrumutului rămân decizii viitoare.

::: notes
Delimitarea explicită îi oprește pe studenți să inventeze reguli de așteptare sau de alocare și apoi să judece soluțiile după ele. Ea descrie un exercițiu restrâns; nu afirmă că un serviciu complet de bibliotecă se poate lipsi de o politică de alocare.

O „decizie viitoare” poate deveni critică înainte ca funcționalitatea să fie extinsă. Cine afirmă că o soluție este pregătită pentru implementare trebuie să precizeze ce parte acoperă.
:::

---

# Analiză: înțelegem problema

| Tip de afirmație | Exemplu din bibliotecă |
|----|--------|
| Informație convenită | R2: un exemplar are cel mult un împrumut activ. |
| Consecință dedusă | Un titlu poate avea un exemplar împrumutat și unul disponibil. |
| Ipoteză | Oricine aduce exemplarul îl poate returna, nu doar membrul. |
| Întrebare deschisă | Cine primește exemplarul returnat, dacă există solicitări? |
| Propunere de proiectare | Operația de împrumut verifică regula din R2. |

„Folosește o bază de date relațională” nu răspunde la „ce este o carte?”

::: notes
Folosim aceleași cinci tipuri și în laboratorul 1. Informațiile convenite vin de la beneficiar (aici, R1–R6); o consecință dedusă trebuie să rezulte din ele. Consecința dedusă rezultă din R1 și R2: disponibilitatea se stabilește pe exemplar. O ipoteză este un răspuns provizoriu, etichetat ca atare: R3 nu spune cine poate returna exemplarul. Atenție: „un membru poate avea mai multe împrumuturi active” nu este o ipoteză, ci o consecință a R2, care condiționează împrumutul doar de exemplar. O propunere de proiectare nu devine informație convenită până nu o acceptă beneficiarul.

Porniți analiza de la ce au lucrat studenții. O tehnologie poate fi o restricție externă reală, dacă o impune beneficiarul; nu lăsați impresia că tehnologia nu are ce căuta în cerințe. Aici beneficiarul nu a impus o asemenea restricție.
:::

---

# Exercițiu: propunerea voastră, înainte de modelul nostru

Mai întâi singuri, apoi comparați în pereche, folosind regulile R1–R6:

1. Pentru titlu, exemplar, membru, împrumut și solicitare: ce îl identifică și ce regulă din R1–R6 îl privește?
2. Verificați-o pe S2: titlul T are exemplarele C1 și C2; M1 a împrumutat C1. M2 solicită T, apoi M3 împrumută C2.
3. Alegeți unde se verifică regula unui singur împrumut activ pe exemplar.
4. Cum reprezentați un împrumut încheiat fără să îi pierdeți istoricul?

Sunt suficiente un tabel, o schiță sau pseudocod. Notați o alternativă și motivul alegerii.

::: notes
Alocați 8 minute din intervalul pentru concepte și responsabilități: 5 minute de lucru individual, 3 minute de comparare în pereche. Ascultați două propuneri diferite înainte de diapozitivul următor, apoi comparați-le cu modelul lucrat. Nu cereți proiectarea completă a bibliotecii și nu adăugați reguli din afara R1–R6.
:::

---

# Modelarea domeniului

| Din solicitare | Întrebarea | Precizare | Concept și regulă |
|------|-------|---|----------|
| „împrumută cărți” | Titlu sau exemplar? | R1 | Titlu; Exemplar al unui titlu |
| „împrumută” | Ce leagă un împrumut? | R2 | Împrumut: exemplar și membru; cel mult unul activ |
| „returnează” | Ce rămâne după returnare? | R3 | Împrumut încheiat, păstrat în istoric |
| „solicita o carte” | Ce se solicită? | R4, R5 | Solicitare: membru și titlu; nu rezervă |

Un titlu, două exemplare: unul poate fi împrumutat, iar celălalt disponibil.

::: notes
Parcurgeți tabelul de la stânga la dreapta: fiecare concept pornește de la un fragment al solicitării, trece printr-o întrebare și se sprijină pe o precizare a beneficiarului. Comparați cu propunerile ascultate la exercițiul anterior. Un model al domeniului surprinde conceptele, relațiile și regulile care contează pentru problemă. Acest tabel este deja un model. Nu impune patru clase, patru tabele într-o bază de date sau o anumită implementare.

Cereți unui student să indice conceptul afectat de returnarea unui exemplar. Titlul continuă să existe, iar regulile date nu anulează automat o solicitare.
:::

---

# Proiectare: cine de ce răspunde?

**Decizie:** operația de împrumutare impune regula împrumutului activ.

Ea trebuie să:

1. Identifice exemplarul și membrul selectați.
2. Verifice că exemplarul nu are un împrumut activ.
3. Înregistreze noul împrumut fără să încalce regula.

Interfața poate afișa disponibilitatea, dar soluția trebuie să respecte regula și în momentul împrumutului.

::: notes
Prezentați responsabilitatea ca obligația de a avea un anumit comportament și de a face respectate anumite reguli. Ea poate reveni unui obiect, unei funcții, unui serviciu sau altui mecanism; nu am ales încă unul.

Pomeniți în treacăt coeziunea (deciziile de care are nevoie această responsabilitate stau împreună) și cuplarea (informațiile și operațiile de care depinde ea). În acest exemplu introductiv nu impuneți un sistem distribuit sau un anumit mecanism de blocare.
:::

---

# Contracte și invariante: reguli verificabile

**Invariant:** un exemplar are cel mult un împrumut activ.

**Operația de împrumutare:**

- Dacă operația reușește, exemplarul are un nou împrumut activ, pe numele membrului care îl împrumută.
- Dacă exemplarul este deja împrumutat, încercarea este respinsă, iar împrumuturile rămân neschimbate.

**Contraexemplu de exclus:** două împrumuturi active acceptate pentru același exemplar.

::: notes
Un invariant este o condiție care trebuie să fie adevărată în toate stările valide avute în vedere. Un contract precizează obligațiile și rezultatele observabile ale unei operații. Mai târziu vom defini precis precondițiile, postcondițiile, comportamentul la eșec și sensul unei „stări valide”.

Nu confundați această regulă a domeniului cu o soluție completă pentru accesul concurent. Dacă încercările simultane de împrumut fac parte din problemă, planul de implementare trebuie să explice cum se păstrează invariantul.
:::

---

# Comportament: urmărim ce se poate întâmpla

Pentru un exemplar:

| Înainte | Eveniment | După |
|---|---|---|
| Disponibil | Împrumut acceptat | Împrumutat |
| Împrumutat | Returnare | Disponibil |
| Împrumutat | O nouă încercare de împrumut | Împrumutat; încercare respinsă |

O solicitare privește un titlu. Ea poate exista în oricare dintre stările unui exemplar.

::: notes
Acest tabel de tranziții este un model comportamental. Comparați-l cu un singur câmp „AVAILABLE / ON_LOAN / REQUESTED” pe titlu: acel câmp nu poate descrie exemplul dat, cu două exemplare în stări diferite și o solicitare simultană.

Nu afirmați că orice model de stări trebuie reprezentat printr-un singur enum. Reprezentarea trebuie să surprindă distincțiile și regulile.
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

Întrebați ce nu arăta tabelul anterior: ordinea operațiilor, comportamentul la eșec sau cine impune o regulă. Astfel justificați nevoia mai multor perspective, fără să prezentați un catalog de diagrame.
:::

---

# AI poate accelera aceste activități

Cereți unui agent să:

- Organizeze faptele date și întrebările deschise.
- Propună soluții de proiectare și să le compare consecințele.
- Construiască scenarii care pun la încercare o regulă.
- Explice o parte nefamiliară a unui sistem existent.
- Revizuiască o soluție pe baza unor criterii explicite.

**Întrebare:** ce stabilește fiecare verificare pe care o faceți deja (citiți propunerea, întrebați alt agent, rulați teste, cereți o explicație) și ce nu poate stabili?

::: notes
Ascultați două-trei răspunsuri. Citirea poate găsi o neconcordanță cu enunțul, dar numai dacă știm ce să căutăm; un alt agent oferă încă o opinie, nu o confirmare; testele trec numai pe cazurile alese; o explicație fluentă poate fi greșită. Pentru a evalua răspunsurile, aveți în continuare nevoie de cunoștințe proprii.

Nu promiteți că agentul va produce întotdeauna o greșeală utilă pentru discuție. Un răspuns bun este valoros: studenții trebuie să explice de ce respectă enunțul și până unde merg garanțiile lui.
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
Acesta este procesul convenit pentru curs: investim de la început într-o specificație și o soluție de proiectare temeinice. Faptul că testele apar după implementare arată doar o ordine posibilă; exemplele de acceptare și întrebările de validare apar și în etapele anterioare. Dezvoltarea dirijată de teste (test-driven development, TDD) este o tehnică posibilă de implementare, nu o cerință a proiectului.

Prototipurile și modelele executabile pot răspunde unor întrebări de proiectare înainte să existe o aplicație completă. Studenților nu li se cere o aplicație funcțională la acest curs.
:::

---

# Ce conține o predare utilă a sarcinii?

La predarea sarcinii (**handoff**), dați următorului agent:

- Limitele convenite și cerințele sursă.
- Deciziile de proiectare și justificarea lor.
- Regulile care trebuie să rămână adevărate.
- Problemele deschise și ce anume blochează.
- Rezultatul cerut și verificările pentru acceptarea lui.

„Construiește aplicația bibliotecii” lasă aceste decizii implicite.

::: notes
Predarea trebuie să ajute etapa următoare fără să devină un transcript imposibil de verificat. În demonstrația introductivă, rezultatul este o descriere concisă a soluției de proiectare. Pentru o etapă reală de implementare, planul ar avea nevoie și de detalii tehnice potrivite funcționalității vizate.
:::

---

# Exercițiu: respingerea păstrează starea

După S1, C1 este împrumutat lui M1, iar C2 este disponibil.

**Două ramuri independente, fiecare pornind după S1:**

- S3: M2 încearcă să împrumute C1. Ce se respinge și ce rămâne neschimbat?
- S4: C1 este returnat, apoi se încearcă o a doua returnare. Ce rămâne în istoric?

Explicați ce regulă verifică fiecare exemplu și ce afirmații nu poate demonstra singur.

::: notes
Alocați aproximativ 7 minute din intervalul pentru contracte și scenarii. Verificați starea înainte și după fiecare operație. R2 cere ca împrumutul repetat să fie respins fără ca împrumuturile să se modifice; R3 păstrează istoricul și respinge returnarea repetată. Acestea sunt observații introductive, nu tratarea aprofundată a contractelor din cursul 6.
:::

---

# Demonstrație: delegăm o sarcină delimitată

Pașii demonstrației:

1. Îi dăm unui analist/proiectant enunțul clarificat al bibliotecii.
2. Verificăm conceptele, regulile și responsabilitățile propuse.
3. Îi dăm unui evaluator (agent de revizuire), într-un context nou, enunțul și soluția.
4. Decidem ce constatări sunt susținute de enunț.

**Sarcina voastră:** explicați o decizie acceptată și puneți la încercare o afirmație.

::: notes
Urmați 02-intelegere-demo.md. Demonstrația cere o proiectare, nu codul aplicației. Se poate folosi orice asistent disponibil, cu un context separat pentru revizuire (review); rolurile diferite nu cer furnizori diferiți sau agenți care rulează simultan.

Dacă generarea nu funcționează sau durează prea mult, folosiți fallback/02-intelegere-fallback.pdf sau .html. Este un exemplu didactic pregătit, nu captura unei rulări AI. Spuneți explicit acest lucru.

O afirmație pusă la încercare poate fi și confirmată, prin verificarea unui scenariu. Studenții nu trebuie să inventeze o eroare dacă rezultatul este corect.
:::

---

# Verificăm și revizuirea

Exemplu pregătit; un evaluator afirmă:

> „Un titlu cu o solicitare activă nu trebuie să poată fi împrumutat.”

Înainte să acceptați constatarea:

1. Ce regulă din enunț o susține?
2. Ce scenariu concret demonstrează problema?
3. Este un defect, o propunere de regulă nouă sau o întrebare deschisă?

Un context separat este încă o ocazie de revizuire, nu o garanție: voi decideți ce susține fiecare constatare.

::: notes
Propoziția este pregătită; nu o atribuiți agentului din demonstrație.

În acest exercițiu, constatarea contrazice limitele declarate: solicitările înregistrate nu alocă exemplare și nu blochează împrumutarea. Faptul că soluția permite împrumutarea nu este un defect.

Un agent separat oferă încă o ocazie de revizuire, nu o garanție de independență sau corectitudine. Dați-i enunțul sursă și criteriile; evaluați voi ce susține fiecare constatare. Același model poate fi folosit într-o sesiune nouă.

În laboratorul 1, studenții clasifică la fel constatările unei revizuiri, într-un tabel: regula, scenariul și decizia pentru fiecare constatare.
:::

---

# Păstrăm o imagine de ansamblu verificabilă

Cereți o sinteză concisă despre:

- Soluția curentă și limitele ei.
- Deciziile schimbate și motivele schimbării.
- Întrebările și riscurile încă neclarificate.
- Verificările efectuate și ce anume stabilesc.

Apoi urmăriți o afirmație importantă până la cerința, detaliul de proiectare sau verificarea care o susține.

::: notes
Aici se aplică ideea coordonării unei echipe. Studenții nu trebuie să citească fiecare token cu aceeași atenție, dar au nevoie de un model mental al sistemului și de acces la detaliile importante.

Cereți agentului să indice fișierul sau secțiunea pe care se sprijină o afirmație ori să reproducă scenariul din spatele ei. O sinteză fluentă poate omite o condiție; trasabilitatea vă ajută să depistați omisiunea.
:::

---

# Când o ipoteză inițială este greșită

Să presupunem că modelăm titlul și exemplarele sale ca un singur lucru.

Alegerea poate afecta:

- Cum selectează un membru obiectul dorit.
- Ce identifică înregistrarea împrumutului.
- Cum se calculează disponibilitatea.
- Ce consideră un test drept o returnare reușită.

Corectarea ulterioară a conceptului poate impune schimbarea tuturor celor patru.

::: notes
Explicați costul unei erori timpurii urmărindu-i consecințele, nu printr-un multiplicator numeric fără justificare. De aceea investim în cerințe și proiectare înainte de a delega implementarea de amploare.

Dacă verificările ulterioare scot la iveală o problemă, revedeți decizia inițială și actualizați ceea ce depinde de ea.
:::

---

# Corecție locală sau reproiectare?

O propunere stochează o singură stare pentru fiecare titlu:

`available | on_loan | requested`

Cineva adaugă un indicator: `has_request`.

**Exercițiu:** se rezolvă astfel cazul cu două exemplare, unul împrumutat și unul disponibil?

De ce distincție mai are nevoie soluția?

::: notes
Acordați un minut de reflecție individuală, apoi discutați. Indicatorul separă existența solicitării de starea împrumutului, dar propunerea tot nu poate reprezenta exemplare împrumutate independent. Lipsește distincția titlu–exemplar și precizarea exemplarului la care se referă fiecare împrumut.

Ideea de reținut: identificăm cerința încălcată înainte de a alege corecția. O corecție locală poate fi potrivită dacă modelul de bază susține deja cerința. O abstractizare generală nu este automat mai bună.
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

În continuare vom:

- Valida modele prin scenarii și exemple executabile mici.
- Explora stări, invariante, interblocări (deadlocks) și contraexemple.
- Compara abstractizări și șabloane cu nevoile reale de schimbare.
- Înțelege și revizui soluții existente.
- Coordona sarcini delegate și argumenta decizii de proiectare.

Fiecare temă folosește un alt domeniu restrâns.

::: notes
Cursul despre validare include unul sau două diapozitive introductive despre modelarea formală. Vom explica atât cum se obține un rezultat, cât și limitele lui.

Planul este în ../docs/redesign-2026-2027.md. Materialele cursurilor ulterioare sunt reorganizate treptat; această întâlnire tehnică introduce principiile care vor fi aprofundate în cursurile 3–13.
:::

---

# Exercițiu final: explicați o decizie

Fără AI, scrieți trei răspunsuri scurte:

1. De ce distingem un titlu de un exemplar fizic?
2. Ce trebuie să rămână adevărat după un împrumut acceptat?
3. Ce justificare ați cere înainte de a accepta o constatare dintr-o revizuire?

**Cursul următor:** formularea problemei și cerințele.

::: notes
Răspunsuri așteptate: exemplarele au identitate și stare de împrumut independente, iar solicitările privesc titluri; cel mult un împrumut activ pentru fiecare exemplar, cu noul împrumut legat de exemplarul și membrul selectați; o cerință sursă și un scenariu concret sau altă justificare verificabilă.

Acceptați și alte invariante sau justificări, dacă sunt argumentate. „Pentru că așa spune un șablon” sau „agentul a fost de acord” nu sunt argumente suficiente. Folosiți răspunsurile pentru a pregăti întâlnirea următoare; exercițiul nu introduce o nouă regulă de notare a participării.
:::
