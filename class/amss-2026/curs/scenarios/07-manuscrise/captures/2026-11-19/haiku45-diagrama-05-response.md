```mermaid
stateDiagram-v2
    [*] --> Ciornă
    
    Ciornă --> Ciornă: atașează(f)
    Ciornă --> Trimis: trimite [fișier]
    
    Trimis --> "În evaluare": preia(e)
    Trimis --> Retras: retrage
    
    "În evaluare" --> "În evaluare": înregistrează raport(r)
    "În evaluare" --> Acceptat: acceptă [≥1 raport]
    "În evaluare" --> Respins: respinge [≥1 raport]
    "În evaluare" --> Retras: retrage
    
    Acceptat --> [*]
    Respins --> [*]
    Retras --> [*]
```

Diagrama include toate 6 stările și tranzițiile permise conform regulilor. Tranzițiile cu condiții sunt marcate între paranteze pătrate (fișier atașat pentru `trimite`, cel puțin un raport pentru `acceptă`/`respinge`). Stările finale — Acceptat, Respins, Retras — nu au tranziții de ieșire, iar tranzițiile refuzate (de exemplu `retrage` din Ciornă) nu apar în diagramă.