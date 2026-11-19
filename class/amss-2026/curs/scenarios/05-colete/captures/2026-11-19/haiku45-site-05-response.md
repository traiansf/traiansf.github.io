```javascript
function estimarePret(textMasa, ambalaj) {
  // Parsare și validare masă
  const masa = parseInt(textMasa, 10);
  if (isNaN(masa) || masa.toString() !== textMasa.trim()) {
    return "Eroare: introduceți masa ca număr întreg valabil.";
  }
  
  if (masa < 1 || masa > 5000) {
    return "Refuz: masa trebuie să fie între 1 și 5000 grame.";
  }
  
  // Validare ambalaj și restricții
  if (ambalaj === "plic") {
    if (masa > 1000) {
      return "Refuz: plicul acceptă doar colete de până la 1000 grame.";
    }
  } else if (ambalaj === "cutie") {
    // Cutia acceptă masa în intervalul R2 (deja validat)
  } else {
    return "Refuz: ambalaj neacceptat. Alegeți: plic sau cutie.";
  }
  
  // Calcul preț
  const pret = masa <= 1000 ? 10 : 18;
  return `Preț estimat: ${pret} lei`;
}
```

**Explicații:**
Funcția validează pe rând: parsarea masei ca întreg (R1), intervalul 1–5000 g (R2), tipul ambalajului și restricția plicului la 1000 g (R3), apoi calculează prețul conform pragului de 1000 g (R4). Pentru orice condiție neîndeplinită, returnează un mesaj de refuz; pentru intrări valide, returnează prețul în lei.