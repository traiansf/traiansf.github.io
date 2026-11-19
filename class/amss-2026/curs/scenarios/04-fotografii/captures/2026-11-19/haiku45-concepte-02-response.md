# Arhiva Fotografică — Concepte și Relații

## Entități

**Fotografie** — entitate cu identificator stabil și atribut legendă (modificabil fără a crea o nouă fotografie). 

**Versiune** — entitate cu identificator unic și conținut imutabil. Fiecare versiune aparține exact unei fotografii și are o identitate permanentă în arhivă.

## Relații și Cardinalitate

**1. Fotografie ↔ Versiune: 1:N (obligatoriu)**
- O fotografie conține cel puțin o versiune și poate conține mai multe.
- Fiecare versiune aparține exact unei fotografii.

**2. Versiune Original: 1:1 (strict pe Fotografie)**
- Fiecare fotografie are exact un original, creat la catalogare.
- Originalul nu are o versiune-sursă în arhivă.

**3. Versiune ↔ Versiune (relația „derivă din"): 0..1 : 0..N**
- Versiunile non-originale sunt derivate; fiecare are exact o sursă (relație intrinsecă fotografiei).
- O versiune-sursă poate genera mai multe versiuni derivate distincte.
- Nu forțează un lanț liniar — două versiuni pot avea aceeași sursă (S3).

## Principii Structurali

- **Atributul legendă** aparține fotografiei, nu versiunilor. Modificarea legendei nu creează versiuni noi.
- **Derivarea** (editare) rămâne în cadrul aceleiași fotografii — o versiune din F2 nu poate deriva din V1 al F1 (S4 demonstrează restrictie).
- **Imutabilitate versiunilor existente** — editarea nu suprascrie conținutul, ci generează versiuni noi cu rețele de derivare.
- **Structura de graf** — relațiile entre versiuni formează un DAG cu un rădăcină (original) și mai mulți descendenți.

Modelul suportă comparația editărilor și recuperarea originalului, garantând integritate datelor și tracabilitate.