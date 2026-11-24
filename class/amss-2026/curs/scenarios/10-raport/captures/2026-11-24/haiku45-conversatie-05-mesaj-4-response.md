**V3 — Interfață**

Acum nu mai e alegere. V3 este singura soluție.

Alte echipe trebuie să adauge formate fără a modifica codul vostru — asta înseamnă că interfața `Formator` este o cerință, nu o preferință arhitecturală. Echipele lor creează propriile implementări ale `Formator`, le furnizează la `exportă(raport, formator)`, gata.

V1 și V2 necesită mereu modificări în codul vostru. V3 permite extensibilitate pură din exterior. Aceasta nu mai este birocație — aceasta este arhitectură impusă de cerințe reale.