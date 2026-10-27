# Enunț — estimarea costului unui colet

Exemplu didactic pentru Cursul 5. Regulile și sumele sunt inventate pentru exercițiu; nu descriu un transportator real. Versiune inițială: 27 octombrie 2026.

## Reguli convenite

- **R1 — intrare:** estimăm un singur colet, descris prin masa în grame (număr întreg) și ambalajul `plic` sau `cutie`. Interfața transformă textul introdus în aceste valori; textul imposibil de interpretat nu ajunge la calcul.
- **R2 — masa acceptată:** `1 ≤ masa ≤ 5000`. Orice altă masă produce un refuz, fără preț.
- **R3 — ambalaj:** un plic este acceptat numai până la 1000 g inclusiv. O cutie este acceptată pe întregul interval R2. Un ambalaj diferit produce un refuz, fără preț.
- **R4 — preț:** pentru un colet acceptat, masa de cel mult 1000 g costă 10 lei; masa de peste 1000 g costă 18 lei. Nu există alte taxe.
- **R5 — canale:** formularul web și ghișeul folosesc aceleași reguli; aceleași valori produc același rezultat. Fiecare canal își alege textele și aspectul afișării.
- **R6 — limite:** producem doar o estimare; fără salvarea coletului, plată, expediere, integrare cu un transportator, concurență sau măsurarea masei. Un refuz pentru o intrare cu mai multe probleme poate indica oricare dintre motivele aplicabile; prioritatea lor nu este stabilită.

## Scenarii independente, fără stare persistentă

| Scenariu | Intrare și acțiune | Rezultat așteptat în ambele canale |
|---|---|---|
| S1 | Estimăm un plic de 1000 g. | Acceptat, 10 lei. |
| S2 | Estimăm un plic de 1001 g. | Refuz: ambalajul nu permite această masă; fără preț. |
| S3 | Estimăm o cutie de 1001 g. | Acceptată, 18 lei. |
| S4 | Estimăm o cutie de 0 g. | Refuz: masă în afara intervalului; fără preț. |
| S5 | Estimăm o cutie de 5000 g, apoi, independent, una de 5001 g. | Prima: 18 lei; a doua: refuz, fără preț. |

## Schimbarea C1, introdusă după analiza inițială

Limita pentru plic devine **1500 g inclusiv**. Numai R3 se schimbă: pragul de preț din R4 rămâne 1000 g. S2 devine acceptare la 18 lei; un plic de 1500 g costă 18 lei, unul de 1501 g este refuzat. Nu anticipați C1 în propunerea inițială.

## Sarcina de proiectare

Comparați verificări și calcul copiate în cele două interfețe cu o operație comună `estimeaza(masa, ambalaj)`. Atribuiți interpretarea intrării, acceptarea coletului, calculul și afișarea. Explicați cine depinde de ce și unde se schimbă C1. O operație comună poate fi o funcție locală; nu se cere serviciu de rețea, clasă, cadru software sau un anumit tip de diagramă.
