```python
def estimeaza_pret(masa_text, ambalaj):
    # Interpretare masă
    try:
        masa = int(masa_text)
    except (ValueError, TypeError):
        return "Masa introdusă nu este validă."
    
    # R2: Interval masă
    if masa < 1 or masa > 5000:
        return "Masa nu respectă intervalul 1–5000 g."
    
    # R3: Verificare ambalaj și restricții
    ambalaj_lower = ambalaj.lower()
    if ambalaj_lower == "plic":
        if masa > 1500:
            return "Plicul este acceptat doar până la 1500 g."
    elif ambalaj_lower == "cutie":
        pass
    else:
        return f"Ambalaj nerecunoscut: '{ambalaj}'."
    
    # R4: Calculare preț
    if masa <= 1000:
        return "Preț estimat: 10 lei"
    else:
        return "Preț estimat: 18 lei"
```

Am actualizat R3: limita plicului a fost schimbată de la 1000 g la 1500 g inclusiv.
Verificarea `if masa > 1500` și mesajul corespunzător au fost ajustate.
Regula R4 de calcul al prețului rămâne neschimbată (10 lei până la 1000 g, 18 lei peste).