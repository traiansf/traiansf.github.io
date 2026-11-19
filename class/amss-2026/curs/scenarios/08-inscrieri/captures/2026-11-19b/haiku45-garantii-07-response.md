# Interacțiunea și garanțiile sistemului de înscrierii

## Descrierea interacțiunii

**Site** inițiază cereri de înscriere `înscrie(c, p, a)` către **Registru**, fiecare cere având identificator unic `c` generat de site. **Registru** validează cererea: dacă participantul `p` nu este deja înscris la atelierul `a` și mai există loc liber, acceptă înscrierea, consumă un loc și înregistrează tripletul (c, p, a). Imediat după, cere **Mesageriei** să trimită o confirmare. Mesageria răspunde cu `trimis` sau `eșec expediție`. Registru consemnează starea confirmării (`trimisă` sau `netrimisă`), dar acceptă cererea în ambele cazuri — beneficiarul preferă participant înscris fără confirmare decât participant fără loc. Site primește rezultatul `acceptat` sau `refuz`.

Când site reîncearcă o cerere cu același identificator `c` (după o cădere de comunicație), registru returnează același rezultat și nu consumă alt loc. Dacă confirmarea precedentă era `netrimisă`, reîncearcă trimiterea; dacă era `trimisă`, nu apelează mesageria.

Operator centrului poate apela `retrimite_confirmări()`: registrul reîncearcă o dată fiecare confirmare `netrimisă`, actualizează rezultatul și nu modifică înscrierea sau locurile.

## Garanțiile pentru document de proiectare

### 1. Consistența datelor
- **Atomicitate pe acceptare:** o cerere cu identificator `c` neînregistrat consumă exact un loc și creează exact o înscriere (c, p, a), sau nu face nimic.
- **Idempotență:** o cerere cu `c` deja înregistrat returnează același rezultat și nu crează duplicate, indiferent de câte reîncercări.
- **Izolare:** o cerere nu modifică alte înscrierii sau locurile lor; starea confirmării reflectă doar ultimul răspuns al mesageriei.

### 2. Livrarea confirmărilor
- **Tentativa garantată:** fiecare cerere acceptată declanșează cel puțin o tentativă către mesagerie.
- **Reîncercare pe eșec:** reîncercările de cerere cu confirmare `netrimisă` generează o nouă tentativă.
- **Retrimitere manuală:** operator poate retrimite orice confirmare `netrimisă` fără a afecta înscrierea.
- **Limitare a devolatilizării:** eticheta `netrimisă` și `trimisă` consemnează doar răspunsul mesageriei, nu garanția livrării efective; retrimiterea poate produce mesaje duplicate la participant.

### 3. Comportamentul la repetarea cererilor
- **Reîncercări identificate:** o cerere este reîncercare doar dacă `c` coincide; refolosirea cu alt (p, a) nu e modelată.
- **Absența efectelor secundare:** reîncercări nu consumă locuri noi, nu crează înscrierii duplicate și nu afectează rezultatul precedent.
- **Separarea fluxurilor:** retrimiteri din `retrimite_confirmări()` sunt independente de reîncercările din `înscrie()` și nu interferează cu alte operații.