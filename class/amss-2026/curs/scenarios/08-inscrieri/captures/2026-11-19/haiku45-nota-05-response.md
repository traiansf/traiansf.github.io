# Notă de proiectare — Registrul de locuri

## Prezentare generală

Registrul de locuri este un serviciu care gestionează înscrierea participanților la atelierele centrului cultural. Primește cererile de la site, le validează împotriva regulilor de disponibilitate și, pentru fiecare înscriere acceptată, cere unui serviciu extern (Expeditorul de confirmări) să notifice participantul. Sistemul garantează că aceluiași participant nu i se consumă mai mult de un loc pe atelier și că nicio cerere nu pierde informația de acceptare din cauza eșecurilor de comunicare cu expeditorul.

## Fluxul unei înscrieri

Cand site-ul trimite o cerere `înscrie(c, p, a)` — unde `c` este un identificator unic de cerere, `p` este participantul și `a` este atelierul — registrul execută următorii pași:

**1. Validare:** Verifică dacă `c` este nou. Dacă da, controlează că participantul `p` nu este deja înscris la atelierul `a` și că `a` are cel puțin un loc liber. Dacă validarea eșuează, returnează `refuz` și se oprește.

**2. Înregistrare:** Consumă un loc din atelier și înregistrează tripletul (c, p, a).

**3. Expeditor de confirmări:** Cere expeditorului extern să trimită un mesaj de confirmare. Expeditorul răspunde `trimis` (mesaj trimis) sau `esec` (mesaj netrimis).

**4. Înregistrare rezultat:** Reține rezultatul confirmării (etichetă `trimisă` sau `netrimisă`).

**5. Răspuns:** Returnează site-ului `acceptat`, **indiferent de răspunsul expeditorului**. Eșecul confirmării nu anulează înscrierea.

## Reîncercări și eșecuri

Dacă site-ul retrimite o cerere cu același `c`:

- Registrul recunoaște cererea ca reîncercare și returnează din nou `acceptat`, fără a consuma alt loc.
- Dacă confirmarea din reîncercarea anterioară este `netrimisă`, registrul apelează expeditorul din nou și actualizează rezultatul.
- Dacă confirmarea era `trimisă`, nu contactează din nou expeditorul.

Operatorul centrului poate apela manual operația `retrimite confirmări()` pentru a reîncerca o dată trimiterea tuturor confirmărilor `netrimisă`, actualizând rezultatele fără a modifica înscrierea.

## Garanții

Sistemul garantează:

- O cerere validă cu `c` unic este acceptată exact o dată și consumă exact un loc.
- Niciun participant nu apare de două ori înscris la același atelier.
- O reîncercare cu același `c` produce întotdeauna răspunsul `acceptat`, fără a duplifica locul.
- Eșecul expeditorului nu face o cerere validă să fie refuzată.
- Nicio cerere nu pierde starea de acceptare din cauza erorilor de rețea cu expeditorul.