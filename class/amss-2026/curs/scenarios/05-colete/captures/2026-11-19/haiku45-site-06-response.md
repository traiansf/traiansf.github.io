```javascript
function estimarePret(textMasa, ambalaj) {
  const masa = Number(textMasa.trim());
  
  if (!Number.isInteger(masa)) {
    return "Eroare: introdu masa ca număr întreg în grame.";
  }
  
  if (masa < 1 || masa > 5000) {
    return "Refuz: masa trebuie să fie între 1 și 5000 grame.";
  }
  
  if (ambalaj !== "plic" && ambalaj !== "cutie") {
    return "Refuz: ambalaj neacceptat.";
  }
  
  if (ambalaj === "plic" && masa > 1000) {
    return "Refuz: plicul este acceptat doar pentru mase până la 1000 grame.";
  }
  
  const pret = masa <= 1000 ? 10 : 18;
  return `Preț estimat: ${pret} lei`;
}
```

**Explicație:**

1. Validează textul masei ca număr întreg; refuza dacă nu se poate interpreta.
2. Verifică intervalul 1–5000 g (R2) și tipul ambalajului (R3).
3. Respinge plicul pentru mase > 1000 g; acceptă cutia pe tot intervalul.
4. Calculează 10 lei pentru ≤ 1000 g, 18 lei pentru > 1000 g (R4).
5. Returnează mesajul de preț estimat sau motivul refuzului (R5–R6).