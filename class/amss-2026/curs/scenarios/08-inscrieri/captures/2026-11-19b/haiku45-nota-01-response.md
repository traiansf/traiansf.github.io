# Notă de Proiectare — Registrul de Locuri al Centrului Cultural

## Descriere generală

Registrul de locuri este componenta centrală care gestionează înscrierile la ateliere cu locuri limitate. Funcționează ca intermediar între site-ul centrului și serviciul extern de mesagerie, garantând consistență și recuperare la erori.

## Fluxul de Înscriere

O cerere de înscriere `înscrie(c, participant, atelier)` urmează următorii pași:

**Validare și acceptare:** Registrul verifică dacă identificatorul cererii `c` este nou. Pentru cereri noi, verifică dacă participantul nu este deja înscris la atelier și dacă mai sunt locuri disponibile. La acceptare, consumă un loc și înregistrează tripletul (c, participant, atelier).

**Trimitere confirmare:** Imediat după acceptare, registrul apelează serviciul de mesagerie cu `trimite(mesaj)`. Mesageria răspunde cu `trimis` sau `eșec expediție`. Registrul înregistrează starea confirmării (triumisă/netrimisă) la înscrierea efectuată.

**Răspuns client:** Indiferent de rezultatul mesageriei, site-ul primește `acceptat`. Un participant fără confirmare este mai valoros decât o pierdere de loc. Eșecul confirmării nu anulează niciodată înscrierea.

## Gestionarea Mesageriei

Dacă mesageria răspunde `eșec expediție`, înscrierea rămâne validă cu starea confirmării marcată `netrimisă`. Registrul nu încearcă imediat retransmiterea; aceasta devine disponibilă doar la reîncercări sau prin operația `retrimite confirmările()`, apelată manual de operator.

## Reîncercări

Atunci când site-ul reîncercă aceeași cerere (trimitând același identificator `c`), registrul recunoaște cererea ca fiind deja procesată. Returnează imediat `acceptat`, fără să consume alt loc.

**Cazul special:** Dacă confirmarea inițială a eșuat (stare `netrimisă`), registrul poate apela din nou mesageria pentru retransmitere și actualizează starea. Dacă confirmarea inițială a reușit, mesageria nu este apelată din nou.

## Garanții

Sistemul garantează:

- **Integritate:** Nicio inseriere nu consume mai mult de un loc; participantul nu poate fi înscris de mai multe ori la același atelier prin reîncercări.
- **Consistență:** Orice identificator de cerere produce mereu același rezultat; reîncercările sunt idempotente.
- **Reziliență:** Eșecurile mesageriei nu pierd înscrierile; confirări nereușite pot fi retrimise.
- **Atomicitate pe operație:** Fiecare apel mesageriei este independent; eșecul confirmării nu afectează alte înscrieri.
- **Izolare:** Reîncercările unui participant nu modifică locurile sau starea altor participanți.

Registrul nu garantează livrarea efectivă a mesajelor; asta depinde de mesagerie. Starea `trimisă` înseamnă doar că serviciul a răspuns pozitiv; `netrimisă` înseamnă că ultimul răspuns a fost negativ.