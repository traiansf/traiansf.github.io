# Interacțiunea componentelor și garanții

## Fluxul de bază

**Site-ul** transmite registrului o cerere `înscrie(c, p, a)` cu un identificator unic `c` pentru fiecare incercare a participantului `p`. **Registrul** validează cererea: dacă participantul nu este deja înscris la atelier și mai sunt locuri libere, acceptă înscrierea, consumă un loc și apelează **mesageria** să trimită o confirmare. Mesageria răspunde cu `trimis` sau `eșec`. Registrul înregistrează rezultatul și returnează site-ului `acceptat` indiferent de răspunsul mesageriei. În caz de respingere (loc ocupat, participant deja înscris), registrul nu apelează mesageria și returnează `refuz`.

## Garanții de consistență a datelor

Registrul garantează că fiecare cerere cu identificator neînregistrat consumă cel mult un loc și produce o singură înregistrare a înscrierii. Nicio cerere nu afectează alte înscrisuri: plajele de locuri rămân consistente. La reîncercări (același identificator `c`), registrul nu creează duplicate și nu consumă locuri suplimentare. Starea unei înscrisuri nu se modifică retroactiv după acceptare — locul acceptat nu este eliberat la eșecul mesageriei.

## Garanții de livrare a confirmărilor

Registrul nu garantează ca mesajul să ajungă participantului: doar consemnează răspunsurile mesageriei. Etichetele `trimisă` și `netrimisă` descriu starea ultimului apel către mesagerie, nu realitatea livrării. La acceptarea unei cereri noi, registrul apelează mesageria o singură dată și înregistrează rezultatul. La o reîncercare cu confirmare `netrimisă`, registrul apelează mesageria din nou, permiţând retrimiteri. Operația `retrimite confirmări()` permite unui operator să retrimită manual confirările eșuate, maximizând șansele de livrare efectivă. Aceste retrimiteri pot produce mesaje duplicate la destinație — beneficiarul preferă participantul înscris fără confirmare unui participant cu confirmare fără loc.

## Comportament la repetarea cererilor

Reîncercarea după succes (cerere cu același `c`, confirmare `trimisă`) returnează `acceptat` fără apel la mesagerie: evită confirmare duplică. Reîncercarea după eșec (confirmare `netrimisă`) returnează `acceptat` și declanșează o nouă tentativă de confirmare, dând o șansă de livrare. Reîncercarea după refuz returnează `refuz` fără modificări în stare. Site-ul controlează reîncercările: registrul le recunoaște prin identificator și se comportă idempotent — acelasi `c` produce mereu același rezultat și același efect asupra locurilor. Aceasta izolează cerurile și garantează că o cădere de rețea urmată de retransmisie nu duplică înscrisuri.