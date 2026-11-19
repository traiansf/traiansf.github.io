```javascript
function estimarePreț(textMasă, ambalaj) {
  const text = textMasă.trim();
  
  // Validare parsare număr întreg
  if (!/^\d+$/.test(text)) {
    return "Corectaţi masa: introduceti un numar intreg.";
  }
  
  const masa = parseInt(text, 10);
  
  // Validare R2: 1 ≤ masa ≤ 5000
  if (masa < 1 || masa > 5000) {
    return "Masa nu se încadrează în limitele acceptate.";
  }
  
  // Validare R3: plic până la 1000g; cutie pe întreg interval
  if (ambalaj === "plic") {
    if (masa > 1000) {
      return "Plicul acceptă colete doar până la 1000 g.";
    }
  } else if (ambalaj === "cutie") {
    // Acceptat pe întreg interval
  } else {
    return "Ambalaj neacceptat.";
  }
  
  // Calcul preț R4
  const preț = masa <= 1000 ? 10 : 18;
  return `Preţ estimat: ${preț} lei.`;
}
```

**Explicație:**
Funcția validează mai întâi dacă textul se parsează ca număr întreg pozitiv, cere corectare dacă nu. Apoi verific masa în domeniul 1–5000 g (R2), compatibilitatea ambalajului (plic doar ≤1000g, cutie pe întreg interval) și tipul ambalaj (R3). Pentru masă validă, calculez și returnez prețul: 10 lei dacă ≤1000g, 18 lei dacă mai greu (R4). Fiecare validare eșuată returnează un mesaj de refuz specific.