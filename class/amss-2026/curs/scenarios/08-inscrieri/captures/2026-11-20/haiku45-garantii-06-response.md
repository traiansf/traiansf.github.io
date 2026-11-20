# Interacțiunea și garanțiile sistemului de înscrierii

## Fluxul de interacțiune

**Site** generează o cerere de înscriire `înscrie(c, p, a)` cu identificator unic `c`, participant `p` și atelier `a`. **Registrul** primește cererea și verifică doi invarianți: (1) participantul `p` nu este deja înscris la `a`, (2) atelierul `a` are locuri libere. Dacă ambele sunt îndeplinite și `c` nu a fost înregistrat anterior, înscrierea este acceptată: registrul consumă un loc și marchează cererea ca procesată. Imediat după, apelează **mesageria** să trimită o confirmare. Rezultatul apelului (`trimis` sau `eșec`) este înregistrat la acea înscriiere. Site-ul primește răspunsul `acceptat` indiferent de starea confirmării.

Dacă site-ul retrimite aceeași cerere (același `c`), registrul recunoaște cererea și returnează `acceptat` fără să consume alt loc. Dacă confirmarea precedentă era `trimisă`, mesageria **nu** este apelată din nou. Dacă era `netrimisă`, se apelează o dată mesageria.

Operatorul apelează `retrimite confirmările()` pentru a încerca din nou fiecare confirmare cu status `netrimisă`, actualizând rezultatul după răspunsul mesageriei.

## Garanții de proiectare

**Consistența datelor:** Fiecare identificator de cerere `c` este procesat atomic și o singură dată în registru. Locurile libere sunt consumate doar la acceptare, indiferent de câte reîncercări primește site-ul cu același `c`. Nu apar înscrierii duplicate pentru aceeași cerere. O cerere nu afectează alte locuri sau înscrierii.

**Livrarea confirmărilor:** După acceptarea unei înscrierii, registrul apelează mesageria o dată. Eșecul confirmării nu anulează înscrierea — beneficiarul prioritizează participant înscris fără confirmare. La reîncercări cu status `netrimisă`, se apelează mesageria din nou; la status `trimisă`, nu. Operatorul poate retrimite confirmări `netrimisă` prin operația dedicată. Retrimiterea poate genera duplicate de mesaje; livrarea efectivă rămâne răspunderea mesageriei.

**Comportamentul la repetare:** Aceeași cerere `c` returnează dintotdeauna `acceptat` dacă a fost acceptată inițial. Retrimiterea la mesagerie se face doar dacă confirmarea precedentă a eșuat. Site-ul nu trebuie să prelucreze stări de confirmare; vede doar `acceptat` sau `refuz`.

Aceste garanții izolează site-ul și operatorul de volatilitatea mesageriei și permit recuperarea confirmărilor pierdute fără a risca duplicarea locurilor.