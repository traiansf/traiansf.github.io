# Două vizite cu același aparat — Laboratorul 2

Scenariu didactic: un atelier comunitar de reparații ține evidența aparatelor aduse, a vizitelor, a problemelor raportate și a voluntarilor responsabili. Lucrăm în perechi sau grupuri de trei, după cursurile 3–4. Schițele și notițele sunt suport pentru discuție, fără predare obligatorie.

## Acordul cu organizatorii

- **R1 — Aparat:** fiecare aparat fizic are un cod stabil atribuit de atelier. Două aparate pot avea același model și aceeași descriere. Nu presupunem existența unui număr de serie al producătorului.
- **R2 — Vizită:** fiecare vizită are un cod propriu, o dată și privește exact un aparat. Același aparat poate reveni în vizite diferite. Un aparat poate fi înregistrat înaintea primei vizite.
- **R3 — Problemă raportată:** fiecare vizită conține cel puțin o problemă raportată. O astfel de înregistrare aparține exact unei vizite; textul poate coincide cu textul unei probleme de la altă vizită. Ea descrie ce a observat persoana care a adus aparatul, nu un diagnostic confirmat.
- **R4 — Voluntar:** fiecare voluntar are un cod stabil și un nume. O vizită poate să nu aibă încă responsabil sau poate avea exact un voluntar responsabil. Un voluntar poate răspunde de mai multe vizite. Numele nu este identificator unic.
- **R5 — Revenire:** o nouă vizită nu înlocuiește problemele raportate sau responsabilul vizitelor anterioare. Nu se copiază implicit problemele vechi în vizita nouă. Asocierea unui responsabil privește vizita, nu aparatul în general.
- **R6 — Limite:** inventarul pieselor, plățile, proprietarii, programările, competențele voluntarilor și efectuarea reparației sunt excluse. Nu analizăm concurența. Ștergerea și corectarea retroactivă a unei vizite rămân de clarificat dacă vor fi cerute. Nu cerem implementare sau o anumită reprezentare.

## Date pentru discuție

| Înregistrare | Date |
|---|---|
| Aparat A17 | Prăjitor de pâine, model T2 |
| Aparat A18 | Alt prăjitor de pâine, tot model T2 |
| Vizită J1 | A17, 3 septembrie; problema P1: „Pârghia nu rămâne jos”; responsabil Mara, cod M1 |
| Vizită J2 | A17, 8 octombrie; problema P2: „Cablul este deteriorat”; responsabil Radu, cod M2 |
| Vizită J3 | A18, 8 octombrie; problema P3: „Pârghia nu rămâne jos”; fără responsabil |

P1 și P3 sunt înregistrări distincte, chiar dacă au același text. Datele sunt exemple, nu cerințe despre formatul codurilor sau un calendar al laboratorului.

