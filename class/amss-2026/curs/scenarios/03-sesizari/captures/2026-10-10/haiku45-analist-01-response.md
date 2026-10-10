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