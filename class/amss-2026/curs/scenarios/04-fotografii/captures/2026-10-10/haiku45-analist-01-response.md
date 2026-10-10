# Model de domeniu — Arhiva fotografică

## Concepte și identități

Modelul identifică patru concepte centrale:

1. **Fotografie** — entitate cu identitate durabilă și legendă atribut modificabil. Identitatea fotografiei rămâne constantă indiferent de schimbări la legendă sau versiuni.

2. **Versiune** — entitate cu identitate proprie și conținut imutabil. Versiunea este unitatea atomică a arhivei: o dată creată, nu se suprascriere.

3. **Original** — rol special: versiunea inițială, unică per fotografie, creată la momentul catalogării. Originalul nu descinde din altă versiune.

4. **Relație de editare** — legătură dirigenţă între o versiune-sursă și o versiune derivată, ambele în cadrul aceleiași fotografii. Edițiile formează o structură direcţionată, nu obligatoriu liniară.

## Relații principale

- **Fotografie → Versiuni (1-la-mulți):** fiecare fotografie conține cel puțin o versiune (originalul) și poate conține mai multe versiuni derivate.
- **Versiune → Fotografie (mulți-la-1):** fiecare versiune aparține unei singure fotografii; editarea nu mută versiuni între fotografii.
- **Versiune → Versiune-sursă (opțional, recursiv):** versiunile derivate au exact o sursă din aceeași fotografie; originalul nu are sursă.
- **Fotografie → Legendă:** legenda este atribut al fotografiei, nu al versiunilor; este pur semnificație externă, decuplată de conținut.

## Restricții cheie

- Fiecare fotografie are **exact un original**, nemodificabil.
- **Imutabilitatea versiunilor:** odată creată, o versiune nu se schimbă; editarea creează versiune nouă.
- **Integritate genealogică:** versiunea-sursă și derivata sunt din aceeași fotografie; nu se pot conecta versiuni dintr-o fotografie la alta.
- **Legendă decuplată:** modificarea legendei nu afectează identitatea versiunilor sau conținuturile lor.

## Cum susține modelul situațiile S1–S4

**S1 — Schimbare de legendă:** F1.legendă devient „Dimineață", F2.legendă rămâne „Curte". Modelul susține prin decuplarea legendei de versiuni: identitățile fotografiei și versiunilor sunt independente de atribut textual.

**S2 — Creare de derivată:** V3 descinde din V1. Relația de editare conectează V3 → V1, ambele în F1. Versiunea V1 rămâne neschimbată (imutabilitate); V3 este entitate nouă cu identitate proprie.

**S3 — Mai multe derivate din aceeași sursă:** V3 și V4 au același sursă V1, dar sunt versiuni distincte în F1. Modelul permite direcționărilor multiple din aceeași sursă: relația de editare nu impune un lanț liniar.

**S4 — Respingere de relație inter-fotografie:** tentativa de a face V5 ∈ F2 cu sursă V1 ∈ F1 violare restricția de integritate genealogică. Modelul respinge prin: sursă și derivată trebuie din aceeași fotografie.

## Reprezentare vs. cerințe

Modelul nu impune:
- Cum codificăm identificatorii (UUID, numere, stringuri)
- Cum reprezentăm rolul de original (flag, tip special, subset explicit)
- Cum stocăm lanțurile de editare (liste, arbori, grafuri)
- Cum persistim legendele (în entitatea Fotografie, în versiunea originală, altundeva)
- Ordinea procesării operațiilor (strict secvențial, cu validare în timp real)

Aceste alegeri sunt structurale și depind de arhitectura stocării și a programului; regulile sunt agnostice față de ele. Cerința este ca semantica să fie conservată: fotografiile au identitate stabilă, versiunile sunt imutabile, originalurile sunt unice, editările respectă genealogia din cadrul fotografiei.