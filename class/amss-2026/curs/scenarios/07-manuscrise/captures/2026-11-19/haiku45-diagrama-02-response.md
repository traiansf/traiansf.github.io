```mermaid
stateDiagram-v2
    [*] --> Ciornă
    
    Ciornă --> Ciornă: atașează(f)
    Ciornă --> Trimis: trimite [fișier]
    
    Trimis --> "În evaluare": preia(e)
    Trimis --> Retras: retrage
    
    "În evaluare" --> "În evaluare": înregistrează raport(r)
    "În evaluare" --> Acceptat: acceptă [raport]
    "În evaluare" --> Respins: respinge [raport]
    "În evaluare" --> Retras: retrage
    
    Acceptat --> [*]
    Respins --> [*]
    Retras --> [*]
```

Diagrama prezintă ciclul de viață al unui manuscris, pornind din starea inițială **Ciornă** și finalizând în una dintre stările finale: **Acceptat**, **Respins** sau **Retras**. Tranzițiile sunt etichetate cu evenimentele permise, iar pentru unele (trimite, acceptă, respinge) sunt indicate condiții necesare în paranteze pătrate. Datele (fișier, editor, rapoarte) se păstrează de-a lungul ciclului, iar stările finale nu au tranziții de ieșire.