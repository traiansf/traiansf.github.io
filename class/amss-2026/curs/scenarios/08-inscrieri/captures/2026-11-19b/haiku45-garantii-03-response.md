# Descrierea interacțiunilor și garanțiile operațional

## Interacțiunea pentru **înscrie**

Site-ul transmite registrului o cerere `înscrie(c, p, a)` cu identificator unic c per participantul p. Registrul verifică trei condiții: identificatorul c nu este deja cunoscut, participantul p nu este înscris la atelierul a și a are locuri libere. Dacă sunt îndeplinite, registrul consumă un loc, înregistrează intrarea (c, p, a) și apelează mesageria `trimite(mesaj)` cu datele confirmării. Mesageria răspunde cu `trimis` sau `eșec expediție`. Registrul memorează rezultatul confirmării (`trimisă` sau `netrimisă`) și întoarce site-ului `acceptat` indiferent de răspunsul mesageriei. Dacă o condiție nu este îndeplinită, registrul întoarce `refuz` și nu apelează mesageria.

## Interacțiunea pentru **retrimite confirmări**

Operatorul centrului apelează `retrimite confirmări()`. Registrul iterează asupra tuturor înscrierilor cu starea confirmării `netrimisă`. Pentru fiecare, apelează mesageria o singură dată și actualizează starea (`trimisă` dacă răspunsul este `trimis`, `netrimisă` dacă `eșec expediție`). Nicio înscriere nu este modificată; doar starea confirmării se actualizează.

## Garanțiile pentru echipa de dezvoltare

### Consistența datelor
- **la înscrie:** o cerere acceptată consumă exact un loc și creează exact o însciere atomiț; site-ul poate reîncerca cu același c fără consecințe; identificatorii c, o dată acceptați, nu produc duplicate.
- **la retrimite confirmări:** operația nu modifică nici o însciere, nici locuri; ea doar reîncearcă trimiteri deja acceptate.

### Livrarea confirmărilor
- **garanție slabă:** răspunsul `trimis` înseamnă că cel mai recent apel la mesagerie pentru acea înscriere a returnat `trimis`; nu garantează citirea participantului.
- **retrimitere:** înscrierea cu starea `netrimisă` va beneficia de o nouă tentativă prin `retrimite confirmări()`.
- **duplicare posibilă:** reîncercarea site-ului al unei cereri cu confirmare `netrimisă` și retrimiteri manuale pot genera mesaje duble; centrul trebuie să gestioneze deduplicarea.

### Comportamentul la repetare
- **cerere cu c cunoscut:** registrul întoarce `acceptat` fără noi consumări de locuri și apeluri la mesagerie, **excepție:** dacă confirmarea este `netrimisă`, apelul mesageriei este reexecutat.
- **cerere nouă cu alt c:** o nouă cerere a unui participant deja înscris la a întoarce `refuz` fără apeluri la mesagerie.
- **invariant:** un participant ocupă maximum un loc per atelier; locurile nu cresc; site-ul vede răspunsuri consistente pentru același c.