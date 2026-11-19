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
        if masa > 1000:
            return "Plicul este acceptat doar până la 1000 g."
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

**Explicație:**
1. Funcția interpretează masa ca întreg; eroare dacă nu este validă.
2. Verifică R2: masa ∈ [1, 5000] g, altfel refuz.
3. Aplică R3: plicul doar până 1000 g, cutia pe tot intervalul, altele refuz.
4. Pentru colete acceptate, calculează R4: 10 lei dacă masa ≤ 1000 g, 18 lei dacă > 1000 g.
5. Întoarce prețul estimat sau motivul refuzului pe canalul operatorului.