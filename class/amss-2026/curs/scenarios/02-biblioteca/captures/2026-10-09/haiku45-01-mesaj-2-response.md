# Corectarea modelului — Logica cozii de așteptare

## **Problema identificată**
Exemplarul nu avea status intermediar pentru cereri în coadă → M3 a putut împrumuta direct, ocolind M2.

## **Corecții necesare**

### **1. Status exemplarului — extins**
- `disponibil` → poate fi împrumutat liber
- `împrumutat` → în posesia unui membru
- **`rezervat`** → are cereri în coadă; numai aprobata cerere poate prelua
- `deteriorat` → indisponibil

### **2. Logica de împrumut — restricție**
```
Dacă exemplar.status == 'rezervat':
  ✗ Reject împrumutul direct (chiar dacă M3 sosește la ghișeu)
  → M3 trebuie să depună o cerere în coadă
```

### **3. Flux de returnare — automat**
```
Când returnare_carte(exemplar_id):
  1. Exemplar era 'împrumutat' 
  2. Dacă exista cereri în coadă:
     - Exemplar → status 'rezervat'
     - Primeira cerere → status 'aprobată'
     - Notificare: "Cartea e gata, vino în 2 zile"
  3. Dacă nu exista cereri:
     - Exemplar → status 'disponibil'
```

### **4. Cerere de împrumut — nouă regula**
- Dacă exemplar `disponibil` → crează împrumut direct (nu cerere)
- Dacă exemplar `împrumutat` → crează cerere în coadă

### **5. Timeout pentru cereri aprobate**
- Cerere aprobată expirează în **2-3 zile** dacă nu e preluată
- → Exemplar revine la `rezervat`, se aprobă următoarea cerere

## **Rezultat pentru scenariul raportat**
1. M2 depune cerere (carta e împrumutată de M1)
2. M1 returnează → M2 cerere aprobată, exemplar → `rezervat`
3. **M3 nu poate împrumuta direct** ✗ (trebuie să depună cerere în coadă după M2)

Vreai să adaug și detalii despre **penalități** sau **limite de împrumuturi active**?
