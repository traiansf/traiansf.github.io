```mermaid
stateDiagram-v2
    [*] --> Ciornă
    
    Ciornă --> Ciornă: atașează(f)
    Ciornă --> Trimis: trimite [dacă fișier]
    
    Trimis --> "În evaluare": preia(e)
    Trimis --> Retras: retrage
    
    "În evaluare" --> "În evaluare": înregistrează raport(r)
    "În evaluare" --> Acceptat: acceptă [dacă raport≥1]
    "În evaluare" --> Respins: respinge [dacă raport≥1]
    "În evaluare" --> Retras: retrage
```

Manuscrisul pornește în **Ciornă** și progresează prin Trimis → În evaluare, unde rapoartele se adună și se ia decizie (acceptare sau respingere), condiționat de prezența cel puțin unui raport. Din orice moment din Trimis sau În evaluare, manuscrisul se poate retrage în Retras. Stările **Acceptat**, **Respins** și **Retras** sunt finale și nu permit nicio ieșire, iar atașarea fișierului rămâne permisă doar în Ciornă prin înlocuire.