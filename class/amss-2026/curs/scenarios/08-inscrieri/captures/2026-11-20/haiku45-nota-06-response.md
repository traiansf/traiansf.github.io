# Notă de proiectare — Registrul de locuri

## Funcționalitate și flux

Registrul de locuri acceptă cereri de înscriere la ateliere și gestionează confirmările. Fiecare cerere conține un identificator unic (generat de site), participantul și atelierul dorit.

**Fluxul unei înscrieri:**

1. Registrul primește cererea. Dacă identificatorul este nou și participantul nu este deja înscris la acel atelier, iar atelierul are locuri libere, înscrierea este acceptată: se consumă un loc și se înregistrează decizia.

2. Imediat după acceptare, registrul apelează serviciul de mesagerie pentru a trimite o confirmare participantului. Mesageria răspunde cu `trimis` sau `eșec`.

3. Registrul memorează rezultatul confirmării. Înscrierea rămâne valabilă indiferent de răspunsul mesageriei — preferăm participant înscris fără confirmare unui participant fără loc.

4. Site-ul primește răspunsul `acceptat`.

## Comportament la eșec și reîncercări

**Eșec al mesageriei:** dacă mesageria răspunde `eșec`, participantul este deja înscris (cu status `netrimisă`), dar nu a primit confirmarea. Înscrierea se păstrează; nu pierde locul.

**Reîncercare cu același identificator:** când site-ul reîncearcă o cerere (de exemplu, din cauza unei întreruperi de rețea), registrul recunoaște identificatorul și întoarce imediat același răspuns `acceptat` fără a consuma alt loc. 

- Dacă confirmarea anterioară era `trimisă`, mesageria nu se apelează din nou.
- Dacă confirmarea era `netrimisă`, registrul apelează mesageria o dată pentru a încerca retransmiterea.

**Retrimitere manuală:** operatorul poate apela funcția `retrimite confirmările()` pentru a reîncerca o singură dată toate confirmările cu status `netrimisă`, actualizând rezultatele fără a modifica înscrierile.

## Garanții

Sistemul garantează:

1. **Consistență:** fiecare identificator de cerere este înregistrat o singură dată; nu apar două înscrieri pentru aceeași cerere.

2. **Atomicitate pe înscrierie:** o cerere acceptată consumă exact un loc; o cerere refuzată nu consumă nici un loc și nu apelează mesageria.

3. **Idempotență:** reîncercările cu același identificator nu modifică locurile sau alte înscrieri.

4. **Separare:** o cerere nu afectează alte ateliere sau alți participanți.

5. **Disponibilitate locurilor:** dacă un atelier are locuri, participanții necunoscuți anterior sunt acceptați în ordinea cererii.

6. **Urmare la confirmare:** rezultatul final memorizat reflectă ultimul răspuns al mesageriei; `trimisă` înseamnă că mesageria a răspuns `trimis`, `netrimisă` înseamnă că ultimul apel a primit `eșec`.