# Analiză: Responsabilități și Dependențe pentru Estimarea Costului Expedierii

## Responsabilități Principale

Fluxul estimării se descompune în patru responsabilități distincte:

1. **Interpretare intrării** – fiecare canal (web, ghișeu) convertește textul utilizatorului în date structurate (masă: întreg, ambalaj: tip). Această responsabilitate este **locală canalului**, pentru că textele și formatele diferă între interfețe.

2. **Validare date** – aplicarea regulilor R2 și R3. Deoarece sunt identice în ambele canale (conform R5), această responsabilitate ar trebui **partajată**, nu duplicată.

3. **Calcul preț** – aplicarea regulii R4 pentru colete acceptate. Și aceasta este **partajată** între canale.

4. **Formatare răspuns** – prezentarea rezultatului (preț, refuz, motiv). Responsabilitate **locală canalului** (texte și aspect diferite).

## Dependențele Critice

- Validarea depinde de interpretare reușită.
- Calcul depinde de validare pozitivă (acceptare).
- Răspunsul depinde de etapele anterioare, dar nu de ordinea lor logică.

**Riscul principal:** Regulile R2, R3, R4 sunt **copiate în două interfețe**. Orice modificare trebuie replicată în ambele locuri; inconsistența (o regulă aplicată diferit) violează R5. Această dependență ascunsă între canale nu apare în codul fiecărui canal, dar o afectează pe amândouă.

## Verificarea Scenariilor S1–S5

| Scen. | Masă | Ambalaj | R2? | R3? | R4 | Rezultat | Corect? |
|-------|------|---------|-----|-----|-----|----------|---------|
| S1 | 1000g | plic | ✓ | ✓ | 10 lei | Acceptat, 10 lei | ✓ |
| S2 | 1001g | plic | ✓ | ✗ (plic > 1000g) | — | Refuz | ✓ |
| S3 | 1001g | cutie | ✓ | ✓ | 18 lei | Acceptată, 18 lei | ✓ |
| S4 | 0g | cutie | ✗ (< 1) | — | — | Refuz | ✓ |
| S5a | 5000g | cutie | ✓ | ✓ | 18 lei | Acceptată, 18 lei | ✓ |
| S5b | 5001g | cutie | ✗ (> 5000) | — | — | Refuz | ✓ |

Toate scenariile respectă regulile. Ordinea verificării (R2 înainte de R3) nu afectează rezultatul – ambele refuzuri ajung la răspunsul corect.

## Concluzie

Responsabilitatea de validare și calcul trebuie **centralizată logic** (nu duplicată în cod), pentru a respecta R5 și a minimiza riscul de evoluție inconsistentă. Canalele rămân responsabile doar pentru interpretare și formatare răspunsului.