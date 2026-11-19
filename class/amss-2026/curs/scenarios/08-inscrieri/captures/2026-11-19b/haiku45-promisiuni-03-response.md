## Ce vă garantăm la înscriere

Dacă cererea voastră de înscriere este acceptată, locul la atelier este instant și permanent rezervat în numele dumneavoastră. Veți primi o confirmare prin email. Chiar dacă confirmarea nu ajunge din motive tehnice, rămâneți înscris—locul dumneavoastră este protejat. Sistemul reîncercă activ trimiterea confirmării. Dacă reîncercați aceeași cerere, veți obține același răspuns și nu se va ocupa alt loc. Cererea voastră nu afectează alți participanți.

---

## Justificarea tehnică

**1. Loc instant și permanent** – Regula R3 definește acceptarea: o cerere nouă cu ID neînregistrat se acceptă exact când participantul nu este deja înscris și atelierul are loc disponibil. Locul este imediat consumat și înscrierea este înregistrată permanent.

**2. Confirmare prin email** – Regula R4 obligă registrul să solicite serviciului de mesagerie trimiterea unei confirmări după fiecare acceptare.

**3. Protecție indiferent de starea confirmării** – Regula R4 precizează explicit că eșecul mesageriei nu anulează înscrierea; locul și înscrierea rămân valide indiferent de răspunsul mesageriei.

**4. Reîncercări și retrimiteri** – Regula R5 permite retransmiterea confirmării la reîncercări dacă confirmarea precedentă a eșuat. Decizia deja luată permite operatori să apeleze operația `retrimite confirmări()` pentru retrimiteri manuale.

**5. Idempotență și izolare** – Regula R5 garantează că reîncercări cu același ID returnează același răspuns fără a consuma locuri suplimentare. Regula R7 asigură că o cerere nu modifică alte înscrieri.