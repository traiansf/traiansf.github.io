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

Am actualizat pragul de acceptare pentru plic de la 1000 g la 1500 g (linia 11). Regula de preț rămâne neschimbată: 10 lei pentru colete ≤1000 g, 18 lei pentru cele >1000 g. Celelalte validări și canale sunt neafectate.