```python
def estima_pret(masa, ambalaj):
    if ambalaj not in ("plic", "cutie"):
        return f"Ambalaj neacceptat: {ambalaj}"
    if masa < 1 or masa > 5000:
        return f"Masă neacceptată: {masa} g"
    if ambalaj == "plic" and masa > 1000:
        return "Plic acceptat doar până la 1000 g"
    pret = 10 if masa <= 1000 else 18
    return f"Preț estimat: {pret} lei"
```

**Explicație:**

Funcția validează succesiv: (1) tipul ambalajului — acceptă numai "plic" sau "cutie"; (2) masa în interval [1, 5000] g; (3) compatibilitatea plic-masă — plicul nu depășește 1000 g. Dacă toate validările trec, calculează prețul: 10 lei până la 1000 g și 18 lei pentru mai greu. Orice validare eșuată returnează textul refuzului; operatorul vede mesajul corespunzător sau prețul estimat.