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

S-a actualizat pragul maxim de masă acceptat pentru plic: de la 1000 g la 1500 g (R3). Verificarea din regula R4 (prețul pe intervale de masă) rămâne neschimbată. Celelalte reguli și validări funcționează identic.