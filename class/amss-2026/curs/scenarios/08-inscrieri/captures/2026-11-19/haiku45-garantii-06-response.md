# Descriere arhitecturală — Sistemul de înscrierii și confirmări

## Interacțiunea componentelor

**Fluxul de bază:**
Site-ul cere înscrierea participantului p la atelierul a prin `înscrie(c, p, a)`, unde c este un identificator generat de site, unic pentru fiecare cerere nouă. Registrul valida: acceptă cererea dacă p nu este deja înscris la a și mai există locuri libere, consumă un loc și înregistrează tripletul (c, p, a). Imediat după acceptare, registrul apelează serviciul extern (expeditorul) cu `trimite(mesaj)`. După răspunsul expeditorului (`trimis` sau `esec`), registrul stochează starea confirmării la acea înscriere și întoarce site-ului `acceptat`, indiferent de răspunsul expeditorului.

**Reîncercările site-ului:**
Când site-ul retrimite o cerere cu același c, registrul recunoaște cererea prin identificatorul c și întoarce rezultatul salvat anterior (`acceptat`), fără să consume loc suplimentar. Dacă confirmarea precedentă era marcată `netrimisă`, registrul apelează din nou expeditorul și actualizează starea; dacă era `trimisă`, nu apelează.

**Retrimiterea operatorului:**
Operatorul apelează `retrimite confirmările()`, care iterează fiecare confirmare marcată `netrimisă` și încearcă o dată trimiterea, actualizând starea fiecăreia conform răspunsului expeditorului.

## Garanții de operare

**Consistența datelor:**
- Fiecare înscriere acceptată (c, p, a) este înregistrată exact o dată și nu poate fi duplicată prin reîncercări, deși apelurile site-ului sunt autonome.
- Locurile sunt consumate odată cu înscrierea; nici o reîncercare nu consumă locuri suplimentare.
- Participantul nu apare de mai multe ori la același atelier.

**Livrarea confirmărilor:**
- Registrul expune starea fiecărei confirmări: `trimisă` (ultimul apel la expeditor a răspuns `trimis`), `netrimisă` (ultimul apel a răspuns `esec`), sau `în așteptare` (apelul este în curs).
- Retrimiterea permite operatorului să recupereze cazurile de eșec fără să piardă date de înscrierea.
- Oricum, niciun eșec de confirmare nu anulează înscrierea; beneficiarul preferă un participant înscris fără confirmare, deoarece l-a putea contacta direct.

**Comportamentul la repetare:**
- Reîncercările site-ului cu același c produc același rezultat (`acceptat`), deci sunt **idempotente din perspectiva datelor interne**.
- Retrimiterea confirmărilor poate genera mesaje duplicate către expeditor (R6), dar nu schimbă starea locurilor sau a înscrisurilor.

Registrul acționează ca **buffer fiabil** între site-ul care ar putea retrimite și expeditorul extern nedependabil.