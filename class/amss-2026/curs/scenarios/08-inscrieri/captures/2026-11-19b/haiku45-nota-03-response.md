# Notă de Proiectare: Registrul de Locuri

## Prezentare generală

Registrul de locuri este serviciul care gestionează înscrierea participanților la ateliere cu locuri limitate. Aceasta primește cererile de la site-ul centrului, valorizează disponibilitatea și integrează trimiterea confirmărilor prin mesageria externă. Modelul garantează consistență și recuperare din eșecuri de comunicație.

## Fluxul unei înscrieri

Fiecare cerere de înscriere include un identificator unic **c** (generat de site), participantul **p** și atelierul **a**. La primire, registrul verifică:

1. **Dacă c este cunoscut** (reîncercare): returnează imediat același răspuns anterior fără modificări.
2. **Dacă c este nou**: acceptă doar dacă participantul nu e deja înscris la atelierul respectiv și rămân locuri libere. La acceptare, registrul **consumă un loc** și marchează înscrierea ca acceptată.

După acceptare, registrul contactează mesageria cu cererea de trimitere a confirmării participantului. Site-ul primește răspunsul `acceptat` indiferent de rezultatul mesageriei.

## Serviciul de mesagerie și gestionarea eșecurilor

Mesageria externă răspunde cu `trimis` sau `eșec expediție`. Registrul înregistrează starea confirmării la fiecare apel.

**Cazul eșecului**: mesageria răspunde `eșec expediție`. Înscrierea rămâne **validă și consumă locul**, dar confirmarea se marchează ca `netrimisă`. Participantul este înscris, dar nu a primit mesajul. Aceasta reflectă preferința operatorului: o încriere fără confirmare este mai sigură decât pierderea unui loc din cauza unei erori de comunicație.

## Reîncercări și recuperare

Când site-ul retransmite cererea cu același identificator **c** (de exemplu, timeout la afișare), registrul nu creează a doua înscrierei. Returnează `acceptat` și nu consumă loc suplimentar.

Dacă starea confirmării anterioară era `netrimisă`, registrul poate apela din nou mesageria pentru a încerca retrimisiunea și actualiza starea. Dacă starea era `trimisă`, nu contactează din nou mesageria.

Operatorul dispose și de operația manuală `retrimite_confirmări()`, care retrimite o dată toate confirmările cu stare `netrimisă`, actualizând rezultatele.

## Garanții

Sistemul garantează:

- **Consistență**: orice cerere neînregistrată acceptă cel mult un loc per participant per atelier; după acceptare, locul este consumat permanent.
- **Idempotență**: reîncercare cu același **c** produce rezultat identic; nu crează duplicate.
- **Separare**: eșecul mesageriei nu anulează înscrierea; participantul rămâne înscris chiar fără confirmare.
- **Recuperabilitate**: confirmările nereușite sunt retrimise la cerere, fără modificarea datelor de încriere.
- **Izolare**: o cerere nu afectează alte înscrieri sau disponibilitatea locurilor.