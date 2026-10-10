# Evaluare propunere — Model de domeniu arhiva fotografică

## Observații

### 1. **Contradicție în descrierea structurii versiunilor**

**Fragmentul problemă:** 
> „Fiecare Fotografie definește o pădure de versiuni cu rădăcina în original. Doi copaci independenți (V3 și V4 din V1) nu sunt definiți; modelul permite orice configurație DAG."

**Problemă:** Afirmația mescheaza concepte. O **pădure** este o colecție de copaci **disjuncți**; un **DAG** (graph aciclic orientat) permite noduri cu mai mulți părinți și configurații arbitrare. În S3, V3 și V4 nu sunt „doi copaci independenți" — sunt două noduri la același nivel în același arbore, ambii cu sursă V1. Aceasta contrazice definiția de pădure și este confuza cu „orice DAG".

**Relevanță:** R4 permite ramificări (aceeași sursă, mai mulți descendenți) și forează ca rădăcina să fie originalul. Structura e mai precisă ca „arbore rooted" (care e caz special de DAG), nu pădure.

---

### 2. **Alegeri de reprezentare neclare pentru original**

**Fragmentul:** 
> „Unicitatea originalului: Fiecare Fotografie are exact o Versiune fără Sursă."

**Observație:** Propunerea oferă două alegeri în secțiunea finală (flag vs. relație dedicată), dar nu clarifica cum sistemul **garantează** această unicitate — aceasta e o restricție pe întreg arhiva, nu doar pe o fotografie. Alegerea impactează:
- Validarea la catalogare (R3): se creează automat original?
- Integritate: cine previne stergerea accidentala a originalului?

**Relevanță:** R3 și R2 cerin ca fiecare fotografie sa aibă **exact** un original. Reprezentarea trebuie sa forțeze, nu sa permit încălcarea.

---

### 3. **Omisiune: Timpul relativ și ordinea operațiilor**

**Context:** R5 spune „Operațiile sunt tratate pe rând" și R4 precizeaza „Sursa trebuie să există înainte".

**Observație:** Modelul de domeniu nu adresează explicit ordinea: când se creează V3 din V1, cum sistemul confirma ca V1 exista deja? Aceasta e mai mult o cerință de consistență temporală decât o alegere de reprezentare, dar modelul ar putea sa clarifice ca relația sursă implica o precedență cauzala.

**Relevanță:** R4, R5 — necesara pentru a evita referințe circulare și invalidarea retroactiva.

---

### 4. **Corectitudine generala**

**Puncte validate:**
- Legenda ca atribut separat (R1, R5): ✓ Corect, nu afecteaza identitatea.
- Relația N:1 (Versiune → Fotografie) cu invariant (cel puțin o Versiune): ✓ Corect (R2).
- Derivare recursiva cu coerenția: ✓ Corect (R4). S1–S4 sustin regulile.

---

## Concluzie

Modelul satisface principalele cerințe (R1–R5) și explicațiile S1–S4 sunt solide. Punctele slabe sunt prezentarea (pădure vs. DAG) și detalierea mecanismelor de garantare a unicității originalului. Propunerea ar putea fi întarită prin: (a) clarificarea precisa ca structura e „arbore rooted", nu pădure; (b) explicarea cum restricțiile se aplica la nivel de sistem, nu doar conceptual.