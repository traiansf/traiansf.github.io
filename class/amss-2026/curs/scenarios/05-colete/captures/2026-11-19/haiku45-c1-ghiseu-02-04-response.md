```python
def estimeaza_pret_expediator(masa, ambalaj):
    """Estimează prețul expedierii unui colet."""
    
    # R2: Verifica masa
    if masa < 1 or masa > 5000:
        return "Refuz: masa trebuie să fie între 1 și 5000 g"
    
    # R3: Verifica ambalajul
    ambalaj_norm = ambalaj.lower().strip()
    
    if ambalaj_norm == "plic":
        if masa > 1500:
            return "Refuz: plicul acceptat doar până la 1500 g"
        pret = 10 if masa <= 1000 else 18
    elif ambalaj_norm == "cutie":
        pret = 10 if masa <= 1000 else 18
    else:
        return "Refuz: tip ambalaj neacceptat"
    
    # R4: Intoarce prețul estimat
    return f"Preț estimat: {pret} lei"
```

**Explicație:** Limita pentru plic a fost actualizată de la 1000 g la 1500 g (R3). Pentru plice între 1001–1500 g, prețul este 18 lei conform R4. Restul regulilor și comportamentul pentru cutii rămân neschimbate.