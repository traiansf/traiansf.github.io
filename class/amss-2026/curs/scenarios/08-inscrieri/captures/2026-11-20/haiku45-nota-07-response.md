# Notă de Proiectare — Registrul de Locuri al Centrului Cultural

## Fluxul unei Înscrierii

Cuando site-ul cere o însciere `înscrie(c, p, a)`, registrul parcurge următoarele etape:

1. **Validare**: Se verifică dacă identificatorul cererii `c` este nou. Dacă este cunoscut, se revine imediat cu rezultatul anterior (vezi secțiunea Reîncercări).

2. **Verificare locuri**: Dacă `c` este nou, se controlează:
   - Participantul `p` nu este deja înscris la atelierul `a`
   - Atelierul `a` are cel puțin un loc liber

   Dacă oricare dintre condiții nu se îndeplinește, se întoarce refuz și proces se încheie.

3. **Înregistrare acceptare**: Locul se consumă, iar cererea se înregistrează cu starea inițială „în așteptare".

4. **Trimitere confirmare**: Registrul apelează mesageria pentru a trimite o confirmare participantului. Mesageria răspunde cu `trimis` sau `eșec`.

5. **Actualizare stare**: Rezultatul confirmării se înregistrează și se întoarce `acceptat` site-ului, indiferent de răspunsul mesageriei.

## Comportament în Cazul Eșecului Mesageriei

Dacă mesageria răspunde `eșec`, **înscrierea rămâne valabilă**: participantul consumă un loc și înregistrarea se păstrează. Registrul marchează starea confirmării ca `netrimisă`. Beneficiarul preferă un participant înscris fără confirmare unei posibile pierderi de loc.

Starea `netrimisă` permite retrimiteri manuale prin operația `retrimite confirmările()` apelată de operator, care încearcă din nou trimiterea și actualizează rezultatul.

## Reîncercările Site-ului

Când site-ul reîncearcă cu același identificator `c`, registrul:

- Recunoaște cererea ca cunoscută și întoarce același rezultat `acceptat`
- **Nu consumă alt loc** și **nu înregistrează o a doua înscriere**
- Dacă confirmarea anterioară era `trimisă`, **nu apelează mesageria din nou** (evită duplicatele)
- Dacă confirmarea era `netrimisă`, apelează mesageria o dată pentru a încerca retrimiterea

## Garanții

Sistemul garantează:

1. **Integritate locuri**: Fiecare loc acceptat corespunde unei cereri unice cu identificator unic; nu se acceptă mai mulți participanți decât locurile disponibile.

2. **Idempotență**: Reîncercări cu același identificator produc același rezultat; nu crează înscrierii duplicate.

3. **Atomicitate**: O cerere fie acceptă o înscrierea și apelează mesageria, fie refuză integral — nu sunt stări intermediare inconsistente.

4. **Izolare**: Fiecare cerere nu afectează alte înscrierii sau locurile lor; concurența este eliminată prin apeluri secvențiale.

5. **Încredere în răspunsuri**: Registrul nu interpretează erorile mesageriei — doar le consemnează, permițând operatorului acțiuni manuale.