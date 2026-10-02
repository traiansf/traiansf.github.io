# Laboratorul 1 — exemplu pregătit pentru lucrul fără AI

**Proveniență: material didactic redactat de cadrul didactic. Nu este un rezultat înregistrat al unui model.** Propunerile și revizuirea de mai jos au fost construite pentru discuție. Nu le prezentați drept comportamentul unui anumit instrument sau model AI.

Informațiile beneficiarului din [fișa scenariului](scenario.md) sunt sursa de referință. Analizați singuri problema înainte de a citi propunerile. Cadrul didactic vă va atribui varianta A sau B; ambele permit atingerea acelorași obiective de învățare.

## Varianta A — propunere pregătită pentru revizuire

Identificatorul variantei de lucru: `fixture-A-v1`.

- **A1 — Scop:** studenții rezervă Alder sau Birch în D și primesc un cod de rezervare.
- **A2 — Concepte:** o sală are o identitate și un program. O rezervare are un cod, o sală, un titular, un început, un sfârșit și o stare.
- **A3 — Acceptare:** acceptă o cerere dacă începutul precedă sfârșitul în intervalul 09:00–17:00, sala este în listă și intervalul este liber. O durată maximă de 60 de minute este obligatorie pentru fiecare rezervare.
- **A4 — Regula conflictului:** două rezervări confirmate pentru aceeași sală intră în conflict când `new.start <= existing.end` și `existing.start <= new.end`.
- **A5 — Propunere de responsabilitate:** fiecare cerere citește disponibilitatea; dacă nu găsește un conflict, confirmă rezervarea ulterior. Cererile pot efectua acești pași independent. Nu este necesară altă coordonare.
- **A6 — Anulare:** înainte de început, titularul cu identitatea verificată poate anula; intervalul devine liber. Încercarea altei persoane este respinsă fără a modifica rezervarea. Anularea la ora de început sau după aceasta rămâne o întrebare pentru beneficiar.
- **A7 — Limite și întrebări:** exclude plățile, rezervările recurente, listele de așteptare, administrarea și notificările. Întreabă dacă un student poate avea rezervări suprapuse în săli diferite. Interfața și tehnologia de stocare rămân alegeri de proiectare.
- **A8 — Sarcina următoare:** proiectează operațiile de rezervare/anulare; leagă regulile lor de informațiile furnizate și oprește-te pentru revizuire umană înainte de implementare.

Cereți mai întâi unui coleg sau unui context separat să revizuiască propunerea față de sursă. Apoi analizați revizuirea pregătită de mai jos ca pe un alt set de afirmații de evaluat.

### Revizuirea pregătită a variantei A

Identificatorul revizuirii: `fixture-A-review-v1`.

1. **Afirmația R1:** A3 adaugă o durată maximă de 60 de minute fără suport în sursă. F3 stabilește validitatea intervalului; Q3 spune că nu s-a convenit o limită a duratei. Întreabă beneficiarul înainte de a adăuga restricția.
2. **Afirmația R2:** A4 respinge rezervările adiacente. Cu o rezervare existentă 10:00–11:00, cererea 11:00–12:00 satisface ambele condiții `<=`. Aceasta contrazice F4. Regula necesită o verificare a adiacenței.
3. **Afirmația R3:** A5 garantează F5 deoarece fiecare cerere verifică disponibilitatea înainte de confirmare. Nu este necesară altă explicație.
4. **Afirmația R4:** A7 este incompletă deoarece orice proiectare corectă trebuie să folosească o bază de date relațională. Adaug-o ca cerință obligatorie.
5. **Afirmația R5:** A6 respectă regula convenită de anulare de către titular înainte de început și lasă corect deschis cazul limitei temporale. Verifică S6 și S7 înainte de a o păstra.

Clasificați fiecare afirmație a revizuirii folosind informațiile și un scenariu. O revizuire formulată cu încredere poate fi greșită. Salvați deciziile voastre și propunerea modificată; nu copiați pur și simplu revizuirea pregătită drept propria concluzie.

## Varianta B — propunere pregătită cu alegeri justificate

Identificatorul variantei de lucru: `fixture-B-v1`.

- **B1 — Scop și limite:** rezervă o sală din listă în D și returnează un rezultat; exclude funcționalitățile din F8 și folosește identitatea verificată din F2.
- **B2 — Concepte:** distinge sala de rezervarea acelei săli. O rezervare leagă un titular, o sală, un început, un sfârșit, un cod și o stare. Conceptele pot fi reprezentate prin înregistrări, obiecte, tabele sau text.
- **B3 — Verificări temporale:** cere un interval de durată pozitivă în interiorul programului 09:00–17:00 (F3). Nu introduce o limită de durată neaprobată (Q3).
- **B4 — Disponibilitate:** compară doar rezervările confirmate pentru sala cerută. Două intervale de durată pozitivă se suprapun când `new.start < existing.end` și `existing.start < new.end`. Sfârșitul unui interval poate coincide cu începutul celuilalt fără conflict (F4).
- **B5 — Responsabilitate:** decizia de rezervare trebuie să impună regula conflictului și să stabilească confirmarea ca o singură decizie indivizibilă față de deciziile concurente de rezervare. Pentru S5, o cerere altfel validă reușește, iar cealaltă primește un conflict. Modul de a obține garanția rămâne o sarcină de proiectare/implementare; cerințele nu impun un mecanism anume (F5).
- **B6 — Anulare:** titularul poate anula înainte de început. O rezervare anulată nu mai blochează disponibilitatea. Respinge anularea de către alt student și păstrează rezervarea. Lasă deschisă anularea la ora de început sau după aceasta (F6, Q2).
- **B7 — Rezultate și întrebări:** returnează un cod la succes sau regula convenită încălcată la respingere (F7). Cere beneficiarului un răspuns despre rezervările suprapuse ale aceluiași student în săli diferite (Q1). Până atunci, marchează S8 ca nerezolvat, fără a promite un rezultat.
- **B8 — Sarcina următoare:** proiectează rezultatele rezervării/anulării și responsabilitățile de impunere a regulilor pornind de la această descriere; folosește S1–S8 pentru verificare, identifică deciziile rămase și obține o revizuire umană înainte de implementare. Verificarea scenariilor singură nu demonstrează că o eventuală implementare concurentă păstrează B5.

Obțineți o revizuire separată cu aceleași criterii. Exercițiul nu cere să găsiți un defect. Explicați ce susține o decizie păstrată, distingeți întrebările suplimentare de contradicții și verificați o propunere printr-un scenariu. O altă reprezentare opțională nu dovedește că această propunere este greșită.
