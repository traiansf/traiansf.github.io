# Raționament de referință — microscopul și camera

Material de pregătire pentru [enunț](brief.md), construit didactic; rezultatele exploratorului sunt din rulări efective (26 noiembrie 2026, Python 3.10.11), păstrate în [`model/rezultate.txt`](model/rezultate.txt). În program, `-` ține locul lui `–`.

## Scenariile, în V0

| Scenariu | Rezultat |
|---|---|
| S1 (X, apoi Y) | se încheie în (gata, gata); stabilește P2 |
| S2 (Y, apoi X) | se încheie în (gata, gata) |
| S3 (ocupare refuzată) | în (MC, –), `ocupă(Y, C)` este refuzat: camera este ocupată; starea rămâne (MC, –) |
| S4 (câte un aparat) | (M, C): niciun eveniment permis; contraexemplu pentru P3 |

V0 are patru execuții complete (continuate până când niciun eveniment nu mai este permis): S1, S2 și cele două ordini ale lui S4, `ocupă(X, M)`, `ocupă(Y, C)` și `ocupă(Y, C)`, `ocupă(X, M)`. Trei pași ai lui X și trei ai lui Y s-ar putea amesteca în 20 de feluri; regulile lasă patru, iar două dintre ele se opresc în blocaj.

## Stările accesibile

V0 are 14 tranziții și 13 stări accesibile din 25 de perechi posibile: (–, –), (M, –), (–, C), (MC, –), **(M, C)**, (–, MC), (gata, –), (–, gata), (gata, C), (M, gata), (gata, MC), (MC, gata), (gata, gata). S1 și S2 trec împreună prin 12 dintre ele și prin 12 tranziții; singura stare ocolită este blocajul (M, C). Perechi ca (MC, C) nu sunt accesibile (și nici nu trebuie să fie): R3 dă numai un aparat liber, deci niciun eveniment nu duce acolo; nu contează ce ar permite.

| Varianta | Stări | Tranziții | P1 | P2 | P3 | Cicluri |
|---|---|---|---|---|---|---|
| V0 (ordini diferite) | 13 | 14 | da | da | nu: (M, C), prin `ocupă(X, M)`, `ocupă(Y, C)` | nu |
| V1 (ordine comună) | 12 | 12 | da | da | da | nu |
| V2 (ambele deodată) | 8 | 8 | da | da | da | nu |
| V3 (renunțare) | 13 | 16 | da | da | da | da: (M, –) → `ocupă(Y, C)` → (M, C) → `renunță(Y)` → (M, –) |

P4 (progres): orice execuție, continuată cât timp un eveniment este permis, ajunge după un număr finit de pași în (gata, gata). În V1 și V2 decurge din rezultate: stările sunt în număr finit, nu există cicluri, deci orice execuție se oprește; fără blocaj, se poate opri numai în (gata, gata). V3 nu respectă P4. În ciclul lui V3, X are mereu un eveniment permis (`ocupă(X, C)` în (M, –), `renunță(X)` în (M, C)); modelul nu spune cine face pasul următor, deci execuția în care numai Y face pași este permisă. Cu presupunerea că un eveniment care redevine mereu permis se produce în cele din urmă, și în V3 lucrările s-ar finaliza; dacă laboratorul o poate garanta este o întrebare de validare.

Argument pentru V1 cu orice număr de lucrări și de aparate, dacă toate lucrările își ocupă aparatele în aceeași ordine: dintre aparatele ocupate, îl luăm pe ultimul din ordine; lucrarea care îl ocupă fie are toate aparatele și se poate finaliza, fie așteaptă numai un aparat aflat după el, deci liber, și poate continua. Dacă nicio lucrare nu ocupă nimic, oricare lucrare nefinalizată poate începe. Pentru trei lucrări cu ordinea M, C (`python trei_lucrari.py MC MC MC`): 32 de stări accesibile, 36 de tranziții, P1–P3 respectate.

## Exercițiul „Explorarea, pe hârtie”

Din (MC, –): `finalizează(X)` → (gata, –), apoi `ocupă(Y, C)` → (gata, C), `ocupă(Y, M)` → (gata, MC), `finalizează(Y)` → (gata, gata). Din (–, MC), simetric: (–, gata), (M, gata), (MC, gata), (gata, gata). (M, C): niciun eveniment permis, blocaj. (gata, gata): niciun eveniment permis, starea finală intenționată. 13 stări accesibile. (MC, C) nu apare: ar încălca P1, iar R3 dă numai un aparat liber.

## Trei reparații: cine garantează

V1, cum este scrisă, este o regulă pentru lucrări: Y își schimbă ordinea, deși își calibra camera înainte de montare. Registrul o garantează numai dacă verifică el ordinea (refuză camera unei lucrări care nu are microscopul); altfel, ordinea comună rămâne o presupunere. V2 este garantată de registru, prin operația care ocupă ambele aparate; un aparat liber nu mai poate fi ocupat cât timp celălalt lipsește. V3 depinde de lucrări, care trebuie să renunțe. Eliminarea contraexemplului nu stabilește P3: fiecare variantă se explorează din nou. Decizia de pe slide: V1 sau V2, cu regula aplicată de registru; rezultatele explorării nu aleg între ele.

