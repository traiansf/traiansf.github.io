# Interacțiunea și Garanții de Proiectare

## Fluxul de Interacțiune

**Site** inițiază o cerere de înscrierii `înscrie(c, p, a)` către **Registru**, cu identificator unic `c` pentru fiecare cerere nouă. **Registru** validează cererea (participant neînscris, loc liber, `c` neînregistrat), consumă un loc și înregistrează înscrierea. Dacă acceptă, **Registru** apelează **Expeditor** (serviciu extern) cu `trimite(mesaj)`, așteptând răspunsul `trimis` sau `esec`. După răspunsul expeditorului, **Registru** întoarce site-ului rezultatul `acceptat` și stocheaza starea confirmării. **Operator** poate apela `retrimite confirmări()` pentru a reîncerca confirmările nertimise; **Registru** apelează din nou **Expeditorul** pentru fiecare confirmare cu status `netrimisă`.

## Garanții de Consistență a Datelor

1. **Atomicitate pe înscrierea acceptată:** o cerere cu `c` neînregistrat în stare validă (loc liber, participant neînscris) produce exact o înregistrare (c, p, a). Nu poate rezulta o înscrierie parțială, indiferent de răspunsul expeditorului.

2. **Idempotență la reîncercare:** o reîncercare cu `c` înregistrat întoare același rezultat `acceptat` și nu consumă alt loc. Nu se creează înscrierii duplicate.

3. **Independență:** o cerere nu modifică alte înscrieri, locurile sau confirmările. Validarea unei cereri nu depinde de starea celorlalte participanți.

4. **Izolare stării confirmării:** eșecul expeditorului nu anulează înscrierea. Starea confirmării (trimisă/netrimisă) este decuplată de acceptarea cererii; o retrimitere nu afectează înscrierea.

## Garanții de Livrare a Confirmărilor

5. **Apelul inițial:** o cerere acceptată cu `c` neînregistrat declanșează exact un apel la expeditor.

6. **Reîncercare selectivă:** o reîncercare cu `c` înregistrat și status `netrimisă` declanșează o retrimitere; status `trimisă` nu declanșează apel.

7. **Retrimitere manuală:** operația `retrimite confirmări()` apelează expeditorul o dată pentru fiecare confirmare netrimisă, independentă de alte operații.

## Comportament la Reîncercare

8. **Idempotența răspunsului:** reîncercările cu același `c` primesc răspunsul `acceptat`, indiferent de starea expeditorului. Diferențele în răspunsul expeditorului nu afectează rezultatul site-ului.

9. **Retrimiteri potențial duplicate:** o confirmare netrimisă poate fi apelată din reîncercarea unei cereri și din `retrimite confirmări()`. Expeditorul poate primi apeluri succesive cu același mesaj; duplicarea mesajelor este permisă și responsabilitatea operatorului este de a semnala că s-a povetorit retrimiterea manuală.

10. **Fără stare globală în așteptare:** apelurile rămân secvențiale; nu modelăm starea `în așteptare` a confirmării la nivel de garanție formală.