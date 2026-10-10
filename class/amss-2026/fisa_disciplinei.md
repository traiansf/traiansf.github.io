---
title: "Fișa disciplinei — Analiza și modelarea sistemelor software"
lang: ro-RO
---

<!--
Sursa datelor din secțiunile 2.4–3.9: planul de învățământ „Master_Informatica_Anii_I_II_2026-2027.pdf”
(Inginerie Software, anul I, sem. I, Ob.12: C 2, S 1, L –, P 1; examen; 6 credite), din folderul
de planuri 2026-2027 indicat pe https://fmi.unibuc.ro/planuri-de-invatamant/.
Conținutul, evaluarea și rezultatele învățării urmează docs/semester-roadmap.md, docs/redesign-2026-2027.md
și proiect/README.md. Rezultatele învățării: Anexa 1 și Anexa 2 pentru masterul Inginerie Software (D6 → R1, R3, R6).
-->

# FIȘA DISCIPLINEI

## 1. Date despre program

| | |
|---|---|
| 1.1. Instituția de învățământ superior | Universitatea din București |
| 1.2. Facultatea | Facultatea de Matematică și Informatică |
| 1.3. Departamentul | Informatică |
| 1.4. Domeniul de studii | Informatică |
| 1.5. Ciclul de studii | Master |
| 1.6. Programul de studii / Calificarea | Inginerie Software |

## 2. Date despre disciplină

| | |
|---|---|
| 2.1. Denumirea disciplinei | Analiza și modelarea sistemelor software |
| 2.2. Titularul activităților de curs | Conf. dr. Traian-Florin Șerbănuță |
| 2.3. Titularul activităților de seminar/laborator/proiect | Conf. dr. Traian-Florin Șerbănuță |
| 2.4. Anul de studiu | I |
| 2.5. Semestrul | I |
| 2.6. Tipul de evaluare | E |
| 2.7. Regimul disciplinei | DOB |

## 3. Timpul total estimat (ore pe semestru al activităților didactice)

| | | | |
|---|---:|---|---:|
| 3.1. Număr de ore pe săptămână | 4 | din care: 3.2. curs | 2 |
| | | 3.3. seminar & laborator & proiect | 2 |
| 3.4. Total ore pe semestru | 56 | din care: 3.5. curs | 28 |
| | | 3.6. seminar & laborator & proiect | 28 |

| Distribuția fondului de timp pentru studiu individual | ore |
|---|---:|
| Studiul după manual, suport de curs, bibliografie și notițe | 30 |
| Documentare suplimentară în bibliotecă, pe platformele electronice de specialitate | 20 |
| Pregătire seminare / laboratoare / proiecte, teme, referate, portofolii și eseuri | 62 |
| Alte activități (pregătirea examenului, consultații) | 12 |

| | |
|---|---:|
| 3.7. Total ore studiu individual | 124 |
| 3.8. Total ore pe semestru | 180 |
| 3.9. Numărul de credite | 6 |

## 4. Precondiții (acolo unde este cazul)

| | |
|---|---|
| 4.1. de curriculum | Cursuri de nivel licență de programare (inclusiv programare orientată pe obiecte) și de ingineria programării |
| 4.2. de competențe | Programare fluentă într-un limbaj de nivel înalt; citirea și scrierea de pseudocod; noțiuni elementare de logică și matematică discretă |

## 5. Condiții (acolo unde este cazul)

| | |
|---|---|
| 5.1. de desfășurare a cursului | Sală de curs, dotată cu calculator, conexiune Internet și videoproiector. Studenții lucrează pe hârtie, individual sau în perechi; prelegerile nu presupun acces la calculator, Internet sau asistenți AI. |
| 5.2. de desfășurare a seminarului/laboratorului/proiectului | Sală de laborator, dotată cu calculatoare, conexiune Internet și videoproiector. Studenții pot folosi un asistent AI ales de ei; nu este necesar un abonament plătit. Fiecare echipă de proiect folosește un repository public pe GitHub sau GitLab. |

## 6. Rezultatele învățării

| | |
|---|---|
| Cunoștințe | R1, R3, R6 |
| Aptitudini | R1, R3, R6 |
| Responsabilitate și autonomie | R1, R3, R6 |

## 7. Conținuturi

### 7.1. Curs

