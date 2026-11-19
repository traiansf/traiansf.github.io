# Interacțiunea componentelor și garanțiile operaționale

## Fluxul de interacțiune

**La înscrierea unui participant:**
Site-ul trimite registrului o cerere `înscrie(c, p, a)` cu identificatorul unic c al cererii, participantul p și atelierul a. Registrul verifică dacă c este nou: dacă da și sunt îndeplinite condițiile (p nu este deja înscris la a și există loc liber), consumă un loc, înregistrează tripletul (c, p, a) și apelează o singură dată mesageria pentru a trimite confirmarea. Rezultatul confirmării (trimisă/netrimisă) este înregistrat la înscrierea acceptată. Site-ul primește răspunsul `acceptat` indiferent de starea confirmării.

**La retrimiterea confirmărilor:**
Operatorul centului apelează `retrimite confirmările()`. Registrul parcurge toate înscrierea cu stare confirmă `netrimisă` și apelează mesageria pentru fiecare. Locurile și înscrierea rămân nemodificate; doar rezultatul confirmării se actualizează conform răspunsului.

**La reîncercări:**
Dacă site-ul retransmite `înscrie(c, p, a)` cu același c (semn că nu a primit răspunsul anterior), registrul recunoaște c ca înregistrat și întoarce imediat `acceptat`, fără a modifica locurile. Dacă confirmarea inițială fusese `netrimisă`, apelează din nou mesageria și actualizează rezultatul; dacă fusese `trimisă`, nu apelează mesageria.

## Garanții de proiectare

**Consistența datelor:**
- Fiecare identificator c nou consumă exact un loc și generează exact o înscrierea înregistrată, irevocabil.
- Locurile sunt o resursă conservatoare: o cerere nu afectează alte înscrierea.
- Starea unei înscrierea (c, p, a) și locurile atelierului a sunt atomice la acceptare: fie ambele se modifică, fie niciuna.

**Livrarea confirmărilor:**
- După acceptarea unei înscrierea, registrul apelează mesageria cel puțin o dată.
- Confirmările nelivrate (răspunsul mesageriei este `eșec expediție`) sunt retrimitibile: operatorul poate recupera omisiunile temporare prin `retrimite confirmările()`.
- Nicio înscrierea nu este anulată din cauza unei erori de confirmare; acceptarea și trimiterea sunt decuplate.
- Înscrierea rămâne valabilă chiar și dacă confirmarea rămâne `netrimisă`.

**Idempotența la repetarea cererilor:**
- O reîncercare cu același identificator c nu creează o a doua înscrierea și nu consumă un loc suplimentar.
- Răspunsul unei reîncercări este identic cu răspunsul original: `acceptat`.
- Reîncercările după eșec de confirmare declanșează o singură reîncercare a mesageriei; după succes, mesageria nu mai este apelată.
- Sistemul tolera pierderea răspunsurilor (site-ul poate nu-și primească răspunsurile) fără a crea inconsistențe.

Această arhitectură asigură că participanții sunt protejați de «vânzarea dublă» a unui loc, iar erorile de comunicație cu mesageria nu compromise înscrierea.