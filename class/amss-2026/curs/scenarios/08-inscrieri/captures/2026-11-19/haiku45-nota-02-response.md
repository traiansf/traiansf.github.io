# Notă de proiectare — Registrul de locuri al atelierelor

## Scopul și arhitectura

Registrul acceptă cereri de înscriere secvențiale, gestionar locuri limitate și ordonează confirmări prin intermediul unui serviciu extern (Expeditorul). Sistemul garantează coerență între înscrisuri, apeluri la expeditor și reîncercări.

## Fluxul unei înscrieri

Când site-ul transmite `înscrie(c, participant, atelier)`:

1. **Verificare unicitate cererii:** dacă identificatorul `c` există deja, registrul returnează imediat răspunsul anterior, fără alte acțiuni.

2. **Verificare eligibilitate:** dacă `c` e nou, registrul testează:
   - participantul nu e deja înscris la atelier;
   - atelierul are cel puțin un loc liber.

3. **Acceptare:** dacă ambele condiții sunt îndeplinite, registrul:
   - consumă un loc din atelier;
   - înregistrează cererea `(c, participant, atelier)`;
   - apelează Expeditorul cu un mesaj de confirmare;
   - etichetează înscrierea cu rezultatul (`trimisă` sau `netrimisă`);
   - întoarce site-ului `acceptat`.

4. **Refuz:** în caz contrar, returnează `refuz` fără a apela Expeditorul.

## Eșecul confirmării și reîncercări

**Eșec la confirmare:** dacă Expeditorul răspunde cu `esec`, înscrierea rămâne valabilă. Locul este consumat, participantul este înscris, dar confirmarea este marcată `netrimisă`. Site-ul primește oricum `acceptat`.

**Reîncercarea după eșec (S3):** când site-ul reîncearcă cu același `c`, registrul detectează cererile anterioare și:
- returnează `acceptat` din nou;
- dacă confirmarea era `netrimisă`, reapelează Expeditorul o dată;
- actualizează eticheta confirmării și returnează același răspuns.

**Reîncercarea după succes (S4):** dacă confirmarea anterioară era `trimisă`, Expeditorul nu este apelat din nou — răspunsul se returnează direct.

## Retrimitere și sincronizare

Operatorul centrului poate apela `retrimite confirmările()`: sistemul identifică confirmările marcate `netrimisă` și încearcă o singură dată fiecare, actualizând starea fără a modifica înscrisurile.

## Garanții

1. **Idempotență:** aceeași cerere returnează același răspuns, indiferent de apeluri repetate.
2. **Atomicitate pe cerere:** o cerere acceptată consumă exact un loc; reîncercările nu dublează locurile.
3. **Resiliență:** eșecul confirmării nu anulează înscrierea; beneficiarul prefacă participant înscris fără confirmare unei posibilități de loc liber.
4. **Separare responsabilități:** Expeditorul e invocat doar pe cereri acceptate; starea lui nu influența acceptarea locurilor.
5. **Consistență:** retrimiteri periodice asigură sincronizarea confirmărilor cu starea reală.