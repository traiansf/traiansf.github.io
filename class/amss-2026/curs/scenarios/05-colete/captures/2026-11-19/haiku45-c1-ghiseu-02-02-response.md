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

**Explicații:** R3 actualizat: plicul este acceptat acum până la 1500 g inclusiv (în loc de 1000 g). Prețul se calculează conform R4 — 10 lei pentru masa ≤ 1000 g, 18 lei pentru 1001–1500 g la plic sau 1001–5000 g la cutie. Celelalte reguli și canale rămân neschimbate.