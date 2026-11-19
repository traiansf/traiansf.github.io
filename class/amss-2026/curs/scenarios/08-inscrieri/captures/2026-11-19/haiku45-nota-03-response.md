# Notă de proiectare: Registrul de locuri al centrului cultural

## Scop și responsabilități

Registrul de locuri acceptă cereri de înscriere la ateliere cu locuri limitate și coordonează trimiterea de confirmări prin serviciul extern de expeditie. Sistemul garantează că o cerere acceptată consumă exact un loc și că reîncercările nu crează duplicate de înscrieri.

## Fluxul de o înscriere

1. **Site-ul trimite cererea** `înscrie(c, p, a)` cu identificatorul cererii `c`, participantul `p` și atelierul `a`.

2. **Registrul evaluează acceptarea:** o cerere este acceptată numai dacă identificatorul `c` este neînregistrat, participantul `p` nu este deja înscris la atelierul `a`, și atelierul are cel puțin un loc liber. În aceste condiții, registrul consumă un loc, înregistrează cererea și trece la pasul 3. În caz contrar, răspunde `refuz` și nu contactează expeditorul.

3. **Registrul apelează expeditorul:** pentru orice înscriere acceptată, registrul cere expeditorului `trimite(mesaj)` cu datele confirmării. Expeditorul răspunde cu `trimis` sau `esec`.

4. **Rezultatul confirmării se înregistrează:** registrul memorează rezultatul (`trimisă` sau `netrimisă`) la înscrierea efectuată, dar **reușita confirmării nu condiționează acceptarea**. În ambele cazuri, răspunsul site-ului este `acceptat`.

## Reîncercări și eșecuri

Când site-ul reîncearcă aceeași cerere (trimitând același identificator `c`):

- Registrul recunoaște `c` ca reîncercare și returnează `acceptat` fără a consuma alt loc sau crea a doua înscriere.
- Dacă confirmarea din reîncercarea anterioară a fost `netrimisă`, registrul apelează expeditorul din nou și actualizează rezultatul.
- Dacă confirmarea din reîncercarea anterioară a fost `trimisă`, expeditorul nu este apelat.

Când expeditorul răspunde `esec` la o confirmare:

- Înscrierea rămâne valabilă și locul consumat este menținut.
- Confirmarea este marcată `netrimisă` și poate fi reîncercată (fie la o nouă tentativă a site-ului, fie de operatori prin operația `retrimite confirmările()`, care reîncearcă o dată toate confirmările nereușite).

## Garanții

Sistemul garantează că:

- **O cerere = maximum o înscriere:** identificatorul `c` este consumat o singură dată; reîncercările nu crează duplicate.
- **Locurile se consumă corect:** fiecare loc este consumat exact o dată per cerere acceptată; nicio cerere respinsă nu consumă loc.
- **Prioritatea participantului:** un participant rămâne înscris și locul este consumat chiar dacă confirmarea eșuează; beneficiarul preferă un participant fără confirmare decât niciun participant cu loc gol.
- **Izolarea cererii:** o cerere nu modifică alte înscrieri și nici locurile lor.
- **Reîncercările sunt idempotente:** reîncercări succesive cu același `c` produc același rezultat și nu înmulțesc efectele.