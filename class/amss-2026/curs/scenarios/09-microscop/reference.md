# Raționament de referință — microscopul și camera

Material de pregătire pentru [enunț](brief.md), construit didactic; rezultatele exploratorului sunt din rulări efective (24 noiembrie 2026, Python 3.10.11), păstrate în [`model/rezultate.txt`](model/rezultate.txt). În program, `-` ține locul lui `–`.

## Scenariile, cu V0

| Scenariu | Rezultat |
|---|---|
| S1 (X, apoi Y) | se încheie în (gata, gata); stabilește P2 |
| S2 (Y, apoi X) | se încheie în (gata, gata) |
| S3 (Y cere un aparat ocupat) | în (MC, –), `ocupă(Y, C)` este refuzat: camera este ocupată; starea rămâne (MC, –) |
| S4 (câte un aparat) | (M, C): niciun eveniment permis; contraexemplu pentru P3 |

## Stările accesibile

V0 are 13 stări accesibile din 25 de perechi posibile și 14 tranziții: (–, –), (M, –), (–, C), (MC, –), **(M, C)**, (–, MC), (gata, –), (–, gata), (gata, C), (M, gata), (gata, MC), (MC, gata), (gata, gata). Perechi ca (MC, C) nu sunt accesibile; nu contează ce ar permite.

| Varianta | Stări | Tranziții | P1 | P2 | P3 | Cicluri |
|---|---|---|---|---|---|---|
| V0 (ordini diferite) | 13 | 14 | da | da | nu: (M, C), prin `ocupă(X, M)`, `ocupă(Y, C)` | nu |
| V1 (ordine comună) | 12 | 12 | da | da | da | nu |
| V2 (ambele deodată) | 8 | 8 | da | da | da | nu |
| V3 (renunțare) | 13 | 16 | da | da | da | da: (M, –) → `ocupă(Y, C)` → (M, C) → `renunță(Y)` → (M, –) |

P4 (progres): orice execuție, continuată cât timp un eveniment este permis, ajunge după un număr finit de pași în (gata, gata). În V1 și V2 decurge din rezultate: stările sunt în număr finit, nu există cicluri, deci orice execuție se oprește; fără blocaj, se poate opri numai în (gata, gata). V3 nu respectă P4.

Argument pentru V1 cu orice număr de lucrări și de aparate, dacă toate lucrările își ocupă aparatele în aceeași ordine: dintre lucrările care țin cel puțin un aparat, cea care ține aparatul cel mai din urmă în ordine așteaptă numai un aparat aflat și mai departe, deci liber; ea poate continua. Dacă nicio lucrare nu ține nimic, oricare poate începe.

## Exercițiul „Ce evenimente sunt permise?”

1: (–, C): `ocupă(X, M)` → (M, C); `ocupă(Y, M)` → (–, MC). 2: (MC, –): `încheie(X)` → (gata, –). 3: (M, C): niciunul, blocaj. 4: (gata, gata): niciunul, stare finală intenționată. 5: (MC, C): inaccesibilă; încalcă P1.

## Trei afirmații

„V1 nu are blocaj nici cu trei lucrări”: alt model, deci altă explorare, sau argumentul de mai sus. „Nici dacă o lucrare poate fi anulată în Pregătită”: întâi starea în care ajunge lucrarea anulată (o stare finală nouă cere completarea listei stărilor finale; Neîncepută aduce un ciclu), apoi o nouă explorare. „Registrul de locuri nu dă niciodată un loc în plus”: explorare pentru un model dat; argument de invariant pentru orice număr. „În laborator nu ne vom bloca” nu se stabilește prin model.

## Secțiunea AI: trei lucrări, trei aparate

Enunțul trimis este [`ai/context-trei-lucrari.md`](ai/context-trei-lucrari.md): X: M, C; Y: C, L; Z: M, L; ordinea M, C, L este comună, deci nu există blocaj. [`model/trei_lucrari.py`](model/trei_lucrari.py): 42 de stări accesibile, 62 de tranziții, P1–P3 respectate. Cu Z: L, M: 45 de stări, 69 de tranziții, P3 încălcată prin `ocupă(X, M)`, `ocupă(Y, C)`, `ocupă(Z, L)`.

| Rularea | Raportul scris | Ieșirea codului |
|---|---|---|
| 01, 03, 04 | descriu exploratorul, fără rezultate | 42 de stări, 62 de tranziții, P1–P3 respectate |
| 02 | P1 și P2 respectate; P3 încălcată, prin „X ocupă M, Y ocupă C, Z ocupă L” (imposibil: Z cere întâi M) | 42 de stări, 185 de „tranziții” (suma lungimilor secvențelor), P1 „VIOLAT” (verificare greșită), P2 și P3 OK |
| 05 | „P1 e structurală”; fără rezultate | 42 de stări, 62 de tranziții, P1 „INCALCAT” (verificare greșită), P2 și P3 OK |
| 06 | „Testez exploratorul”, apoi P1–P3 OK, fără numere | 42 de stări, 62 de tranziții, P1–P3 OK |

Verificarea lui P1 din rularea 02 numără câte aparate ține lucrarea care ocupă `device`; o lucrare În lucru ține două, deci „VIOLAT”. Reprezentarea (un singur ocupant pentru fiecare aparat) face ca P1 să nu poată fi încălcată. Nici „P1 OK” din 06 nu verifică P1 (întreabă dacă ocupantul este în starea 1 sau 2), iar 03 fixează valoarea la adevărat.

## Transfer

Starea (G1 în A, G2 în B) nu permite niciun eveniment: blocaj, fiindcă niciun grup nu a ieșit. „Ambele grupuri pot ieși” este o afirmație de accesibilitate: ajunge o execuție, dar din această stare nu există. Reparații posibile: sens unic (ca V1) sau intrarea numai când ambele săli sunt libere (ca V2), urmate de o nouă explorare.
