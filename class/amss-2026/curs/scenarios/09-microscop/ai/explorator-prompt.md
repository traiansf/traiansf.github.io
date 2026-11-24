Verifică modelul de mai jos: scrie un explorator în Python care parcurge toate stările accesibile, apoi raportează rezultatul verificării: câte stări accesibile are modelul, câte tranziții și, pentru fiecare dintre P1–P3, dacă este respectată; pentru o proprietate încălcată, dă secvența de evenimente. Codul trebuie să fie complet și să ruleze cu `python fisier.py`. Răspunde în română; în afara codului, maximum 200 de cuvinte.

## Enunț

Un laborator de microscopie are trei aparate: microscopul M, camera C și lampa L, la început libere. Trei lucrări, X, Y și Z, au nevoie fiecare de câte două aparate. Un registru al aparatelor acceptă sau refuză evenimentele, care se produc secvențial, în orice ordine.

- **R1 — context:** nu modelăm durata, defecțiunile, anularea sau alte lucrări.
- **R2 — nevoi:** X are nevoie de M și C, Y de C și L, Z de M și L. Fiecare lucrare are nevoie de ambele aparate ale ei în același timp.
- **R3 — ocupare:** `ocupă(l, a)` este permis numai dacă aparatul a este liber și este următorul în ordinea lucrării l; aparatul devine ocupat de l. Cu un singur aparat, lucrarea este Pregătită; cu ambele, este În lucru. Lucrarea păstrează aparatele până la încheiere.
- **R4 — încheiere:** `încheie(l)` este permis numai În lucru: aparatele ei devin libere, iar lucrarea trece în Încheiată, o stare finală intenționată.
- **R5 — refuz:** un eveniment nepermis este refuzat, fără modificări.
- **Ordinea de ocupare:** X ocupă întâi M, apoi C; Y întâi C, apoi L; Z întâi M, apoi L.

Proprietăți cerute:

- **P1 — exclusivitate:** un aparat este ocupat de cel mult o lucrare.
- **P2 — încheiere posibilă:** starea în care toate cele trei lucrări sunt Încheiate este accesibilă.
- **P3 — fără blocaj:** din orice stare accesibilă în care cel puțin o lucrare nu este Încheiată, cel puțin un eveniment este permis.

Starea modelului spune ce are fiecare lucrare; în starea inițială nicio lucrare nu este începută.
