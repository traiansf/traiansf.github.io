# Interacțiunea și Garanțiile Sistemului de Înscrierii

## Fluxul de Interacțiune

**La cererea de înscriere:**
1. Site-ul trimite `înscrie(c, p, a)` către registru cu identificator unic c per cerere
2. Registru verifică dacă c este nou și dacă sunt disponibile: participant neînscris la a și loc liber
3. Dacă sunt îndeplinite: registru consumă un loc, stochează înscrierea (c, p, a), apelează `mesagerie.trimite(mesaj)`
4. Mesageria răspunde cu `trimis` sau `eșec expediție`; registru stochează rezultatul (`trimisă`/`netrimisă`)
5. Registru răspunde `acceptat` site-ului — **indiferent de răspunsul mesageriei**
6. În alte cazuri: registru răspunde `refuz` și nu apelează mesageria

**La retrimitere manuală:**
Operatorul apelează `retrimite confirmările()`, care reapelează mesageria o singură dată pentru fiecare confirmare `netrimisă`, actualizând rezultatul, fără a modifica înscrierile.

## Garanțiile pentru Echipa de Dezvoltare

### 1. Consistența Datelor

- **Atomicitate pe acceptare:** o cerere acceptată consumă exact un loc și este înregistrată simultan; dacă ambele nu se petrec, cererea se refuză
- **Idempotență globală:** o cerere cu același identificator c returnează mereu `acceptat` și nu consumă locuri suplimentare, indiferent de câte reîncercări primește registrul
- **Invariant:** numărul total de locuri ocupate plus locuri libere rămâne constant pentru fiecare atelier
- **Izolarea cererii:** o cerere nu modifică alte înscrieri sau locurile acestora

### 2. Livrarea Confirmărilor

- **Acoperire:** fiecare cerere acceptată declanșează cel puțin o tentativă de trimitere la mesagerie
- **Reîncercare pe eșec:** la reîncercarea unei cereri al cărei rezultat este `netrimisă`, registru apelează din nou mesageria și actualizează eticheta
- **Evitarea apelurilor redundante:** la reîncercarea unei cereri al cărei rezultat este `trimisă`, mesageria nu este contactată din nou
- **Retrimitere manuală:** operatorul poate forța reapelarea mesageriei pentru confirmi `netrimisă` prin `retrimite confirmările()`
- **Fără garanție de livrare efectivă:** eticheta `netrimisă` reflectă doar ultimul răspuns `eșec expediție`; `trimisă` înseamnă doar răspunsul `trimis`. Duplicatele sunt posibile.

### 3. Comportamentul la Repetarea Cererilor

- **Reîncercare după eșec de confirmare:** dacă c este înregistrat cu `netrimisă`, registru apelează din nou mesageria (evoluie potential la `trimisă`)
- **Reîncercare după succes:** dacă c este înregistrat cu `trimisă`, se returnează `acceptat` imediat, fără contact cu mesageria
- **Reîncercare cu c nou al aceluiași participant:** se refuză cu `refuz` — participantul este deja înscris
- **Rezultat idemfotent:** răspunsul site-ului rămâne `acceptat` indiferent de starea confirmării