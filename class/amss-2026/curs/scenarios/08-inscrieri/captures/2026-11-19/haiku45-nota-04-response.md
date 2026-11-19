# Notă de proiectare — Registrul de locuri

## Fluxul unei înscrieri

Registrul de locuri procesează cereri de tip `înscrie(c, p, a)`, unde `c` este identificatorul unic al cererii, `p` este participantul și `a` atelierul. Pentru fiecare cerere nouă (identificator neînregistrat anterior):

1. **Validare:** se verifică dacă atelierul `a` are locuri disponibile și dacă participantul `p` nu este deja înscris la `a`.
2. **Înregistrare:** dacă validarea reușește, se consumă un loc și se înregistrează înscrierea cu starea inițială `în așteptare`.
3. **Confirmare:** registrul apelează serviciul extern (expeditorul de confirmări) pentru a trimite participantului o notificare; expeditorul răspunde cu `trimis` sau `esec`.
4. **Finalizare:** se înregistrează rezultatul confirmării (`trimisă` sau `netrimisă`) și se întoarce `acceptat` indiferent de răspunsul expeditorului.

Dacă validarea eșuează (atelier plin sau participant deja înscris), se întoarce `refuz` fără a apela expeditorul.

## Eșecul confirmării

Când expeditorul răspunde `esec`, **înscrierea rămâne valabilă și consumă un loc**. Statusul confirmării se marchează `netrimisă`, dar participantul rămâne oficial înscris. Site-ul primește răspunsul `acceptat`, asigurând că nu va reîncerca din ignoranță.

## Reîncercările

Dacă site-ul retransmite aceeași cerere (același identificator `c`), registrul recunoaște reîncercarea și:

- **Întoarce același rezultat** (`acceptat`), fără a consuma alt loc.
- **Reapelează expeditorul doar dacă** confirmarea anterioară este `netrimisă`. Dacă confirmarea este `trimisă`, nu se mai apelează serviciul extern.
- **Actualizează statusul confirmării** în funcție de răspunsul noului apel.

Mecanismul permite recuperarea automată a confirmărilor eșuate la reîncercare, iar operatorii centrului pot declanșa manual `retrimite confirmările()` pentru a reîncerca o dată toate confirmările `netrimisă`.

## Garanții

Sistemul garantează:

1. **Atomicitate pe cerere:** o cerere acceptată consumă exact un loc și generează exact o înregistrare de înscris.
2. **Idempotență:** reîncercările cu același identificator nu consumă resurse suplimentare.
3. **Prioritatea înscrierii:** preferența asupra confirmării — un participant înscris fără confirmare are precedență asupra unui loc neocupat.
4. **Separare:** o cerere nu afectează alte înscrieri sau locurile acestora.
5. **Durabilitate:** o dată înregistrată, o înscriență persistă independent de starea confirmării.