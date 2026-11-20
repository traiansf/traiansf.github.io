# Notă de Proiectare — Registrul de Locuri

**Scop:** Registrul de locuri acceptă cereri de înscriere la ateliere cu locuri limitate și coordonează trimiterea de confirmări prin serviciul de mesagerie extern.

## Fluxul de Înscriere

La primirea cererii `înscrie(c, p, a)`, unde `c` este identificatorul unic al cererii, `p` este participantul și `a` atelierul:

1. Registrul verifică dacă identificatorul `c` este nou. Dacă da, controlează dacă participantul `p` nu este deja înscris la atelierul `a` și dacă există locuri disponibile.
2. Dacă ambele condiții sunt îndeplinite, înscrierea este acceptată: se consumă un loc și se înregistrează tripletul `(c, p, a)`.
3. Registrul apelează mesageria cu un mesaj de confirmare și așteptă răspunsul (`trimis` sau `eșec`), care este memorat în evidența înscrierii.
4. În ambele cazuri, răspunsul transmis site-ului este `acceptat`.

## Eșec și Reîncercare

**Eșec al mesageriei:** Dacă mesageria răspunde `eșec`, înscrierea rămâne valabilă (participantul rămâne înscris) și locul consumat nu se recuperează. Statusul confirmării devine `netrimisă`. Preferința sistemului este că un participant înscris fără confirmare este mai valoros decât riscul dublării.

**Reîncercare cu același identificator:** Când site-ul retrimite cererea cu aceeași valoare `c`, registrul returnează din nou `acceptat` fără a consuma alt loc. Dacă confirmarea anterioară era `trimisă`, mesageria nu este apelată din nou. Dacă era `netrimisă`, registrul apelează mesageria o dată pentru retransmisie și actualizează statusul.

**Cerere nouă a unui participant deja înscris:** Orice identificator nou este refuzat dacă participantul este deja înscris la acel atelier.

## Garanții

1. **Consistență:** Fiecare participant este înscris cel mult o dată la fiecare atelier.
2. **Capacitate:** Numărul de locuri consumate nu depășește niciodată capacitatea atelierului.
3. **Idempotență:** Reîncercările returnează același rezultat și nu modifică starea sistemului.
4. **Izolare:** Fiecare cerere afectează numai propria inscriere; alte înscrisuri rămân neafectate.
5. **Robustență:** Eșecul confirmării nu anulează înscrierea acceptată.