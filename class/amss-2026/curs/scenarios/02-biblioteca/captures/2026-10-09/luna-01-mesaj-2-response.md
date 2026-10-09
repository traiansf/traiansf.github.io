Problema apare fiindcă modelul trata cererea ca pe o coadă informativă, fără să rezerve exemplarul pentru primul membru eligibil. Aș adăuga o **rezervare legată de exemplar** și aș face returnarea să proceseze coada înainte ca exemplarul să poată fi împrumutat altcuiva.

- **Cerere de împrumut**: membru, carte, data cererii, stare și poziție în coadă. Cererile active se ordonează după data depunerii.
- **Rezervare**: cerere, exemplar, data începerii și expirării, stare. O cerere poate primi rezervare când devine prima eligibilă.
- **Exemplar**: stare precum disponibil, împrumutat sau rezervat.

La returnare, sistemul înregistrează returul, apoi atribuie exemplarului disponibil o rezervare pentru prima cerere activă a cărții. Cât timp rezervarea este valabilă, doar membrul respectiv îl poate împrumuta. Dacă nu îl ridică până la expirare, rezervarea expiră și exemplarul se oferă următoarei cereri; abia dacă nu mai există cereri devine disponibil pentru oricine.

Astfel, M2 primește rezervarea după returul lui M1, iar M3 nu poate împrumuta exemplarul înaintea lui.
