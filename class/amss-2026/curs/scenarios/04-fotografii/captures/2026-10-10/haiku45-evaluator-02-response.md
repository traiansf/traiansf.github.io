# Evaluare: Model de domeniu pentru arhiva fotografică

## Afirmații susținute și corecte

Propunerea identifică corect conceptele centrale:
- **Fotografie și Versiune ca entități cu identitate stabilă** (R1, R2) ✓
- **Legenda ca atribut doar al Fotografiei** (R1, R5) ✓
- **Relația N:1 fotografie–versiune** (R2) ✓
- **Originalul unic per fotografie, creat la catalogare** (R3) ✓
- **Relația de derivare cu sursă din aceeași fotografie** (R4, S4) ✓

Explicațiile scenariilor S1–S4 sunt exacte și bine justificate prin reguli.

## Omisiuni

**S5 nu e abordată.** Enunțul precizează că „comportamentul importului repetat nu este convenit"; propunerea tace pe această situație — corect, dar ar putea fi menționat explicit că e în afara modelului.

## Confuzie structurală

Propunerea afirmă: „Fiecare Fotografie definește o **pădure** de versiuni cu rădăcina în original", apoi zice „Doi copaci independenți (V3 și V4 din V1) **nu sunt definiți**; modelul permite **orice configurație DAG**".

**Problema**: Aceasta e ambiguă. S3 arată că V3 și V4 sunt ambele derivate din V1 și aparțin aceleași Fotografii F1 — nu sunt „doi copaci independenți", ci **două ramuri din același arbore**. Fraza trebuia să clarifice: modelul permite mai multe ramuri dintr-o versiune, nu structuri liniare obligatorii. O pădure (forest) e de fapt un caz special de DAG, deci spunerea „pădure" apoi „DAG" sugerează evoluție, când ar trebui să fie precisă de la început.

## Alegeri vs. cerințe

Propunerea distinge corect între:
- **Cerință** (din reguli): un original per fotografie
- **Alegeri** (de reprezentare): flag boolean vs. relație dedicată

Ambele satisfac regula; modelul nu prescrie — corect conform R6.

## Concluzie

Modelul susține core-ul regulilor (identități, relații, restricții coerență). Principala slăbiciune e formularea structurii DAG/forest, care ar trebui clarificată: fiecare fotografie e un singur arbore cu rădăcina în original, care permite mai multe ramuri (S3), nu o pădure cu mai mulți arbori independenți. Restul e solid și bine argumentat.