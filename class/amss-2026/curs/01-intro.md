---
title: "AMSS 2026/2027 — Cursul 1: Organizare și motivație"
author: "Traian-Florin Șerbănuță"
lang: ro-RO
---

# Bun venit!

:::::: {.columns align=center}
::: {.column width="40%"}
[![Alăturați-vă echipei cursului pe Microsoft Teams](../static/assets/amss-2026-teams-qr.png){width=100%}](https://teams.cloud.microsoft/l/team/19%3AVxKxx_O-NWeyohdw5ZunUYqv4Ai-s5cSD24U1-3eOZc1%40thread.tacv2/conversations?groupId=9aac9415-9492-4850-9ac4-66f7174fa3e1&tenantId=08a1a72f-fecd-4dae-8cec-471a2fb7c2f1)
:::
::: {.column width="56%"}
**AMSS — Analiza și Modelarea Sistemelor&nbsp;Software**

Traian-Florin Șerbănuță\
<traian.serbanuta@unibuc.ro>

Echipa cursului pe Microsoft Teams: scanați codul QR sau apăsați pe el.

**Codul echipei: `fswo4rl`**
:::
::::::

::: notes
Urați bun venit studenților de la master. Porniți de la premisa că au experiență de programare în mai multe paradigme, dar introduceți de la zero vocabularul proiectării. Lăsați-le un moment să intre pe Teams.

Ritm orientativ: 70–80 de minute. Bun venit și obiective 10; organizare și evaluare 20; proiect și unelte 20; motivație și discuție 20; pregătirea întâlnirii următoare 10. Acest curs este administrativ și motivațional. Exemplul tehnic cu biblioteca și demonstrația AI rămân pentru cursul 2.
:::

---

# Citatul zilei

> „Controlul complexității este esența programării calculatoarelor.”
>
> Original: “Controlling complexity is the essence of computer programming.”

— **Brian W. Kernighan și P. J. Plauger**

[Sursa: Software Tools in Pascal (1981), p. 311](https://seriouscomputerist.atariverse.com/media/pdf/book/Software%20Tools%20in%20Pascal.pdf#page=320)

::: notes

Legătura cu tema: Motivația cursului: reducerea complexității prin înțelegere și decizii explicite.
:::

---

# Întrebarea de la care pornim

> Poți explica problema și soluția de proiectare suficient de bine încât să îndrumi pe altcineva să o realizeze?

La finalul cursului, ar trebui să puteți:

- analiza o problemă (mică) necunoscută;
- propune o soluție de proiectare și explica alternativele;
- urmări consecințele schimbării unei cerințe;
- îndruma lucrul cu AI și evalua justificările pe care le oferă.

::: notes
Primele trei competențe trebuie demonstrate și fără AI, prin text, schițe, tabele sau pseudocod. Cursul predă cunoștințele de proiectare de care e nevoie pentru aceste judecăți; ele nu vin automat odată cu experiența de programare.
:::

---

# Program și comunicare

:::::: {.columns align=center}
::: {.column width="70%"}
- **14&nbsp;săptămâni de curs** și **7&nbsp;laboratoare**, de regulă o dată la două săptămâni.
- [Laboratorul 0](https://traiansf.github.io/class/amss2026/lab/Lab00.html): orientare opțională, care poate fi parcursă și individual.
- Laboratorul 1 se desfășoară după cursurile 1 și 2.
- Materiale: [traiansf.github.io/class/amss2026](https://traiansf.github.io/class/amss2026/) (codul&nbsp;QR alăturat).
- Întrebări și anunțuri: echipa cursului pe Microsoft Teams.
- Consultații (online): cu programare prin mesaj individual pe MS Teams.
:::
::: {.column width="26%"}
[![Deschideți pagina cursului](../static/assets/amss-2026-site-qr.png){width=100%}](https://traiansf.github.io/class/amss2026/)
:::
::::::

::: notes
Programați fiecare laborator după predarea ambelor cursuri asociate. Întâlnirea imediat după primul curs este Laboratorul 0, opțional; Laboratorul 1 poate avea loc în săptămâna 3, conform orarului grupei. Arătați linkul și codul Teams de pe primul slide. Orele fiecărei grupe se anunță pe canalul cursului.

Primul laborator folosește o problemă de programare a mașinilor de spălat dintr-un cămin, astfel încât studenții să aplice, după cursul 2, raționamentul învățat într-un alt domeniu. Laboratorul se programează după ambele cursuri ale perechii, nu înainte de cursul 2.
:::

---

# Evaluare: 10 puncte

| Componentă | Puncte |
|---|---:|
| Dosar de proiectare al echipei | 5 |
| Examen grilă individual | 3 |
| Prezență | 1 |
| Din oficiu | 1 |

**Restanță / mărire:** 9&nbsp;puncte pentru examenul grilă + 1&nbsp;punct din oficiu.

Feedback pentru proiect la cerere, pe parcursul semestrului. Punctajul pentru dosar se definitivează printr-un interviu de echipă la ultimul laborator.

::: notes
Cele cinci puncte ale dosarului acoperă formularea problemei și cerințele, modelarea domeniului, atribuirea responsabilităților, contractele și invariantele, respectiv starea și comportamentul. Rezultatele validării, alternativele analizate și argumentarea efectelor unei schimbări susțin aceste criterii. Detaliile sunt pe pagina proiectului.

Examenul grilă folosește scenarii, cerințe, contracte și modele mici date în enunț. Evaluează raționamentul, nu memorarea notațiilor pentru diagrame. Restanța și mărirea urmează o cale separată: nouă puncte la examen și un punct din oficiu, fără reportarea punctajelor pentru dosar sau prezență.

Cu aproximativ 100 de studenți și un singur cadru didactic, organizați discuții scurte cu echipele în laboratoarele existente. Exercițiile individuale fără AI au rol formativ; nu introduceți o notă separată pentru fiecare activitate.
:::

---

# Prezența și pregătirea pentru examinare

**Punctajul pentru prezență:** întâlniri la care ați participat ÷ întâlniri de curs și laborator desfășurate pentru grupa voastră.

Fiecare întâlnire, de curs sau de laborator, are aceeași pondere; în mod normal sunt 14&nbsp;cursuri și 7&nbsp;laboratoare.

**Pregătiți-vă pentru întrebări bazate pe scenarii:**

- Separați o cerință de o ipoteză nejustificată.
- Identificați încălcarea unui invariant sau stabiliți ce tranziție este permisă.
- Comparați soluții de proiectare în raport cu constrângerile date.

::: notes
Folosiți numărul ședințelor efectiv desfășurate, astfel încât anulările să nu scadă punctajul. Numitorul include cursurile comune și laboratoarele grupei studentului, nu toate cele trei grupe. Punctajul este între zero și unu. Dosarul de proiectare se notează o singură dată pentru fiecare echipă, iar examenul grilă individual.
:::

---

# Proiectul de echipă

Echipele de **3–5&nbsp;studenți** elaborează o soluție comună.

**Livrabil:** o specificație și o soluție de proiectare revizuite. Modelele și prototipurile le pot susține; nu este obligatorie o aplicație funcțională.

Laboratorul 6 (laborator deschis): finalizarea proiectului și discuții. Laboratorul 7: interviu de echipă, în care se definitivează punctajul pentru dosar.

Livrabilul (repository public) trebuie să fie definitivat cu ~1 săptămână înainte de interviu.

**Pagină cu detalii:** [traiansf.github.io/class/amss2026/proiect](https://traiansf.github.io/class/amss2026/proiect).

::: notes
Repository-ul public pe GitHub sau GitLab se creează la anunțarea proiectului pe Teams; mesajul include linkul. Progresul și contribuțiile fiecărui membru trebuie să poată fi urmărite pe parcursul semestrului. Dezvoltarea și commit-urile pot fi asistate de AI; echipa verifică și își asumă conținutul. Numărul de commit-uri nu aduce puncte.

Modelele și prototipurile pot susține argumentarea. Nu este obligatorie o aplicație funcțională. Reprezentările se aleg pentru ceea ce explică; nu există cote obligatorii de diagrame UML sau de șabloane de proiectare (design patterns).
:::

---

# Ce trebuie să poată explica fiecare student

- Problema și regulile domeniului care o privesc.
- Propria contribuție la proiectare și alternativele ei.
- Cum sunt respectate regulile prin contracte și comportament.
- Rezultatele validării și limitele lor.
- Ce schimbă o cerință nouă.

::: notes
Proiectare comună, competențe individuale. Studenții trebuie să înțeleagă suficient din întregul sistem ca să explice unde se încadrează contribuția lor; nu trebuie să memoreze toate detaliile implementării colegilor.
:::

---

# Ce trebuie să rezulte din munca voastră

- O specificație și o soluție de proiectare elaborate temeinic.
- Motivele deciziilor cu consecințe importante.
- Verificări prin scenarii, prin analiza modelelor sau printr-un prototip cu scop precis.
- Sarcini predate explicit și constatări de revizuire pe care le-ați verificat.
- Capacitatea de a judeca singuri, fără AI.

Prezentați verificările concis și legați-le de soluția propusă.

::: notes
Dosarul echipei se evaluează o singură dată. Un examen grilă individual, bazat pe scenarii, verifică felul în care studenții judecă probleme și soluții date în enunț. Exercițiile de la curs antrenează și construirea unei soluții fără AI. Nu reluați vechile cerințe privind numărul de diagrame, de șabloane sau de defecte și nici pe cea de a reproduce rezultatul unui model AI.
:::

---

# Instrumente și organizarea lucrului

- Alegeți un asistent și un model AI la care aveți acces.
- Creați un repository public pe GitHub sau GitLab când anunțați proiectul pe Teams; consemnați acolo progresul și contribuțiile membrilor, pe tot parcursul semestrului.
- Definiți explicit rolurile de analist/proiectant și evaluator (agent de revizuire).
- Porniți revizuirea într-un context separat, cu sursele necesare.
- Pregătiți-vă să explicați soluția fără asistent.

::: notes
Folosiți tooling/SETUP.md și tooling/README.md. Nu impunem un abonament plătit, un furnizor, un editor, un model sau un nivel de efort anume. Contextele separate pot fi folosite succesiv.

Dacă o unealtă nu este disponibilă, la curs se poate exersa pe exemple pregătite sau în perechi. Un exemplu pregătit nu trebuie prezentat drept rezultatul unei rulări efectuate de student.
:::

---

# Înainte de laboratorul 1

- Citiți [ghidul de pregătire a mediului de lucru](https://github.com/traiansf/traiansf.github.io/blob/main/class/amss-2026/tooling/SETUP.md) și [ghidul despre roluri, predarea sarcinilor și revizuire](https://github.com/traiansf/traiansf.github.io/blob/main/class/amss-2026/tooling/README.md).
- Pregătiți accesul la asistentul ales și la fișierele comune.
- Veți lucra în perechi, alternând rolurile.
- Veți analiza singuri un enunț scurt înainte de a folosi AI.

Primul livrabil descrie clar problema și deciziile rămase deschise.

::: notes
Ghidul complet al laboratorului 1 conține datele problemei și exercițiul. Studenții au nevoie de experiență de programare, dar nu de un curs anterior de UML sau proiectare. Nu le cereți să învețe un limbaj de diagrame ca pregătire.
:::

---

# De ce studiem analiza și proiectarea?

O implementare poate să funcționeze exact cum am cerut și totuși să&nbsp;rezolve problema greșită.

- Beneficiarii pot folosi același cuvânt pentru lucruri diferite.
- O decizie locală poate îngreuna schimbările ulterioare.
- Un rezultat convingător trebuie să poată fi verificat.

Vom învăța să formulăm întrebări, să comparăm soluții și să explicăm consecințele deciziilor.

::: notes
Cereți un exemplu din experiența studenților: o cerință interpretată diferit sau o modificare aparent mică, dar dificilă. Discutați ce ar fi ajutat înainte de implementare. Nu începeți aici predarea modelelor, contractelor sau diagramelor.
:::

---

# Ce schimbă lucrul cu AI?

AI poate produce rapid variante, documente și cod. Alegerea problemei, verificarea rezultatului și asumarea deciziilor rămân ale voastre.

Vrem să puteți explica de ce o soluție este potrivită și ce constatare v-ar determina să o reconsiderați.

**Discuție:** când ați acceptat un rezultat care părea corect? Cum ați putea să îl verificați mai bine?

::: notes
Încurajați studenții să povestească situații concrete, fără a le cere acces la conturi sau conversații private. Alegeți și un exemplu în care asistentul a ajutat. Scopul este să-i motivați să judece singuri și să învețe principiile, nu să demonstrați o greșeală previzibilă a modelului.
:::

---

# Cum se leagă întâlnirile?

- Cursul 1: organizarea, așteptările și motivația.
- Cursul 2: înțelegem o problemă înainte să delegăm o soluție.
- Laboratorul 1: aplicăm ideile celor două cursuri unei probleme concrete.
- Fiecare laborator are loc după perechea de cursuri asociată.
- Doar laboratoarele 6 și 7 sunt dedicate proiectelor.

---

# Pentru întâlnirea următoare

Pregătiți accesul la Teams, la materialele cursului și la asistentul ales.

Gândiți-vă la o situație în care o întrebare pusă mai devreme ar fi schimbat soluția propusă.

**Cursul 2:** o bibliotecă ne cere un terminal pentru împrumutul și returnarea cărților. Vom analiza cererea, vom compara interpretări ale ei și vom verifica o soluție propusă de un asistent AI.

---

# Experiența și așteptările voastre

:::::: {.columns align=center}
::: {.column width="30%"}
[![Deschideți chestionarul de început de curs](../static/assets/amss-2026-initial-form-qr.png){width=100%}](https://forms.gle/uHCXyFvxqQxsWWmH9)
:::
::: {.column width="66%"}
**[Completați chestionarul de început de curs](https://forms.gle/uHCXyFvxqQxsWWmH9)**

Scanați codul QR sau deschideți linkul: [forms.gle/uHCXyFvxqQxsWWmH9](https://forms.gle/uHCXyFvxqQxsWWmH9).

Ce experiență aveți? Ce știți deja și ce ați vrea să aprofundați?

Completarea este facultativă și durează aproximativ 10–12&nbsp;minute. Vom folosi răspunsurile pentru adaptarea conținutului.
:::
::::::

::: notes
Invitația se adresează tuturor grupelor. La finalul semestrului vom reveni cu un chestionar despre învățare și îmbunătățiri.
:::
