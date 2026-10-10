CONTEXT: CEREREA ȘI REGULILE CONVENITE

## Cererea inițială

> „Acum primim sesizări despre defecțiuni prin mesaje și telefon. Studenții revin să întrebe dacă s-a făcut ceva. Vrem să poată raporta o problemă și să-i vadă rapid starea.”

Problema urmărită: studentul nu poate afla starea sesizării fără să întrebe din nou. Obiectivul versiunii: înregistrarea sesizării și consultarea stării înregistrate de administrație. Nu promitem reducerea timpului de reparație.

## Limite și reguli convenite în scenariu

Identitatea și rolul utilizatorului sunt deja cunoscute. Rolurile sunt student și personal al administrației. Exemplele de actualizare pornesc din stările indicate și nu analizează concurența actualizărilor. Încărcarea Q1 privește consultări.

- **R1 — Înregistrare:** studentul identificat trimite locul și o descriere nevidă a defecțiunii. La acceptare, sistemul creează o sesizare cu număr unic, autorul respectiv și starea „înregistrată”; afișează numărul și starea. Dacă lipsește locul sau descrierea, indică informația lipsă și nu creează sesizarea. Nu impunem un format al numărului sau o numerotare consecutivă. Nu dezvoltăm validarea avansată a câmpurilor în acest exercițiu.
- **R2 — Acces:** studentul poate consulta numai propriile sesizări și nu le schimbă starea. Administrația poate consulta toate sesizările și actualiza starea conform R4.
- **R3 — Sesizări repetate:** fiecare sesizare se păstrează separat, chiar dacă descrie aceeași defecțiune. Nu se reunesc și nu se resping automat sesizările repetate. O sesizare nouă nu modifică autorul, identificatorul sau starea uneia existente. Administrația actualizează separat sesizările, chiar dacă privesc aceeași intervenție.
- **R4 — Stare:** numai administrația poate schimba „înregistrată” în „în lucru”, apoi „în lucru” în „rezolvată”. Orice altă cerere de schimbare este respinsă, cu motiv și fără modificarea stării. Inclusiv repetarea stării curente este respinsă. „Rezolvată” consemnează declarația administrației că reparația este încheiată; sistemul nu constată fizic reparația.
- **Q1 — Timpul de consultare:** măsurăm de la acțiunea de consultare în browser la afișarea stării. În rețeaua campusului, cu 10.000 de sesizări existente și 20 de consultări simultane, cel puțin 950 dintr-un lot de 1.000 de consultări valide ale propriilor sesizări afișează starea corectă în cel mult 2 secunde. Valorile sunt convenite pentru exercițiu, nu provin din măsurători sau din cererea inițială. Toate consultările rămân supuse cerințelor funcționale și de acces; pragul nu permite rezultate incorecte pentru celelalte 50. Un protocol executabil ar mai fixa dispozitivele, browserul, profilul cererilor, setul de date și condițiile rețelei; acestea nu au fost stabilite sau executate aici.

Sunt excluse: autentificarea, fotografiile, notificările, prioritizarea, repartizarea echipelor, termenele de reparație și redeschiderea. Cererea ulterioară de redeschidere este o propunere de schimbare care nu modifică regulile până la clarificare și acceptare.

SPECIFICAȚIA DE REVIZUIT

# Organizarea Cerințelor și Exemple de Acceptare

## Cerințe Funcționale

**R1 – Înregistrare sesizării:**
Student identificat trimite locul și descrierea defecțiunii. Sistemul creează sesizare cu număr unic, autor, stare „înregistrată" și afișează confirmarea. Dacă lipsesc locul sau descrierea, afișează eroarea și nu creează sesizarea.

**R2 – Acces și rol:**
Studentul vede numai propriile sesizări și nu le modifică. Administrația vede toate și actualizeaza starea.

**R3 – Duplicare:**
Fiecare sesizare rămâne separată și independentă, chiar pentru aceeași defecțiune. Nici studenta, nici administrația nu fuzionează sau resping automat duplicatele.

**R4 – Tranziții de stare:**
Doar administrația schimbă „înregistrată" → „în lucru" → „rezolvată". Orice altă cerere (inclusiv reafirmarea stării curente) este respinsă cu motiv, fără schimbare.

**Q1 – Performanță:**
Cu 10.000 sesizări și 20 consultări simultane, cel puțin 950/1.000 consultări asupra propriilor sesizări afișează stare corectă în ≤ 2 secunde. Toate consultările respectă R2 și R4.

---

## Trei Exemple de Acceptare

**Exemplu 1: Înregistrare validă (R1)**
- Student trimite: locație „D105", descriere „Geamul nu se deschide"
- Sistem creează sesizare #42, stare „înregistrată", afișează confirmarea
- ✓ Acceptat

**Exemplu 2: Acces correct și refuz de modificare neautorizată (R2, R4)**
- Student consulta sesizarea #42, vede starea „în lucru"
- Student încearcă schimbarea în „rezolvată"
- Sistem refuză cu: „Doar administrația poate actualiza starea"
- ✓ Acceptat

**Exemplu 3: Duplicate și tranziție în paralel (R3, R4)**
- Student creează sesizări #42 și #43 pentru aceeași defecțiune
- Administrație actualizează #42: „înregistrată" → „în lucru"
- Administrație actualizează #43: „înregistrată" → „în lucru"
- Fiecare păstrează istoria independentă
- ✓ Acceptat

---

## Întrebări Deschise (Excluse din Cerințe)

1. Cine creează contul și cum se stabilește identitatea inițial?
2. Poate studentul adăuga fotografii sau detalii suplimentare sesizării existente?
3. După „rezolvată", poate student redeschide sesizarea sau creează noua?
4. Cum se gestionează sesizări pentru defecțiuni comune (ex. mai mulți studenți raportează aceeași problemă)?
5. Care este formatul și structura numărului unic (secvențial, UUID, etc.)?

SARCINA

Revizuiește specificația față de cererea și regulile convenite, fără să o rescrii. Pentru fiecare constatare, citează afirmația și regula relevantă și explică efectul printr-un exemplu. Distinge erorile și omisiunile de alegerile de proiectare sau extinderi. Precizează și ce este corect și limitele verificării. Răspunde în română, în maximum 450 de cuvinte.
