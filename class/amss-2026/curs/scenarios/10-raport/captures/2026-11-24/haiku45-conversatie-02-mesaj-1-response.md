**V2** — Operații separate

Aceasta oferă cel mai bun echilibru între simplitate și flexibilitate. Prin separarea responsabilităților — `vizibil` aplică ascunderea, `text` și `csv` formatează — codul devine ușor de testat și managerizat. Fiecare operație are un singur scop clar, respectând principiul SRP.

V1 amestecă logici și devine inmanejabil cu condiții mari; V3 introduce o interfață pentru doar două formate implementate, ceea ce este overengineering dat fiind că beneficiarul nu a cerut extensii. V2 permite adăugarea facilă a noi formate mai târziu, fără a complica arhitectura acum.