## Trei afirmații

„Nici dacă o lucrare poate fi anulată în Pregătită”: întâi starea în care ajunge lucrarea anulată (o stare finală nouă cere completarea listei stărilor finale intenționate; Neîncepută aduce un ciclu), apoi o nouă explorare. „Registrul de locuri nu dă niciodată un loc în plus”: explorare pentru un model dat; argument de invariant pentru orice număr. „În laborator nu vom avea blocaje” nu se stabilește prin model: cere o validare (descrie modelul laboratorul? trec toate ocupările prin registru?). „V1 nu are blocaj nici cu trei lucrări”, dacă întreabă cineva: alt model, deci altă explorare, sau argumentul de mai sus.

## Secțiunea AI: trei lucrări, trei aparate

Enunțul trimis este [`ai/context-trei-lucrari.md`](ai/context-trei-lucrari.md): X: M, C; Y: C, L; Z: M, L; ordinea M, C, L este comună, deci nu există blocaj. [`model/trei_lucrari.py`](model/trei_lucrari.py): 42 de stări accesibile, 62 de tranziții, P1–P3 respectate. Cu ordinea L, M pentru Z: 45 de stări, 69 de tranziții, P3 încălcată prin `ocupă(X, M)`, `ocupă(Y, C)`, `ocupă(Z, L)`.

Capturile folosite sunt seria din [27 noiembrie 2026](captures/2026-11-27/README.md) (enunțul cu `finalizează`, Finalizată). Seria din 24 noiembrie 2026 rămâne arhivată.

| Rularea | Raportul scris | Ieșirea codului |
|---|---|---|
| 01 | descrie exploratorul; „P1 e garantată de reprezentare”; „Rezultatele se raportează conform cererii” | 42 de stări, 62 de tranziții; P1 „OK” tipărit fără verificare; P2 și P3 OK |
| 02, 05 | descriu exploratorul, fără rezultate | 42 de stări, 62 de tranziții, P1–P3 respectate |
| 03 | „**Rezultat:** 27 stări accesibile și 48 tranziții”; P1 și P2 respectate; P3 încălcată, prin `ocupă(X,M), ocupă(Y,C), ocupă(Z,L)` (imposibil: Z ocupă întâi M) | 42 de stări, 62 de tranziții; P1 „ÎNCĂLCATĂ” (verificare greșită); P2 și P3 „RESPECTATĂ” |
| 04 | descrie exploratorul, fără rezultate | 42 de stări, 41 de „tranziții” (numai cele spre stări noi); P1 „VIOLATĂ”, prin `ocupă(X, M)`, `ocupă(X, C)` (verificare greșită); P2 și P3 OK |
| 06 | descrie exploratorul, fără rezultate | 42 de stări, 41 de „tranziții”; P1–P3 OK |

Verificarea lui P1 din rularea 03 numără, pentru fiecare lucrare, câte aparate are; o lucrare În lucru are două, deci „ÎNCĂLCATĂ”. Reprezentarea (un singur ocupant pentru fiecare aparat) face ca P1 să nu poată fi încălcată: la P1 are dreptate raportul, iar la P3, codul. Secvența de blocaj din codul rulării 03 este un text fix, tipărit dacă verificarea lui P3 eșuează (funcția care ar căuta drumul nu este apelată), iar verificarea lui P3 acceptă orice stare în care o lucrare este Finalizată. Rularea 04 compară indicele lucrării cu indicele aparatului; „contraexemplul” ei este o execuție corectă. P1 este verificată corect de 02, 05 și 06. Niciuna dintre cele șase rulări nu spune că nu a rulat codul; 03 nu lasă niciun semn.

## Transfer

[`model/muzeu.py`](model/muzeu.py), cu ambele grupuri afară la început. Trasee opuse (G1 prin A și B, G2 prin B și A): 13 stări accesibile, 14 tranziții; starea în care ambele grupuri au ieșit este accesibilă, de exemplu prin `intră(G1, A)`, `intră(G1, B)`, `iese(G1)`, `intră(G2, B)`, `intră(G2, A)`, `iese(G2)`, deci „ambele grupuri pot ieși” este o afirmație de accesibilitate: este suficientă o execuție, dar ea nu spune nimic despre celelalte. Două stări accesibile nu permit niciun eveniment: cea în care ambele grupuri au ieșit, finală intenționată, și (G1 în A, G2 în B), prin `intră(G1, A)`, `intră(G2, B)`: blocaj, fiindcă niciun grup nu a ieșit. Sens unic (`python muzeu.py AB AB`): 14 stări, 16 tranziții, niciun blocaj. Argument pentru oricâte grupuri: grupul din B poate ieși oricând; dacă B este liberă, grupul din A poate trece; dacă A este liberă, un grup de afară poate intra. Asemănarea cu V0 și V1 este parțială: un grup eliberează prima sală când intră în a doua.
