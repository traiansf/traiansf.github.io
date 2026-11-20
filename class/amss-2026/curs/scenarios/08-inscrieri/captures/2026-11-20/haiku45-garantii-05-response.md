# Specificație: Înscrierea și Confirmarea în Registrul Atelierelor

## Fluxul de interacțiune

**Site → Registru:** Site-ul transmite cererile de însciere `înscrie(c, p, a)`, unde `c` este identificatorul unic al cererii generat de site (reutilizat în reîncercări), `p` este participantul și `a` este atelierul. Registrul validează cererea: acceptă doar dacă participantul nu este deja înscris, atelierul are locuri libere și identificatorul cererii este nou. La acceptare, consumă un loc și înregistrează tripletul (c, p, a).

**Registru → Mesagerie:** După înscrierea acceptată, registrul apelează imediat `trimite(mesaj)` și așteaptă răspunsul (`trimis` sau `eșec`). Resultatul este stocat la inscrierea respectiva, independent că a reușit sau nu. Site-ul primește răspunsul `acceptat` în ambele cazuri.

**Reîncercările:** Dacă site-ul retransmite aceeași cerere (același `c`), registrul identifică-o ca reîncercare și întoarce `acceptat` fără a consuma alt loc. Dacă confirmarea anterioară era `trimisă`, nu apelează mesageria. Dacă era `netrimisă`, reapelează mesageria o dată.

## Garanțiile consistenței datelor

**Ocuparea locurilor:** Orice loc acceptat este consumat exact o dată. Reîncercările nu creează duplicate de înscrierii. O inscriere refuzată nu consuma resurse.

**Înregistrarea inscrierii:** Starea (`acceptat` / `refuz`) este persistentă și determinată de stare la primirea cererii. Noile cereri (identificator nou) și reîncercările (identificator cunoscut) sunt tratate distinct și ireversibil.

**Independență:** Fiecare cerere afectează doar o singură înscriiere la un atelier, fără a modifica alte locuri sau înscrierii.

## Comportamentul la livrarea confirmărilor și repetare

**Eșecul confirmării:** Livrarea confirmării la mesagerie este ortogonală acceptării. Dacă mesageria răspunde `eșec`, înscrierea rămâne valabilă (participantul este deja înscris). Registrul marchează confirmarea ca `netrimisă`, semn că ultimul apel a întors `eșec`, nu că știm cu certitudine că mesajul n-a ajuns.

**Retrimite confirmări:** Operatorul poate apela `retrimite confirmările()`, care reapelează mesageria pentru fiecare confirmație `netrimisă`, actualizează rezultatul și se oprește. Retrimiterea poate genera duplicate de mesaje.

**Idempotența reîncercărilor:** Site-ul poate reîncerca aceeași cerere de oricâte ori cu același `c`. Registrul garantează că răspunsul și comportamentul extern (apeluri mesagerie) sunt determinist și nu se modifică după prima acceptare. Starea internă (`în așteptare`, `trimisă`, `netrimisă`) este finalizată după răspunsul mesageriei; reîncercările nu modifica această stare dacă confirmarea s-a încheiat cu succes.