# Tabelul interacțiunii pentru `inscrie`

## Pașii procesării

| Pas | Apelant | Apelat | Acțiune | Transmis | Primit | Înregistrat | Rezultat spre site |
|-----|---------|--------|---------|----------|--------|-------------|-------------------|
| 1 | Site | Registru | Cerere | `inscrie(c, p, a)` | — | — | — |
| 2 | Registru | — | Verifică dacă c există | — | — | — | — |
| **2.1** | **Registru** | **— (neexistă c)** | — | — | — | — | — |
| 2.1.1 | Registru | — | Verifică: p neînscris la a ∧ a cu loc liber | — | — | — | — |
| 2.1.1a | Registru | — | Ambele true | Consumă 1 loc | — | — | — |
| 2.1.1a1 | Registru | Expeditor | Apel confirmare | `trimite(mesaj)` | `trimis`/`esec` | — | — |
| 2.1.1a1-i | Registru | — | Răspuns `trimis` | — | — | **(c, p, a, `trimisă`)** | `acceptat` |
| 2.1.1a1-ii | Registru | — | Răspuns `esec` | — | — | **(c, p, a, `netrimisă`)** | `acceptat` |
| 2.1.1b | Registru | Site | Condiție eșuează | — | — | — | `refuz` |
| **2.2** | **Registru** | **— (c există)** | **Reîncercare** | — | — | — | — |
| 2.2.1 | Registru | — | Extrage starea confirmării | — | — | — | — |
| 2.2.1a | Registru | — | Stare `trimisă` | — | — | — | — |
| 2.2.1a1 | Registru | Site | Întoarcere fără apel expeditor | — | — | — | `acceptat` |
| 2.2.1b | Registru | — | Stare `netrimisă` | — | — | — | — |
| 2.2.1b1 | Registru | Expeditor | Retry: apel confirmare | `trimite(mesaj)` | `trimis`/`esec` | — | — |
| 2.2.1b1-i | Registru | — | Răspuns `trimis` | — | — | **(c, p, a, `trimisă`)** [actualizare] | — |
| 2.2.1b1-ii | Registru | — | Răspuns `esec` | — | — | stare neschimbată | — |
| 2.2.1b1† | Registru | Site | Întoarcere în ambele cazuri | — | — | — | `acceptat` |

---

## Repartizarea responsabilităților

| Actor | Responsabilități |
|-------|-----------------|
| **Site** | Generează identificatorul unic c pe fiecare încercare nouă; retransmite cererea cu același c dacă nu primește răspuns |
| **Registru** | Verifică disponibilitatea (loc liber, p neînscris); consumă resurse atomic; apelează expeditor doar dacă acceptă; distinge reîncercări; garantează idempotență pe reîncercare; actualizează starea confirmării |
| **Expeditor** | Răspunde cu `trimis` sau `esec`; nu trebuie să garanteze livrare efectivă |

---

## Garantiile registrului și presupunerile despre expeditor

**Garantiile registrului:**
- O cerere cu c neînregistrat și condiții îndeplinite consumă exact 1 loc și apelează expeditorul o singură dată.
- O reîncercare cu c deja înregistrat nu consumă alt loc și întoarce același `acceptat`.
- Dacă confirmarea eșuează, înscrierea persista; reîncercările pot retrimite confirmarea.

**Presupunerile despre expeditor:**
- Răspunde la fiecare apel cu `trimis` sau `esec`.
- Răspunsul nu implică succes sau eșec real al livrării.
- Apelul se completează.

---

## Verificarea scenariilor S1–S6

| Scen. | Cerere | După răspuns | Locuri | Înscrisuri | Stare confirmare |
|-------|--------|--------------|--------|-----------|-----------------|
| S1 | c1, P1 | acceptat | 1 | (c1, P1, A) | trimisă |
| S2 | c1, P1 | acceptat | 1 | (c1, P1, A) | **netrimisă** |
| S3 | c1, P1 (retry) | acceptat | 1 | (c1, P1, A) | trimisă [actualizată] |
| S4 | c1, P1 (retry) | acceptat | 1 | (c1, P1, A) | trimisă [neschimbată] |
| S5 | c9, P1 | **refuz** | 1 | (c1, P1, A) | trimisă |
| S6a | c2, P2 | acceptat | 0 | (c1, P1), (c2, P2) | trimisă, trimisă |
| S6b | c3, P3 | **refuz** | 0 | (c1, P1), (c2, P2) | — |