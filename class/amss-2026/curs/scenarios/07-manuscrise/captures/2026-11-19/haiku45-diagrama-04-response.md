```mermaid
stateDiagram-v2
    [*] --> Ciornă
    
    Ciornă --> Ciornă: atașează(f)
    Ciornă --> Trimis: trimite\n[fișier anexat]
    
    Trimis --> "În evaluare": preia(e)
    Trimis --> Retras: retrage
    
    "În evaluare" --> "În evaluare": înregistrează raport(r)
    "În evaluare" --> Acceptat: acceptă\n[≥1 raport]
    "În evaluare" --> Respins: respinge\n[≥1 raport]
    "În evaluare" --> Retras: retrage
```

Manuscrisul pornește în **Ciornă**, unde se pot adăuga fișiere până la trimitere. După trimitere intră în **Trimis**, apoi editorul îl preia și tranzitionează în **În evaluare**, unde se colectează rapoarte. Din **În evaluare**, cu cel puțin un raport, se poate lua decizie (acceptă/respinge) sau retrage. **Acceptat**, **Respins** și **Retras** sunt stări finale intenționate fără tranziții de ieșire, și retragerea e permisă doar din **Trimis** sau **În evaluare**, nu din ciornă (care nu a fost trimisă) sau după o decizie.