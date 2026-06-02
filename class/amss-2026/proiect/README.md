---
title: "Proiect AMSS 2026"
author: "Traian-Florin Șerbănuță"
date: "2026"
---

# Proiect AMSS 2026

Proiectul de echipă este coloana vertebrală a evaluării: **8 din cele 10 puncte** ale notei finale. Spre deosebire de edițiile anterioare, ceea ce se notează nu este sistemul care rulează, ci **traseul deciziilor de arhitect și critic** — felul în care ai dirijat AI prin ciclul de dezvoltare și ce ai corectat la ce a produs.

> Sistemul nu trebuie să ruleze impecabil. Trebuie să demonstrezi că *tu* ai condus designul și că *tu* poți citi, critica și apăra fiecare artefact.

## Rolul tău: arhitect și critic

Pe tot parcursul proiectului joci două roluri simultan:

- **Arhitect / director.** Conduci AI prin ciclul de dezvoltare software (SDLC) — aduni cerințe, generezi modele, alegi pattern-uri, produci teste și cod.
- **Critic / recenzent.** Citești critic ce produce AI — identifici defectele (fabricație, multiplicități greșite, stări orfane, pattern-uri aplicate decorativ) și propui corecții.

Trei consecințe pe care trebuie să le internalizezi:

1. **AI este unealta implicită, nu o excepție.** Fiecare artefact (cerințe, modele, cod, teste) se generează în mod normal *cu* AI. Valoarea ta este direcția, judecata și corectarea.
2. **Se notează traseul, nu sistemul.** Se evaluează: narativul de design dirijat, setul final de artefacte revizuite și apărarea orală. *Nu* se notează: codul care rulează, rata brută de teste trecute, diagrame desenate de mână.
3. **Implementarea este o pârghie, nu un livrabil.** Bucla de dezvoltare ghidată de teste (TDD) cu AI este obligatorie, dar nota stă în *documentarea* a ceea ce a dezvăluit bucla despre precizia specificației — nu în faptul că livrezi cod care merge.

## Echipă și temă

- Echipe de **3–5 studenți**.
- Tema aleasă până pe **31 octombrie 2026**. Studenții fără echipă/temă la **1 noiembrie** vor fi distribuiți aleator.
- Mai multe echipe pot alege aceeași temă — traseele lor de design dirijat vor diferi oricum. Dacă prea multe echipe aleg exact aceeași temă, unele pot fi rugate să schimbe.

Alegerea se anunță pe canalul cursului, printr-un mesaj al liderului de echipă care conține:

- numele echipei;
- componența echipei;
- numele și o descriere sumară a proiectului (1–2 paragrafe);
- un argument că tema este suficient de complexă, dar nu prea complexă.

## Livrabile per echipă

Toate artefactele, jurnalele și transcripturile trăiesc într-un **repository de proiect** pe organizația de curs (GitHub/GitLab), public în cohortă.

- **Model de ansamblu al sistemului** — o singură diagramă la nivel înalt, pregătită împreună, care arată întregul sistem și cum se încadrează sliceul fiecărui student.
- **Document comun de cerințe** — fiecare cerință trasabilă către unul sau mai multe sliceuri individuale.
- **Prezentare finală** — susținută împreună în săptămâna 14 + Lab 7: fiecare student își prezintă sliceul, iar echipa prezintă ansamblul.

## Livrabile per student

Fiecare student deține un **slice** coerent al sistemului și produce, în repository-ul echipei:

1. **Narativ de design dirijat.** Traseul conversației cu AI / transcriptul agentului care arată cerințele adunate, modelele generate, deciziile luate, prompturile care *nu* au funcționat, output-urile respinse și iterațiile. Jumătatea de *arhitect* făcută vizibilă. *Format: un narativ în markdown cu fragmente de transcript citate — nu un dump brut de chat.*
2. **Defect log.** Problemele prinse în timpul generării cu AI, de-a lungul SDLC: severitate, ce a greșit AI și cum ai corectat. Jumătatea de *critic* făcută vizibilă. *Minim: 5 defecte substanțiale, acoperind atât artefacte structurale, cât și comportamentale.*
3. **Două diagrame UML pentru slice** — una **structurală** (de regulă de clasă) și una **comportamentală** (use case / secvență / stare / activitate), de tipuri diferite. Generate de AI, revizuite și corectate de tine.
   - **Regula „fără diagrame auto-generate" din 2025 este inversată.** Generarea cu AI este acum implicită; *traseul de revizuire* — ce ai schimbat și de ce — este noua dovadă a muncii tale.
4. **Reflecție TDD-cu-AI** (≤ 2 pagini). Rulezi bucla pe cel puțin o caracteristică a sliceului: specificație → AI generează teste → AI generează cod → testele trec/cad → *ce au dezvăluit eșecurile despre specificație*. Codul este un produs secundar; se citește reflecția.
5. **Cel puțin un design pattern** aplicat în slice, cu motivație (echipa, în total, ≥ 2 pattern-uri). **Aplicat, nu doar etichetat** — structura pattern-ului trebuie să fie prezentă, nu doar numele (vezi săptămânile 8–9).

