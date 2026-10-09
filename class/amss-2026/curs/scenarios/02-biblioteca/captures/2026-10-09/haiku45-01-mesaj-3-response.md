# Problemă identificată — Logica conflictuală

## **Ce face sistemul meu anterior? ❌**
M2 depune o cerere pentru "Ion" → Sistemul o pune în coadă de așteptare.

**Dar problema:** Copy2 e disponibil pe raft! De ce M2 ar astepta în coadă dacă poate împrumuta imediat?

## **Corecția — Logica trebuie să fie mai inteligentă**

### **Regulă simplă:**
```
Când M2 vrea cartea "Ion":
1. Sistemul verifica: sunt exemplare disponibile?
   ✓ DA → oferă să îl împrumute DIRECT (nu cerere)
   ✗ NU → oferă opțiunea de depune cerere în coadă
```

### **Consequence pentru Cerere de Împrumut:**
- **Cererea e relevantă DOAR dacă:**
  - Toate exemplarele sunt împrumutate ŞI
  - Membrul vrea să fie notificat când se eliberează

- **Dacă exemplare sunt disponibile:**
  - Cererea e redundantă
  - Sistemul trebuie să sugereze împrumutul direct

## **Scenariul tău — fluxul corect:**
```
M2 → "Vreau Ion"
  Sistem: "2 exemplare: 1 disponibil, 1 ocupat"
  Opțiuni:
  a) Împrumut imediat exemplarul disponibil ← cea mai logică
  b) Depun cerere pentru coadă (dacă voi veni mai târziu)
```

## **Model revizuit**
- **Cerere** = pentru situații cu ALL exemplare ocupate
- **Verificare disponibilitate** = trebuie facută ÎNAINTE de a oferi cererea
- **Status exemplarelor** = trebuie accesibil instant la interogare

Sistemul trebuie să **prioritizeze împrumutul direct** când e posibil.
