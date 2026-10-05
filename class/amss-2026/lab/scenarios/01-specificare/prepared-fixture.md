# Laboratorul 1 — exemplu pregătit pentru lucrul fără AI

**Proveniență: material didactic redactat de profesor. Nu este un rezultat înregistrat al unui model.** Propunerile și revizuirea de mai jos au fost scrise pentru discuție. Nu le prezentați drept comportamentul unui anumit instrument sau model AI.

Informațiile beneficiarului din [fișa scenariului](scenario.md) sunt sursa de referință. Analizați singuri problema înainte de a citi propunerile. Profesorul vă va atribui varianta A sau B; ambele servesc acelorași obiective de învățare.

## Varianta A — propunere pregătită pentru revizuire

Identificatorul variantei de lucru: `fixture-A-v1`.

- **A1 — Scop:** locatarii programează Albastra sau Verdea în D și primesc un cod de programare.
- **A2 — Concepte:** o mașină are o identitate și un program. O programare are un cod, o mașină, un titular, un început, un sfârșit și o stare.
- **A3 — Acceptare:** acceptă o cerere dacă începutul precedă sfârșitul în intervalul 08:00–22:00, mașina este în listă și intervalul este liber. Fiecare locatar poate avea cel mult o programare în ziua D.
- **A4 — Regula conflictului:** două programări confirmate pentru aceeași mașină intră în conflict când `new.start <= existing.end` și `existing.start <= new.end`.
- **A5 — Propunere de responsabilitate:** fiecare cerere citește disponibilitatea; dacă nu găsește un conflict, confirmă programarea ulterior. Cererile pot parcurge acești pași independent. Nu este necesară altă coordonare.
- **A6 — Anulare:** înainte de început, titularul cu identitatea verificată poate anula; intervalul devine liber. Încercarea altei persoane este respinsă fără a modifica programarea. Anularea la ora de început sau după aceasta rămâne o întrebare pentru beneficiar.
- **A7 — Limite și întrebări:** exclude plățile, programările recurente, listele de așteptare, administrarea, defecțiunile și notificările. Întreabă dacă un locatar poate avea programări suprapuse pe mașini diferite. Interfața și tehnologia de stocare rămân alegeri de proiectare.
- **A8 — Sarcina următoare:** proiectează operațiile de programare/anulare; leagă regulile lor de informațiile furnizate și oprește-te pentru revizuire umană înainte de implementare.

Cereți mai întâi unui coleg sau unui context separat să revizuiască propunerea față de sursă. Apoi analizați revizuirea pregătită de mai jos ca pe un alt set de afirmații de evaluat.

### Revizuirea pregătită a variantei A

Identificatorul revizuirii: `fixture-A-review-v1`.

1. **Constatarea C1:** A3 adaugă limita „cel mult o programare pe locatar în ziua D” fără temei în sursă. Q3 spune că un număr maxim de programări pe locatar nu este convenit. Cu S1 confirmat, o cerere a Ioanei pentru Albastra 15:00–16:00 ar fi respinsă. Întreabă beneficiarul înainte de a adăuga restricția.
2. **Constatarea C2:** A4 respinge programările adiacente. Cu o programare existentă 10:00–11:00, cererea 11:00–12:00 satisface ambele condiții `<=`. Aceasta contrazice F4. Regula trebuie să verifice și cazul intervalelor adiacente.
3. **Constatarea C3:** A5 garantează F5 deoarece fiecare cerere verifică disponibilitatea înainte de confirmare. Nu este necesară altă explicație.
4. **Constatarea C4:** A7 este incompletă deoarece orice proiectare corectă trebuie să folosească o bază de date relațională. Adaug-o ca cerință obligatorie.
5. **Constatarea C5:** A6 respectă regula convenită de anulare de către titular înainte de început și lasă corect deschis cazul limitei temporale. Verifică S6 și S7 înainte de a o păstra.

Clasificați fiecare constatare a revizuirii pe baza informațiilor și a unui scenariu. O revizuire formulată cu încredere poate fi greșită. Salvați deciziile voastre și propunerea modificată; nu copiați pur și simplu revizuirea pregătită drept concluzie proprie.

## Varianta B — propunere pregătită cu alegeri justificate

Identificatorul variantei de lucru: `fixture-B-v1`.

- **B1 — Scop și limite:** programează o mașină din listă în D și returnează un rezultat; exclude funcționalitățile din F8 și folosește identitatea verificată din F2.
- **B2 — Concepte:** distinge mașina de programarea acelei mașini. O programare leagă un titular, o mașină, un început, un sfârșit, un cod și o stare. Conceptele pot fi reprezentate prin înregistrări, obiecte, tabele sau text.
- **B3 — Verificări temporale:** cere un interval de durată pozitivă în interiorul programului 08:00–22:00 (F3). Nu introduce o limită de durată sau de număr de programări neconvenită (Q3).
- **B4 — Disponibilitate:** compară doar programările confirmate pentru mașina cerută. Două intervale de durată pozitivă se suprapun când `new.start < existing.end` și `existing.start < new.end`. Sfârșitul unui interval poate coincide cu începutul celuilalt fără conflict (F4).
- **B5 — Responsabilitate:** decizia de programare trebuie să impună regula conflictului, iar confirmarea trebuie să fie o singură decizie indivizibilă în raport cu celelalte decizii de programare concurente. Pentru S5, o cerere altfel validă reușește, iar cealaltă primește un conflict. Cum se obține această garanție rămâne o sarcină de proiectare/implementare; cerințele nu impun un mecanism anume (F5).
- **B6 — Anulare:** titularul poate anula înainte de început. O programare anulată nu mai blochează disponibilitatea. Respinge anularea de către alt locatar și păstrează programarea. Lasă deschisă anularea la ora de început sau după aceasta (F6, Q2).
- **B7 — Rezultate și întrebări:** returnează un cod când programarea reușește, iar la respingere, regula convenită care a fost încălcată (F7). Cere beneficiarului un răspuns despre programările suprapuse ale aceluiași locatar pe mașini diferite (Q1). Până atunci, marchează S8 ca nerezolvat, fără a promite un rezultat.
- **B8 — Sarcina următoare:** proiectează rezultatele programării/anulării și responsabilitățile care impun regulile, pornind de la această descriere; folosește S1–S8 pentru verificare, identifică deciziile rămase și cere o revizuire umană înainte de implementare. Simpla verificare a scenariilor nu arată că o eventuală implementare concurentă păstrează B5.

Cereți o revizuire separată, cu aceleași criterii. Exercițiul nu cere să găsiți un defect. Explicați ce susține o decizie păstrată, distingeți întrebările suplimentare de contradicții și verificați o propunere printr-un scenariu. Existența unei alte reprezentări posibile nu înseamnă că propunerea este greșită.
