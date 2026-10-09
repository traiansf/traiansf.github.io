## Model de date

- **Membru**: identificator, nume, date de contact, stare.
- **Carte**: identificator, titlu, autor, ISBN.
- **Exemplar**: identificator, carte, cod de inventar, stare (disponibil, împrumutat, pierdut etc.). Separarea cărții de exemplare permite mai multe copii ale aceluiași titlu.
- **Împrumut**: identificator, exemplar, membru, data împrumutului, scadență, data returnării.
- **Cerere de împrumut**: identificator, carte, membru, data cererii, stare (în așteptare, disponibilă, anulată, onorată), poziție în coadă.

## Operații principale

1. **Împrumută un exemplar**: verifică eligibilitatea membrului și disponibilitatea unui exemplar; creează împrumutul și îl marchează ca împrumutat.
2. **Returnează un exemplar**: înregistrează data returnării și marchează exemplarul disponibil; dacă există cereri în așteptare pentru carte, notifică primul membru și rezervă-i exemplarul pentru o perioadă stabilită.
3. **Depune o cerere**: dacă nu există exemplare disponibile, adaugă membrul în coada de așteptare pentru carte. Evită cererile duplicate active ale aceluiași membru.
4. **Anulează o cerere**: marchează cererea ca anulată și actualizează coada.
5. **Consultă situația**: listează împrumuturile active ale unui membru, scadențele și cererile sale.

La împrumut și returnare, actualizarea stării exemplarului și a înregistrării de împrumut trebuie făcută atomic, pentru a evita împrumuturi duble.
