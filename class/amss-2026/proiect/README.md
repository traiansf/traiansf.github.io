---
title: "AMSS 2026/2027 — Proiectul de echipă"
author: "Traian-Florin Șerbănuță"
lang: ro-RO
---

# Proiectul de echipă

Proiectul urmărește **analiza unei probleme și construirea unei soluții de proiectare justificate**. Echipa dezvoltă o specificație și o soluție de proiectare comune, cu contribuțiile membrilor identificabile. Dosarul de proiectare al echipei valorează **5&nbsp;puncte**, iar înțelegerea individuală se evaluează printr-un **examen grilă de 3&nbsp;puncte**. Prezența și punctul din oficiu completează nota până la 10.

La finalul cursului, ar trebui să puteți, fără AI, să analizați o problemă (mică) necunoscută, să propuneți o soluție de proiectare, să explicați alternative și să urmăriți consecințele unei schimbări, folosind text, schițe sau pseudocod. AI vă poate ajuta să explorați și să produceți mai repede; voi răspundeți pentru cerințele, deciziile și rezultatele pe care le acceptați.

## Echipă și temă

- Echipe de **3–5&nbsp;studenți**, cu o soluție de proiectare comună și contribuții individuale identificabile.
- Echipa se anunță odată cu tema, până la **31&nbsp;octombrie&nbsp;2026**. Studenții care la **1&nbsp;noiembrie** nu fac parte dintr-o echipă anunțată vor fi repartizați aleatoriu.
- Mai multe echipe pot alege aceeași temă. Dacă prea multe echipe aleg exact aceeași temă, unele pot fi rugate să o schimbe.

Alegerea se anunță pe canalul Teams al cursului, printr-un mesaj al liderului de echipă, care conține:

- numele echipei și componența ei;
- numele și descrierea proiectului, în 1–2 paragrafe;
- argumente că tema are o dimensiune potrivită;
- **linkul către repository-ul public al proiectului, pe GitHub sau GitLab**.

Repository-ul trebuie să existe și să fie public în momentul în care anunțați proiectul.

Folosiți acest repository pe parcursul întregului semestru, astfel încât din istoricul modificărilor să se vadă progresul și contribuția fiecărui membru. Publicați treptat cerințele, modelele, deciziile, revizuirile și verificările; pentru fiecare contribuție trebuie să se știe cine este autorul. O singură încărcare la final nu arată cum a evoluat proiectul. Pentru părțile lucrate împreună, notați cine a contribuit și ce rol a avut fiecare în deciziile respective. Numărul de commituri nu este un criteriu de notare.

**Puteți folosi AI pentru a dezvolta materialele și pentru a face commituri. Echipa răspunde pentru conținutul publicat, verifică modificările și își asumă cerințele, deciziile și verificările din repository.** Chiar dacă un commit este făcut de un asistent, contribuția membrilor echipei trebuie să rămână identificabilă.

Alegeți o problemă cu reguli, decizii și comportamente care merită analizate. Stabiliți explicit limitele proiectului: o problemă bine delimitată permite o soluție de proiectare argumentată și verificabilă. Împărțiți munca astfel încât fiecare student să contribuie la decizii importante, iar proiectul să rămână coerent ca întreg.

## Parcursul proiectului

Elaborați o **specificație și o soluție de proiectare substanțiale înainte de implementare**. Răspundeți explicit la următoarele întrebări:

1. **Ce problemă rezolvăm?** Identificați beneficiarii, obiectivele, limitele sistemului, cerințele, ipotezele și întrebările deschise. Separați regulile confirmate de propunerile echipei sau ale AI.
2. **Cum înțelegem domeniul?** Definiți conceptele, identitatea, relațiile și regulile care contează. Modelul domeniului poate preceda orice alegere de clase, funcții sau structuri de date.
3. **Ce soluție de proiectare propunem?** Atribuiți responsabilități, descrieți contracte, invarianți și comportamente, apoi justificați limitele și dependențele dintre părți.
4. **Ce verificări susțin proiectarea?** Parcurgeți scenarii normale și excepționale, verificați proprietăți și comparați soluția cu o alternativă plauzibilă. Analizați efectul unei schimbări de cerință.
5. **Ce revizuim înainte de predare?** Cereți o revizuire într-un context separat, verificați constatările și actualizați specificația, proiectarea și sinteza în consecință.

Când treceți de la o etapă la alta, notați ce este stabilit, ce rămâne incert și ce ar putea impune o revizuire. Ce descoperiți mai târziu poate justifica revenirea la o cerință sau la o decizie anterioară.

