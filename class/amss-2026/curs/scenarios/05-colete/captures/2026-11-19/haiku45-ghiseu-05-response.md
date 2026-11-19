```python
def estimeaza_pret(masa, ambalaj):
    try:
        masa = int(masa)
    except (ValueError, TypeError):
        return "Corectați masa - trebuie să fie număr întreg."
    
    if not (1 <= masa <= 5000):
        return "Masa neacceptată. Interval: 1-5000 grame."
    
    if ambalaj == "plic":
        if masa > 1000:
            return "Plic neacceptat pentru mase > 1000 grame."
    elif ambalaj == "cutie":
        pass
    else:
        return "Ambalaj neacceptat."
    
    pret = 10 if masa <= 1000 else 18
    return f"Preț estimat: {pret} lei"
```

**Explicații:**
Funcția validează mai întâi dacă masa este interpretabilă ca întreg (R1). Apoi verifică intervalul 1-5000g (R2) și regula ambalajului: plicul doar ≤1000g, cutia pe tot intervalul (R3). Dacă masa și ambalajul sunt acceptate, calculează și returnează prețul: 10 lei ≤1000g, 18 lei peste 1000g (R4). Pentru orice invaliditate, returnează textul de refuz corespunzător.