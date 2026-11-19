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

Am actualizat R3: limita pentru plic este acum 1500 g inclusiv. Condiția de validare și mesajul de eroare reflectă noua limită. R4 (calculul prețului) rămâne neschimbat: 10 lei până la 1000 g, 18 lei pentru plicuri de 1001–1500 g și cutii peste 1000 g.