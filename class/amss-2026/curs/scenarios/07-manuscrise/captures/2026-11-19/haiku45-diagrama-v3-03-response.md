```mermaid
stateDiagram-v2
    state "Ciornă" as Ciorna
    state "Trimis" as Trimis
    state "În evaluare" as Evaluare
    state "Acceptat" as Acceptat
    state "Respins" as Respins
    state "Retras" as Retras
    
    [*] --> Ciorna
    
    Ciorna --> Ciorna: atașează(f) / file := f
    Ciorna --> Trimis: trimite [file exists] / sent_at := now
    
    Trimis --> Evaluare: preia(e) / editor := e
    Trimis --> Retras: retrage / withdrawn_at := now
    
    Evaluare --> Evaluare: înreg.raport(r) / reports := reports + r
    Evaluare --> Acceptat: acceptă [report exists] / decided_at := now
    Evaluare --> Respins: respinge [report exists] / decided_at := now
    Evaluare --> Retras: retrage / withdrawn_at := now
    
    Acceptat --> [*]
    Respins --> [*]
    Retras --> [*]
```

Diagrama de stări reflectă ciclic de viață complet al manuscrisului: de la **Ciornă** (cu posibilitate de reatașare), prin **Trimis** și **Evaluare** (cu rapoarte acumulate), către stările finale **Acceptat**, **Respins** sau **Retras**. Transițiile refuzate (trimitere fără fișier, decizie fără raport, retragere din Ciornă, operații din stări finale) nu apar în diagramă conform regulilor. Datele înregistrate (fișier, editor, rapoarte, timpi) se păstrează la fiecare tranziție, iar stările finale n-au tranziții de ieșire.