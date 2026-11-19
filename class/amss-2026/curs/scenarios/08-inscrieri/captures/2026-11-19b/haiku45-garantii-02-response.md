# Interacțiunea și garanțiile sistemului de înscrierii

## Fluxul de interacțiune

**La înscriere:** Site-ul trimite registrului o cerere `înscrie(c, p, a)` cu identificator unic `c`. Registrul validează:
- dacă `c` este nou: verifică dacă participantul `p` nu este deja înscris la atelierul `a` și dacă există locuri libere
- dacă sunt îndeplinite condițiile, consumă un loc, înregistrează (c, p, a) și apelează mesageria `trimite(mesaj)` pentru confirmare
- răspunde site-ului cu `acceptat` indiferent de rezultatul mesageriei (`trimis` sau `eșec expediție`).

**La reîncercare:** Site-ul apelează cu același `c`. Registrul recunoaște cererea cunoscutului și:
- întoarce `acceptat` fără a consuma alt loc
- dacă confirmarea anterioară este `netrimisă`, apelează mesageria din nou și actualizează rezultatul
- dacă este `trimisă`, nu apelează mesageria.

**La retrimitere:** Operatorul apelează `retrimite confirmările()`. Registrul parcurge toate confirmările `netrimisă`, apelează mesageria pentru fiecare și actualizează starea.

## Garanțiile de proiectare

**Consistența datelor:**
- Fiecare identificator `c` acceptat corespunde exact unei înscrierii (c, p, a); nu se crează duplicat pe reîncercare.
- Locurile sunt consumate exact o dată la fiecare înscriere acceptată și nu sunt consumate pe reîncercări.
- Starea unei înscrierii (acceptată și cu confirmare `trimisă`/`netrimisă`) este invariantă pe reîncercări dacă cererea nu se schimbă.
- Nicio cerere nu modifică alte înscrieri sau locurile acestora.

**Livrarea confirmărilor:**
- După acceptare, registrul **întotdeauna** apelează mesageria cel puțin o dată.
- Dacă confirmarea inițială eșuează (`netrimisă`), registrul poate retrimite: pe reîncercare a cererii sau via `retrimite confirmările()`.
- Site-ul și centrul cultural au vizibilitate asupra stării confirmării: `trimisă` (ultimul apel a răspuns `trimis`) sau `netrimisă` (ultimul apel a răspuns `eșec expediție`).
- **Retrimiterea poate produce mesaje duplicate:** aceasta este acceptabilă pentru cazul de utilizare.

**Comportamentul la repetare:**
- Idempotență pe cerere: aceeași cerere `(c, p, a)` produce întotdeauna `acceptat` dacă a fost acceptată inițial, indiferent de alți participanți sau eșecuri tehnice.
- Registrul distinghează cerere nouă (c nou) de reîncercare (c cunoscut): doar cererea nouă are efect asupra locurilor libere.
- Reîncercare cu `c` cunoscut și rezultat inițial `refuz` întoarce `refuz` și nu apelează mesageria (nicio validare nu s-a schimbat).
- Starea confirmării nu face parte din contractul de răspuns: site-ul primește `acceptat` indiferent dacă mesageria a reușit, iar centrul poate consulta starea separată.