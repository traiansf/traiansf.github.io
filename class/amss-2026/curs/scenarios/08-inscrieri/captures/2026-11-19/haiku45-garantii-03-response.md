# Interacțiunea și garanții pentru Sistemul de însciere la ateliere

## Fluxul de însciere

**Site** inițiază cererea `înscrie(c, p, a)` cu identificator unic per cerere. **Registrul** verifică dacă identificatorul c este nou și dacă participantul p nu este deja înscris la atelierul a cu locuri disponibile. Dacă acceptă: consumă un loc, înregistrează tripletul (c, p, a), și apelează **expeditorul** cu `trimite(mesaj)`. După răspunsul expeditorului (`trimis` sau `esec`), Registrul consemnează starea confirmării (trimisă sau netrimisă) și întoarce Site-ului răspunsul `acceptat`. Dacă refuză, Registrul răspunde `refuz` fără a apela expeditorul. Eșecul confirmării nu anulează înscrierea.

## Fluxul de retrimite confirmări

**Operatorul** cheamă `retrimite confirmări()`. **Registrul** parcurge fiecare înscrierea cu confirmare `netrimisă`, apelează expeditorul o dată pentru fiecare, și actualizează starea confirmării conform răspunsului. Locurile și înscrierea rămân nemodificate.

## Garanții

### Consistența datelor

- **Idempotență:** o reîncercare cu același identificator c returnează întotdeauna același răspuns și nu consumă un alt loc. 
- **Atomicitate per cerere:** înscrierea și rezultatul confirmării sunt asociate permanent; o cerere nu afectează alte înscieri.
- **Unicitate:** fiecare loc acceptat corespunde unei singure cereri unice.

### Livrarea confirmărilor

- **Încercare garantată la acceptare:** după orice acceptare, Registrul apelează expeditorul cel puțin o dată.
- **Stare consemnată:** rezultatul ultima încercării (trimisă = răspuns `trimis`, netrimisă = răspuns `esec`) este înregistrat permanent.
- **Reîncercări controlate:** o reîncercare a aceleiași cereri apelează expeditorul doar dacă confirmarea precedentă este `netrimisă`; după `trimisă`, expeditorul nu mai este contactat.
- **Retrimitere manuală:** operatorul poate apela `retrimite confirmări()` pentru a reîncerca confirm ările `netrimisă` fără alte efecte asupra sistemului. Duplicatele la expeditor pot fi create, dar Registrul rămâne consistent.

### Comportamentul la repetare

- **Cerere repetată de Site:** Registrul răspunde cu rezultatul original, nu înregistrează a doua dată.
- **Cerere nouă după inițiale:** o nouă cerere cu alt identificator c′ de același participant este tratată independent (refuzată dacă e deja înscris).
- **Atomicitate**: fiecare cerere este procesată complet sau refuzată; nu există stări intermediare de tip „în așteptare" vizibile pentru Site după răspunsul Registrului.