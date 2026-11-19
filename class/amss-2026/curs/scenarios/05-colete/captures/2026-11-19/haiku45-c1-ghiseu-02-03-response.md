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
    elif ambalaj_norm != "cutie":
        return "Refuz: tip ambalaj neacceptat"
    
    # R4: Intoarce prețul estimat
    pret = 10 if masa <= 1000 else 18
    return f"Preț estimat: {pret} lei"
```

S-a actualizat limita pentru plic de 1000 g la 1500 g inclusiv. Prețul rămâne 10 lei până la 1000 g și 18 lei pentru greutăți mai mari. Validarea masei și tipurile de ambalaj acceptate sunt neschimbate.