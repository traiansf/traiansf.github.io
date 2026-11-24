**V3 — Interfață**

Recomand V3. Deși pare mai complexă, aceasta este singura variantă care respectă principiile SOLID și oferă o arhitectură deschisă pentru evoluție.

V1 amestecă trei responsabilități (ascundere, formatare text, formatare CSV) într-o singură operație cu ramuri condiționale — greu de testat și de extins.

V2 separă formatarea de ascundere, dar `exportă` conține o condiție care selectează formatorul. Dacă beneficiarul va cere un nou format, trebuie modificat codul existent.

V3 decuplează complet:
- `vizibil` ascunde câmpuri
- Interfața `Formator` și implementările sale (`text`, `csv`) sunt independente
- `exportă` nu mai decide: apelantul furnizează formatorul

Avantajul major: noi formate se adaugă prin noi clase, fără a modifica codul existent. Este pattern-ul Strategy, robust pentru acest caz.