# Sprijin facultativ pentru discuție — depozit

Folosiți [enunțul](scenario.md) și explicați alegerile colegilor. Notițele sunt facultative, rămân la voi și nu se predau.

## Responsabilități

Formularul și importul trebuie să aplice aceleași reguli. Cine interpretează intrarea, cine decide acceptarea și cine modifică registrul? Cum verificăm o cerere dacă nu folosim formularul?

## Contracte

Pentru fiecare operație: ipotezele apelului → condiția de succes → rezultat și efect → refuz → ce rămâne identic. Nu numiți disponibilitatea „precondiție” dacă operația trebuie să refuze explicit o cantitate indisponibilă.

**Repere:** rezervare de cantitate întreagă pozitivă, cel mult egală cu disponibilul, cu cod nou; ridicare integrală numai pentru o rezervare activă; anulare numai a unei rezervări active; istoric păstrat; refuz fără modificări.

F este stocul fizic; R este suma rezervărilor active; D=F−R este disponibilul. Explicați de ce `D≥0` nu descrie singur efectul corect al unei operații.

## Exemple

Fiecare scenariu S1–S7 din enunț repornește din I (F=10, A activă 4, R=4, D=6), exceptând continuările marcate. Pentru fiecare, spuneți rezultatul și întregul registru de după. La refuz, precizați explicit ce nu se schimbă.

## Analiza și revizuirea AI

Profesorul conduce o singură analiză și o singură revizuire în plen. Preziceți o consecință înainte de răspuns, apoi verificați o afirmație folosind o regulă și un scenariu. Nu porniți sesiuni separate pentru fiecare pereche. Dacă instrumentul nu răspunde, discutăm capturile reale pregătite, cu aceeași metodă.

## Comparație finală

Pornim cu A activă 4 și B activă 6, F=10, R=10, D=0. Executăm `anuleaza(A)`, apoi `ridica(B)`. Explicați unui coleg ambele stări intermediare și păstrarea rezervării neatinse. Separat, după anularea lui A, încercăm reutilizarea codului A: regula istoricului cere refuz fără modificări.
