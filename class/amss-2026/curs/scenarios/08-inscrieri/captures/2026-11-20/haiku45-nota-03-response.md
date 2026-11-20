# Notă de proiectare — Registrul de locuri al atelierelor

## Scopul sistemului

Registrul de locuri gestionează înscrierea participanților la ateliere cu locuri limitate și coordonează trimiterea confirmărilor prin serviciul extern de mesagerie. Sistemul garantează coerență între locurile consumate și confirmările trimise, indiferent de eșecurile rețelei sau reîncercările din partea site-ului.

## Flux de înscriere

Fiecare cerere de înscriire vine cu un identificator unic generat de site. La primire, registrul verifică:
- dacă participantul nu este deja înscris la atelier;
- dacă mai sunt locuri libere.

Dacă ambele condiții sunt îndeplinite, registrul **acceptă** cererea: consumă un loc, înregistrează înscrierea și apelează imediat serviciul de mesagerie pentru a trimite o confirmare participantului. Dacă cel puțin o condiție nu se îndeplinește, registrul refuză înscrierea fără a contacta mesageria.

## Comportament la eșec mesagerie și reîncercare

Mesageria răspunde cu „trimis" sau „eșec" la fiecare apel. **Indiferent de răspuns, înscrierea acceptată rămâne valabilă:** participant este înscris la atelier și locul consumat nu se recuperează. Registrul înregistrează doar rezultatul confirmării (trimisă sau netrimisă) pentru evidență și alertări operatorului.

Când site-ul reîncearcă aceeași cerere (trimitând același identificator):
- dacă înscrierea a fost refuzată anterior, registrul returnează refuz din nou, fără apeluri noi;
- dacă înscrierea a fost acceptată și confirmarea este deja „trimisă", registrul returnează acceptat și **nu apelează mesageria** din nou;
- dacă înscrierea a fost acceptată dar confirmarea este „netrimisă", registrul apelează o dată mesageria, pentru a reîncerca trimiterea.

Operatorul centrului poate solicita manual retrimiterea tuturor confirmărilor cu status „netrimisă"; sistemul reîncercează o singură dată pentru fiecare și actualizează rezultatul.

## Garanții

1. **Consistență înscrisuri–locuri:** orice participant înscris ocupă exact un loc; locurile nu se dublează.
2. **Idempotență:** reîncercarea cu același identificator returnează același răspuns și nu duplică înscrierea.
3. **Separare efect:** o cerere nu afectează alte înscrieri sau locurile acestora.
4. **Bună credință confirmări:** registrul reflectă răspunsurile reale ale mesageriei; etichetele „trimisă" și „netrimisă" dovedesc ce a răspuns serviciul, nu garantează livrarea efectivă.
5. **Prioritate participare:** un participant înscris fără confirmare prevaleaza asupra unui participant neînscris.