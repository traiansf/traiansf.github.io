# Notă de proiectare — Registrul de locuri al centrului cultural

## Scopul sistemului

Registrul de locuri acceptă cereri de înscriere la ateliere, verifică disponibilitatea și coordonează trimiterea confirmărilor prin intermediul serviciului extern de mesagerie. Sistemul este proiectat pentru fiabilitate: o conexiune eșuată cu mesageria nu compromite înscrierea, iar site-ul poate reîncerca o cerere fără teama de duplicare.

## Fluxul unei înscrierii

Când site-ul trimite o cerere `înscrie(c, participant, atelier)`, registrul execută trei operații atomice:

1. **Validare și acceptare:** verifică dacă participantul nu este deja înscris la atelier și dacă mai sunt locuri disponibile. Dacă ambele condiții sunt îndeplinite, consumă un loc și înregistrează înscrierea cu identificatorul cererii `c`. Dacă validarea eșuează, returnează imediat `refuz` și nu apelează mesageria.

2. **Trimitere confirmare:** pentru orice înscriere acceptată, registrul apelează mesageria cu `trimite(mesaj)`. Mesageria răspunde cu `trimis` sau `eșec`.

3. **Înregistrare rezultat:** registrul consemnează rezultatul confirmării (`trimisă` sau `netrimisă`) la fișa înscrierii. Ambele răspunsuri al site-ului sunt **`acceptat`** — eșecul confirmării nu anulează înscrierea.

## Comportamentul în caz de eșec și reîncercare

**Eșecul mesageriei:** dacă mesageria răspunde `eșec`, participantul rămâne înscris, dar confirmarea rămâne în starea `netrimisă`. Operatorul centrului poate rula `retrimite confirmările()` pentru a reîncerca confirmări neonorate.

**Reîncercările site-ului:** dacă site-ul nu primește răspunsul și retrimite aceeași cerere (cu același `c`), registrul recunoaște `c` ca deja înregistrat. Returnează `acceptat` fără să consume alt loc. Dacă confirmarea precedentă era `trimisă`, nu apelează din nou mesageria (evitând mesaje duplicate). Dacă era `netrimisă`, apelează mesageria o dată.

## Garanții

Sistemul garantează:

- **Atomicitate pe apel:** fiecare cerere produce exact o actiune: acceptare, refuz sau reîncercare recunoscută.
- **Absența duplicării:** identificatorul cererii `c` asigură că aceeași cerere de participant nu generează două înscrierii.
- **Izolație:** o cerere nu modifică alte înscrierii sau locurile lor.
- **Coerență**: numărul de locuri consumate = numărul de înscrierii acceptate. Niciodată nu acceptăm mai multe cereri decât locurile disponibile.
- **Rezilijență:** eșecul mesageriei nu pierde înscrierea; operatorul poate retrimite confirmări neonorate.
- **Ordonare:** apelurile sunt secvențiale; rezultatele sunt deterministe, dependent doar de cerere și răspunsul mesageriei.