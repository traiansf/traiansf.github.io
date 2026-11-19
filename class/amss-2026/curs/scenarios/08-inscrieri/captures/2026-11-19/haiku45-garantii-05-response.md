# Interacțiunile și garanțiile operaționale

## Interacțiunile principale

**Fluxul de înscriiere:**
Site trimite `înscrie(c, p, a)` cu identificator unic per cerere. Registrul verifică dacă participantul p nu este deja înscris la atelierul a și dacă mai sunt locuri libere. Dacă validă, înscrierea este acceptată: consumă un loc, înregistrează tripletul (c, p, a), apelează Expeditorul cu `trimite(mesaj)`, așteptă răspunsul (`trimis` sau `esec`), marchează înscrierea cu starea confirmării și returnează site-ului `acceptat`. În caz contrar, returnează `refuz` și nu apelează Expeditorul.

**Fluxul de reîncercare:**
Când site retrimite `înscrie(c, p, a)` cu același identificator c (de exemplu, din cauza timeout-ului), Registrul recunoaște cererea ca reîncercare. Dacă confirmarea anterioară este marcată `trimisă`, returnează imediat `acceptat` fără apel la Expeditor. Dacă este `netrimisă`, apelează din nou Expeditorul, actualizează starea confirmării, și returnează `acceptat`. Niciun loc suplimentar nu se consumă.

**Retrimiterea batch:**
Operatorul apelează `retrimite confirmări()`. Registrul iterează confirmările marcate `netrimisă`, apelează Expeditorul o dată pentru fiecare și actualizează staturile, fără a modifica alte date.

## Garanțiile operaționale

**Consistența datelor:**
- Fiecare loc se consumă maxim o dată per participant la atelier
- Reîncercări nu creează înscriteri duplicate: același identificator c produce o singură înregistrare în Registru
- Starea locurilor rămâne coherentă (total participant-atelier ≤ capacitate)
- Confirmările sunt independente de consuma locurilor

**Livrarea confirmărilor:**
- După acceptarea unei înscrierii, Expeditorul este apelat necondiționat
- Reîncercări cu stare `netrimisă` declanșează reapelul Expeditorului
- Operația `retrimite confirmări()` permite o a doua încercare pentru toate confirmările netrimise
- Eșecul Expeditorului (răspunsul `esec`) nu anulează înscrierea; prioritatea sistemului este locul garantat > confirmare garantată

**Comportament la repetări (idempotență):**
- Acelaș identificator c returnează acelaș răspuns `acceptat` și nu consumă locuri suplimentare
- Reîncercări nu modifică alte date ale sistemu (doar starea confirmării din acea înscriiere)
- Expeditorul este apelat o dată la acceptare, și opțional la reîncercări cu netrimisă; duplicarea de mesaje spre participant este acceptabilă și tolerantă
- Nicio cerere nu afectează alte înscriieri sau disponibilitatea locurilor acestora