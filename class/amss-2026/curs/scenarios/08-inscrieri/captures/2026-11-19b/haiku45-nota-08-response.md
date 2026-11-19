# NOTĂ DE PROIECTARE — Registrul de locuri al atelierelor

## Fluxul unei înscriseri

Când site-ul transmite o cerere `înscrie(c, p, a)` pentru participantul p la atelierul a cu identificatorul unic c:

1. **Validare**. Registrul verifică dacă c este nou (neînregistrat anterior), p nu este deja înscris la a și atelierul mai are locuri libere.

2. **Acceptare sau refuz**. Dacă validarea reușește, registrul acceptă: consumă un loc, înregistrează tripletul (c, p, a) și trece la confirmare. Altfel, răspunde `refuz` și se oprește.

3. **Confirmare**. Registrul cere serviciului extern de mesagerie să trimită confirmarea: `trimite(mesaj)`. Mesageria răspunde cu `trimis` sau `eșec expediție`.

4. **Consemnare rezultat**. Registrul marchează confirmarea: `trimisă` dacă răspunsul a fost `trimis`, sau `netrimisă` dacă a fost `eșec expediție`.

5. **Răspuns site-ului**. Registrul răspunde `acceptat`, indiferent de rezultatul confirmării. **Înscrierea rămâne valabilă și locul consumat chiar dacă confirmarea a eșuat.**

## Reîncercări și recuperare din eșecuri

**Reîncercare site-ului**. Dacă site-ul retrimite aceeași cerere cu același c (după o eroare de comunicație):
- Registrul o recunoaște și răspunde din nou `acceptat`
- Nu consumă alt loc
- Dacă confirmarea era `netrimisă`, reîncearcă trimiterea și actualizează statul
- Dacă era `trimisă`, nu apelează mesageria

**Eșec expediție**. Când mesageria răspunde `eșec expediție`:
- Înscrierea acceptată și consumul locului rămân valabile
- Registrul marchează confirmarea `netrimisă`
- Site-ul primește `acceptat`: participantul este înscris, doar notificarea nu a ajuns

**Retrimitere manuală**. Echipa operatorului apelează operația `retrimite confirmările()`: registrul reîncearcă o dată fiecare confirmare `netrimisă`, actualizează statul și poate produce duplicări de mesaje. Înscrierea și locurile rămân nemodificate.

## Garanții

Sistemul garantează:

- **Fără duplicate de înscrisuri**: fiecare cerere nouă cu c unic consumă maxim un loc
- **Fără reglementări conflictuale**: participantul nu poate fi înscris la același atelier de mai multe ori
- **Consistență a locurilor**: suma (înscrisuri acceptate + locuri rămase) = locuri totale
- **Izolare**: o cerere nu modifică alte înscrisuri sau locurile acestora
- **Toleranță la eșecuri**: eșecul confirmării nu anulează înscrierea; beneficiarul prefără participant înscris fără confirmare
- **Recuperare asistată**: confirmările `netrimisă` pot fi reîncercate manual fără a modifica înscrierile