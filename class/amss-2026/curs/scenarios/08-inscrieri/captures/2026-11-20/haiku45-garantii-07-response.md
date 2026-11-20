# Descrierea interacțiunii și garanții pentru înscrierea la atelier

## Fluxul interacțiunii

**La o nouă cerere de înscriere:** Site-ul trimite registrului o cerere `înscrie(c, p, a)` cu identificator unic `c`. Registrul verifică dacă `c` este nou. Dacă da, și dacă participantul `p` nu este deja înscris la atelierul `a` și mai există un loc liber, registrul **acceptă**: consumă un loc, înregistrează tripletul (c, p, a), apoi apelează mesageria pentru a trimite o confirmare. După răspunsul mesageriei (`trimis` sau `eșec`), registrul **înregistrează rezultatul confirmării** (respectiv `trimisă` sau `netrimisă`) și întoarce site-ului răspunsul `acceptat`. Eșecul mesageriei nu anulează înscrierea. În caz contrar (cerere nouă refuzată sau deja înscris), registrul refuză și nu apelează mesageria.

**La o reîncercare:** Dacă `c` este deja înregistrat, registrul recunoaște reîncercarea, **întoarce același răspuns** (`acceptat` sau `refuz`) și **nu consumă alt loc**. Dacă confirmarea anterioară a fost `trimisă`, nu apelează mesageria din nou. Dacă fost `netrimisă`, apelează mesageria și actualizează starea.

**La retrimiterea operatorului:** Operatorul apelează `retrimite confirmările()` pentru a reapela mesageria pentru fiecare confirmare `netrimisă`, actualizând rezultatul, fără a modifica înscrierile.

---

## Garanțiile pentru echipa de dezvoltare

### Consistența datelor
- **Idempotență pe cereri:** Aceeași cerere `c` produce mereu același rezultat; nu se consumă resurse suplimentare la reîncercări.
- **Atomicitate pe acceptare:** Acceptarea unei cereri noi înseamnă exact consumul a unui loc și înregistrarea tripletului (c, p, a); nu se acceptă o cerere parțial.
- **Excludere:** Un participant nu poate apărea de mai multe ori la același atelier; o nouă cerere cu alt `c` și același (p, a) este refuzată.

### Livrarea confirmărilor
- **Apeluri garantate:** După fiecare acceptare inițială, mesageria este apelată o dată (cu posibilă reapel la reîncercare cu `netrimisă` sau operator).
- **Înregistrare răspunsului:** Starea confirmării (`trimisă` / `netrimisă` / `în așteptare`) reflectă răspunsul ultimului apel, nu garanția de livrare efectivă.
- **Retrimitere manuală:** Operatorul poate reapela mesageria pentru fiecare confirmare `netrimisă`, acceptând posibile duplicate.

### Comportament la repetare
- **Reîncercare cu `c` cunoscut:** Întoarce același răspuns fără efecte secundare.
- **Evitarea apelurilor redundante:** Dacă confirmarea anterioară a fost `trimisă`, nu se apelează mesageria.
- **Opționalitate retransmisiei:** Reîncercarea cu `netrimisă` **poate** reapela mesageria (nu este obligatoriu în regulă, dar decizia de proiectare o face).