## Ce vă garantăm la înscriere

Dumneavoastră îi comunicați site-ului o cerere de însciere. Registrul nostru garantează:

1. **Spot sigur.** Dacă atelierul are locuri libere și nu sunteți deja înscris, cererea voastră este acceptată. Locul este rezervat imediat. Acceptarea nu depinde de confirmare și nu este anulată dacă confirmarea eșuează.

2. **Notificare.** După acceptare, trimitere o notificare la adresa indicată. Dacă trimiterea eșuează din cauze tehnice, înscriere rămâne valabilă; centrul poate retrimite notificări neinclinate manual.

3. **Coerență.** Dacă nici o schimbare de dată în cerere (participant, atelier) și reîncercați cu același identificator, răspunsul e același și nu se consumă alt loc. Nu vă dublați involuntar.

4. **Fără cozi de așteptare sau anulări.** Modelul acceptă doar înscrieri și nu gestionează liste de așteptare sau anulări (acestea sunt în afara sistemului).

---

## Justificare tehnică

**Spot sigur (R3):** Acceptarea cere trei condiții: ID neînregistrat, participant neînscris la atelier, loc liber. Locul se consumă la acceptare.

**Notificare (R4):** După acceptare, registrul apelează mesageria. Rezultatul (trimis/eșec) se înregistrează, dar nu anulează înscrierea.

**Coerență și fără dublări (R2, R5):** Site-ul generează ID unic per cerere. Reîncercările cu același ID returnează răspunsul deja calculat, fără a consuma alt loc. Dacă confirmarea precedentă s-a trimis, nu se apelează din nou mesageria.

**Retransmitere (decizie de proiectare):** Operația `retrimite confirmările()` permite operatorului să retrimită notificări neinclinate, actualizând doar statusul confirmării, nu înscrierea.

**Garantă limitată la graniță (R6):** Eticheta „trimisă" înseamnă răspunsul mesageriei, nu livrarea efectivă. Responsabilul mesageriei este operator extern; noi garantez doar trimiterea apelului.