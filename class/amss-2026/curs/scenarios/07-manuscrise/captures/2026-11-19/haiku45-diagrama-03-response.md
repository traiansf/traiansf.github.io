```mermaid
stateDiagram-v2
    [*] --> "Ciornă"
    
    "Ciornă" --> "Ciornă": atașează(f)
    "Ciornă" --> "Trimis": trimite [are fișier]
    
    "Trimis" --> "În evaluare": preia(e)
    "Trimis" --> "Retras": retrage
    
    "În evaluare" --> "În evaluare": înregistrează raport(r)
    "În evaluare" --> "Acceptat": acceptă [are raport]
    "În evaluare" --> "Respins": respinge [are raport]
    "În evaluare" --> "Retras": retrage
    
    "Acceptat" --> [*]
    "Respins" --> [*]
    "Retras" --> [*]
```

Manuscrisul pornește din **Ciornă** (inițial) și poate fi trimis în **Trimis** doar dacă are fișier atașat; operațiile refuzate rămân în aceeași stare. Din **Trimis**, un editor o preia și trece în **În evaluare**, unde se pot adăuga rapoarte; acceptarea sau respingerea necesită cel puțin un raport. **Retras** este accesibil din **Trimis** sau **În evaluare**, iar **Acceptat**, **Respins** și **Retras** sunt stări finale fără ieșiri ulterioare.