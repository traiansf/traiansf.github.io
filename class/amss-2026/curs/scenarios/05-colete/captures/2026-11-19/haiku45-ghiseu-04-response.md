```python
def estimeaza_pret(masa, ambalaj):
    try:
        masa_g = int(masa)
    except (ValueError, TypeError):
        return "Eroare: masa trebuie să fie un număr întreg."
    
    if masa_g < 1 or masa_g > 5000:
        return "Refuz: masa trebuie să fie între 1 și 5000 de grame."
    
    if ambalaj not in ["plic", "cutie"]:
        return "Refuz: ambalaj neacceptat."
    
    if ambalaj == "plic" and masa_g > 1000:
        return "Refuz: plicul acceptă doar colete până la 1000 de grame."
    
    pret = 10 if masa_g <= 1000 else 18
    return f"Prețul estimat: {pret} lei"
```

**Explicație:**
1. Funcția parsează masa ca întreg și validează intervalul R2 (1–5000 g).
2. Verifică tipul ambalajului și aplică restricția din R3 (plic acceptat doar ≤ 1000 g).
3. Pentru colete acceptate, calculează prețul conform R4: 10 lei (≤ 1000 g) sau 18 lei (> 1000 g).
4. Returnează textul operatorului: prețul estimat sau motivul refuzului.
5. Mesajele sunt în limba română, respectând R5 (aceleași reguli pe ambele canale).