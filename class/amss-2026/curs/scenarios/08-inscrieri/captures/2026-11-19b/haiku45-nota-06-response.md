# Notă de Proiectare — Registrul de Locuri

## Context și Fluxul de Bază

Registrul de locuri acceptă cereri de înscriere la ateliere cu locuri limitate. Fiecare cerere are un identificator unic generat de site. Fluxul normal este:

1. Site-ul trimite `înscrie(c, participant, atelier)`
2. Registrul verifică dacă identificatorul c este nou și dacă participantul nu este deja înscris
3. Dacă sunt locuri libere, registrul **acceptă** cererea: consumă un loc și înregistrează (c, participant, atelier)
4. Imediat după, apelează mesageria externă: `trimite(confirmare)`
5. Mesageria răspunde `trimis` sau `eșec expediție`
6. Registrul înregistrează starea confirmării la această înscriere și întoarce site-ului `acceptat`

**Detaliu crucial:** eșecul confirmării **nu anulează** înscrierea. Participantul rămâne înscris, indiferent dacă confirmarea a ajuns.

## Comportament la Eșec Expediție

Dacă mesageria răspunde `eșec expediție`, registrul marcheaza confirmarea ca `netrimisă`, dar:
- Participantul rămâne înscris și locul rămâne ocupat
- Site-ul primește același răspuns: `acceptat`
- Mesajul de confirmare nu a fost livrat (conform ultimului apel)

Centrul poate folosi apoi operația `retrimite confirmările()` pentru a reîncerca confirmările neligate manual, o singură dată pentru fiecare, și pentru a actualiza statusul confirmării.

## Comportament la Reîncercare

Atunci când site-ul reîncearcă aceeași cerere (trimit același identificator c), registrul:

1. **Detectează că c este deja înregistrat** și nu procesează cererea de zero
2. Întoarce `acceptat` fără a consuma alt loc
3. **Dacă confirmarea anterioară este `netrimisă`:** apelează din nou mesageria pentru a reîncerca livrarea și actualizează statusul confirmării
4. **Dacă confirmarea anterioară este `trimisă`:** nu apelează mesageria din nou

Reîncerc automatice la nivel de apel mesageriei (din aceeași reîncercare site-ului) pot produce mesaje duplicate la beneficiar.

## Garanții

Sistemul garantează:

- **O singură loc per participat per atelier:** o cerere nouă acceptată consumă exact un loc; reîncercările nu crează înscrisuri duplicate
- **Consistență între loc și înscrisuri:** fiecare loc ocupat corespunde unei înscrisuri înregistrate cu identificator acceptat
- **Paritate între respingeri și acceptări:** o cerere respinge (refuz) consumă zero locuri și nu apelează mesageria
- **Idempotență la reîncercare:** retrimiterea aceleiași cereri cu același identificator produce același răspuns (acceptat) și nu modifică alte înscrisuri
- **Separare între înscrisuri și confirmare:** statusul confirmării nu afectează înscrierea; prioritatea este locul asigurat, nu confirmarea livrării