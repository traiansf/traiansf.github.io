# Revizuirea Specificației

## Concordanțe și Constatări

Specificația este **general în acord** cu cererea și regulile convenite. Cerințele funcționale R1–R4 și exemplele reflectă fidel contextul:

- **R1 (Înregistrare):** Structura și fluxul sunt corecte. Precizarea că lipsesc ambele câmpuri (loc și descriere) coincide cu „indică informația lipsă" din context. Totuși, formularea „afișează confirmarea" este **vagă**; contextul precizează mai clar: „afișează numărul și starea", care sunt detaliile concrete necesare pentru trazabilitate.

- **R4 (Tranziții):** Restricția celor trei stări și refuzul explicit al reafirmării stării curente sunt corecte și deja menționate: „inclusiv reafirmarea stării curente este respinsă".

- **Exemple:** Cele trei scenarii aplică regulile corect; Exemplul 3 demonstrează bine independența sesizărilor paralele.

## Omisiuni Semnificative

**Omisiunea 1: Numerotarea și formatul identificatorului**

Contextul precizează explicit: „Nu impunem un format al numărului sau o numerotare consecutivă." Specificația omite aceasta, ceea ce poate duce la întrebări nefondate privind secvențializarea (v. Întrebarea 5: „Care este formatul numărului unic?"). Efectul: implementatorul nu știe că o soluție cu UUID sau orice alt identificator unic este acceptabilă.

**Omisiunea 2: Limitele scenariilor de actualizare**

Contextul notează: „Exemplele de actualizare pornesc din stările indicate și nu analizează concurența actualizărilor." Această precizare lipsește din specificație, generând ambiguitate privind conflictele potențiale (ex. două actualizări simultane pe aceeași sesizare). Efectul: testele de acceptare ar putea evalua comportament nespecificat.

**Omisiune 3: Detalierea Q1**

Contextul clarează: „Toate consultările rămân supuse cerințelor funcționale și de acces; pragul nu permite rezultate incorecte pentru **celelalte 50** [de consultări]." Specificația zice doar „Toate consultările respectă R2 și R4", fără a preciza că și consultările mai lente decât 2 secunde trebuie să returneze răspunsuri **corecte**, nu doar rapide. Riscul: confuzia că 50 consultări din 1.000 pot fi incorecte din punct de vedere al datelor, nu doar ale performanței.

## Alegeri de Proiectare și Limitări ale Verificării

- **Validarea avansată:** Exclusa corect din scope (context); specificația nu o promite.
- **Autentificare:** Exclusa; specificația nu o adresează, ceea ce e consistent.
- **Limitări:** Nu se testează concurența reală, browserele multiple sau scenarii de eșec rețea—acceptabil pentru exercițiu, dar ar trebui documentat explicit că testele Q1 nu acoperă aceste cazuri.

## Rezumat

Specificația este solidă pentru scopul exercițiului, dar necesită clarificări asupra formatelor ID-urilor și precizări că toate consultările—inclusiv cele mai lente din lot—trebuie corecte.