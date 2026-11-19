# Nota de Proiectare — Registrul de Locuri

## Fluxul de Înscriere

La primirea apelului `înscrie(c, participant, atelier)`, registrul validează cererea folosind identificatorul unic c transmis de site:

1. **Validare**: dacă c nu este în registru și participantul nu este deja înscris la atelier cu un loc disponibil, cererea se acceptă. Registrul consumă un loc și înregistrează (c, participant, atelier).
2. **Confirmare**: după acceptare, registrul apelează expeditorul extern cu `trimite(mesaj)` și înregistrează răspunsul: `trimisă` (dacă expeditorul răspunde `trimis`) sau `netrimisă` (dacă răspunde `esec`).
3. **Răspuns site-ului**: în ambele cazuri, site-ul primește `acceptat`, deoarece înscrierea este consumată indiferent de rezultatul confirmării. Participant preferă loc fără confirmare decât confirmare fără loc.

Dacă c este deja în registru sau cererea nu îndeplinește condițiile (participant deja înscris, atelier plin), registrul întoarce imediat `refuz`.

## Eșecul Expeditorului și Reîncerarile

Când expeditorul răspunde `esec`, confirmarea se înregistrează ca `netrimisă`, dar **înscrierea rămâne valabilă**. Locul este consumat.

La o reîncercare — aceași cerere c transmisă din nou de site (după timeout):
- Registrul recunoaște c și întoarce `acceptat` fără a consuma alt loc.
- **Dacă confirmarea anterioară era `netrimisă`**, registrul apelează expeditorul din nou și actualizează rezultatul. Retrimiterea poate genera mesaje duplicate.
- **Dacă era `trimisă`**, expeditorul nu se apelează.

Registrul oferă și operația `retrimite confirmările()` pentru operatori: retrimite o singură dată fiecare confirmare `netrimisă`, actualizând rezultatele fără a modifica înscrierile.

## Garanții

Sistemul garantează:

1. **Atomicitate**: fiecare `înscrie` cu c unic produce o alegere finală (acceptat/refuz) și o înregistrare consistentă.
2. **Idempotență**: aceeași cerere c (reîncercată) produce același răspuns și nu consumă locuri suplimentare.
3. **Locuri consečvente**: numărul de locuri consumate nu depășește capacitatea; fiecare participant ocupă cel mult un loc per atelier.
4. **Independență**: o cerere nu modifică alte înscrieri.
5. **Reziliență**: pierderea confirmării nu anulează înscrierea; datele sunt recuperabile prin reîncercări sau prin operația de retransmitere.