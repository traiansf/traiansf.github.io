## Ce vă garantăm la înscriere

Dacă sunteți acceptat, locul la atelier este al dvs. — nu riscați să fiți anulat din cauza unor probleme tehnice cu transmiterea confirmării. Vă vom trimite o confirmare; dacă aceasta nu ajunge prima dată, o vom reîncerca automat. Dacă din neatentie ați trimis de mai multe ori aceeași cerere, nu veți fi înscri duplicat — o singură dată. Răspunsul sistemului rămâne același pentru aceeași cerere, indiferent de reîncercări.

---

## Justificare tehnică

Fiecare promisiune se sprijină pe reguli ale registrului:

1. **Loc garantat** (R4): Înscrierea este consemnată în registru imediat după acceptare, independent de răspunsul expeditorului de confirmări. Eșecul confirmării nu anulează locul.

2. **Reîncercări automate** (R5): La reîncercare cu identificator deja înregistrat și confirmare `netrimisă`, expeditorul este apelat din nou. Operația `retrimite confirmări()` permite și reinițierea manuală.

3. **Fără dublă înscriere** (R2, R5): Identificatorul cererii (generat de site) este unic. Refolosirea lui semnalează reîncercare, nu cerere nouă. Se returnează același răspuns fără consum de loc suplimentar.

4. **Consistență** (R5): Reîncercarea cu același identificator primește același răspuns; nu se redeclanșează înscrierea, doar confirmarea dacă e necesar.

5. **Izolare** (R7): O cerere nu modifică alte înscri sau locurile acestora.