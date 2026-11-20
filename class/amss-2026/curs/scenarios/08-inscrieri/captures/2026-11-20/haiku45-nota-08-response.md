# Notă de proiectare — Registrul de locuri

## Scopul sistemului

Registrul de locuri al centrului cultural acceptă cererile de înscriere la ateliere cu locuri limitate, confirmă participanții prin mesagerie externă și ține evidența stării fiecărei înscrisuri.

## Fluxul unei înscrisuri

Fiecare cerere de înscriere `înscrie(c, p, a)` conține un identificator unic `c` generat de site, participantul `p` și atelierul `a`. Registrul acceptă cererea numai dacă:
- identificatorul `c` nu a mai fost înregistrat anterior,
- participantul `p` nu este deja înscris la atelierul `a`, și
- atelierul `a` are cel puțin un loc liber.

La acceptare, registrul consumă un loc și marchează înscrierea ca acceptată. Apoi apelează serviciul de mesagerie cu `trimite(mesaj)` pentru a trimite o confirmare participantului. După răspunsul mesageriei, registrul înregistrează rezultatul: `trimisă` dacă mesageria a răspuns `trimis`, sau `netrimisă` dacă a răspuns `eșec`.

**Rezultatul întors site-ului este întotdeauna `acceptat`**, indiferent că confirmare a reușit sau a eșuat. O înscriere acceptată consumă un loc, chiar dacă confirmarea nu ajunge la participant.

## Reîncercări și eșecuri

Când site-ul reîncearcă aceeași cerere (trimitând același identificator `c`), registrul o recunoaște și întoarce același răspuns `acceptat`, **fără să consume alt loc și fără a apela din nou mesageria** — cu o excepție: dacă confirmarea anterioară este marcată `netrimisă`, registrul apelează mesageria o dată pentru a încerca retransmisie și actualizează rezultatul.

Dacă o cerere nouă (cu identificator diferit) refuză pentru că atelierul nu mai are locuri libere, registrul întoarce `refuz` și nu apelează mesageria.

Operatorul centrului poate apela oricând `retrimite confirmările()`: sistemul retransmite o dată fiecare mesaj marcat `netrimisă`, fără a modifica înscrierile sau locurile.

## Garanții

Sistemul garantează:
- **Corectitudine:** o cerere acceptată consumă exact un loc; nicio cererere nu consumă locuri suplimentare la reîncercări.
- **Idempotență:** reîncercările cu același identificator nu duplică înscrisuri.
- **Separare:** o cerere nu afectează alte înscrisuri.
- **Izolare:** rezultatul unei înscrisuri reflectă răspunsul ultimului apel la mesagerie pentru acea cerere.
- **Persistență:** înscrisurile și rezultatele lor rămân înregistrate chiar dacă confirmarea eșuează.

Livrarea efectivă a mesajelor și citirea lor de participant sunt în afara modelului sistemului.