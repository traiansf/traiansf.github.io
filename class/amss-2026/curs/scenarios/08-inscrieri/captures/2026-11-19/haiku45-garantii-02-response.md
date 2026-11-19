# Interacțiunea componentelor și garanții de proiectare

## Fluxul de interacțiune

**La `înscrie(c, p, a)`:**
1. Site trimite cererea cu identificator unic c
2. Registru verifică dacă c este cunoscut
   - **Dacă nu:** evaluează acceptarea (loc liber, participant neînscris); dacă acceptă, consumă locul și apelează expeditorul cu mesajul de confirmare
   - **Dacă da:** retrimitere — returnează răspunsul anterior fără a apela expeditorul din nou
3. Expeditor răspunde cu `trimis` sau `esec`; registrul stochează rezultatul și întoarce site-ului `acceptat` sau `refuz`

**La `retrimite confirmări()`:**
1. Operator invocă operația pe registru
2. Registru selectează înscrisurile cu confirmare `netrimisă`
3. Pentru fiecare, apelează expeditorul o singură dată și actualizează rezultatul

---

## Garanții ale operațiilor

### **1. Consistența datelor (Idempotență și atomicitate)**
- Fiecare identificator de cerere c se acceptă cel mult o dată în registru. Reîncercările cu acelaș c returnează rezultatul salvat anterior fără modificări ulterioare.
- Un participant p nu poate fi înscris de mai multe ori la atelierul a: acceptarea unei cereri noi cu p și a se refuză dacă p figurează deja.
- Locurile atelierului a se consumă doar la prima acceptare al unei cereri: reîncercările nu epuizează locuri suplimentare.
- Acceptarea unei cereri și înregistrarea acesteia sunt atomice: fie ambele se produc, fie nici una.

### **2. Livrarea confirmărilor**
- Fiecare confirmare trimisă cu succes se stochează ca `trimisă` și nu se reapelează expeditorul.
- Confirmări eșuate se înregistrează ca `netrimisă` și sunt candidate pentru retrimitere.
- **Eșecul confirmării nu anulează înscrierea:** înscrierea rămâne valabilă și locul consumat, chiar dacă expeditorul nu livrează. Registrul returnează site-ului `acceptat` în ambele cazuri.
- Retrimiterea prin `retrimite confirmări()` nu produce efecte asupra locurilor sau numărului de înscriori.

### **3. Comportamentul la repetarea cererilor**
- O cerere cu identificator c cunoscut este tratată ca reîncercare: site-ul primește răspunsul anterior idempotent.
- La reîncercare după eșec de confirmare, registrul apelează expeditorul din nou; la succes anterior, expeditorul se omite.
- Retrimiteri pot genera mesaje duplicate către participant, dar niciodată duplicate de înscriori în registru.
- Apelurile rămân secvențiale; nu modelăm concurență.

---

**Rezultat:** Registrul garantează că site-ul nu va pierde o acceptare prin reîncercări și că expeditorul nu va fi apelat inutil, dar retrimiteri pot produce notificări duplicate.