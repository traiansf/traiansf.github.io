# NOTĂ DE PROIECTARE — Registrul de Locuri

## Scop

Registrul de locuri coordonează înscrierile la ateliere cu locuri limitate și sesizează serviciul de mesagerie extern (operat de alte firme) pentru confirmare. Aceste note ghidează echipa de operare.

## Fluxul unei Înscrieri

Fiecare cerere de înscriere `înscrie(c, p, a)` are identificator unic `c` (generat de site). Registrul acceptă cererea dacă:
- identificatorul `c` nu a fost procesat anterior,
- participantul `p` nu este deja înscris la atelierul `a`,
- atelierul `a` are cel puțin un loc liber.

La acceptare, registrul consumă un loc și înregistrează înscrierea. Apoi apelează serviciul de mesagerie: `trimite(mesaj_confirmare)`. În orice alt caz, registrul refuză cererea fără a contacta mesageria.

## Comportamentul Mesageriei și Confirmări

După apelul la mesagerie, registrul asteaptă răspunsul: fie `trimis`, fie `eșec`.

**Garantie critică:** eșecul confirmării **nu anulează** înscrierea acceptată. Datorită acestei decizii, participantul rămâne înscris și locul rămâne ocupat indiferent de răspunsul mesageriei. Registrul înregistrează starea confirmării (`trimisă` la răspuns `trimis`, `netrimisă` la răspuns `eșec`).

## Reîncercare și Idempotență

Atunci când site-ul reîncearcă o cerere (de exemplu, pentru că nu a primit răspunsul din cauza unei probleme de rețea), trimite același identificator `c` cu același participant și atelier. Registrul recunoaște reîncercarea și:
- returnează din nou `acceptat` fără a consuma alt loc,
- nu creează o a doua înscriere,
- **nu apelează mesageria din nou dacă confirmarea anterioare era `trimisă`**,
- **apelează mesageria o dată dacă confirmarea anterioare era `netrimisă`**, pentru a încerca retransmisia.

## Garanții

Sistemul garantează:

1. **Consistență:** Fiecare identificator de cerere acceptat corespunde exact unei înscri­eri; niciun loc nu este consumat de două ori de aceeași cerere.
2. **Atomicitate pe înscrierea:** Consum de loc și înregistrare a cererii sunt simultane; nu se creează stări intermediare vizibile.
3. **Izolare:** O cerere nu modifică alte înscrieri; fiecare atelierul menține o coadă de locuri consistentă.
4. **Durabilitate:** După întoarcerea răspunsului site-ului, înscrierea și starea confirmării sunt permanente.
5. **Retriere sigură:** Reîncercările cu același `c` nu causează înscri­eri duplicate sau consum extra de locuri.
6. **Prioritate înscrierii:** Un participant preferat neconfirmat e mai valoros decât participant neînscris cu confirmare; eșecul mesageriei nu afectează valabilitatea locului.