# Proiectare sistem de gestionare a împrumuturilor în bibliotecă

## Concepte și entități

**Stări ale unui exemplar:**
- Disponibil: fără împrumut activ și fără rezervare
- Împrumutat: legat de un membru printr-un împrumut activ
- Rezervat: alocat unui membru printr-o cerere de împrumut în așteptare

**Entități principale:**
- Exemplar (legat de titlu)
- Membru
- Împrumut (leagă exemplar-membru; are date de început; închis la returnare)
- Cerere de împrumut (leagă membru-titlu; are număr de ordine; stare: așteptare/îndeplinită)
- Rezervare (leagă exemplar-cerere de împrumut; activă până la ridicare)

---

## Operații și reguli

### 1. **Împrumut**
**Precondițiu:** Exemplarul cunoscut este disponibil SAU rezervat tocmai membrului care solicită.

**Regulă:**
- Dacă exemplarul este disponibil: se crează împrumut activ (exemplar trece în stare împrumutat).
- Dacă exemplarul este rezervat membrului: se ridică cererea (cererea se încheie, rezervarea se anulează, exemplarul trece în stare împrumutat).
- Alte cazuri: operație respinsă, stare inchisă.

**Rezultat:** Exemplar împrumutat sau cerere îndeplinită.

---

### 2. **Returnare**
**Precondițiu:** Exemplarul are împrumut activ.

**Regulă:**
1. Închide împrumutul activ (salvează în istoric).
2. Căuta prima cerere în așteptare pentru titlul exemplarului (ordinea înregistrării).
3. Dacă există: aloca exemplarul cererii (crează rezervare, cererea rămâne așteptând ridicare).
4. Dacă nu există: exemplarul devine disponibil.

**Rezultat:** Exemplar disponibil sau o cerere devine cu exemplar rezervat.

---

### 3. **Cerere de împrumut**
**Precondițiu:** 
- Titlul și membrul sunt cunoscuți.
- Niciunul din exemplarele titlului nu este disponibil.
- Membrul nu are cerere neîncheiat ă pentru acest titlu.

**Regulă:**
- Se înregistrează cererea cu stare "așteptare" și număr de ordine curent.

**Rezultat:** Cerere creată în așteptare.

**Respingere (fără modificare stare):**
- Titlul are exemplare disponibile.
- Membrul are deja cerere neîncheiat ă pentru titlu.
- Duplicat.

---

## Fluxul complet

1. **Cere împrumut** → Dacă exemplar disponibil: împrumut imediat. Altfel: cerere în așteptare.
2. **Returnare** → Exemplarul este rezervat primei cereri sau devine disponibil.
3. **Ridicare exemplar rezervat** → Cererea se îndeplinește, exemplarul se împrumută.

Prioritatea cererilor se stabilește strict prin ordinea înregistrării.