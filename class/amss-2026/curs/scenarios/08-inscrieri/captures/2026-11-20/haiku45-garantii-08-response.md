# Proiectarea sistemului de înscrierii și confirmări

## Flux de interacțiune

Site-ul transmite registrului o cerere de înscriiere `înscrie(c, p, a)` cu un identificator unic `c` pentru fiecare participant `p` la atelierul `a`. Registrul validează cererea: dacă participantul nu este deja înscris și există locuri libere, acceptă înscrierea și consumă un loc. Imediat după acceptare, registrul apelează mesageria pentru a trimite o confirmare participantului. Mesageria răspunde cu `trimis` sau `eșec`, iar registrul consemnează rezultatul și întoarce site-ului răspunsul `acceptat`. În caz de refuz (participant deja înscris sau locuri epuizate), registrul nu apelează mesageria și întoarce `refuz`.

## Garanții de consistență a datelor

**G1 — Atomicitate a acceptării:** o cerere acceptată generează exact o înscriiere și consumă exact un loc liber. Înscrierea este consemnată înainte de apelul mesageriei, garantând că o repriză nu creează duplicate.

**G2 — Idempotență pe identificatorul cererii:** reîncercările unei cereri cu același identificator `c` returnează același rezultat `acceptat` și nu generează alte înscrierii sau consum de locuri. Aceasta este garantată prin înregistrarea asocierii dintre `c` și înscriiere.

**G3 — Independență a confirmării:** eșecul mesageriei nu afectează înscrierea. Rezultatul `acceptat` este întors indiferent de răspunsul mesageriei; doar starea confirmării se diferențiază în `trimisă` (pe `trimis`) sau `netrimisă` (pe `eșec`).

## Garanții de livrare a confirmărilor

**G4 — Registrare a stării confirmării:** fiecare înscriiere acceptată consemnează starea confirmării la ultimul răspuns al mesageriei pentru acea înscriiere.

**G5 — Reîncercare pe confirmări nereușite:** la o reîncercare a cererii cu stare `netrimisă`, registrul apelează din nou mesageria și actualizează starea. La o reîncercare cu `trimisă`, mesageria nu este apelată.

**G6 — Retrimiteri manuale:** operatorul poate solicita `retrimite confirmările()`, care apelează mesageria o dată pentru fiecare înscriiere cu stare `netrimisă` și actualizează rezultatele respective. Aceasta permite recuperarea eșecurilor temporare.

## Comportament la repetarea cererilor

**G7 — Cererile sunt idempotente:** un site care nu a receptionat răspunsul și reîncearcă cu același identificator `c` obține același răspuns fără efecte secundare suplimentare.

**G8 — Distinctivitatea cererilor noi:** o nouă cerere trebuie să aibă identificator distinct, chiar dacă este aceluiași participant. Refolosirea unui `c` cu alt conținut nu este admisă.

Aceste garanții asigură că participanții sunt corect înscriși, confirmările sunt gestionate robust, iar mecanismul de reîncercare nu introduce inconsistențe în registru.