## Apărarea orală (Critică / Raționament / Trasabilitate)

În săptămâna 14, fiecare student susține o **apărare la rece, neasistată** — fără AI în cameră. Aceasta este verificarea de integritate a proiectului și valorează **3 din 8 puncte**. Trebuie să demonstrezi:

- **Critică — Citește și critică pe loc.** Dată orice diagramă UML generată de AI (din repository-ul *oricărei* echipe), identifici defecte, elemente lipsă, relații greșite.
- **Raționament — Articulează raționamentul.** Explici de ce ai dirijat AI într-un anume fel și ce ai acceptat sau respins.
- **Trasabilitate — Apără trasabilitatea.** Navighezi proiectul tău cap-coadă: cerință → use case → clasă → stare/secvență → test.

Cursul din săptămâna 10 (trasabilitate) și cel din săptămâna 12 (prezentare și apărare) te pregătesc direct pentru acest moment; Lab 6 este repetiția la rece.

## Barem (8 puncte)

| Componentă | Puncte | Evaluat pe |
|---|---|---|
| **Apărare orală** (săptămâna 14) | **3** | Critică, raționament și trasabilitate demonstrate *la rece*: citești și critici orice diagramă, articulezi raționamentul sliceului, aperi trasabilitatea. *Verificarea de integritate.* |
| **Narativ de design + defect log** | **2** | Traseul vizibil al muncii de arhitect/critic. Înlocuiește vechea linie „diagrame" — diagramele sunt acum output-uri AI ușoare; contează ce ai *făcut* cu ele. |
| **Calitatea documentației** | **1** | Coerența modelului de ansamblu, trasabilitatea cerințelor, claritatea prezentării, igiena repository-ului. |
| **Design patterns** | **1** | Au fost pattern-urile alese deliberat, sau le-a decorat AI peste cod? Evaluat prin lentila designului dirijat. |
| **Checkpoint decembrie** (Lab 5) | **1** | Poartă de 1 punct; fiecare student face o apărare la rece de 3 minute a progresului sliceului. |

## TDD-cu-AI

Bucla TDD-cu-AI este **obligatorie** pentru cel puțin o caracteristică din sliceul fiecărui student — dar este **explicit în afara baremului**.

De ce obligatorie, dar nenotată: a scrie o specificație testabilă este mai greu decât a scrie una vagă, iar testele generate de AI dintr-o specificație vagă dezvăluie rapid lacunele. Bucla este o pârghie asupra preciziei specificației. Implementarea propriu-zisă se notează la cursul paralel; aici nu re-notăm cod pe ușa din spate.

Se citește **reflecția** (ce a dezvăluit bucla), iar creditul se acordă la linia „narativ de design", nu separat ca o notă de cod.

## Checkpoint (Lab 5, decembrie)

La ultimul laborator înainte de vacanța de iarnă, fiecare student susține o **apărare la rece de 3 minute** a progresului sliceului său, iar echipa prezintă o parte din modelul de ansamblu. Poartă de **1 punct**, păstrată din cursul anterior. Este o repetiție a apărării finale: dacă ți-ai parcurs propriul traseu și ai reparat legăturile rupte, treci curat.

## Cum te pregătesc cursurile și laboratoarele

Proiectul este integrarea întregului semestru — fiecare etapă a SDLC a fost antrenată undeva:

- **Cerințe** — săptămâna 2 + Lab 1 (onboarding unelte + cerințe cu AI).
- **Specificații testabile / TDD** — săptămâna 3.
- **Diagrame structurale** — săptămâna 4 (clasă) + săptămâna 5 (alte vederi) + Lab 2.
- **Diagrame comportamentale** — săptămâna 6 (use case + secvență) + săptămâna 7 (stare + activitate).
- **Critică / red-team** — Lab 3 (structural) + Lab 4 (comportamental).
- **Design patterns** — săptămâna 8 (selecție) + săptămâna 9 (aplicat vs etichetat).
- **Trasabilitate** — săptămâna 10 + checkpoint-ul din Lab 5.
- **Prezentare și apărare** — săptămâna 12 + repetiția din Lab 6.
- **Prezentări finale** — săptămâna 14 + Lab 7.

## Nota finală

8 (proiect) + 1 (prezență) + 1 (din oficiu) = **10**.

## Examen scris (restanță)

Pentru sesiunea de restanțe, examenul scris testează același nivel ca apărarea orală, într-o lucrare scrisă, fără AI în cameră (critică, raționament și trasabilitate, ca la apărarea orală). Vezi `../exam/examen-2026.pdf`.

## Unelte

Toți studenții folosesc aceeași **setare agentică standardizată de curs** (o extensie de editor, un endpoint de model, un fișier de configurare), documentată în repository-ul cursului — vezi `tooling/SETUP.md`. Poți folosi unelte proprii mai puternice peste această bază, dar **artefactele notate trebuie să se reproducă pe setarea canonică**.
