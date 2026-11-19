# Notă de Proiectare — Registrul de Locuri

## Flux de Funcționare

Registrul de locuri acceptă cereri de înscriere de la site-ul centrului cultural. Fiecare cerere conține identificatorul cererii (unic pentru fiecare participare), participantul și atelierul dorit.

**Acceptarea unei înscrierii:** o cerere cu identificator neînregistrat anterior este acceptată dacă participantul nu este deja înscris la acel atelier și locurile nu sunt epuizate. Dacă sunt îndeplinite aceste condiții, registrul consumă un loc și consemnează înscrierea.

**Confirmarea participantului:** imediat după acceptare, registrul apelează expeditorul de confirmări pentru a trimite participantului un mesaj de confirmare. Expeditorul răspunde cu „trimis" sau „esec". Registrul înregistrează această valoare în starea înscrierii.

## Expeditorul de Confirmări și Gestionarea Eșecului

Expeditorul de confirmări este un serviciu extern, operat de o altă firmă. Registrul nu controlează implementarea acestuia — doar presupune că răspunde la fiecare apel.

**Răspunsul esec:** când expeditorul răspunde „esec", înscrierea rămâne valabilă și consumul de loc nu este anulat. Site-ul primește răspunsul „acceptat" în ambele cazuri (confirmare trimisă sau eșuată). Sistemul prioritizează prezența locului pentru participant asupra confirmării: un participant înscris fără confirmare este preferabil unui participant fără loc.

## Reîncercare și Idempotență

Când site-ul retrimite o cerere cu același identificator (după o întrerupere de conexiune, de exemplu), registrul o recunoaște și întoarce rezultatul anterior fără a modifica starea.

**Dacă confirmarea inițială eșuase:** registrul poate apela din nou expeditorul și actualiza rezultatul. **Dacă confirmarea eșuase și se retrimite:** retrimiterea poate genera mesaje duplicate la participant, dar aceasta este o trădare acceptată pentru a garanta probabilitatea confirmării.

**Dacă confirmarea eșuase și nu se retrimite:** registrul oferă operatorului o funcție separată pentru a reîncerca manual confirmările nereușite.

## Garanții

Sistemul garantează:

- **Atomicitate pe cerere:** o cerere acceptată consumă exact un loc; reîncercările nu generează înscrisuri duble.
- **Idempotență:** aceeași cerere întoarce întotdeauna același rezultat.
- **Izolare:** o cerere nu afectează alte înscrierii.
- **Înregistrare:** fiecare acceptare și rezultat al confirmării este consemnat permanent.
- **Separare:** eșecul confirmării nu anulează înscrierea; beneficiarul știe diferența.