---
title: "AMSS 2026/2027 — Cursul 7: Stare și comportament"
author: "Traian-Florin Șerbănuță"
lang: ro-RO
state-names: [Ciornă, Trimis, "În evaluare", Acceptat, Respins, Retras]
---

# Ce are voie să se întâmple acum? {.transition}

Aceeași cerere, acceptată ieri, este refuzată azi. Ce s-a schimbat?

::: notes
În cursul 6 am precizat ce promite o operație, inclusiv când refuză. Azi urmărim de ce aceeași operație reușește într-un moment și este refuzată în altul: istoricul manuscrisului, rezumat într-o stare, decide ce evenimente sunt permise acum. Nu adăugăm cerințe noi, ci organizăm promisiunile operațiilor de-a lungul vieții unui obiect.

**Organizare:** minutul 0 din 100; interval 0–15 (15 min), inclusiv coperta, citatul, întrebarea deschisă, problema, exercițiul cu cele șapte evenimente și slide-urile despre stări și tranziții. 35 de slide-uri cu copertă. []{.pace at=0 of=100}
:::

---

# Citatul zilei

> „O mare parte a informaticii se ocupă de mașini de stări.”
>
> Original: “Much of computer science is about state machines.”

— **Leslie Lamport**

[Sursa: Computation and State Machines (2008), p. 1](https://lamport.azurewebsites.net/pubs/state-machine.pdf#page=4)

::: notes
Lamport susține că stările și tranzițiile sunt conceptul comun de sub limbaje și notații diferite. Pentru noi: ciclul de viață al unui manuscris este o mașină de stări, pe care o descriem printr-un tabel de tranziții, fără un limbaj anume. Diagrama de mai târziu este doar o altă reprezentare a aceluiași tabel.

**Sursă:** manuscris pe site-ul autorului, prima propoziție din Introduction, pagina numerotată 1 (pagina PDF 4); formulare reverificată în textul PDF la 12 noiembrie 2026. Vezi `docs/quotations.md`.
:::

---

# O cerere pe care n-ați mai putut-o schimba

Gândiți-vă la o comandă, o cerere de concediu, un bilet, o lucrare trimisă: la un moment dat nu ați mai putut face ceva cu ea (anula, modifica, retrage).

**În ce „stare” era și ce v-ar fi ajutat să știți dinainte? Ați întâlnit o aplicație care vă lăsa să apăsați un buton, dar refuza acțiunea?**

::: notes
Nu căutăm un singur răspuns corect. Pot apărea o comandă care nu se mai anulează după expediere, o lucrare care nu se mai editează după trimitere, un bilet care se anulează cu penalizare, un buton activ care întoarce o eroare. Observăm că utilizatorii vor să știe dinainte ce este permis și că aplicația trebuie să decidă după istoricul cererii, nu după cine apasă. Azi facem explicită această decizie.

**Organizare:** 5 min: întrebare către clasă; notăm câteva exemple, fără să le rezolvăm. []{.pace dur=5}
:::

---

# Un manuscris retras poate fi acceptat?

Un sistem editorial ține evidența manuscriselor trimise unei reviste. **Registrul editorial**, componenta responsabilă, păstrează pentru fiecare manuscris **starea** lui și **datele** înregistrate pe parcurs: fișierul, editorul responsabil, rapoartele de evaluare, decizia.

**Regula convenită cu revista (beneficiarul):** autorul poate retrage manuscrisul trimis cât timp nu are decizie; după retragere, nicio decizie nu mai este posibilă.

Ieri autorul a retras manuscrisul M. Azi editorul apasă „Acceptă”. **Ce trebuie să facă registrul și ce trebuie să rămână înregistrat?**

*Exemplu didactic; registrul nu trimite e-mailuri și nu publică. Lucrăm pe hârtie; toate datele necesare sunt pe slide-uri.*

::: notes
Registrul refuză acceptarea: manuscrisul este retras, iar regula nu permite decizii după retragere. Rămân înregistrate fișierul, editorul, rapoartele deja scrise și data retragerii. Răspunsul depinde de istoricul manuscrisului, nu de butonul apăsat: de aici întrebarea cursului, cum rezumăm istoricul într-o stare care spune ce este permis acum.

**Organizare:** 2 min: întrebare către clasă, așteptăm răspunsul. []{.pace dur=2}
:::

---

# Care evenimente schimbă starea?

**Reguli** (operațiile sunt evenimentele cerute):

- `ataseaza(f)`: autorul atașează fișierul f; numai cât timp manuscrisul este ciornă (netrimis);
- `trimite`: autorul îl trimite revistei; numai pentru o ciornă, dacă există fișier;
- `preia(e)`: editorul e îl preia; numai pentru un manuscris trimis;
- `inregistreaza_raport(r)`: se adaugă raportul r; numai în evaluare;
- `accepta` și `respinge`: editorul decide; numai în evaluare, cu cel puțin un raport;
- `retrage`: autorul îl retrage; numai după trimitere, până la decizie.

Un manuscris nou începe ca ciornă, fără fișier și fără alte date: crearea este starea inițială, nu un eveniment. Un eveniment nepermis este **refuzat**: nimic nu se schimbă.

**Manuscrisul M este în evaluare,** cu editorul E1 și un raport Rp1. Individual, pentru fiecare dintre cele șapte evenimente: **schimbă starea**, **păstrează starea dar înregistrează ceva**, sau **este refuzat**? Apoi discutăm.

::: notes
`accepta` → Acceptat, `respinge` → Respins, `retrage` → Retras: schimbă starea. `inregistreaza_raport(Rp2)` păstrează În evaluare și adaugă raportul. `ataseaza`, `trimite`, `preia` sunt refuzate: nu sunt permise În evaluare. Observăm că răspunsul vine din starea curentă și din reguli, nu din cine cere. Regulile de pe slide sunt rezumatul celor complete, care urmează.

**Organizare:** 6 min: 3 individual, 3 discuție. []{.pace dur=6}
:::

---

# Stare și eveniment

**Starea** descrie valorile relevante la un moment dat. În cursul 6, precondiția unui contract citea starea, iar postcondiția o descria după apel. În ciclul de viață al manuscrisului, **stările** sunt Ciornă, Trimis, În evaluare etc. (numele stărilor sunt scrise mereu astfel); starea, împreună cu datele păstrate (fișier, editor, rapoarte), decide **ce evenimente sunt permise acum**.

Un **eveniment** este ceva ce se întâmplă și contează pentru model; aici, fiecare eveniment este apelul unei operații asupra manuscrisului.

::: notes
Legătura cu cursul 6: starea este aceeași noțiune, valorile de la un moment dat; noutatea este că o rezumăm printr-o stare care spune ce este permis acum, fiindcă istoricul manuscrisului contează. Starea rezumă istoricul; datele rămân alături.
:::

---

# Tranziție, condiție, efect

O **tranziție** spune: din starea curentă, la acest eveniment, dacă **condiția** este îndeplinită, trecem în starea următoare, cu un **efect** asupra datelor.

Un eveniment fără tranziție permisă, sau cu condiția neîndeplinită, este **refuzat**: starea și datele rămân neschimbate.

**Ciclul de viață al manuscrisului** descrie stările și tranzițiile, pornind de la starea inițială și precizând stările finale intenționate. Îl scriem ca tabel de tranziții, îl desenăm ca diagramă de stări și îl verificăm pe scenarii.

::: notes
Legătura cu cursul 6: tabelul descrie cazurile de succes ale contractelor operațiilor; regula refuzului le completează. Starea curentă și condiția formează condiția de succes; starea următoare și efectul sunt postcondiția cazului de succes; refuzul cu starea și datele neschimbate este postcondiția cazului de refuz. Noutatea: condiția de succes depinde de starea din ciclul de viață și de celelalte date, iar tranzițiile se înlănțuie. Nu presupunem clase, enumerări sau un instrument.
:::

---

# Precizăm ciclul de viață {.transition}

Ce evenimente sunt permise în fiecare stare, și cu ce condiție?

::: notes
Citim regulile complete, apoi le scriem ca tabel de tranziții: reprezentarea pe care o verificăm pe scenarii în etapa următoare.

**Organizare:** minutul 15 din 100; interval 15–35 (20 min): reguli 4, tabel 5, condiția și datele 4, exercițiu 7. []{.pace at=15}
:::

---

# Regulile manuscrisului: context, stări, evenimente

| Regulă | Conținut |
|--------|------------------------------------------|
| R1 (context) | Identificatorii sunt cunoscuți; apelurile sunt secvențiale; un singur manuscris pe scenariu. Fără autentificare, concurență, retrimitere sau programarea publicării. |
| R2 (stări) | Exact una dintre Ciornă, Trimis, În evaluare, Acceptat, Respins, Retras. Un manuscris nou este în Ciornă, fără date. |
| R3 (pregătire și trimitere) | `ataseaza(f)` numai în Ciornă: înregistrează f, înlocuind fișierul anterior, dacă există. `trimite` numai în Ciornă și numai cu fișier: trece în Trimis. |
| R4 (evaluare) | `preia(e)` numai în Trimis: editorul e, trece În evaluare. `inregistreaza_raport(r)` numai În evaluare: adaugă raportul, starea rămâne. |

::: notes
Regulile vin de la beneficiar: cine are voie să facă ce și când. Noi le organizăm; nu adăugăm tranziții pe care enunțul nu le cere. Datele de efect (data trimiterii, a retragerii, a deciziei) sunt înregistrate la tranziția respectivă.
:::

---

# Regulile manuscrisului: decizie, retragere, refuz, date

| Regulă | Conținut |
|--------|------------------------------------------|
| R5 (decizie) | `accepta`, `respinge` numai În evaluare și numai cu cel puțin un raport: Acceptat, respectiv Respins. |
| R6 (retragere) | `retrage` numai în Trimis sau În evaluare: Retras. Nu din Ciornă, nu după decizie. |
| R7 (evenimente refuzate) | Fără tranziție permisă sau cu condiția neîndeplinită: refuzat, nimic nu se schimbă. |
| R8 (datele se păstrează) | Fișierul, editorul, rapoartele și decizia nu se șterg. Acceptat, Respins, Retras sunt stări finale intenționate. |

::: notes
R7 și R8 sunt regulile pe care le verificăm la fiecare eveniment refuzat și la fiecare tranziție: nimic nu se modifică la refuz, iar succesul modifică numai datele precizate. În Ciornă, `ataseaza(f)` poate înlocui fișierul; R8 nu impune păstrarea versiunilor anterioare. Stările finale sunt decizia beneficiarului, nu o lipsă a modelului.
:::

---

# Tabelul de tranziții

| Stare curentă | Eveniment | Condiție | Stare următoare | Efect |
|:------------|:------------------------------|:---------------|:-------------|:-----------------|
| Ciornă | `ataseaza(f)` | — | Ciornă | fișier: f |
| Ciornă | `trimite` | există fișier | Trimis | data trimiterii |
| Trimis | `preia(e)` | — | În evaluare | editor: e |
| În evaluare | `inregistreaza_raport(r)` | — | În evaluare | rapoarte: + r |
| În evaluare | `accepta` / `respinge` | cel puțin un raport | Acceptat / Respins | decizia și data ei |
| Trimis, În evaluare | `retrage` | — | Retras | data retragerii |

**Altfel: refuzat**, fără modificări. Schimbarea stării păstrează datele existente.

::: notes
Tabelul este reprezentarea pe care o verificăm. „—” la condiție înseamnă că nu cerem altceva în afară de starea indicată. Un rând descrie un caz de succes: în starea curentă, dacă condiția este adevărată, evenimentul reușește cu starea următoare și efectul. Dacă niciun rând nu se aplică, evenimentul este refuzat. Rândul `inregistreaza_raport` nu schimbă starea, dar este o tranziție: are efect asupra datelor și trebuie să fie permis undeva, altfel nicio decizie nu ar deveni posibilă. Rândurile lipsă nu sunt uitări: ele spun „refuzat”.
:::

---

# Condiția nu este o stare

`trimite` cere un fișier; `accepta` cere un raport. **De ce nu introducem stările „Ciornă cu fișier” și „În evaluare cu raport”?**

Am putea: ar fi alt model corect, cu mai multe stări. Alegem **starea pentru distincția convenită cu beneficiarul** și **condiția pentru verificarea datelor**:

- Ciornă cu sau fără fișier este, pentru revistă, aceeași stare: nu a fost trimis;
- numărul rapoartelor este o dată de care avem nevoie oricum; condiția o citește.

**Legătura cu cursul 6:** starea curentă și condiția formează împreună condiția de succes a evenimentului; refuzul păstrează starea și datele, ca refuzul din contractul atribuirii.

::: notes
Ambele modele descriu aceleași comportamente; diferă prin ce arată. Un tabel cu stări „cu fișier”/„fără fișier” dublează rândurile și ascunde stările în detalii; condițiile păstrează ciclul de viață la șase stări și arată explicit ce date decid. Criteriul nostru: starea grupează situațiile pe care beneficiarul le numește la fel; condiția spune ce verificăm în date. Nu există un număr „corect” de stări.
:::

---

# Ce se păstrează când se schimbă starea

**R8 (datele se păstrează):** fișierul, editorul, rapoartele și decizia nu se șterg la nicio schimbare de stare.

**Înainte:** M În evaluare; fișier f1, editor E1, rapoarte [Rp1].

**Eveniment:** `retrage`.

**După:** M Retras; fișier f1, editor E1, rapoarte [Rp1], data retragerii.

Starea s-a schimbat; datele au rămas, plus una nouă. **De ce contează că Rp1 rămâne?**

::: notes
Raportul face parte din istoricul evaluării: revista poate explica ce s-a întâmplat înainte de retragere. Retrimiterea rămâne în afara enunțului; nu îi presupunem regulile. Starea nu înlocuiește celelalte date: un model care ar șterge rapoartele la retragere ar respecta tranziția din tabel și ar încălca R8. Verificăm, deci, și starea de după, și datele de după, ca la postcondițiile din cursul 6.

**Organizare:** 1 min: întrebare către clasă, din cele 4 ale condiției și datelor. []{.pace dur=1}
:::

---

# Este permis `accepta` acum?

**Reguli:** `accepta` numai În evaluare și numai cu cel puțin un raport; Acceptat, Respins și Retras sunt finale intenționate; un eveniment nepermis este refuzat, fără modificări.

| | Stare | Date | `accepta` este permis? |
|:-|:-----------|:------------------------------|:---------------------|
| 1 | În evaluare | editor E1, rapoarte: niciunul | ? |
| 2 | Trimis | fișier f1, fără editor | ? |
| 3 | În evaluare | editor E1, rapoarte [Rp1, Rp2] | ? |
| 4 | Retras | editor E1, rapoarte [Rp1] | ? |

Individual, apoi discutăm: pentru fiecare refuz, **ce** îl decide: starea sau condiția? În cazul 4, ce rămâne înregistrat după refuz?

::: notes
1: refuzat de condiție (niciun raport). 2: refuzat de stare (Trimis nu permite decizii; nici nu există editor). 3: permis → Acceptat, decizia și data înregistrate. 4: refuzat de stare (Retras este finală intenționată); rămân E1, Rp1 și data retragerii. Refuzul este rezultatul corect, nu un defect de reparat. În cazul 1 se poate înregistra un raport, apoi cere acceptarea; în cazul 4 nu există niciun parcurs permis spre Acceptat.

**Organizare:** 7 min: 3 individual, 4 discuție; ajungem la minutul 35. []{.pace dur=7}
:::

---

# Urmărim ciclul de viață {.transition}

Aceleași evenimente, în altă ordine: același rezultat?

::: notes
Verificăm tabelul pe scenarii: un parcurs normal, o retragere, o decizie după retragere și două ordini ale acelorași evenimente.

**Organizare:** minutul 35 din 100; interval 35–60 (25 min): diagrama 3, S1 5, exercițiul S3–S4 8, două ordini 6, stări finale 3. []{.pace at=35}
:::

---

# Același tabel, desenat

:::::: {.columns align=center}
::: {.column width="52%"}
```mermaid
%%{init: {"theme":"base","themeVariables":{"primaryColor":"#F3F7F8","primaryTextColor":"#0A2145","primaryBorderColor":"#087373","lineColor":"#087373","fontFamily":"Arial","fontSize":"20px"}}}%%
stateDiagram-v2
    direction LR
    accTitle: Ciclul de viață al unui manuscris
    accDescr: Tranzițiile numerotate sunt explicate în tabel. Din Ciornă se trece în Trimis, din Trimis în În evaluare, de unde se ajunge în Acceptat sau Respins; retragerea duce din Trimis sau În evaluare în Retras. Atașarea fișierului și înregistrarea unui raport păstrează starea.
    state "Ciornă" as C
    state "Trimis" as T
    state "În evaluare" as E
    state "Acceptat" as A
    state "Respins" as R
    state "Retras" as W
    [*] --> C
    C --> C: 1
    C --> T: 2
    T --> E: 3
    E --> E: 4
    E --> A: 5
    E --> R: 6
    T --> W: 7
    E --> W: 7
```
:::
::: {.column width="46%"}
| Nr. | Eveniment și condiție |
|:---:|---|
| 1 | `ataseaza(f)` |
| 2 | `trimite`, dacă există fișier |
| 3 | `preia(e)` |
| 4 | `inregistreaza_raport(r)` |
| 5 | `accepta`, cu cel puțin un raport |
| 6 | `respinge`, cu cel puțin un raport |
| 7 | `retrage` |
:::
::::::

Evenimentele refuzate nu sunt desenate. Diagrama arată rapid ce lipsește: din Acceptat, Respins, Retras nu pleacă nimic.

::: notes
Diagrama este reprezentarea tabelului, nu un model suplimentar; efectele asupra datelor nu apar în ea, deci tabelul rămâne referința pentru verificare. Buclele 1 și 4 sunt tranziții care păstrează starea și modifică datele. Notația nu este obligatorie: o diagramă ajută când întrebarea este „de unde se ajunge unde”; tabelul, când întrebarea este „ce se înregistrează”.

**Organizare:** 3 min. []{.pace dur=3}
:::

---

# Scenariul S1 (parcurs normal)

**Din I0:** M în Ciornă, fără date.

| Pas | Eveniment permis | Stare după | Date adăugate |
|:-----|:----------------------------------|:---------------|:---------------------------|
| 1 | `ataseaza(f1)` | Ciornă | fișier f1 |
| 2 | `trimite` | Trimis | data trimiterii |
| 3 | `preia(E1)` | În evaluare | editor E1 |
| 4 | `inregistreaza_raport(Rp1)` | În evaluare | raport Rp1 |
| 5 | `accepta` | Acceptat | decizia și data ei |

**Fișierul precede trimiterea; raportul precede acceptarea.** S1 arată că Acceptat este **accesibil** din I0: există o secvență de evenimente permise care ajunge acolo. Datele adăugate la fiecare pas se păstrează.

::: notes
La fiecare pas sunt îndeplinite cerințele de stare și condiția; datele din coloana finală se adaugă celor existente. O trasare verifică o singură secvență, și justifică accesibilitatea: o stare este accesibilă dacă există cel puțin o secvență de evenimente permise care ajunge la ea.

**Organizare:** 5 min, cu întrebări. []{.pace dur=5}
:::

---

# Retragerea și decizia ulterioară

**Din I0:** M în Ciornă, fără date. În Ciornă putem atașa un fișier, apoi trimite manuscrisul; `trimite` înregistrează data. Din Trimis, `preia(E1)` înregistrează editorul și trece În evaluare, unde putem adăuga rapoarte.

**Reguli:** `retrage` din Trimis sau În evaluare duce în Retras și înregistrează data; `accepta` cere În evaluare și cel puțin un raport. Datele existente se păstrează. Din Retras, orice eveniment este refuzat, fără modificări.

**Scenariul S3 (retragere din evaluare):** din I0, `ataseaza(f1)`, `trimite`, `preia(E1)`, `inregistreaza_raport(Rp1)`, apoi `retrage`.

**Scenariul S4 (decizie după retragere):** continuarea lui S3: `accepta`.

Pe hârtie, apoi discutăm: pentru fiecare pas din S3 și pentru S4, permis sau refuzat, starea și datele de după. **Ce vede editorul la S4 și ce rămâne din munca lui?**

::: notes
S3: primii patru pași ca în S1; `retrage` permis → Retras; date: f1, E1, [Rp1], data trimiterii, data retragerii; fără decizie. S4: `accepta` refuzat (Retras nu permite decizii); starea și datele rămân exact cele de după S3, inclusiv Rp1. Editorul primește un refuz; enunțul nu precizează textul afișat; raportul lui rămâne înregistrat. Este răspunsul la întrebarea de la început.

**Organizare:** 8 min: 3 pe hârtie, 5 discuție. []{.pace dur=8}
:::

---

# Scenariul S6 (două ordini): două rezultate

**Reguli:** `accepta` numai În evaluare, cu cel puțin un raport → Acceptat; `retrage` numai în Trimis sau În evaluare → Retras; Acceptat și Retras sunt finale intenționate; evenimentul nepermis este refuzat.

**Starea de pornire, comună:** M În evaluare, fișier f1, editor E1, rapoarte [Rp1].

| Ordinea | Pasul 1 | Pasul 2 | Stare finală |
|:------|:----------|:----------|:------------|
| (a) | `retrage` | `accepta` | ? |
| (b) | `accepta` | `retrage` | ? |

Aceleași două evenimente. Câte sunt refuzate în fiecare ordine? Care ordine este „corectă”?

::: notes
(a): `retrage` permis → Retras; `accepta` refuzat; final Retras. (b): `accepta` permis → Acceptat; `retrage` refuzat; final Acceptat. În fiecare ordine exact un eveniment este refuzat. Ambele sunt corecte față de reguli; ordinea vine din lume (cine a apăsat primul), iar modelul trebuie să dea un rezultat precis pentru fiecare. Starea finală depinde de ordine tocmai pentru că stările finale nu au ieșiri. Cu apeluri secvențiale, nu există „simultan”; concurența rămâne în afara exercițiului.

**Organizare:** 6 min: 2 individual, 4 discuție. []{.pace dur=6}
:::

---

# Stări finale intenționate

**R8 (datele se păstrează):** Acceptat, Respins și Retras nu au tranziții de ieșire, **prin decizia beneficiarului**: retrimiterea și programarea publicării sunt în afara exercițiului.

| Stare | Are ieșire? | De ce |
|:-------------------|:-------------------------------|:-------------------------------|
| Acceptat | nu | finală intenționată |
| Ciornă, fără fișier | da: `ataseaza(f)` | nu este finală, deși `trimite` este refuzat |
| În evaluare, fără raport | da: `inregistreaza_raport`, `retrage` | nu este finală, deși deciziile sunt refuzate |

Lipsa unei ieșiri este o decizie de notat, nu o omisiune. **Ce ar însemna să permitem `retrage` din Acceptat?**

::: notes
Ar fi altă regulă, cu alte consecințe (un manuscris acceptat retras înainte de publicare), pe care numai beneficiarul o poate stabili; nu o adăugăm pentru simetrie. Distingem „nu mai este nimic de făcut, intenționat” de „nu se mai poate face ce vrem, din greșeală”: etapa următoare arată al doilea caz.

**Organizare:** 3 min; ajungem la minutul 60. []{.pace dur=3}
:::

---

# Căi excepționale {.transition}

Un tabel care arată bine poate ascunde un parcurs imposibil?

::: notes
Verificăm un tabel propus prin trasare: căutăm un parcurs pe care regulile îl interzic, dar tabelul îl permite, și un obiectiv pe care regulile îl cer, dar tabelul nu îl poate atinge. Nu rulăm cod în timpul cursului.

**Organizare:** minutul 60 din 100; interval 60–80 (20 min): tabelul propus 3, exercițiu 8, trei cazuri 4, corecție 3, limite 2. []{.pace at=60}
:::

---

# Tabelul P: exemplu didactic

| Stare curentă | Eveniment | Condiție | Stare următoare |
|:------------------|:----------------------|:-----------------|:--------------|
| Ciornă | `ataseaza(f)` | — | Ciornă |
| Ciornă | `trimite` | — | Trimis |
| Trimis | `preia(e)` | — | În evaluare |
| În evaluare | `accepta` | cel puțin un raport | Acceptat |
| În evaluare | `respinge` | cel puțin un raport | Respins |
| Trimis, În evaluare | `retrage` | — | Retras |

**Altfel: refuzat. Reguli:** trimiterea cere fișier; În evaluare putem înregistra rapoarte; deciziile cer un raport.

::: notes
P are șase rânduri, pare complet și are două abateri față de enunț: `trimite` nu cere fișier, iar rândul `inregistreaza_raport` lipsește, deși deciziile cer un raport. Nu le numim încă; studenții le găsesc prin trasare pe slide-ul următor. P nu este o captură AI.

**Organizare:** 3 min: citim tabelul. []{.pace dur=3}
:::

---

# Ce permite și ce nu permite P?

**P:** în Ciornă, `ataseaza(f)` păstrează starea și înregistrează f, iar `trimite` trece în Trimis fără condiție. `preia(e)` trece din Trimis În evaluare; de aici, `accepta`/`respinge` cer un raport. `retrage` duce din Trimis sau În evaluare în Retras. Restul este refuzat.

**Regulile enunțului:** trimiterea cere fișier; În evaluare putem înregistra rapoarte, necesare deciziilor. **I0:** Ciornă, fără date.

Pe hârtie, apoi discutăm:

1. **Scenariul S2 (trimitere fără fișier):** din I0, `trimite`; extindem apoi verificarea cu `preia(E1)`. Ce stare produce P? Ce cer regulile?
2. Din starea obținută sub P la punctul 1, fără raport, ce evenimente permite P? Găsiți o secvență care duce M în Acceptat sub P sau explicați de ce nu există.
3. Care rând lipsește și care condiție lipsește?

::: notes
1: sub P, `trimite` este permis fără fișier → Trimis, apoi → În evaluare: un manuscris fără fișier ajunge în evaluare, contrar lui R3. 2: din În evaluare, P permite numai `retrage`; `accepta` și `respinge` cer un raport, dar niciun eveniment din P nu înregistrează unul: Acceptat nu este accesibil dintr-o ciornă nouă. 3: lipsesc condiția „există fișier” la `trimite` și rândul `inregistreaza_raport(r)`. Prima abatere permite prea mult; a doua, prea puțin. Trasarea face consecințele concrete; abaterile se pot observa și comparând tabelul cu regulile.

**Organizare:** 8 min: 3 pe hârtie, 5 discuție. []{.pace dur=8}
:::

---

# Interzisă, finală sau inaccesibilă?

Trei cazuri cu nume diferite, pentru că se repară diferit:

| Cazul | Exemplu | Ce înseamnă |
|:--------------------|:-------------------|:------------------------------------|
| **Tranziție interzisă** | `retrage` din Acceptat | regula o refuză; refuzul este corect |
| **Stare finală intenționată** | Acceptat | nicio ieșire, prin decizia beneficiarului |
| **Obiectiv inaccesibil** | Acceptat, sub P | nicio secvență permisă din I0 nu ajunge acolo; P este greșit |

Un **blocaj** este cazul extrem: o stare în care niciun eveniment nu mai este permis, fără să fie finală intenționată. Sub P, În evaluare nu este blocaj (`retrage` rămâne permis), dar obiectivul cerut de reguli este inaccesibil.

::: notes
Aceeași observație, „nu se mai poate face X”, are trei cauze: o regulă (corectă, nu reparăm), o decizie (notată, nu reparăm) sau o greșeală de model (reparăm). Întrebarea de verificare este mereu aceeași: ce cer regulile beneficiarului? Explorarea sistematică a stărilor accesibile și a blocajelor urmează în cursul 9; azi le găsim prin trasare.

**Organizare:** 4 min. []{.pace dur=4}
:::

---

# Corecția noastră

**R3 (pregătire și trimitere):** `trimite` numai în Ciornă și numai cu fișier. **R4 (evaluare):** `inregistreaza_raport(r)` numai În evaluare, starea rămâne.

| Stare curentă | Eveniment | Condiție | Stare următoare | Efect |
|:-------------|:--------------------------------|:-----------|:--------------|:--------------|
| Ciornă | `trimite` | **există fișier** | Trimis | data trimiterii |
| În evaluare | **`inregistreaza_raport(r)`** | — | În evaluare | r se adaugă |

**Reverificăm:** scenariul S2 (trimitere fără fișier) → `trimite` refuzat, M rămâne în Ciornă; scenariul S1 (parcurs normal) → Acceptat accesibil, prin pasul 4.

::: notes
Corecția se justifică prin regulă și scenariu, nu prin simetrie. După corecție, tabelul coincide cu cel din etapa a doua. Reverificăm S2, care trebuie refuzat, și S1, care trebuie să ajungă în Acceptat. S1 nu funcționa sub P: lipsea înregistrarea raportului.

**Organizare:** 3 min. []{.pace dur=3}
:::

---

# Ce stabilește o trasare

**Scenariul S1 (parcurs normal)** arată că Acceptat este accesibil: o secvență ajunge acolo.

**„Niciun manuscris fără fișier nu ajunge În evaluare”** privește **toate** secvențele. O trasare nu o poate stabili; o justificăm din I0: intrarea în Trimis cere fișier, intrarea În evaluare se face numai din Trimis, iar fișierul nu se șterge.

| Afirmație | Ce o susține |
|:-----------------------------------|:------------------------------------|
| o stare este accesibilă | o secvență care ajunge acolo |
| o stare nu este accesibilă | un argument despre toate secvențele |
| o proprietate este adevărată în toate stările accesibile | este adevărată inițial și păstrată de fiecare tranziție |

::: notes
Este aceeași distincție ca în cursul 6 între un exemplu și argumentul pentru toate cazurile. Ultimul rând este invariantul ciclului de viață: un manuscris în Trimis, În evaluare sau cu decizie are fișier, pentru că fiecare tranziție îl păstrează. În cursul 9 explorăm sistematic toate stările accesibile ale unui model de dimensiuni reduse și discutăm ce rămâne în afara explorării.

**Organizare:** 2 min; ajungem la minutul 80. []{.pace dur=2}
:::

---

# Verificăm un ciclu de viață delegat {.transition}

Un tabel propus de altcineva spune tot ce avem nevoie?

::: notes
Analizăm capturi reale, obținute înaintea cursului: Claude Haiku 4.5, prin Claude Code 2.1.322, la 12 noiembrie 2026, fără unelte și fără contextul proiectului. Evaluatorul (agent AI de revizuire) a primit într-un context nou enunțul, sarcina și răspunsul integral. Am rulat câte două încercări și am ales câte una pentru discuție; selecția nu descrie performanța tipică a modelului. Toate încercările sunt în arhiva capturilor. La curs nu rulăm instrumente.

**Organizare:** minutul 80 din 100; interval 80–95 (15 min): sarcină 3, analiză 4, promptul evaluatorului AI 2, revizuire 4, decizie 2. []{.pace at=80}
:::

---

# Ce cerem asistentului AI?

> Propune tabelul de tranziții al manuscrisului: stare curentă, eveniment, condiție, stare următoare și efect asupra datelor. Precizează ce se întâmplă cu un eveniment refuzat și ce date se păstrează la schimbarea stării. Verifică S1–S7 […]. Spune care stări sunt finale intenționate și dacă Acceptat este accesibil dintr-o ciornă nouă. Nu scrie cod. Răspunde în română, în maximum 450 de cuvinte.

**Context:** regulile R1–R8 de mai devreme, integral: evenimentele permise în fiecare stare, condițiile lui `trimite` (fișier) și ale deciziilor (un raport), retragerea din Trimis sau În evaluare, refuzul fără modificări, datele păstrate.

**Date:** I0 = Ciornă fără date; scenariile S1–S7: parcursul normal, trimiterea fără fișier, retragerea din evaluare, decizia după retragere, acceptarea fără raport, cele două ordini, retragerea unei ciorne.

::: notes
Instrucțiunea este cea trimisă efectiv, urmată de enunțul integral; omisiunea marcată din citat este enumerarea cerințelor pentru fiecare scenariu. Un evaluator (agent AI de revizuire) a primit apoi și sarcina exactă, pentru a judeca propunerea față de ce s-a cerut.

**Organizare:** 3 min. []{.pace dur=3}
:::

---

# Ce propune analistul AI?

**Analistul AI — Claude Haiku 4.5, captură din 12 noiembrie 2026; fragmente:**

> | În evaluare | `accepta` | ≥1 raport | Acceptat | Decizie + dată înregistrate; **toate datele anterioare păstrate** |
>
> **S1** (normal): ataseaza(f1)✓→Ciornă, trimite✓→Trimis, preia(E1)✓→ÎnEval, inregistreaza_raport(Rp1)✓→ÎnEval, accepta✓→Acceptat. ✓ **Permis** complet.
>
> **Acceptat accesibil din Ciornă nouă?** **NU.** Singura cale către Acceptat este evenimentul `accepta` din ÎnEval, care necesită ≥1 raport. […] Lanțul este **unic: Ciornă → Trimis → ÎnEval → Acceptat**. Acceptat nu este direct accesibil din Ciornă.

**Reguli:** o stare este accesibilă dacă există o secvență de evenimente permise care ajunge la ea; `accepta` numai În evaluare, cu cel puțin un raport.

**Răspunsul „NU” este susținut de scenariul S1 (parcurs normal) din aceeași propunere?**

::: notes
Tabelul și scenariile S1–S7 din răspunsul integral sunt corecte, inclusiv datele păstrate și stările finale intenționate. Încheierea răspunde însă „NU” la accesibilitatea lui Acceptat, citind „accesibil” ca „într-un singur pas”, deși propria trasare S1 ajunge în Acceptat din I0 și deși lanțul pe care îl descrie este exact o secvență de evenimente permise. În vocabularul nostru, răspunsul corect este „da, prin S1”. Cealaltă analiză păstrată are aceeași lectură, formulată mai prudent („nu este accesibil direct”). Fragmentele sunt fidele; „ÎnEval” este prescurtarea modelului pentru În evaluare.

**Organizare:** 4 min: răspuns individual, apoi discuție. []{.pace dur=4}
:::

---

# Promptul evaluatorului AI

**Evaluator (agent AI de revizuire), context nou:** enunțul, sarcina analistului AI și răspunsul integral; fără observațiile noastre.

**Instrucțiunea exactă, la începutul promptului:**

> Ești evaluator (agent AI de revizuire). Verifică propunerea exclusiv față de enunț și sarcină. Pentru fiecare observație indică fragmentul, regula și un scenariu concret, cu starea de pornire și rezultatul așteptat. Verifică fiecare rând al tabelului de tranziții, condițiile, efectele, evenimentele refuzate, datele păstrate, stările finale intenționate și accesibilitatea lui Acceptat. Confirmă și afirmațiile corecte; nu presupune că trebuie să existe greșeli. Nu scrie cod. Răspunde în română, în maximum 350 de cuvinte.

**Reper:** „accesibil” înseamnă că există o secvență permisă. În scenariul S1 (parcurs normal), propunerea ajunge din Ciornă în Acceptat, dar concluzia spune „NU, inaccesibil”. **Va observa evaluatorul AI contradicția?**

::: notes
Instrucțiunea cere verificarea fiecărui rând și confirmarea afirmațiilor corecte; nu îi semnalăm ce am observat noi și nu îi cerem un număr minim de defecte.

**Sursă:** instrucțiunea integrală din `evaluator-instructiune.md`; intrarea completă în `evaluator-prompt.md`, arhiva din 12 noiembrie 2026.

**Organizare:** 2 min; predicții prin ridicarea mâinii, fără discuție. []{.pace dur=2}
:::

---

# Revizuirea confirmă fiecare fragment

**Evaluatorul AI — Claude Haiku 4.5, captură din 12 noiembrie 2026; fragmente:**

> Propunerea este **corectă și completă**. […]
>
> **S1** (normal): Lanțul Ciornă → Trimis → ÎnEval → ÎnEval → Acceptat este valid; toate evenimentele permise. ✓
>
> **Accesibilitate Acceptat:** NU din Ciornă nouă — argumentul lanțului obligatoriu (Ciornă → Trimis → ÎnEval → Acceptat) este riguros. […] ✓

**Reguli:** o stare este accesibilă dacă există o secvență de evenimente permise care ajunge la ea; scenariul S1 (parcurs normal) este o asemenea secvență.

Evaluatorul AI confirmă S1 și confirmă „NU”. **Cele două confirmări pot fi adevărate împreună? Ce ar fi trebuit să confrunte?**

::: notes
Nu pot: dacă S1 este o secvență validă care ajunge în Acceptat, atunci Acceptat este accesibil. Evaluatorul AI verifică fiecare fragment separat și le confirmă pe toate, fără să le confrunte între ele și fără să întrebe ce înseamnă „accesibil” în sarcină. Cealaltă revizuire păstrată confirmă la fel propunerea („nu sunt observații de corectat”). O revizuire care confirmă totul nu este inutilă: rândurile tabelului chiar sunt corecte; dar verdictul despre accesibilitate rămâne al nostru.

**Organizare:** 4 min: răspunsuri individuale, apoi discuție. []{.pace dur=4}
:::

---

# Decizia noastră

**Păstrăm** din propunere tabelul de tranziții, scenariile S1–S7, datele păstrate și stările finale intenționate: sunt susținute de reguli, cu precizarea că verificăm rezultatele față de enunțul trimis atunci.

**Corectăm** un punct: **Acceptat este accesibil** dintr-o ciornă nouă. Justificarea este chiar scenariul S1 (parcurs normal): cinci evenimente permise, din I0 în Acceptat. „Accesibil” înseamnă „printr-o secvență de evenimente permise”, nu „într-un singur pas”.

**Clarificăm enunțul:** „accesibil din I0” înseamnă că există o secvență de evenimente permise din I0 până la starea căutată. Capturile păstrează formularea inițială; pentru analize viitoare folosim definiția explicită.

::: notes
Verdictul aparține oamenilor și se sprijină pe regulă și scenariu. Corecția nu schimbă tabelul, ci o afirmație despre el; de aceea cerem ca verificările (S1) și concluziile să fie confruntate. Nu cerem ca orice propunere sau revizuire să fie greșită: aceleași verificări ar fi confirmat o concluzie corectă. Ultima observație este o lecție despre enunț, nu despre model.

**Organizare:** 2 min; încheierea etapei la minutul 95. []{.pace dur=2}
:::

---

# Transferăm ciclul de viață {.transition}

Aceleași întrebări, alte reguli.

::: notes
Transferăm metoda de citire a unui ciclu de viață, nu regulile revistei.

**Organizare:** minutul 95 din 100; interval 95–100 (5 min): exercițiu și încheiere. []{.pace at=95}
:::

---

# O comandă la cafenea

**Enunț nou:** o comandă este Plasată, apoi În pregătire, apoi Gata, apoi Ridicată. `anuleaza` este permisă **numai** în Plasată și duce în Anulată. Ridicată și Anulată nu mai permit evenimente. Evenimentele nepermise sunt refuzate, fără modificări; produsele comandate și momentul comenzii se păstrează.

**Înainte:** comanda K este În pregătire, cu două produse.

1. `anuleaza(K)`: permisă sau refuzată? Este o tranziție interzisă sau un rând uitat?
2. Este Ridicată o stare finală intenționată? Dar Gata?
3. **Independent**, o comandă J este Plasată, cu două cafele, la ora 10:15. După `anuleaza(J)`, ce rămâne înregistrat?

::: notes
1: refuzată; interzisă prin regulă, nu uitată, deoarece enunțul spune „numai în Plasată”. 2: Ridicată, da (nu există evenimente după); Gata, nu (urmează ridicarea). 3: Anulată, cu produsele și momentul comenzii păstrate. Regulile se citesc din noul enunț; nu importăm retragerea revistei. La laborator adăugăm interacțiunea cu un serviciu extern și cererile reîncercate, după cursul 8. Feedbackul pentru proiect poate fi cerut oricând.

**Organizare:** 5 min, încheiere la minutul 100. []{.pace dur=5}
:::
