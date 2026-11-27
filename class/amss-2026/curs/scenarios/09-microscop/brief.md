# Enunț — microscopul și camera

Exemplu didactic pentru Cursul 9, versiunea 26 noiembrie 2026. Laboratorul de microscopie al facultății are un microscop și o cameră care se montează pe el. Studenții fac lucrări practice pentru care au nevoie de amândouă. Un **registru al aparatelor**, componenta pe care o proiectăm, consemnează cine ocupă fiecare aparat și acceptă sau refuză evenimentele.

## Reguli convenite

- **R1 — context:** două lucrări, X și Y; două aparate, microscopul M și camera C, la început libere. Evenimentele se produc secvențial, în orice ordine. Nu modelăm durata, defecțiunile, anularea sau alte lucrări.
- **R2 — nevoi:** fiecare lucrare are nevoie de ambele aparate în același timp.
- **R3 — ocupare:** `ocupă(l, a)` este permis numai dacă aparatul a este liber și este următorul în ordinea lucrării l (ordinea o stabilește varianta de proiectare); aparatul devine ocupat de l. Cu un singur aparat, lucrarea este **Pregătită**; cu ambele, este **În lucru**.
- **R4 — finalizare:** `finalizează(l)` este permis numai pentru o lucrare În lucru: ambele aparate devin libere, iar lucrarea trece în **Finalizată**, starea ei finală.
- **R5 — refuz:** un eveniment nepermis este refuzat, fără modificări.

## Proprietăți cerute

- **P1 — exclusivitate:** un aparat este ocupat de cel mult o lucrare.
- **P2 — finalizare posibilă:** starea în care ambele lucrări sunt Finalizate este accesibilă.
- **P3 — fără blocaj:** din orice stare accesibilă în care cel puțin o lucrare nu este Finalizată, cel puțin un eveniment este permis.

## Variante de proiectare

Regulile nu spun în ce ordine își ocupă o lucrare aparatele și nici ce se întâmplă cu un aparat ocupat cât timp celălalt lipsește. Variantele completează regulile:

- **V0 — ordini diferite** (practica actuală): X ocupă întâi microscopul, apoi camera, fiindcă își reglează întâi microscopul; Y ocupă întâi camera, apoi microscopul, fiindcă își calibrează camera înainte de montare. Fiecare păstrează aparatul ocupat.
- **V1 — ordine comună:** ambele lucrări ocupă întâi microscopul, apoi camera; fiecare păstrează aparatul ocupat.
- **V2 — ambele deodată:** în locul lui `ocupă`, un singur eveniment, `ocupă ambele(l)`, permis numai dacă ambele aparate sunt libere; lucrarea trece direct În lucru.
- **V3 — renunțare:** ca V0, cu `renunță(l)` în plus, permis pentru o lucrare Pregătită al cărei al doilea aparat este ocupat: aparatul ei devine liber, iar lucrarea revine în Neîncepută.

Enunțul nu spune cine asigură ordinea unei variante: lucrările, din obișnuință, sau registrul, care ar refuza ocuparea în altă ordine. În model, ordinea este o presupunere despre lucrări; cine o garantează este o decizie de proiectare.

## Starea modelului

Starea modelului cuprinde ce are fiecare lucrare și se scrie ca pereche (X, Y): `–` pentru Neîncepută, `M` sau `C` pentru Pregătită, `MC` pentru În lucru, `gata` pentru Finalizată. Cine ocupă un aparat se citește din pereche. Starea inițială I0 este (–, –); starea finală intenționată a modelului este (gata, gata).

## Scenarii

Toate pornesc din I0, în varianta V0.

| Scenariu | Evenimente |
|---|---|
| S1 — X, apoi Y | `ocupă(X, M)`, `ocupă(X, C)`, `finalizează(X)`, `ocupă(Y, C)`, `ocupă(Y, M)`, `finalizează(Y)` |
| S2 — Y, apoi X | `ocupă(Y, C)`, `ocupă(Y, M)`, `finalizează(Y)`, `ocupă(X, M)`, `ocupă(X, C)`, `finalizează(X)` |
| S3 — ocupare refuzată | `ocupă(X, M)`, `ocupă(X, C)`, `ocupă(Y, C)` |
| S4 — câte un aparat | `ocupă(X, M)`, `ocupă(Y, C)`, apoi orice eveniment |
