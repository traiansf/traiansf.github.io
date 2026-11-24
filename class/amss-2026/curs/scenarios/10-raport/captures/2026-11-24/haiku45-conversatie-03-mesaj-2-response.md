**V3 — interfață.**

Sunt pe deplin de acord. V3 este varianta corectă. Interfața Formator decuplează complet logica de formatare de cea de export, ceea ce permite testare independentă și extensibilitate viitoare fără modificări în codul existent. 

Apelantul controlează formatarea, iar `exportă` rămâne neutru și responsabil doar pentru filtrarea câmpurilor ascunse. Aceasta e abordarea profesionistă: conform Open/Closed Principle, codul e deschis la extensie, închis la modificare. V3 e singura variantă care se scalează corect.