| Conținut | Metode de predare | Observații |
|---|---|---|
| Organizarea disciplinei. De ce analiză și proiectare atunci când există asistenți AI. | Prezentare pe slide-uri; discuție | 1 curs |
| Înțelegerea problemei înainte de delegare: model inițial, responsabilități, contracte, stări, validare prin scenarii, delegare și revizuire. | Exerciții individuale și în perechi pe hârtie; analiza unor exemple AI pregătite | 1 curs |
| Formularea problemei și cerințe: beneficiari, obiective, limite, ipoteze, cerințe de calitate măsurabile, exemple de acceptare. | Exerciții pe hârtie; studiu de caz; discuție | 1 curs |
| Modelarea domeniului: identitate, atribute, relații și reguli ale domeniului, independent de implementare. | Exerciții pe hârtie; compararea unor modele alternative | 1 curs |
| Atribuirea responsabilităților; coeziune și cuplare; efectul unei schimbări de cerință. | Compararea unor variante de proiectare; discuție | 1 curs |
| Contracte și invarianți: precondiții, postcondiții, comportamentul în caz de respingere. | Exemple de stări înainte/după; exerciții pe hârtie | 1 curs |
| Stare și comportament: stări, evenimente, condiții de gardă, efecte, căi excepționale. | Tabele de tranziții; urme de execuție; exerciții | 1 curs |
| Interacțiuni, fluxuri de lucru și limitele sistemului: coordonare, eșecuri parțiale, cereri repetate. | Scenarii de interacțiune; compararea alternativelor de recuperare | 1 curs |
| Validarea și analiza modelelor: proprietăți, stări accesibile, contraexemple, interblocare; introducere în modelarea formală. | Analiza unui model executabil mic și a rezultatelor pregătite | 1 curs |
| Abstractizare și proiectare pentru schimbare: politici variabile, costul abstractizării, rolul șabloanelor de proiectare. | Compararea mai multor soluții sub o schimbare dată | 1 curs |
| Evoluția unui sistem existent: reconstituirea proiectării, analiza impactului, corecție locală versus revizuire structurală. | Studiu de caz; plan de schimbare etapizat | 1 curs |
| Coerență și supraveghere în munca delegată: trasabilitate, criterii de revizuire, verificarea constatărilor pe baza surselor. | Audit al unui pachet de proiectare; discuție | 1 curs |
| Sinteza proiectării și explicarea ei: proiectare independentă, alternative, raționament despre schimbare. | Exerciții individuale și în perechi; discuție | 1 curs |
| Examen grilă bazat pe scenarii; reflecție asupra cursului. | Evaluare scrisă; discuție | 1 curs |

**Bibliografie:**

1. Materialele cursului (prezentări, ghiduri și enunțuri): <https://traiansf.github.io/class/amss2026/>
2. Craig Larman: *Applying UML and Patterns: An Introduction to Object-Oriented Analysis and Design and Iterative Development*, ediția a 3-a, Prentice Hall, 2004.
3. Eric Evans: *Domain-Driven Design: Tackling Complexity in the Heart of Software*, Addison-Wesley, 2003.
4. Bertrand Meyer: *Object-Oriented Software Construction*, ediția a 2-a, Prentice Hall, 1997.
5. Rebecca Wirfs-Brock, Alan McKean: *Object Design: Roles, Responsibilities, and Collaborations*, Addison-Wesley, 2002.
6. Daniel Jackson: *Software Abstractions: Logic, Language, and Analysis*, ediția revizuită, MIT Press, 2012.
7. Michael Jackson: *Problem Frames: Analysing and Structuring Software Development Problems*, Addison-Wesley, 2001.
8. John Ousterhout: *A Philosophy of Software Design*, ediția a 2-a, Yaknyam Press, 2021.
9. David L. Parnas: On the Criteria To Be Used in Decomposing Systems into Modules, *Communications of the ACM* 15(12), 1972, pp. 1053–1058.
10. Leslie Lamport: *Computation and State Machines*, manuscris, 2008.

### 7.2. Seminar

| Conținut | Metode de predare-învățare | Observații |
|---|---|---|
| — | — | Activitățile aplicative se desfășoară ca laborator (7.3) și proiect (7.4). |

### 7.3. Laborator

| Conținut | Metode de transmitere a informației | Observații |
|---|---|---|
| Înțelegere, specificare și revizuire: fapte din enunț, limite, exemple de acceptare, roluri și predarea sarcinilor, decizii umane asupra revizuirii. | Lucru în perechi pe o problemă de dimensiuni reduse; comparație cu un asistent AI; revizuire separată | După cursurile 1–2 |
| Cerințe și modelarea domeniului: clarificări, ipoteze explicite, glosar și model al relațiilor. | Lucru în perechi; revizuire pe baza scenariilor | După cursurile 3–4 |
| Responsabilități, contracte și invarianți: alocarea operațiilor, garanții la succes și la respingere. | Lucru în perechi; compararea a două alocări | După cursurile 5–6 |
| Stare, comportament și interacțiuni: tranziții permise, urme de interacțiune, reîncercări după eșec. | Lucru în perechi; urmărirea manuală a scenariilor | După cursurile 7–8 |
| Validare și abstractizare: proprietăți și limitele verificării, compararea abstractizărilor sub o variație dată. | Verificări pregătite sau urme manuale; comparația soluțiilor | După cursurile 9–10 |

