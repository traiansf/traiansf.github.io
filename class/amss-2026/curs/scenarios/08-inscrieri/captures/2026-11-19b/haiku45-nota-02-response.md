# Notă de Proiectare — Registrul de Locuri

## Scop
Registrul de locuri gestionează înscrierile la ateliere cu plăți limitate. Acceptă cereri de la site-ul centrului, confirmă participanții prin mesagerie externă și garantează coerență între locurile disponibile și confirmări.

## Fluxul de Înscriere

O cerere `înscrie(c, participant, atelier)` decurge în trei etape:

1. **Validare:** Registrul verifică dacă identificatorul cererii `c` este nou. Dacă da, controlează dacă participantul nu este deja înscris la atelier și dacă mai este loc liber. În caz afirmativ, acceptă: consumă un loc, înregistrează înscrierea cu `c`.

2. **Confirmare:** După acceptare, registrul cere mesageriei să trimită participantului o notificare. Mesageria răspunde `trimis` (confirmare reușită) sau `eșec expediție` (trimitere eșuată).

3. **Rezultat:** Înscrierea este înregistrată cu starea confirmării (`trimisă` sau `netrimisă`). Site-ul primește `acceptat` indiferent de rezultatul mesageriei — locul este rezervat și locul confirmării are importanță secundară.

## Gestionarea Erorilor și Reîncercării

**Eșec expediție:** Dacă mesageria nu confirmă, participantul rămâne înscris, locul consumat rămâne ocupat. Starea „netrimisă" se înregistrează, permițând reîncercări ulterioare.

**Reîncercare pe aceeași cerere:** Dacă site-ul retrimite o cerere cu același identificator `c` (de exemplu, pentru că nu a primit răspunsul), registrul detectează că `c` este cunoscut și întoarce imediat `acceptat` fără a consuma alt loc. Dacă confirmarea era `netrimisă`, registrul apelează mesageria din nou; dacă era `trimisă`, nu apelează — evitând duplicări inutile.

**Cerere nouă cu alt identificator:** Dacă participantul e deja înscris, noul `c` este refuzat; dacă locurile s-au epuizat, refuz — fără apel la mesagerie.

## Retrimitere Manuală

Operatorul centrului poate apela `retrimite confirmările()` pentru a reîncerca o dată confirmările marcate `netrimisă`, actualizând rezultatele fără a modifica înscrierile.

## Garanții

Sistemul garantează:
- **Coerență:** Niciun loc nu este consumat decât o singură dată per participant per atelier.
- **Determinism:** Același identificator de cerere produce întotdeauna același rezultat.
- **Izolare:** O cerere nu afectează alte înscrieri sau locurile acestora.
- **Preferință pentru înscrierea:**  Un participant fără confirmare este preferat unuia cu confirmare fără loc — înscrierea e definitorie, confirmarea e confirmație de efort.