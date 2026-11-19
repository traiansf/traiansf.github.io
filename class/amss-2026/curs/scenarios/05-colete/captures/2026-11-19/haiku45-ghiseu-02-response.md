```python
def estimeaza_pret_expediator(masa, ambalaj):
    """Estimează prețul expedierii unui colet."""
    
    # R2: Verifica masa
    if masa < 1 or masa > 5000:
        return "Refuz: masa trebuie să fie între 1 și 5000 g"
    
    # R3: Verifica ambalajul
    ambalaj_norm = ambalaj.lower().strip()
    
    if ambalaj_norm == "plic":
        if masa > 1000:
            return "Refuz: plicul acceptat doar până la 1000 g"
        pret = 10
    elif ambalaj_norm == "cutie":
        pret = 10 if masa <= 1000 else 18
    else:
        return "Refuz: tip ambalaj neacceptat"
    
    # R4: Intoarce prețul estimat
    return f"Preț estimat: {pret} lei"
```

**Explicație:**

Funcția verifică pe rând: (1) dacă masa e în intervalul 1–5000 g; (2) dacă ambalajul e valid și respectă restricțiile (plicul doar ≤ 1000 g, cutia pe întreg interval); (3) calculează prețul conform R4 (10 lei pentru ≤ 1000 g, 18 lei pentru > 1000 g). Întoarce textul cu prețul estimat sau motivul refuzului aplicabil.