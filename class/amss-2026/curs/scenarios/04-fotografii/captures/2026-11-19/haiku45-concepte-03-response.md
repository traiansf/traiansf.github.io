# Arhiva Fotografică — Concepte și Relații

## Concepte principale

Arhiva este structurată în jurul a trei concepte centrale:

**Fotografie** — Entitate cu identificator stabil și legendă modificabilă. Legenda poate fi schimbată fără a crea altă fotografie. Reprezintă subiectul/colecția logică.

**Versiune** — Reprezentare concretă a unei fotografii cu conținut imutabil și identificator propriu. Versiunile sunt numerotate global în ordinea creării. Orice modificare a conținutului creează o nouă versiune, originala păstrîndu-se.

**Original** — Prima versiune asociată unei fotografii, creată la catalogare. Fiecare fotografie are exact un original, care nu are sursă în arhivă.

## Relații și cardinalitate

**1. Fotografie ↔ Versiune: 1:N**
- O fotografie are cel puțin o versiune
- O versiune aparține exact unei fotografii
- Schimbarea legendei nu afectează versiunile existente

**2. Versiune-sursă ↔ Versiune-derivată: 1:N**
- O versiune poate fi sursă pentru mai multe versiuni derivate (vezi S3: V1 genereaza atît V3 cît și V4)
- O versiune derivată are exact o sursă
- Originalul nu are sursă; versiunile derivate au sursă doar din aceeași fotografie (S4 demonstrează că o versiune din F2 nu poate proveni din V1 al lui F1)

**3. Fotografie ↔ Original: 1:1**
- Fiecare fotografie are exact un original
- Originalul e unic pentru fiecare fotografie

## Reguli critice

Editarea nu creează ramuri neliniare obligatorii — mai multe versiuni pot avea aceeași sursă. Legenda fotografiei e orthogonală versiunilor: modificarea legendei nu creează versiuni noi și nu afectează relațiile dintre versiuni. Cardinalitatea derivării e controlată de regula R4: derivata trebuie să aparțină aceleiași fotografii ca sursa sa.