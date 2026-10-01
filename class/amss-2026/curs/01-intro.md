---
title: "AMSS 2026/2027 — Cursul 1: Organizare și motivație"
author: "Traian-Florin Șerbănuță"
date: "2026/2027"
lang: ro-RO
---

# Bun venit!

:::::: {.columns align=center}
::: {.column width="32%"}
[![Alăturați-vă echipei cursului pe Microsoft Teams](../static/assets/amss-2026-teams-qr.png){width=100%}](https://teams.cloud.microsoft/l/team/19%3AVxKxx_O-NWeyohdw5ZunUYqv4Ai-s5cSD24U1-3eOZc1%40thread.tacv2/conversations?groupId=9aac9415-9492-4850-9ac4-66f7174fa3e1&tenantId=08a1a72f-fecd-4dae-8cec-471a2fb7c2f1)
:::
::: {.column width="68%"}
**AMSS — Analiza și Modelarea Sistemelor Software**

Traian-Florin Șerbănuță · <traian.serbanuta@unibuc.ro>

Echipa cursului pe Microsoft Teams: scanați codul sau apăsați pe el.

**Codul echipei: fswo4rl**
:::
::::::

::: notes
Urați bun venit studenților de la master. Presupuneți experiență de programare în mai multe paradigme, dar introduceți de la bază vocabularul proiectării. Lăsați-le un moment să intre pe Teams.

Ritm orientativ: 70–80 de minute. Bun venit și obiective 10; organizare și evaluare 20; proiect și unelte 20; motivație și discuție 20; pregătirea întâlnirii următoare 10. Acest curs este administrativ și motivațional. Exemplul tehnic al bibliotecii și demonstrația AI se desfășoară în cursul 2.
:::

---

# Ideea întâlnirii

> „Controlul complexității este esența programării calculatoarelor.”

— **Brian W. Kernighan și P. J. Plauger**

[Sursa: Software Tools (1976); confirmare în raportul NII Shonan nr. 42](https://shonan.nii.ac.jp/docs/No-042.pdf#page=8) · traducere din engleză

::: notes
Original: “Controlling complexity is the essence of computer programming.”

Raport NII, pagina numerotată 7 (pagina PDF 8), rezumatul lui Johan Georg Granström. Sursă secundară academică: citează explicit cartea și ambii autori; nu este o scanare verificată a paginii originale.

Legătura cu tema: Motivația cursului: reducerea complexității prin înțelegere și decizii explicite.
:::

---

# Întrebarea de la care pornim

> Poți explica problema și soluția de proiectare suficient de bine încât să îndrumi pe altcineva să o realizeze?

La finalul cursului, ar trebui să puteți:

- Analiza o problemă mică, nefamiliară.
- Propune o soluție de proiectare și explica alternativele.
- Raționa asupra consecințelor schimbării unei cerințe.
- Îndruma lucrul cu AI și evalua dovezile oferite.

::: notes
Primele trei competențe trebuie demonstrate și fără AI, prin text, schițe, tabele sau pseudocod. Vom preda cunoștințele de proiectare necesare acestor judecăți. Fluența în programare nu oferă automat aceste cunoștințe.
:::

---

# Program și comunicare

- **14 săptămâni de curs** și **7 laboratoare**, de regulă o dată la două săptămâni.
- [Laboratorul 0](https://traiansf.github.io/class/amss2026/lab/Lab00.html): orientare opțională, disponibilă și pentru parcurgere individuală.
- Laboratorul 1 se desfășoară după cursurile 1 și 2.
- Materiale: [traiansf.github.io/class/amss2026](https://traiansf.github.io/class/amss2026/).
- Întrebări și anunțuri: echipa cursului pe Microsoft Teams.
- Consultații: cu programare prin e-mail.

::: notes
Programați fiecare laborator după predarea ambelor cursuri asociate. Întâlnirea imediat după primul curs este Laboratorul 0, opțional; Laboratorul 1 poate avea loc în săptămâna 3, conform orarului grupei. Indicați linkul și codul Teams de pe primul slide. Orele fiecărei grupe se anunță pe canalul cursului.

Primul laborator folosește o problemă de rezervare a sălilor, astfel încât studenții să aplice, după cursul 2, raționamentul învățat într-un alt domeniu. Laboratorul se programează după ambele cursuri ale perechii, nu înainte de cursul 2.
:::

---

# Evaluare: 10 puncte

| Componentă | Puncte |
|---|---:|
| Dosar de proiectare al echipei | 5 |
| Examen grilă individual | 3 |
| Prezență | 1 |
| Din oficiu | 1 |

**Restanță:** 9 puncte pentru examenul grilă + 1 punct din oficiu.

Feedback pentru proiect la cerere, pe parcursul semestrului. Nota pe dosar se definitivează printr-un interviu de echipă la ultimul laborator.

::: notes
Cele cinci puncte ale dosarului acoperă formularea problemei și cerințele, modelarea domeniului, atribuirea responsabilităților, contractele și invariantele, respectiv stările și comportamentul. Dovezile de validare, alternativele și raționamentul despre schimbare susțin aceste criterii. Detaliile sunt pe pagina proiectului.

Examenul grilă folosește scenarii, cerințe, contracte și modele mici date în enunț. Evaluează raționamentul, nu memorarea notațiilor pentru diagrame. Restanța este o cale separată: nouă puncte la examen și un punct din oficiu, fără reportarea punctajelor pentru dosar sau prezență.

La aproximativ 100 de studenți și un singur cadru didactic, organizați discuții scurte cu echipele în laboratoarele existente. Exercițiile individuale fără AI au rol formativ; nu introduceți o notă separată pentru fiecare activitate.
:::

---

# Prezența și pregătirea pentru examen

**Punctajul pentru prezență:** ședințe frecventate ÷ ședințe de curs și laborator desfășurate pentru grupa voastră.

Cursurile și laboratoarele au aceeași pondere: în mod normal, 14 cursuri și 7 laboratoare.

**Pregătiți-vă pentru întrebări bazate pe scenarii:**

- Separați o cerință de o presupunere nejustificată.
- Identificați încălcarea unei invariante sau anticipați o tranziție permisă.
- Comparați soluții de proiectare în raport cu restricțiile date.

::: notes
Folosiți numărul ședințelor efectiv desfășurate, astfel încât anulările să nu scadă punctajul. Numitorul include cursurile comune și laboratoarele grupei studentului, nu toate cele trei grupe. Punctajul este între zero și unu. Dosarul de proiectare se notează o singură dată pentru fiecare echipă, iar examenul grilă individual.
:::

---

# Proiectul de echipă

Echipele de **3–5 studenți** elaborează o soluție comună.

**Livrabil:** o specificație și o soluție de proiectare revizuite. Modelele și prototipurile le pot susține; nu este obligatorie o aplicație funcțională.

Lab 6: lucru deschis la proiect și discuții. Lab 7: interviu de echipă pentru definitivarea notei pe dosar.

Fiecare student trebuie să poată explica:

- Problema și regulile relevante ale domeniului.
- Propria contribuție la proiectare și alternativele ei.
- Cum păstrează contractele și comportamentul regulile.
- Dovezile de validare și limitele lor.
- Impactul unei cerințe noi.

::: notes
Repository-ul public pe GitHub sau GitLab se creează la anunțarea proiectului pe Teams; mesajul include linkul. Progresul și contribuțiile fiecărui membru trebuie să poată fi urmărite pe parcursul semestrului. Dezvoltarea și commit-urile pot fi asistate de AI; echipa verifică și își asumă conținutul. Numărul de commit-uri nu aduce puncte.

Proiectare comună, competențe individuale. Studenții trebuie să înțeleagă suficient din întregul sistem ca să explice unde se încadrează contribuția lor; nu trebuie să memoreze toate detaliile implementării colegilor.

Modelele și prototipurile pot susține argumentarea. Nu este obligatorie o aplicație funcțională. Reprezentările se aleg pentru ceea ce explică; nu există cote obligatorii de diagrame UML sau de șabloane de proiectare (design patterns).
:::

---

# Ce trebuie să rezulte din munca voastră

- O specificație și o soluție de proiectare bine dezvoltate.
- Motivele deciziilor cu consecințe importante.
- Dovezi din scenarii, analiza modelelor sau un prototip cu scop precis.
- Sarcini predate explicit și constatări de revizuire pe care le-ați verificat.
- Capacitatea voastră de a raționa fără AI.

Păstrați dovezile concise și legate de soluția propusă.

::: notes
Dosarul echipei se evaluează o singură dată. Un examen grilă individual, bazat pe scenarii, verifică raționamentul asupra problemelor și soluțiilor furnizate. Exercițiile de la curs antrenează și construirea unei soluții fără AI. Nu reutilizați cerințele vechi privind numărul de diagrame, de șabloane sau de defecte și nici reproducerea rezultatului unui model AI.
:::

---

# Unelte și organizarea lucrului

- Alegeți un asistent și un model AI la care aveți acces.
- Creați un repository public pe GitHub sau GitLab când anunțați proiectul pe Teams; păstrați progresul și contribuțiile membrilor pe tot parcursul semestrului.
- Definiți explicit rolurile de analist/proiectant și evaluator (agent de revizuire).
- Porniți revizuirea într-un context separat, cu sursele necesare.
- Pregătiți-vă să explicați soluția fără asistent.

::: notes
Folosiți tooling/SETUP.md și tooling/README.md. Nu impunem un abonament plătit, un furnizor, un editor, un model sau un nivel de efort anume. Contextele separate pot fi folosite succesiv.

La curs, exemplele pregătite sau lucrul în perechi permit exersarea raționamentului dacă o unealtă nu este disponibilă. Un exemplu pregătit nu trebuie prezentat drept rezultatul unei rulări efectuate de student.
:::

---

# Înainte de laboratorul 1

- Citiți [ghidul de pregătire](https://github.com/traiansf/traiansf.github.io/blob/main/class/amss-2026/tooling/SETUP.md) și [convențiile de lucru](https://github.com/traiansf/traiansf.github.io/blob/main/class/amss-2026/tooling/README.md).
- Pregătiți accesul la asistentul ales și la fișierele comune.
- Veți lucra în perechi, alternând responsabilitățile.
- Veți analiza singuri un enunț scurt înainte de a folosi AI.

Primul livrabil descrie clar problema și deciziile încă neclarificate.

::: notes
Ghidul complet al laboratorului 1 conține datele problemei și exercițiul. Studenții au nevoie de experiență de programare, dar nu de un curs anterior de UML sau proiectare. Nu le cereți să învețe un limbaj de diagrame pentru pregătirea inițială.
:::

---

# De ce studiem analiza și proiectarea?

O implementare poate funcționa exact cum am cerut și totuși să rezolve problema greșită.

- Beneficiarii pot folosi același cuvânt pentru lucruri diferite.
- O decizie locală poate îngreuna schimbările ulterioare.
- Un rezultat convingător are nevoie de dovezi verificabile.

Vom învăța să formulăm întrebări, să comparăm soluții și să explicăm consecințele deciziilor.

::: notes
Cereți un exemplu din experiența studenților: o cerință interpretată diferit sau o modificare aparent mică, dar dificilă. Discutați ce ar fi ajutat înainte de implementare. Nu începeți aici predarea modelelor, contractelor sau diagramelor.
:::

---

# Ce schimbă lucrul cu AI?

AI poate produce rapid variante, documente și cod. Alegerea problemei, verificarea rezultatului și asumarea deciziilor rămân ale voastre.

Vrem să puteți explica de ce o soluție este potrivită și ce dovadă v-ar determina să o revizuiți.

**Discuție:** când ați acceptat un rezultat care părea corect? Cum ați putea să îl verificați mai bine?

::: notes
Invitați experiențe concrete, fără a cere acces la conturi sau conversații private. Alegeți și un exemplu în care asistentul a ajutat. Scopul este motivarea judecății proprii și a învățării principiilor, nu demonstrarea unei greșeli previzibile a modelului.
:::

---

# Cum se leagă întâlnirile?

- Cursul 1: organizarea, așteptările și motivația.
- Cursul 2: înțelegem o problemă înainte să delegăm o soluție.
- Lab 1: aplicăm ideile celor două cursuri la rezervarea sălilor.
- Fiecare laborator urmează perechea de cursuri deja predată.
- Doar Lab 6 și Lab 7 sunt dedicate efectiv proiectelor.

---

# Pentru întâlnirea următoare

Pregătiți accesul la Teams, la materialele cursului și la asistentul ales.

Gândiți-vă la o situație în care o întrebare pusă mai devreme ar fi schimbat soluția propusă.

**Cursul 2:** vom analiza cererea unei biblioteci, vom compara interpretări și vom verifica o soluție propusă cu ajutorul AI.

---

# Experiența și așteptările voastre

:::::: {.columns align=center}
::: {.column width="32%"}
[![Deschideți chestionarul de început de curs](../static/assets/amss-2026-initial-form-qr.png){width=100%}](https://forms.gle/uHCXyFvxqQxsWWmH9)
:::
::: {.column width="68%"}
**[Completați chestionarul de început de curs](https://forms.gle/uHCXyFvxqQxsWWmH9)**

Scanați codul QR sau deschideți linkul: [forms.gle/uHCXyFvxqQxsWWmH9](https://forms.gle/uHCXyFvxqQxsWWmH9).

Ce experiență aveți? Ce știți deja și ce ați vrea să aprofundați?

Completarea este voluntară și durează aproximativ 10–12 minute. Vom folosi răspunsurile pentru adaptarea conținutului.
:::
::::::

::: notes
Invitația se adresează tuturor grupelor. La finalul semestrului vom reveni cu un chestionar despre învățare și îmbunătățiri.
:::