**Nu sunt obligatorii nici aplicația funcțională, nici ciclul TDD (dezvoltare ghidată de teste).** Puteți folosi modele executabile, simulări, teste sau prototipuri pentru a investiga o întrebare de proiectare. Explicați ce ați verificat, ce ați obținut și care sunt limitele verificării. Dacă implementați un prototip, porniți de la specificația și proiectarea revizuite și urmați apoi succesiunea implementare → teste → revizuire.

## Dosarul de proiectare al echipei&nbsp;— 5&nbsp;puncte

Păstrați dosarul în **repository-ul public de pe GitHub sau GitLab anunțat pe Teams**. Dosarul are o sinteză ușor de parcurs și legături către modelele și verificările care susțin afirmațiile sale. Ca reper, **sinteza are aproximativ două pagini**; detaliile pot rămâne în fișierele către care trimite sinteza.

În sinteză trebuie să se găsească repede problema și limitele proiectului, deciziile principale, justificările, verificările și incertitudinile rămase. Includeți și o scurtă evidență a contribuțiilor membrilor echipei, cu legături către deciziile și materialele la care au lucrat.

<!-- table-class: rubric -->
| Criteriu | Puncte | Ce trebuie să putem verifica |
|-----------------|-----:|--------------------------------------------|
| **Formularea problemei și cerințe** | 1 | Beneficiari, obiective și limite clare; cerințe verificabile; ipoteze și întrebări deschise explicite; exemple de acceptare și efectul schimbării unei cerințe. |
| **Modelarea domeniului** | 1 | Concepte, identități, relații și reguli coerente cu problema; exemple care verifică distincțiile importante; justificarea alegerilor față de alternative. |
| **Contracte și invarianți** | 1 | Obligații și garanții ale operațiilor importante; reguli care trebuie să rămână adevărate; verificări și contraexemple legate de cerințe. |
| **Stare și comportament** | 1 | Comportamente și tranziții permise, condiții și efecte; scenarii normale și excepționale care verifică modelul; concordanță cu regulile domeniului. |
| **Responsabilități, coeziune și cuplare** | 1 | Cine răspunde de fiecare decizie sau comportament important; justificarea grupării responsabilităților, a dependențelor și a interfețelor, prin alternative și prin consecințele unei schimbări. |
| **Total dosar de proiectare** | **5** | Dosarul se evaluează o singură dată pentru echipă. |

Validarea și rezultatele ei, compararea alternativelor și analiza schimbării se evaluează în cadrul celor cinci criterii. Explicați ce arată fiecare verificare și care sunt limitele ei; aceste aspecte fac parte din calitatea fiecărei decizii de analiză sau proiectare.

Alegeți reprezentări potrivite întrebărilor: glosar, exemple, tabel de responsabilități, contracte, tabel de tranziții, schițe, pseudocod, diagrame sau modele executabile. Folosiți identificatori și legături simple pentru a urmări o cerință până la decizia și verificarea ei. **Nu există cote de diagrame UML, de șabloane de proiectare (design patterns) sau de defecte descoperite.** Claritatea, justificarea și coerența contează în evaluare; volumul documentației sau al conversațiilor nu aduce puncte suplimentare.

## Lucrul cu AI și rezultatele revizuirii

Puteți alege instrumentele și modelele AI. Definiți explicit rolurile, de exemplu analist, proiectant și evaluator (agent de revizuire), și ce informații își transmit. Înainte de a delega, formulați voi problema, constrângerile și criteriile după care veți judeca rezultatul.

Includeți o revizuire într-o **sesiune sau într-un context nou**, care primește specificația și proiectarea curente, întrebările de verificat și criteriile de acceptare. Același model poate fi folosit într-un context separat. Agentul de revizuire trebuie să poată examina modelele și verificările, inclusiv atunci când sinteza omite un detaliu important.

Documentați concis o decizie importantă și parcursul revizuirii ei: ce a fost delegat, ce context a fost transmis, ce constatare ați verificat, ce ați acceptat sau respins și de ce. Legați explicația de versiunea relevantă a modelului de proiectare și de un exemplu sau de altă justificare verificabilă. Dacă revizuirea nu găsește un defect, arătați ce s-a verificat și ce concluzie se poate trage; nu inventați greșeli pentru dosar.

