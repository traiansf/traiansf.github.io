```javascript
function estimareExpediere(textMasa, ambalaj) {
  if (!/^\d+$/.test(textMasa.trim())) {
    return "Masa nu poate fi interpretată. Corectați valoarea.";
  }
  
  const masa = parseInt(textMasa.trim(), 10);
  
  if (masa < 1 || masa > 5000) {
    return "Masa nu este acceptată (1–5000 g).";
  }
  
  if (ambalaj === "plic" && masa > 1000) {
    return "Plicul acceptă doar până la 1000 g.";
  }
  
  if (ambalaj !== "plic" && ambalaj !== "cutie") {
    return "Ambalajul nu este acceptat.";
  }
  
  const pret = masa <= 1000 ? 10 : 18;
  return `Prețul estimat: ${pret} lei.`;
}
```

**Explicații:** Funcția validează mai întâi masa ca număr întreg, apoi verific intervalul [1, 5000] grame. Aplică regula plicului (maximum 1000 g) și acceptă cutia pe tot intervalul. Calculez prețul conform regulei: 10 lei până la 1000 g, 18 lei pentru peste 1000 g. Returnez mesajul cu preț sau motivul refuzului.