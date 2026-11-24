**V3 — interfață.**

V3 oferă cel mai bun echilibru între simplitate și flexibilitate. Prin decuplarea complet a logicii de formatare (via interfață Formator), codul devine testabil și extensibil: orice format nou se adaugă fără modificări în `exportă`.

V1 concentrează prea multă logică într-un singur loc, ceea ce complică testarea și îngreunează adăugarea de formate viitoare.

V2 este un compromis rezonabil, dar lasă o cuplare slabă: `exportă` trebuie să cunoască pe care formatter să apeleze, ceea ce o face mai puțin flexibilă.

V3 inversează această dependență: apelantul controlează formatarea, iar `exportă` devine neutrală. Deși beneficiarul a cerut numai text și CSV, o asociație de voluntari poate evolua și necesita rapoarte în alte formate (XML, JSON, PDF). Interfață permită adăugarea acestora ușor.