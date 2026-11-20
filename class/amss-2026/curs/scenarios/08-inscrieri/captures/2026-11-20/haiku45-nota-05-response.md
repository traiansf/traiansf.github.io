# Notă de Proiectare — Registrul de Locuri

## Scop

Registrul de locuri acceptă cereri de înscriere la ateliere, coordonează confirmarea prin serviciul extern de mesagerie și înregistrează starea fiecărei înscrieri.

## Fluxul de Înscriere

La primirea cererii `înscrie(c, p, a)`:
1. **Validare:** registrul verifică dacă identificatorul cererii `c` este nou. Dacă `c` este deja înregistrat, returnează imediat rezultatul din înregistrarea anterioară fără alte acțiuni.
2. **Acceptare:** o cerere nouă este acceptată dacă participantul `p` nu este deja înscris la atelierul `a` și sunt locuri libere. Registrul consumă un loc și marchează cererea ca acceptată.
3. **Refuz:** dacă participantul e deja înscris sau nu sunt locuri, registrul returnează `refuz` și nu contactează mesageria.
4. **Confirmare:** după acceptare, registrul cere mesageriei să trimită notificarea participantului și așteaptă răspunsul.
5. **Răspuns:** registrul returnează site-ului `acceptat` și salvează starea confirmării (trimisă sau netrimisă).

## Comportament la Eșec și Reîncercări

**Eșec de confirmare:** dacă mesageria răspunde `eșec`, participantul rămâne înscris și locul este consumat. Înscrierea se marchează `netrimisă`. Beneficiarul preferă participant înscris fără notificare decât să piardă locul. Site-ul primește `acceptat` în ambele cazuri.

**Reîncercare după eșec:** când site-ul reîncearcă cu același identificator `c`, registrul detectează cererea deja înregistrată și returnează `acceptat`. Dacă confirmarea anterioară era `netrimisă`, registrul apelează mesageria o dată pentru a încerca din nou. Dacă era `trimisă`, nu contactează din nou mesageria.

**Reîncercare după succes:** dacă confirmarea era `trimisă`, registrul nu mai apelează mesageria. Returnează `acceptat` direct.

## Garanții

Sistemul garantează:
- **Fiecare loc atribuit o singură dată:** o cerere acceptată consumă exact un loc; reîncercările nu generează înscrisuri duplă.
- **Determinism:** pentru același identificator `c`, registrul returnează același răspuns indiferent de câte reîncercări.
- **Consistență înregistrării:** starea confirmării reflectă ultimul răspuns al mesageriei; atribuirea locului nu depinde de succes confirmării.
- **Izolare:** o cerere nu afectează alte înscrisuri sau locurile lor.
- **Retrimitere controlată:** retrimiterea se face manual via operația `retrimite confirmările()`, evitând bombardamentul mesageriei.

Operator-ul centrului poate folosi `retrimite confirmările()` pentru a încerca o dată confirmările rămase în stare `netrimisă`, actualizând rezultatele fără a modifica înscrisurile.