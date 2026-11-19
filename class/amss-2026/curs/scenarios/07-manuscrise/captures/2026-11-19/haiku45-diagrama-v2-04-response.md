```mermaid
stateDiagram-v2
    state "Ciornă" as Draft
    state "Trimis" as Submitted
    state "În evaluare" as Review
    state "Acceptat" as Accepted
    state "Respins" as Rejected
    state "Retras" as Withdrawn
    
    [*] --> Draft
    
    Draft --> Draft: atașează(f)
    Draft --> Submitted: trimite [fișier]
    
    Submitted --> Review: preia(e)
    Submitted --> Withdrawn: retrage
    
    Review --> Review: înregistrează raport(r)
    Review --> Accepted: acceptă [raport]
    Review --> Rejected: respinge [raport]
    Review --> Withdrawn: retrage
    
    Accepted --> [*]
    Rejected --> [*]
    Withdrawn --> [*]
```

Diagrama ilustrează ciclul de viață al manuscrisului: de la Ciornă prin Trimis și În evaluare, cu posibilitatea retragerii din orice stare de pre-decizie, până la stările finale (Acceptat, Respins sau Retras). Condițiile de tranzițiie sunt exprimate în paranteze pătrate: trimite necesită fișier atașat, iar acceptă/respinge necesită cel puțin un raport înregistrat. Stările finale n-au tranziții de ieșire, conform R8.