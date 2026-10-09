### Model de date

- **Membru**: ID, nume, date de contact, stare.
- **Carte**: ID, titlu, autor, ISBN.
- **Exemplar**: ID, carte, cod de inventar, stare (disponibil, împrumutat, pierdut etc.). Separarea de carte permite gestionarea mai multor copii.
- **Împrumut**: ID, exemplar, membru, data împrumutului, termen de returnare, data returnării (opțional), stare.
- **Cerere de împrumut**: ID, membru, carte, data cererii, stare (în așteptare, disponibilă, onorată, anulată), poziție în coadă.

### Operații principale

1. **Împrumută un exemplar**: verifică eligibilitatea membrului și disponibilitatea; creează împrumutul și marchează exemplarul ca împrumutat.
2. **Returnează un exemplar**: înregistrează data returnării și marchează exemplarul disponibil. Dacă există cereri în așteptare pentru carte, notifică membrul următor și rezervă exemplarul pentru o perioadă limitată.
3. **Depune o cerere**: dacă nu există exemplare disponibile, adaugă cererea la coada cărții. Previne cererile duplicate ale aceluiași membru pentru aceeași carte.
4. **Gestionează cererile**: anulează cereri, avansează coada când apare un exemplar disponibil și marchează cererea onorată când împrumutul este acordat.
5. **Consultă**: afișează împrumuturile active, istoricul și cererile unui membru, precum și disponibilitatea exemplarelor.

Actualizările de împrumut, stare a exemplarului și coadă ar trebui făcute atomic, ca să nu poată fi alocat același exemplar de două ori.
