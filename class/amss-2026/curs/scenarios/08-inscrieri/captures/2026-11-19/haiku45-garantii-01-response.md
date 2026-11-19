# Proiectarea Serviciului de Înscrierii și Confirmări

## Interacțiunea pentru Înscrierea (`înscrie`)

**Fluxul de bază:**
Site-ul transmite registrului o cerere `înscrie(c, p, a)`, unde `c` este identificatorul unic al cererii generat de site pentru perechi (participant, atelier). Registrul verifică mai întâi dacă identificatorul `c` a fost deja procesat:

- **Prima dată:** dacă participantul `p` nu este deja înscris la atelierul `a` și mai există locuri libere, registrul **acceptă** cererea, consumă un loc, și **declanșează apelul expeditorului** cu mesajul de confirmare. După primirea răspunsului expeditorului, înregistrează starea confirmării (trimisă/netrimisă) la înscrierea. Site-ul primește întotdeauna `acceptat`, indiferent de rezultatul confirmării.
- **La reîncercare:** dacă `c` a fost deja procesat, registrul **returnează imediat** răspunsul anterior fără a consuma alt loc. Dacă confirmarea era `netrimisă`, expeditorul este apelat din nou; dacă era `trimisă`, expeditorul nu se mai contactează.
- **Respingere:** o nouă cerere (cu `c` neînregistrat) este respingută dacă participantul este deja înscris sau nu mai sunt locuri; expeditorul nu este apelat.

## Interacțiunea pentru Retrimitere (`retrimite confirmări`)

Operatorul centrului apelează `retrimite confirmări()`. Registrul **parcurge toate înscrierea cu starea netrimisă**, apelează o singură dată expeditorul pentru fiecare, și actualizează starea confirmării. Locurile și înscrierea nu se modifică. Aceasta permite recuperarea de la eșecurile temporare ale expeditorului fără a regenera înscrierea.

## Garanțiile Operaționale

### 1. Consistența datelor
- Înregistrarea o dată cu acceptarea: o cerere acceptată generează exact o înscrierea în bază, chiar dacă site reîncercă. Identificatorul cererii `c` este cheia de idempotență.
- Atomicitate la loc: fiecare loc acceptat decrementează inventarul o singură dată.
- Izolația înscrierea: o cerere nu modifică alte participanți sau ateliere.

### 2. Livrarea confirmărilor
- **Separarea deciziei de livrare:** acceptarea unei cereri nu depinde de răspunsul expeditorului. Înscrierea persista chiar dacă expeditorul eșuează.
- **Preferința clarei:** un participant înscris fără confirmare are prioritate faţă de absența lui cu confirmare trimisă.
- **Retrimitere controlată:** `retrimite confirmări()` oferă o mecanică pentru operatori de a recupera eșecurile expeditorului fără perturbări în sistem.

### 3. Comportamentul la repetarea cererilor
- **Idempotență prin identificator:** reîncercarea aceluiași `c` returnează același rezultat, în ordinea apelurilor originale.
- **Apeluri multiple la expeditor:** o cerere acceptată poate genera 1, 2 sau mai multe apeluri (acceptare + reîncercare cu netrimisă + retrimite). Expeditorul ar trebui să tolereze mesaje duplicate.
- **Stare finală de neîncheiere:** valoarea `în așteptare` semnalizează apeluri expeditorului în progres; este tranzitorie în operații secvențiale.

Modelul asigură că înscrierea rămâne fiabilă sub reîncercări, iar livrarea confirmărilor este decuplată de procesul de acceptare.