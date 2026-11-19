```javascript
function estimarePret(masaText, ambalaj) {
  const masa = parseInt(masaText, 10);
  
  if (isNaN(masa)) {
    return "Masa trebuie să fie un număr întreg. Vă rugăm corectați.";
  }
  
  if (masa < 1 || masa > 5000) {
    return "Masa trebuie să fie între 1 și 5000 grame.";
  }
  
  if (ambalaj === "plic" && masa > 1500) {
    return "Plicul este acceptat doar până la 1500 grame.";
  }
  
  if (ambalaj !== "plic" && ambalaj !== "cutie") {
    return "Tip de ambalaj neacceptat.";
  }
  
  const pret = masa <= 1000 ? 10 : 18;
  return `Preț estimat: ${pret} lei`;
}
```

**Explicații:** Limita plicului s-a actualizat de la 1000 g la 1500 g în verificarea R3. Mesajul de eroare corespunzător reflectă noua valoare. Restul regulilor și logica de preț rămân neschimbate.