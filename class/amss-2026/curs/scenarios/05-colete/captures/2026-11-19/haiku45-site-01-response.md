```javascript
function estimarePret(textMasa, ambalaj) {
  // R1: Interpretare textului ca număr întreg
  const textTrim = textMasa.trim();
  if (!/^\d+$/.test(textTrim)) {
    return "Masa nu a putut fi interpretată ca număr întreg. Vă rugăm să o corectați.";
  }
  
  const masa = parseInt(textTrim, 10);
  
  // R2: Validare interval masă
  if (masa < 1 || masa > 5000) {
    return "Masa trebuie să fie între 1 și 5000 grame.";
  }
  
  // R3: Validare ambalaj
  const ambalajNorm = (ambalaj || "").toLowerCase().trim();
  
  if (ambalajNorm === "plic") {
    if (masa > 1000) {
      return "Plicul este acceptat doar pentru mase până la 1000 grame.";
    }
  } else if (ambalajNorm === "cutie") {
    // Acceptat pe întreg intervalul 1–5000 g
  } else {
    return "Tip de ambalaj neacceptat.";
  }
  
  // R4: Calcul preț
  const pret = masa <= 1000 ? 10 : 18;
  return `Preț estimat: ${pret} lei`;
}
```

**Explicație:**
Funcția interpretează textul masai ca întreg (R1) și refuză dacă nu se poate. Validează masa în intervalul 1–5000 g (R2). Verifică compatibilitatea ambalajului: plicul merge doar până la 1000 g, cutia pe întreg intervalul (R3). Calculează prețul: 10 lei până la 1000 g, 18 lei peste (R4). Returnează prețul sau mesajul de refuz.