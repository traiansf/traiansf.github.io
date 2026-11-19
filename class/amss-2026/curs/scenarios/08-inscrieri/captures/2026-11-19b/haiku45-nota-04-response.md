# Notă de proiectare — Registrul de locuri al atelierelor

## Descriere

Registrul de locuri este componenta care gestionează înscrierile la ateliere cu locuri limitate. Primește cererile de la site, le validează și, după acceptare, coordonează trimiterea unei confirări prin serviciul extern de mesagerie. Sistemul este proiectat pentru a garanta că înscrierea rămâne valabilă chiar dacă confirmarea eșuează, respectând prioritatea participantului de a avea un loc.

## Flux de înscriere

Când site-ul apelează `înscrie(c, participant, atelier)`, registrul execută următorii pași:

1. **Validare:** Verifică dacă identificatorul cererii `c` este nou. Dacă este cunoscut (reîncercare), sare la pasul 5.

2. **Eligibilitate:** Pentru o cerere nouă, testează dacă participantul nu este deja înscris la atelier și dacă mai există locuri libere.

3. **Acceptare/Refuz:** Dacă ambele condiții sunt îndeplinite, consumă un loc, înregistrează înscrierea și trece la pasul 4. Altfel, răspunde `refuz` și nu contactează mesageria.

4. **Confirmare:** Apelează mesageria cu `trimite(mesaj)`. Mesageria răspunde `trimis` sau `eșec expediție`. Registrul înregistrează starea (`trimisă` sau `netrimisă`) la înscrierea efectuată. **Indiferent de răspuns, site-ul primește `acceptat`.**

5. **Reîncercare:** Dacă cererea cu identificatorul `c` era deja înregistrată, registrul răspunde `acceptat` fără a consuma alt loc. Dacă confirmarea anterioară este `netrimisă`, contactează din nou mesageria și actualizează starea. Dacă confirmarea este `trimisă`, nu apelează mesageria.

## Eșec de confirmare și retrimitere

Când mesageria răspunde `eșec expediție`, înscrierea rămâne **validă și consumă locul**. Starea se marchează `netrimisă`. Site-ul primește același răspuns `acceptat`, asigurând participantul că are loc rezervat. 

Registrul dispune de operația `retrimite confirmările()` pentru operatorii centrului: reîncercează o singură dată transmiterea fiecărei confirmări `netrimisă` și actualizează starea, fără a modifica înscrierea.

## Garanții

Sistemul garantează:

- **Atomicitate:** O cerere acceptată consumă exact un loc și generează exact o înscriere pentru acel participant la atelier.
- **Idempotență:** Reîncercarea cu același identificator de cerere întoarce mereu același rezultat și nu creează duplicate.
- **Prioritate corectă:** Preferă participanți înscriși fără confirmare decât confirmări fără loc.
- **Izolare:** O cerere nu afectează alte înscrieri sau locurile acestora.
- **Transparență:** Distincea între starea înscrierii (acceptată/refuzată) și starea confirmării (trimisă/netrimisă) permite operatorilor să intervină ușor.