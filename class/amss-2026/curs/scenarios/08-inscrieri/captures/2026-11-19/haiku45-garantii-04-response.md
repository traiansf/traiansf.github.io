# Interacțiunile și garanțiile sistemului de înscrierii

## Fluxul de înscriiere și confirmare

**Site** trimite registrului cererea `înscrie(c, p, a)` cu identificator unic `c`, participant `p` și atelier `a`. **Registrul** verifică dacă `c` este nou: dacă da, validează (participant neînscris, loc liber) și acceptă. La acceptare, registrul apelează **expeditorul** cu `trimite(mesaj)` și înregistrează rezultatul (`trimisă` sau `netrimisă`), apoi răspunde site-ului cu `acceptat` indiferent de rezultatul confirmării. Dacă cererea e refuzată, registrul nu apelează expeditorul și răspunde `refuz`.

## Fluxul de reîncercare și retrimiere

Când site-ul **reîncearcă** cu același `c`, registrul recunoaște cererea înregistrată și returnează imediat `acceptat`, fără a consuma alt loc. Dacă confirmarea precedentă a fost `netrimisă`, registrul îi mai dă o șansă expeditorului și actualizează rezultatul; dacă a fost `trimisă`, nu contactează expeditorul.

Operatorul centrului apelează operația `retrimite confirmările()`: registrul selectează toate confirmarile `netrimisă`, apelează o dată expeditorul pentru fiecare și actualizează rezultatele, fără a modifica înscrierile sau locurile libere.

---

## Garanții formale

### 1. Consistența datelor
Fiecare identificator de cerere `c` acceptat corespunde exact unei înscrierii (p, a). Locurile atelierului scad cu 1 doar la acceptarea unui `c` nou; reîncercările cu același `c` nu afectează locurile. Două cereri cu identificatori diferiți nu pot crea decât două înscrieri distincte. Niciun participant nu apare de două ori la același atelier din cauza unei reîncercări.

### 2. Livrarea confirmărilor
Registrul nu garantează că participantul primește mesajul. Garantează doar:
- Pentru fiecare înscriiere acceptată, apelează expeditorul cel puțin o dată
- La reîncercări cu `c` și confirmare `netrimisă`, reapelează expeditorul
- Operația `retrimite confirmările()` oferă o cale de control pentru retrimiterea în masă
- Starea finală `trimisă`/`netrimisă` reflectă doar ultimul răspuns al expeditorului, nu livrarea efectivă

### 3. Comportament la repetare
Reîncercările sunt idempotente: aceași cerere `c` produce mereu răspunsul `acceptat` și nu generează a doua înscriiere. Reîncercările nu consumă locuri noi. Duplicarea mesajelor de confirmare este posibilă (expeditorul poate primi mai mult de un apel pentru aceeași înscriiere), dar rămâne răspunderea beneficiarului să le deduplicare pe baza contextului participantului și atelierului.