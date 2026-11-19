# Proiectare sistem gestionare împrumuturi cărți

## Concepte principale

**Entități:**
- **Membru, Titlu, Exemplar** – entități cu identificatori distincți
- **Împrumut** – relație activă între exemplar și membru (cu dată de start; dată de end numai dacă închis)
- **Cerere de împrumut** – înregistrare cu timestamp, stare (în_așteptare/îndeplinită) și posibil exemplar rezervat
- **Coadă de așteptare** – ordonează cererile nefulfillate ale fiecărui titlu

**Stări exemplar:**
- **Disponibil** – fără împrumut activ și fără rezervare activă
- **Împrumutat** – are împrumut activ
- **Rezervat** – are cerere de împrumut care asteaptă exemplarul

---

## Operații și reguli

### 1. Împrumut exemplar
**Precondițiu:** Exemplar disponibil SAU rezervat acelui membru  
**Proces:**
- Creează Împrumut activ (leagă exemplar de membru)
- Schimbă starea exemplarului la **Împrumutat**
- Dacă era rezervat, încheie cererea cu statut **îndeplinită**

**Rezultat:** Succes / Respinge dacă exemplar ocupat de alt membru

---

### 2. Returnare exemplar
**Precondițiu:** Exemplar cu Împrumut activ  
**Proces:**
- Închide Împrumutul (setează dată de end), păstrează în istoric
- Caută prima Cerere **în_așteptare** pentru titlul exemplarului
  - **Dacă există:** Alocă exemplarul cererii, rezervă exemplarul, schimbă starea la **Rezervat**
  - **Dacă nu există:** Exemplar devine **Disponibil**

**Rezultat:** Succes / Respinge dacă nu există Împrumut activ

---

### 3. Cerere de împrumut
**Precondițiu:** 
- Nu există exemplare disponibile pentru titlu
- Membrul nu are cerere neîncheiată (în_așteptare sau cu exemplar rezervat) pentru titlu

**Proces:**
- Creează Cerere cu stare **în_așteptare**
- Înregistrează timestamp (stabilește prioritate în coadă)

**Rezultat:** Succes / Respinge dacă există exemplar disponibil sau cerere duplicată neîncheiată

---

### 4. Ridicare exemplar (implicit din împrumut)
Se declanșează când membru cu cerere în_așteptare ridică exemplarul rezervat (operație din R2).

---

## Reguli transversale

- **O singură rezervare/exemplar, o singură rezervare/cerere**
- **Cererile se servesc FIFO** – ordinea timestamp stabilește prioritatea
- **Închidere cererelor** – doar la ridicare exemplarului (fulfill din așteptare) sau la anulare (exclus din regulament)
- **Istoric** – Împrumuturile închise se păstrează cu date complete

Sistemul asigură eficiență (ridicare directă a cererilor) și corectitudine (coadă ordonată, stări consistente).