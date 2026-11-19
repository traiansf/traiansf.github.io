# Descrierea interacțiunii și garanții de proiectare

## Interacțiunea componentelor

**Site** inițiază o cerere de înscriering prin `înscrie(c, p, a)`, unde `c` este identificatorul unic generat pentru acea cerere (același dacă site-ul reîncearcă), `p` este participantul și `a` atelierul. **Registrul** primește cererea și:

1. Verifică dacă `c` este deja înregistrat (reîncercare) sau nou
2. Pentru cereri noi: validează disponibilitatea (loc liber și participant neînscris la atelier)
3. Dacă e valid: consumă un loc, înregistrează (c, p, a) și apelează **mesageria** prin `trimite(mesaj)`
4. Pentru reîncercări: returnează rezultatul anterior, indiferent de starea confirmării

**Mesageria** răspunde cu `trimis` sau `eșec expediție`. **Registrul** înregistrează starea confirmării (`trimisă` sau `netrimisă`) la fiecare apel, dar returnează site-ului `acceptat` indiferent de rezultat. Pentru reîncercări cu confirmare eșuată, registrul poate reapela mesageria și actualiza starea.

Operatorul centrului poate declanșa `retrimite confirmările()`: registrul reapelează mesageria o dată pentru fiecare confirmare `netrimisă` și actualizează starea.

## Garanții de proiectare

### Consistență a datelor
- **Consumul locurilor:** Fiecare identificator de cerere unic este procesat o singură dată. Reîncercările cu același `c` nu consumă locuri suplimentare, chiar dacă primesc din nou apelul.
- **Integritate înscrierii:** O înscriiere acceptată rămâne neschimbată. Noile cereri ale aceluiași participant la același atelier (cu identificatori diferiți) sunt refuzate explicit.
- **Izolare:** O cerere nu afectează alte înscriieri sau disponibilitatea locurilor pentru alte participanți.

### Livrarea confirmărilor
- **Decuplare:** Acceptarea înscrierii este independentă de succes mesageriei. Lipsa confirmării nu anulează participarea, dar participant neconfirmat înscris > participant confirmat neacceptat.
- **Tranzitivitate stării:** Starea confirmării reflectă răspunsul ultimului apel la mesagerie (`trimisă` = răspuns `trimis`; `netrimisă` = răspuns `eșec expediție`).
- **Retriere controlată:** `retrimite confirmării()` permite actualizarea doar a confirmărilor `netrimisă`, evitând mesaje duplicate pentru cele deja `trimisă`.

### Comportament la repetare cererilor
- **Idempotență:** Reîncercări cu același `c` returnează rezultatul anterior (`acceptat` sau `refuz`) fără modificări de stare.
- **Fără efecte secundare:** Nicio dată duplicată în evidență, niciun loc consumat din nou.
- **Recuperare progresivă:** Reîncercările pot triggers reapeluri la mesagerie pentru confirmări neterminate, permițând recuperare graduală fără a compromite consistența.