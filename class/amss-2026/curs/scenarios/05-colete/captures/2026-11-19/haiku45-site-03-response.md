```javascript
function estimarePret(masaText, ambalaj) {
  const masa = parseInt(masaText, 10);
  
  if (isNaN(masa)) {
    return "Masa trebuie să fie un număr întreg. Vă rugăm corectați.";
  }
  
  if (masa < 1 || masa > 5000) {
    return "Masa trebuie să fie între 1 și 5000 grame.";
  }
  
  if (ambalaj === "plic" && masa > 1000) {
    return "Plicul este acceptat doar până la 1000 grame.";
  }
  
  if (ambalaj !== "plic" && ambalaj !== "cutie") {
    return "Tip de ambalaj neacceptat.";
  }
  
  const pret = masa <= 1000 ? 10 : 18;
  return `Preț estimat: ${pret} lei`;
}
```

**Explicație:**
Funcția validează mai întâi masa ca întreg, apoi o verifică în intervalul [1, 5000] conform R2. Aplică regula R3 pentru plicuri (doar până la 1000g) și acceptă cutii pe tot intervalul. Respinge alte tipuri de ambalaj. Calculează prețul conform R4: 10 lei pentru ≤1000g, 18 lei pentru >1000g. Mesajele returnate sunt în limba română și specifice pentru fiecare tip de eroare.