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

**Explicație:** Regula R3 a fost actualizată — plicul acceptă acum până la 1500 g inclusiv. S-a schimbat doar condiția de verificare a masei pentru plic (din 1000 în 1500) și mesajul de eroare corespunzător. Celelalte reguli și calculul prețului rămân neschimbate.