Fragmentele de conversație pot susține explicația. O transcriere integrală nu înlocuiește sinteza și raționamentul vostru. Indicați instrumentul și modelul folosite, dacă aveți această informație; se evaluează deciziile și justificarea lor, nu se cere ca textul generat să poată fi reprodus exact. Consultați, de asemenea, [ghidul de pregătire a mediului de lucru](https://github.com/traiansf/traiansf.github.io/blob/main/class/amss-2026/tooling/SETUP.md) și [ghidul despre roluri, predarea sarcinilor și revizuire](https://github.com/traiansf/traiansf.github.io/blob/main/class/amss-2026/tooling/README.md).

## Feedback pe parcursul semestrului și laboratorul deschis

**Echipa poate cere oricând feedback profesorului în timpul semestrului**, prin canalul Teams al cursului sau în cadrul întâlnirilor. Includeți linkul către materialul în cauză din repository și întrebarea pe care doriți să o clarificați. Feedbackul vă ajută să îmbunătățiți dosarul; nu există o evaluare intermediară programată sau un punctaj separat pentru această activitate.

Doar **ultimele două laboratoare** sunt dedicate efectiv proiectului. Laboratoarele 1–5 tratează, prin exerciții pe probleme distincte, teme importante ale cursului: înțelegere, specificare și revizuire (cursurile 1–2); cerințe și modelarea domeniului (3–4); responsabilități, contracte și invarianți (5–6); stări, comportament și interacțiuni (7–8); validare și abstractizare (9–10). Fiecare laborator are loc după predarea celor două cursuri asociate.

**Laboratorul 6 este un laborator deschis:** finalizarea proiectului, întrebări adresate profesorului și discuții între echipe. Folosiți timpul pentru întrebările și revizuirile de care mai are nevoie proiectul vostru; puteți aduce și întrebări generale de proiectare. Laboratorul 6 are loc după cursurile 11–12, iar laboratorul 7, după cursurile 13–14. Nu există o prezentare obligatorie sau o repetiție de susținere.

## Interviul de susținere&nbsp;— ultimul laborator

La **laboratorul 7**, profesorul definitivează punctajul pentru dosarul echipei printr-un **interviu de aproximativ 8&nbsp;minute**, cu întrebări despre aspectele neclare, la care răspunde echipa. Dosarul din repository-ul public trebuie definitivat cu aproximativ o săptămână înainte de interviu, ca să poată fi citit; termenul exact și programarea echipelor vor fi anunțate pe Teams.

Discuția pornește de la dosarul citit de profesor. Echipa poate consulta repository-ul și poate arăta, pentru clarificare, cerințele, deciziile, contribuțiile și verificările în cauză. Nu trebuie să pregătiți o prezentare sau diapozitive.

Profesorul stabilește punctajul final de echipă pe **cele cinci criterii ale dosarului**, ținând cont de clarificările din interviu. Interviul nu are punctaj separat. Întrebările sunt adresate echipei; nu se organizează o examinare orală distinctă pentru fiecare student.

## Examen grilă individual&nbsp;— 3&nbsp;puncte

Examenul verifică, individual și fără AI, cum aplicați principiile de analiză și proiectare în **scenarii scurte**. Întrebările urmăresc interpretarea cerințelor, modelarea domeniului, responsabilitățile și dependențele, contractele și invarianții, starea și comportamentul, precum și rezultatele validării.

Pregătiți-vă să identificați o ipoteză nejustificată, să comparați variante de proiectare, să interpretați un contraexemplu sau să urmăriți efectele unei schimbări. Se evaluează raționamentul aplicat situației descrise; nu există întrebări care cer memorarea detaliilor unei notații. Formatul detaliat și condițiile de organizare vor fi anunțate separat.

## Nota finală

| Componentă | Puncte | Nivel de evaluare |
|---|---:|---|
| Dosar de proiectare | 5 | Echipă |
| Examen grilă | 3 | Individual |
| Prezență | 1 | Individual |
| Din oficiu | 1 | Individual |
| **Total** | **10** | |

Pentru dosar se acordă un punctaj de echipă; examenul grilă și prezența se contabilizează individual.

Punctul de prezență se acordă proporțional cu participarea la **cursuri și laboratoare**, fiecare întâlnire având aceeași pondere:

**Punctaj prezență = numărul întâlnirilor la care ați participat / numărul total al întâlnirilor desfășurate și contabilizate.**

Pentru 14&nbsp;cursuri și 7&nbsp;laboratoare, numitorul este 21. Cursul&nbsp;14, cu examenul și reflecția, se contabilizează ca oricare alt curs. Laboratorul&nbsp;0 se contabilizează pentru grupele în care s-a ținut, iar pentru ele numitorul este 22. Întâlnirile anulate nu intră în numitor; acesta reflectă întâlnirile efectiv desfășurate și contabilizate pentru grupa voastră.

La restanță sau la mărire, nota se calculează astfel: **9&nbsp;puncte pentru examenul grilă + 1&nbsp;punct din oficiu = 10**. Examenul urmărește aceleași competențe de analiză și proiectare. Punctajele pentru dosarul de proiectare și pentru prezență nu se reportează în această notă.
