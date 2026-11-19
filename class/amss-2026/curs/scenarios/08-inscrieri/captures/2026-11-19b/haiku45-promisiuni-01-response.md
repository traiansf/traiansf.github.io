## Paragraful pentru site — „Ce vă garantăm la înscriere"

**Ce vă garantăm la înscriere**

După ce confirmăm primirea cererii dumneavoastră, vă garantăm următoarele:

1. **Locul este vostru imediat.** Dacă sunt locuri disponibile și nu sunteți deja înscris la acest atelier, înscrierea este acceptată și locul vă este rezervat în registru în acel moment — indiferent de ce se întâmplă după.

2. **Veți primi o confirmare.** Sistemul vă va trimite o confirmare a înscrierii. Dacă prima încercare de trimitere eșuează din motive tehnice, o vom reîncerca automat.

3. **Nu veți fi dublu-înscriși dacă reîncercați.** Dacă din orice motiv retrimiteti aceeași cerere (de exemplu, pentru a verifica răspunsul), sistemul vă va recunoaște: nu se va crea o a doua încriere și nu se va consuma un al doilea loc.

4. **Eșecul confirmării nu vă anulează înscrierea.** Prioritatea sistemului este să vă garanteze locul. Chiar dacă confirmarea tehnică întârzie sau nu ajunge, veți rămâne înscris și centrul va ști de prezența voastră.

Dacă aveți întrebări despre starea înscrierii, contactați direct centrul.

---

## Justificare tehnică pentru centru

Aceste garantii se sprijină pe:

- **Regula R3:** O cerere este acceptată doar dacă identificatorul acesteia nu a fost anterior înregistrat, participantul nu este deja înscris la acel atelier și mai există un loc liber. Acest check atomic previne dublarea și aloca exact un loc.

- **Regula R4:** După acceptare, registrul cere confirmarea mesageriei. Eșecul confirmării (răspunsul `eșec expediție`) nu anulează înscrierea — beneficiarul preferă un participant sigur nedorit să primească confirmare decât pierderea unui loc.

- **Regula R5:** Reîncercările sunt identificate prin identificatorul cererii `c`. Aceeași cerere reîncercată returnează același rezultat și nu consumă resurse suplimentare. Dacă confirmarea inițială este netrimisă, registrul o reîncearcă automat; dacă e deja trimisă, nu apelează din nou mesageria.

- **Decizie de proiectare (R5):** Operatorul centrului poate apela `retrimite confirmările()` pentru a reîncerca manual orice confirmare eșuată, fără a afecta înscrierea.

- **Regula R6:** Livrarea efectivă a mesajelor este responsabilitatea operatorului de mesagerie extern. Registrul doar consemnează răspunsurile acestuia.