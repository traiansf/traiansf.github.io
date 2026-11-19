# Concepte și relații în arhiva fotografică

## Entități

**Fotografie (F):** Entitate cu identificator stabil și legendă modificabilă. Fotografiile distincte pot comparte aceeași legendă. Schimbarea legendei nu afectează fotografiile sau versiunile.

**Versiune (V):** Entitate cu identificator unic, conținut imuabil și apartenență la exact o fotografie. Versiunile sunt numerotate global în ordinea creării.

## Relații și cardinalitate

### Fotografie ↔ Versiune
Relație **1:N** — Fiecare fotografie cuprinde **minimum o versiune** (originalul), iar o versiune aparține **exact unei fotografii**.
- (1) Fotografie ——1:N—— (∞) Versiune

### Versiune ↔ Versiune (Derivare)
Relație **1:N** — Fiecare versiune **poate fi sursa** pentru multiple versiuni derivate, dar fiecare versiune derivată provine din **exact o versiune-sursă** (cu excepția originalelor, care nu au sursă).
- (1) Versiune_sursă ——1:N—— (0,1) Versiune_derivată

## Principii fundamentali

- **Originalul:** Fiecare fotografie are exact un original, creat la catalogare, fără versiune-sursă proprie.
- **Derivare:** Editarea oricărei versiuni creează versiune nouă a aceleiași fotografii, cu versiunea editată ca sursă. Se permit derivări multiple din aceeași sursă (ramificație).
- **Izolare:** Versiunile din fotografii diferite nu pot avea relații de derivare.
- **Imutabilitate versiunilor:** Conținutul, identitatea și relațiile versiunilor existente se păstrează permanent.
- **Legenda:** Aparține fotografiei și se păstrează în toate versiunile sale; modificările legendei nu crează versiuni noi.

Arhiva modelează un **arbore (pădure) de versiuni** per fotografie, cu originalul ca rădăcină și posibile ramificații prin editări multiple.