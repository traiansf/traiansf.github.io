# Descrierea Interacțiunilor și Garanțiile Sistemului

## Fluxurile de Interacțiune

**Fluxul de înscriiere:**
Site-ul cere registrului `înscrie(c, p, a)`, unde c este identificatorul unic al cererii (generat de site). Registrul verifica dacă c este înregistrat deja. Pentru o cerere nouă (c neînregistrat), verifica dacă participantul p nu este deja înscris la atelierul a și dacă a are locuri libere. Dacă ambele condiții sunt îndeplinite, acceptă cererea: consumă un loc, înregistrează tripletul (c, p, a) și apelează expeditorul cu `trimite(mesaj)`. Dacă vreuna din condiții nu se îndeplinește, refuză cererea fără a contacta expeditorul.

**Fluxul de confirmare:**
După acceptare, registrul așteaptă răspunsul expeditorului: `trimis` sau `esec`. Registrul consemnează starea: `trimisă` dacă răspunsul e `trimis`, respectiv `netrimisă` dacă e `esec`. Indiferent de starea confirmării, site-ul primește răspunsul `acceptat`. Eșecul confirmării nu anulează înscrierea.

**Fluxul de reîncercare:**
Dacă site-ul retrimite aceeași cerere (același c), registrul o recunoaște ca reîncercare și întoarce același răspuns `acceptat` fără apel suplimentar la expeditor. Excepție: dacă starea confirmării originale este `netrimisă`, registrul poate apela din nou expeditorul și actualiza starea.

**Operația retrimite confirmările():**
Operatorul centrului poate declanșa reîncercarea tuturor confirmărilor cu stare `netrimisă`. Registrul apelează expeditorul pentru fiecare și actualizează starea; nu modifică înscrierile existente.

---

## Garanțiile Operaționale

**G1 — Consistența datelor:**
- Fiecare identificator de cerere c nou acceptat generează exact o înscriiere și consumă exact un loc.
- Orice reîncercare cu același c nu produce o a doua înscriiere și nu consumă alt loc.
- Nicio cerere nu modifică alte înscriieri sau alte ateliere.
- Un participant este înscris cel mult o dată la fiecare atelier.

**G2 — Livrarea confirmărilor:**
- După fiecare acceptare, registrul inițiază o tentativă de trimitere la expeditor.
- Starea confirmării consemnează cel puțin rezultatul ultimei tentative.
- La reîncercare, dacă starea e `netrimisă`, registrul poate reîncearca, permițând retrimiterea controlată prin operația dedicate.
- Eticheta `trimisă` asigură că expeditorul a răspuns afirmativ; eticheta `netrimisă` indică răspunsul negativ. Livrarea efectivă la participant nu este garantată de sistem.

**G3 — Comportamentul la repetare:**
- Reîncercare cu c înregistrat — site-ul primește același răspuns `acceptat` și nu se apelează expeditorul (dacă confirmarea e `trimisă`).
- Reîncercare cu participant deja înscris la atelier — rezultat `refuz` indiferent de c.
- Reîncercare cu locuri epuizate — rezultat `refuz` indiferent de c și de participanți.
- Site-ul poate reîncerca oricând; registrul răspunde idempotent pe baza c.