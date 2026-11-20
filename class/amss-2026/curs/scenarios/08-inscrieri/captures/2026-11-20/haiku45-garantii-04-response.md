# Descrierea Interacțiunilor și Garanțiile Sistemului de Înscrierei

## Fluxul de Înscrierei

Cuando site-ul apelează `înscrie(c, p, a)`, registrul execută următorii pași:
1. Verifică dacă identificatorul cererii `c` este deja cunoscut (semn de reîncercare)
2. Dacă `c` este nou: validează dacă participantul `p` nu este deja înscris la atelierul `a` și dacă există locuri libere
3. La acceptare: consumă un loc, înregistrează tripletul `(c, p, a)`, apelează mesageria cu `trimite(mesaj)`
4. După răspunsul mesageriei (`trimis` sau `eșec`), actualiza starea confirmării la `trimisă` sau `netrimisă`
5. Întoarce `acceptat` indiferent de rezultatul confirmării

La refuz (participant deja înscris, locuri epuizate), registrul nu consumă resurse și nu contactează mesageria.

## Fluxul de Retransmitere

Operația `retrimite confirmările()` parcurge toate înscrierea cu starea `netrimisă`, apelează mesageria o singură dată pentru fiecare și actualizează rezultatul confirmării. Înscrierea și locurile rămân nemodificate.

## Garanții de Proiectare

### Consistența Datelor
- **Idempotență:** o cerere cu același identificator `c` produce exact același rezultat și consumă cel mult un loc
- **Izolare:** modificări în alte ateliere sau participanți nu afectează înscrierea curentă
- **Atomicitate pentru acceptare:** înscrierea și apelul de confirmare formează o unitate; eșecul confirmării nu anulează înscrierea

### Livrarea Confirmărilor
- **Apel unic la acceptare:** la prima acceptare a cererii `c`, mesageria se apelează o singură dată
- **Reîncercare cu netrimisă:** o reîncercare cu starea `netrimisă` declanșează un nou apel la mesagerie (oportunitate de retransmitere)
- **Management operator:** `retrimite confirmările()` oferă control explicit asupra confirmărilor eșuate
- **Semnatică limitată:** starea `trimisă` înregistrează doar răspunsul serviciului; livrarea efectivă și citirea nu sunt garantate. Starea `netrimisă` înseamnă: ultimul răspuns a fost `eșec`, nu că știm cu certitudine că mesajul nu a ajuns

### Comportamentul la Repetarea Cererilor
- **Reîncercare cu c cunoscut:** se întoarce același rezultat (`acceptat` sau `refuz`)
- **Economia mesageriei:** dacă starea confirmării din cererea anterioară = `trimisă`, mesageria nu se reapelează
- **Noi identificatori:** o noua cerere (c diferit) a aceluiași participant pentru aceeași atelier este tratată ca refuz
- **Fără efect secundar:** reîncercarea nu modifică alte înscrieri, nici nu creează înscrisuri duplicate

Aceste garanții asigură că sistemul rămâne consistent în fața erorilor de rețea și reîncercări de client, cu capabilitate de recuperare prin operatori.