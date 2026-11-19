## Paragraful pentru site

**Ce vă garantăm la înscriere**

Înscrierea dumneavoastră la atelier este procesată imediat. Dacă atelierul are locuri disponibile și nu sunteți deja înscris, cererea va fi acceptată și un loc va fi rezervat pentru dumneavoastră. După confirmarea înscrierii, veți primi pe email o notificare cu detaliile atelierului. Dacă din orice motiv notificarea nu ajunge, înscrierea rămâne valabilă — prioritatea noastră este ca voi să aveți locul garantat. Dacă reîncercați să trimiteți cererea de înscriere (de exemplu, din cauza unei probleme tehnice), sistemul va recunoaște cererea și vă va oferi același răspuns fără a crea o dublă înscriere. Dacă confirmarea nu a fost primită, o putem retrimite la cerere. Vă garantăm transparență: veți ști imediat dacă ați fost acceptat sau dacă locurile s-au epuizat.

---

## Justificarea tehnică

1. **Imediat și cert:** Sistemul verifică atomic disponibilitatea locului și înscrierea participantului (R3), consumând un loc doar dacă ambele condiții sunt îndeplinite. Răspunsul e dat la fiecare apel.

2. **Confirmare + resilență:** După acceptare, apelul la mesagerie e automat (R4). Orice rezultat (trimis/eșec) e înregistrat; locul rămâne rezervat indiferent de status confirmării (R4 — beneficiarul preferă participant fără confirmare).

3. **Idempotență:** Fiecare cerere are identificator unic (c) generat de site. Reapelul cu același c readucă același răspuns și nu consumă loc suplimentar (R5). Site-ul poate retenta fără risc.

4. **Retransmisie selectivă:** Pentru confirmări `netrimisă`, mesageria se apelează din nou (R5); pentru `trimisă`, nu. Aceasta evită duplicate în orice caz și maximizează șansa livrării.

5. **Izolare:** O cerere nu afectează alte înscrieri (R7), deci evenimentele sunt independente.