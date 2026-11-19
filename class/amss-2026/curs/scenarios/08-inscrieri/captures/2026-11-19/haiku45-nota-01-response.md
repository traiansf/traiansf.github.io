# Notă de Proiectare — Registrul de Locuri al Centrului Cultural

## Scop și context

Registrul de locuri procesează cererile de înscriere la ateliere cu locuri limitate. Pentru fiecare cerere acceptată, notifică participantul printr-un serviciu extern — expeditorul de confirmări — operat de altă organizație. Registrul trebuie să garanteze coerență și respecte o principiu fundamental: **prioritatea locului asupra confirmării** — un participant înscris fără confirmare are precedență asupra unui participant cu confirmare dar fără loc disponibil.

## Fluxul de bază al unei înscrieri

Fiecare cerere de înscriere `înscrie(c, participant, atelier)` aduce trei date: identificatorul cererii **c** (unic per participant, generat de site), participantul și atelierul.

Registrul verifică dacă participantul nu este deja înscris la acel atelier și dacă atelierul are locuri libere. Dacă ambele condiții sunt îndeplinite, acceptă cererea: consumă un loc, înregistrează înscrierea cu identificatorul c, apoi apelează expeditorul cu mesajul de confirmare.

Rezultatul apelului (mesaj trimis sau eșec) este înregistrat la cerere, dar **eșecul nu anulează înscrierea**. Site-ul primește răspunsul `acceptat` indiferent de rezultatul confirmării. Aceasta garantează că locurile nu se risipesc din cauza problemelor externe.

## Reîncercare și comportament la eșec

Atunci când site-ul reîncearcă aceeași cerere (același identificator c), registrul recunoaște reîncercarea și returnează imediat `acceptat`, fără să mai consume un loc. 

Dacă confirmarea inițială a eșuat (expeditorul răspunde cu `esec`), reîncercarea permite registrului să ceară expeditorului o nouă trimitere. Registrul actualizează rezultatul confirmării; dacă noua încercare reușește, starea trece la `trimisă`. Dacă confirmarea anterioară reușise, reîncercarea nu apelează expeditorul — nu sunt necesare mesaje duplicate.

Registrul oferă și o operație manuală — `retrimite confirmările()` — pentru operatorul centrului, care retrimite o dată toate confirmările marcate `netrimisă`.

## Garanții ale sistemului

1. **Coerență de locuri:** fiecare loc consumat corespunde unei înscrisuri unice; reîncercările nu epuizează locuri suplimentare.
2. **Idempotență:** o reîncercare cu același identificator produce același răspuns și nu modifică alte înscriuri.
3. **Prioritate:** locurile sunt garantate participantului la acceptare, indiferent de starea confirmării.
4. **Integritate referințe:** o cerere nu este acceptată pentru un participant deja înscris la acel atelier.
5. **Consistență de stare:** fiecare confirmare este marcată clar — `trimisă`, `netrimisă` sau `în așteptare` — și reflectă răspunsul ultimului apel la expeditor.