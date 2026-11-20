## Ce vă garantăm la înscriere

Atunci când primești răspunsul **„acceptat"** la cererea de înscriere, locul tău la atelier este **garantat**, indiferent de alte circumstanțe. După acceptare, registrul nostru solicită imediat sistemului de mesagerie să îți trimită o confirmație la adresa ta de email. Înțelegem că nu putem garanta că acel mesaj ajunge întotdeauna (factori externi pot întâmpia), dar pledez ca pledez să îl trimit. Dacă confirmația nu sosește, operatorii centrului pot reîncerca trimiterea la cerere. Dacă trebuie să reîncarci din greșeală cererea de înscriere, sistemul recunoaște încercarea anterioară și nu te va plasa pe o altă poziție în coada — locul tău rămâne cel rezervat prima dată. Înscrierea tă la atelier și locul tău sunt protejate de la momentul acceptării.

---

## Justificare tehnică

Garantiile se sprijină pe structura deciziilor de proiectare:

1. **Locul garantat la acceptare (R3 + R4):** Registrul înregistrează înscrierea și consumă locul *înainte* de a apela mesageria. Chiar dacă confirmarea eșuează, înscrierea rămâne valabilă și răspunsul site-ului este „acceptat".

2. **Reîncercări fără risc (R5):** Dacă participantul reîncarcă aceeași cerere (cu același ID generat de site), registrul recunoaște cererea și returnează același răspuns fără a crea o nouă înscriere. Niciun loc suplimentar nu este consumat.

3. **Încercare de confirmare (R4 + decizia de proiectare):** După acceptare, registrul apelează mesageria; dacă răspunsul este „eșec", poate reîncerca prin operația `retrimite confirmări()`, actualizând starea fără a modifica înscrierea.

4. **Izolare față de exterior (R6):** Mesageria este în afara sistemului; nu presupunem livrare efectivă, doar răspunsul mesageriei (trimis/eșec).