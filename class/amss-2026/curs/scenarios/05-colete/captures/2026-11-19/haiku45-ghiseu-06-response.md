```python
def estimeaza_pret(masa_text, ambalaj):
    try:
        masa = int(masa_text)
    except ValueError:
        return "Masa invalida. Introduceti un numar intreg de grame."
    
    if masa < 1 or masa > 5000:
        return "Masa acceptata: 1-5000 grame."
    
    if ambalaj not in ["plic", "cutie"]:
        return "Ambalaj neacceptat. Alegeti plic sau cutie."
    
    if ambalaj == "plic" and masa > 1000:
        return "Plicul se accepta pana la 1000g inclusiv."
    
    pret = 10 if masa <= 1000 else 18
    return f"Pret estimat: {pret} lei"
```

**Explicație:**
- Interpretează masa ca întreg (R1) și refuză dacă nu e valid
- Validează intervalul 1–5000 g (R2)
- Acceptă doar plic și cutie, verifying limitele (R3)
- Calculează prețul: 10 lei până la 1000 g, 18 lei peste (R4)
- Returnează textul pentru afișare la operator