# Notă de proiectare: Registrul de locuri al atelierelor

## Scop
Registrul de locuri coordonează înscrierea participanților la ateliere cu locuri limitate și gestionează confirmarea participației prin serviciul extern de mesagerie.

## Fluxul de bază: acceptare și confirmare
Când site-ul transmite o cerere nouă `înscrie(c, participant, atelier)`:
1. Registrul verifică dacă identificatorul cererii **c** este necunoscut și dacă participantul nu este deja înscris la acel atelier cu un loc liber.
2. Dacă ambele condiții sunt îndeplinite, înscrierea este **acceptată**: se consumă un loc din capacitatea atelierului și se înregistrează tripletul (c, participant, atelier).
3. Imediat după, registrul apelează serviciul de mesagerie: `trimite(mesaj_confirmare)`.
4. Răspunsul mesageriei (`trimis` sau `eșec expediție`) este înregistrat la fiecare înscriere.
5. Registrul răspunde site-ului cu `acceptat`, **indiferent dacă confirmarea a reușit sau nu**. Principiul este: participant înscris fără confirmare este mai valoros decât participant neînscris cu confirmare.

## Eșec expediție: confirmarea netrimisă
Dacă mesageria răspunde `eșec expediție`, înscrierea rămâne active și locul consumat nu se recuperează. Starea confirmării se marchează `netrimisă`. Participantul va primi confirmare doar printr-o reîncercare sau prin operația de retrimitere manuală `retrimite_confirmările()`.

## Reîncercare: aceeași cerere din nou
Când site-ul retrimite o cerere cu identificator **c** deja cunoscut (de exemplu, pentru a reafișa răspunsul):
- Registrul nu creează o a doua înscriere și nu consumă alt loc.
- Răspunsul este identic: `acceptat`.
- **Excepție**: dacă confirmarea inițială este marcată `netrimisă`, registrul apelează mesageria din nou și actualizează starea.
- Dacă confirmarea inițială era `trimisă`, mesageria nu este contactată din nou.

## Garanții
Sistemul garantează:
- **Atomicitate pe participant**: fiecare participant are maxim o înscriiere per atelier.
- **Idempotență**: reîncercarea aceleiași cereri produce același rezultat; nu duplică înscrierea.
- **Consistență locuri**: locurile consumate nu sunt recuperate pe eșec de confirmare.
- **Izolare**: o cerere nu afectează alte înscrierii sau disponibilitatea locurilor pentru alte participanți.
- **Separare responsabilități**: eșecurile de livrare a mesageriei nu compromit înscrierea; livrarea efectivă rămâne responsabilitatea serviciului extern.