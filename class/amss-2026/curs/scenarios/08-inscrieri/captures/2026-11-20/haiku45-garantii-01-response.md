# Descrierea interacțiunilor și garanțiile operaționale

## Fluxul interacțiunilor

**Pentru înscrie:**
Site-ul transmite registrului o cerere `înscrie(c, p, a)`, unde `c` este identificatorul unic al cererii, `p` participantul și `a` atelierul. Registrul verifică dacă `c` este nou. Dacă da, acceptă cererea numai dacă participantul `p` nu are deja o înscrisoare la atelierul `a` și mai este un loc liber. La acceptare, registrul consumă un loc, înregistrează tripletul (c, p, a), apoi solicită mesageriei să trimită o confirmare cu `trimite(mesaj)`. După răspunsul mesageriei (`trimis` sau `eșec`), registrul înregistrează starea confirmării și întoarce site-ului `acceptat`. Dacă acceptarea eșuează, registrul întoarce `refuz` și nu apelează mesageria.

**Pentru retrimite confirmări:**
Operatorul declanșează `retrimite confirmări()`, care apelează mesageria o singură dată pentru fiecare confirmare marcată `netrimisă`, actualizând rezultatul pe baza răspunsului.

## Garanții operaționale

**G1 — Consistența datelor:**
- Fiecare identificator `c` este înregistrat cel mult o dată. 
- O înscrisoare se acceptă exact când sunt ambele condiții adevărate: `p` nu are alt `c` acceptat la `a` și `a` are un loc liber.
- Reîncercările cu `c` deja cunoscut nu generează noi înscrisuri nici nu consumă locuri suplimentare.
- Locurile totale la `a` nu depășesc niciodată limita inițială.
- Starea confirmării (trimisă/netrimisă/în așteptare) reflectă cel mai recent răspuns al mesageriei pentru acea înscrisoare.

**G2 — Livrarea confirmărilor:**
- După fiecare acceptare, registrul efectuează un apel la mesagerie.
- La reîncercarea unei cereri al cărei răspuns anterior este `acceptat` și confirmarea `netrimisă`, registrul apelează mesageria din nou.
- La reîncercări cu confirmare `trimisă`, mesageria nu este apelată.
- Operatorul poate retrimite manual confirmările `netrimisă`.
- Acceptarea se raportează ca `acceptat` indiferent dacă confirmarea succeduiește; eșecul confirmării nu anulează înscrierea.

**G3 — Idempotență la repetarea cererilor:**
- O cerere identificată de `c` cu același participant și atelier produce mereu același răspuns (`acceptat` sau `refuz`).
- Reîncercările nu schimbă locurile disponibile.
- Reîncercările nu creează duplicate de înscrisuri.
- Retrimiterea confirmării poate genera mesaje duplicate către participant.