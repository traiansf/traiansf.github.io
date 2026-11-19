# Notă de proiectare — Registrul de locuri al atelierelor

## Scopul și fluxul de bază

Registrul de locuri acceptă cereri de înscriere la ateliere cu locuri limitate și coordonează trimiterea confirmărilor prin serviciul extern de mesagerie. Fiecare cerere poartă un identificator unic (generat de site) și conține participantul și atelierul solicitat.

## Procesul de acceptare și confirmare

Registrul acceptă o cerere nouă dacă participantul nu este deja înscris la atelier și mai este cel puțin un loc liber. La acceptare, registrul:
1. Consumă un loc și înregistrează înscrierea
2. Cere mesageriei să trimită o confirmare

Răspunsul site-ului este **întotdeauna** `acceptat` indiferent de răspunsul mesageriei. **Eșecul confirmării nu anulează înscrierea**; beneficiarul preferă participant înscris fără confirmare decât să piardă locul.

Dacă cererea nu poate fi acceptată (participant deja înscris sau locuri epuizate), registrul răspunde `refuz`, nu consumă resurse și nu apelează mesageria.

## Comportament la eșec și reîncercare

Reîncercarea se detectează prin identificatorul cererii:
- Dacă identificatorul este cunoscut, registrul **nu consumă alt loc** și întoarce același răspuns `acceptat`
- Dacă confirmarea anterioară a eșuat (`netrimisă`), registrul **apelează din nou** mesageria și actualizează starea
- Dacă confirmarea anterioară a reușit (`trimisă`), mesageria **nu este apelată**

Această strategie asigură că un participant nu pierde locul din cauza unei reîncercări, dar încearcă activ retrimiterea confirmării.

## Operații suplimentare

Operatorul centrului poate declanșa `retrimite confirmările()`: sistemul retrimite o singură dată fiecare confirmare `netrimisă`, actualizând rezultatele, fără a modifica înscrierile.

## Garanții

Sistemul garantează:

1. **Consistență**: fiecare loc este consumat cel mult o dată; fiecare participant figurează o singură dată pe atelier
2. **Idempotență**: reîncercarea cu același identificator nu generează duplicate și nu pierde locuri
3. **Prioritate**: înscrierea este finală; eșecul confirmării nu afectează aceasta
4. **Separare**: mesageria și site-ul sunt sisteme independente; erorile de expediere nu afectează starea înscrierilor
5. **Recuperabilitate**: confirmările nereușite pot fi retransmise manual fără a compromite datele
6. **Izolare**: o cerere nu modifică alte înscrieri sau locurile acestora

Garantiile nu acoperă: livrarea efectivă a mesajelor, citirea acestora sau faptul că participantul a putut dori mai târziu anularea.