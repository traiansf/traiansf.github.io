# Interacțiunea și garanțiile sistemului de înscrierii

## Fluxul de interacțiune

**La cererea de însciere:** site-ul transmite registrului o cerere `înscrie(c, p, a)` cu identificatorul unic c, participantul p și atelierul a. Registrul verifică dacă c este nou și dacă p nu este deja înscris la a și dacă există locuri libere. Dacă sunt îndeplinite toate condițiile, registrul consumă un loc, înregistrează tripletul (c, p, a), apoi apelează serviciul de mesagerie cu un mesaj de confirmare. După ce mesageria răspunde — `trimis` sau `eșec expediție` — registrul memorează starea confirmării și întoarce site-ului răspunsul `acceptat`, indiferent de rezultatul mesageriei.

**La reîncercare:** dacă site-ul reapelează cu același c (de obicei după pierderea răspunsului), registrul recunoaște cererea și returnează din nou `acceptat`, fără să consume alt loc. Dacă confirmarea precedentă a fost netrimisă, registrul o reîncearcă cu mesageria; dacă a fost trimisă, nu mai apelează serviciul.

**Operația de retrimitere:** un operator poate cere `retrimite confirmările()`, care reapelează mesageria pentru fiecare confirmare netrimisă și actualizează rezultatul, fără să modifice înscrierile.

---

## Garanțiile pentru echipa de dezvoltare

**Consistența datelor:**
- Fiecare cerere identificată prin c este înregistrată o singură dată ca pereche (c, p, a). Reîncercările cu acelaşi c nu crează duplicate de înscrierii.
- Un participant p nu poate fi înscris de două ori la acelaşi atelier a.
- Fiecare loc consumat corespunde exact unei înscrierii acceptate; locurile nu sunt revendicare pe reîncercări.
- Referințele la stare (numărul de locuri, lista de înscrierii) rămân coerente între apeluri.

**Livrarea confirmărilor:**
- După orice acceptare, registrul invocă mesageria cu cel puțin o cerere de trimitere.
- Starea fiecărei înscrierii reține rezultatul confirmării: `trimisă` dacă ultimul apel la mesagerie a returnat `trimis`, `netrimisă` dacă a returnat `eșec expediție`, ori `în așteptare` dacă apelul este în curs.
- Retrimiterea este posibilă: stările netrimise pot fi reapelate fără a invalida înscrierea.
- Nu garantăm că participantul a primit efectiv mesajul; garantăm doar răspunsurile mesageriei și ciclul de reapelare.

**Comportamentul la repetarea cererilor:**
- Orice cerere cu identificatorul c deja cunoscut returnează răspunsul original `acceptat` și nu modifică alte date.
- Reîncercările nu pot determina anularea, mutarea sau modificarea unei înscrierii acceptate.
- Retrimiterea nu afectează alte înscrierii, locurile lor sau cererile în curs.
- Acceptarea unei cereri noi cu p deja înscris la a returnează `refuz` și nu consume locuri.