**Bibliografie:**

1. Materialele laboratoarelor și ghidurile de lucru cu asistenți AI: <https://traiansf.github.io/class/amss2026/>
2. Karl Wiegers, Joy Beatty: *Software Requirements*, ediția a 3-a, Microsoft Press, 2013.
3. Eric Evans: *Domain-Driven Design: Tackling Complexity in the Heart of Software*, Addison-Wesley, 2003.
4. Daniel Jackson: *Software Abstractions: Logic, Language, and Analysis*, ediția revizuită, MIT Press, 2012.

### 7.4. Proiect

| Conținut | Metode de transmitere a informației | Observații |
|---|---|---|
| Proiect de echipă (3–5 studenți): formularea problemei și cerințe, modelul domeniului, responsabilități, contracte și invarianți, stare și comportament, verificări și revizuire într-un context separat, cu deciziile documentate într-un dosar de proiectare dintr-un repository public. | Feedback la cerere pe parcursul semestrului; laborator deschis pentru finalizarea proiectului și discuții între echipe | Laboratorul 6 |
| Interviu de susținere a proiectului: clarificarea punctelor neclare din dosarul citit în prealabil de profesor. | Discuție cu echipa pe baza dosarului | Laboratorul 7 |

**Bibliografie:**

1. Cerințele și criteriile de evaluare ale proiectului: <https://traiansf.github.io/class/amss2026/proiect/>
2. Craig Larman: *Applying UML and Patterns*, ediția a 3-a, Prentice Hall, 2004.
3. Rebecca Wirfs-Brock, Alan McKean: *Object Design: Roles, Responsibilities, and Collaborations*, Addison-Wesley, 2002.

## 8. Coroborarea conținuturilor disciplinei cu așteptările reprezentanților comunităților epistemice, asociațiilor profesionale și angajatori reprezentativi din domeniul aferent programului

Disciplina dezvoltă capacitatea de a analiza o problemă necunoscută, de a formula cerințe verificabile și de a construi și justifica o soluție de proiectare: model al domeniului, responsabilități, contracte, invarianți și comportament. Pe măsură ce asistenții AI preiau o parte tot mai mare din producerea codului și a documentației, angajatorii din industria software au nevoie de ingineri care pot stabili ce trebuie construit, pot delega sarcini bine delimitate și pot verifica rezultatele pe baza surselor. Cursul exersează explicit aceste competențe: analiza fără AI, delegarea cu roluri și informații transmise explicit, revizuirea într-un context separat și asumarea deciziilor. Proiectul de echipă, desfășurat într-un repository public, reproduce practicile de colaborare, trasabilitate și revizuire din echipele de dezvoltare. Conținutul pregătește cursurile ulterioare ale programului (arhitectura și testarea sistemelor software) și activitatea de cercetare pentru disertație.

## 9. Evaluare

| Tip activitate | 9.1. Criterii de evaluare | 9.2. Metode de evaluare | 9.3. Pondere din nota finală |
|---|---|---|---:|
| 9.4. Curs | Aplicarea principiilor de analiză și proiectare în scenarii scurte: interpretarea cerințelor, modelarea domeniului, responsabilități și dependențe, contracte și invarianți, stare și comportament, interpretarea rezultatelor validării. | Examen grilă individual, bazat pe scenarii, fără AI | 30% |
| 9.4. Curs | Participarea la cursuri și laboratoare | Prezență, proporțional cu întâlnirile desfășurate | 10% |
| 9.4. Curs | Punct din oficiu | — | 10% |
| 9.5.1. Seminar | — | — | — |
| 9.5.2. Laborator | Exerciții formative, fără notare separată; prezența se contabilizează la 9.4 | — | — |
| 9.5.3. Proiect | Dosarul de proiectare al echipei, pe cinci criterii egale: formularea problemei și cerințe; modelarea domeniului; contracte și invarianți; stare și comportament; responsabilități, coeziune și cuplare. Contribuțiile membrilor trebuie să fie identificabile. | Evaluarea dosarului din repository-ul public, finalizată printr-un interviu de susținere cu echipa | 50% |

La restanță și la mărire, nota este formată din examenul grilă (90%) și punctul din oficiu (10%); punctajele pentru dosar și prezență nu se reportează.

**Standard minim de performanță:**

Nota finală 5 (cinci). Studentul poate analiza o problemă de dimensiuni reduse, poate identifica cerințele și ipotezele ei, poate propune un model al domeniului cu reguli și operații justificate și poate explica efectul unei schimbări de cerință.

| | |
|---|---|
| Data completării | 07.10.2026 |
| Titularul de curs | Conf. dr. Traian-Florin Șerbănuță |
| Data avizării în departament | 13.10.2026 |
| Director de departament | Prof. dr. Alin Ștefănescu |
