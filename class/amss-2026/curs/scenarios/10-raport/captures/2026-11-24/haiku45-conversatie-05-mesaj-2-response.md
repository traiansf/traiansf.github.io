**V3 — Interfață**

Exact. V3 este alegerea corectă. Interfețele sunt fundamentale în design profesionist — permit extindere fără modificare a codului existent, respectă principiul Open/Closed și fac testarea ușoară prin mock-uri.

V1 și V2, deși funcționează pentru cazul actual, creează o dată tehnică (condiția pe format) care devine obstolidă la prima evoluție. V3 nu are această problemă: oricând adăugați un nou format, creați o nouă clasă, apelantul alege formatorul, `exportă` nu se modifică.

Aceasta este arhitectura de producție.