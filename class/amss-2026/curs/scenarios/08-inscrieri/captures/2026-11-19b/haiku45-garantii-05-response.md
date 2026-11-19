# Interacțiunea și garanții - Registrul de locuri

## Interacțiunea

**Site** generează identificatori unici de cerere și trimite registrului solicitări `înscrie(c, p, a)` pentru a înscrie participantul p la atelierul a cu identificatorul cererii c. 

**Registru** verifică dacă cererea cu identificator c este nouă. Dacă da, acceptă înscrierea numai dacă participantul p nu este deja înscris la a și atelierul a mai are locuri libere. La acceptare, registrul **consumă un loc** și înregistrează înscrierea, apoi apelează **mesageria** pentru trimiterea confirmării. Rezultatul apelului (trimis/eșec) se salvează ca `trimisă` sau `netrimisă` și întoarce site-ului răspunsul `acceptat`. Dacă cererea nu poate fi acceptată, registrul răspunde `refuz` fără a apela mesageria.

Dacă cererea cu identificatorul c este deja înregistrată (reîncercare), registrul răspunde cu `acceptat` și nu consumă alt loc. Pentru reîncercări cu confirmare `netrimisă`, registrul apelează din nou mesageria și actualizează rezultatul.

**Mesageria** (serviciu extern) răspunde cu `trimis` sau `eșec expediție` la fiecare apel `trimite(mesaj)`. Registrul nu modelează livrarea efectivă: `trimisă` înseamnă doar că mesageria a răspuns `trimis`, iar `netrimisă` că a răspuns `eșec`.

Operator poate apela **`retrimite confirmările()`**: registrul reîncearcă o singură dată fiecare confirmare `netrimisă`, actualizând rezultatul, fără a modifica înscrierile sau locurile.

## Garanții

**Consistența datelor:**
- Fiecare identificator de cerere c acceptat corespunde exact unei înscrierii (p, a).
- Locurile consumate și înscrierii acceptate rămân sincronizate: loc consumat ⟺ înscrierea acceptată.
- Niciun participant nu apare de două ori în aceleeași atelier.
- O cerere nouă nu modifică alte înscrierii.

**Livrarea confirmărilor:**
- La fiecare acceptare nouă, registrul apelează mesageria o singură dată și înregistrează rezultatul.
- La reîncercare cu c cunoscut și confirmare `netrimisă`, registrul apelează mesageria din nou; la confirmare `trimisă`, nu apelează.
- Operatorul poate retrimite manual confirmările `netrimisă`, apelând mesageria o dată pe fiecare.
- Retrimiterea poate genera mesaje duplicate la mesager, dar nu modifică înscrierea.
- Eșecul confirmării nu anulează înscrierea: acceptarea se întoarce chiar dacă confirmarea este `netrimisă`.

**Comportament la repetare:**
- Reîncercări cu același c (identificator, participant, atelier) returnează mereu răspunsul `acceptat`.
- Reîncercările nu consumă locuri suplimentare.
- Refolosire lui c cu alt conținut este operație neadmisă.
- Apelurile rămân secvențiale; fiecare reîncercare se bazează pe starea stabilă anterioară.