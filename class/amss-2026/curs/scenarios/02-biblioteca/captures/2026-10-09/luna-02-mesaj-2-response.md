Modelul trebuie să includă **rezervări pentru exemplare returnate** și să impună respectarea cozii de cereri.

- **Cerere de împrumut**: membru, carte, data depunerii, stare și poziție în coada cărții.
- **Rezervare**: cerere, exemplar, termen de ridicare, stare (activă, onorată, expirată, anulată).

La returnarea unui exemplar, sistemul îl alocă **atomic** primei cereri eligibile din coada cărții și creează o rezervare pe numele acelui membru. Exemplarului i se atribuie starea „rezervat”; ceilalți membri, inclusiv cei ajunși la ghișeu, nu îl pot împrumuta. Împrumutul se acordă membrului rezervării. Dacă termenul expiră sau cererea este anulată, rezervarea se încheie, iar exemplarul se oferă următoarei cereri din coadă; devine disponibil public doar dacă nu mai există cereri eligibile.
