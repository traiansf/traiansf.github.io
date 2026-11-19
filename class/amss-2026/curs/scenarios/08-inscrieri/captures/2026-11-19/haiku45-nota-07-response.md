# Notă de proiectare — Registrul de locuri

## Fluxul de înscriiere

Când site-ul trimite o cerere de înscriiere `înscrie(c, p, a)`, registrul primește:
- **c**: identificator unic al cererii, generat de site pentru fiecare tentativă nouă
- **p**: participantul
- **a**: atelierul dorit

Registrul verifică dacă identificatorul **c este nou**. Dacă da, valideaza condiția: participantul p nu este deja înscris la a și atelierul a mai are cel puțin un loc liber.

**La acceptare**, registrul consumă un loc, înregistrează înscriirea (c, p, a) și apelează expeditorul cu mesajul de confirmare. După ce expeditorul răspunde, rezultatul (`trimis` sau `esec`) se înregistrează la acea înscriiere. Site-ul primește răspunsul `acceptat` indiferent dacă expeditorul a reuşit; înscrierea se păstrează și fără confirmare.

**La refuz**, registrul nu consumă loc, nu înregistrează nimic și nu apelează expeditorul. Site-ul primește `refuz`.

## Reîncercări și eșecuri

Când site-ul reîcearcă o cerere (acelasi c), registrul o recunoaște și returnează imediat același rezultat anterior (`acceptat` sau `refuz`), **fără să consume alt loc**.

Dacă înscrirea anterioară a fost acceptată dar confirmarea s-a marcat `netrimisă` (expeditorul răspunse `esec`), registrul **reîncearcă expeditorul o dată**. Dacă de această dată răspunsul este `trimis`, actualizează înscrierea la `trimisă`. Dacă expeditorul răspunde din nou `esec`, înrăgistrarea rămâne `netrimisă`.

Dacă confirmarea anterioară era `trimisă`, expeditorul nu se apelează din nou.

## Operații și garanții

Echipa poate apela și operația `retrimite confirmările()`: expeditorul se contactează pentru fiecare confirmare `netrimisă` și rezultatele se actualizează.

**Sistemul garantează:**
- Fiecare identificator c produce maxim o înscriiere validă
- Locurile unui atelier nu se consumă mai mult pentru aceeași cerere, oricâte reîncercări
- Un participant nu poate fi înscris de două ori la același atelier
- O reîncercare returnează rezultatul anterior, deci site-ul nu dublează înscriieri din retrimiteri
- Reîncercările nu modifică alte înscrieri
- Confirmările `netrimisă` pot fi retrimise separat, fără a anula înscriieri

Eșecul expeditorului nu anulează înscrierea: beneficiarul preferă o participare neconfirmată unei pierderi de loc.