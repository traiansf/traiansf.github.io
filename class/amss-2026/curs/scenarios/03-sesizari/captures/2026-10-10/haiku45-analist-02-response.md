# Organizarea cerințelor și exemple de acceptare

## Cerințe funcționale

**R1 — Înregistrare sesizării**
- Studentul identificat completează locația și descrierea defecțiunii
- Sistemul creează sesizare cu: număr unic, autor, stare „înregistrată"
- Răspuns: afișează numărul și starea
- Dacă lipsa loc sau descriere: indică câmpul și nu creează sesizarea

**R2 — Control acces**
- Studentul consulta doar propriile sesizări (citire)
- Administrația consulta toate sesizările și actualizează starea

**R3 — Sesizări repetate**
- Fiecare sesizare se păstrează separat
- Nu se reunesc și nu se resping automat
- Actualizarea unei sesizări nu afectează altele cu tema similară

**R4 — Stări și tranzități**
- Stări valide: „înregistrată" → „în lucru" → „rezolvată"
- Numai administrația schimbă starea
- Orice altă tranzație (inclusiv repetarea stării curente) este respinsă cu motiv explicit

**Q1 — Performanță de citire**
- Condiții: 10.000 sesizări existente, 20 cereri simultane
- Criteriu: ≥950 din 1.000 consultări ale propriilor sesizări afișează stare corectă în ≤2 secunde
- Toate consultările rămân supuse cerințelor funcționale și de acces

---

## Exemple de acceptare

**Exemplu 1 (R1 — Înregistrare reușită)**
- Când: Student autentificat completează: Locație = „Sala 204", Descriere = „Temperatura prea ridicată"
- Atunci: Sistemul creează sesizare și afișează: Număr = „SEZ-2025-11847", Stare = „înregistrată"

**Exemplu 2 (R4 — Tranzație validă)**
- Când: Administrator selectează sesizare cu stare „înregistrată" și schimbă în „în lucru"
- Atunci: Starea se actualizează și următoarea consultare afișează „în lucru"

**Exemplu 3 (R2 + Q1 — Acces și performanță)**
- Când: 20 de studenți consultează simultan propriile sesizări (10.000 sesizări în sistem)
- Atunci: Măsurând 1.000 de citiri, ≥950 afișează starea corectă în ≤2 secunde; nici o sesizare de alt student nu apare

---

## Întrebări deschise

1. **Format și numerotare:** Cum se generează identificatorul sesizării? (consecutiv, UUID, alte reguli)
2. **Autentificare:** Cine stabilește identitatea studentului și administratorului?
3. **Persistență:** Cum și unde se stochează sesizările? (bază de date, fișier, memorie)
4. **Erori de acces:** Ce se afișează dacă student încearcă să consulte sesizarea altcuiva?
5. **Ștergere:** Se pot șterge sesizări închise? Istoric?
6. **Notificări:** Se anunță studentul la schimbare stării?

---

**Observație:** Regulile și exemplele menține focus pe fluxurile de bază (raportare, consultare, actualizare stare) și pe performanța citirilor. Autentificarea, validarea avansată, notificările și redeschiderea rămân excluse conform acordului.