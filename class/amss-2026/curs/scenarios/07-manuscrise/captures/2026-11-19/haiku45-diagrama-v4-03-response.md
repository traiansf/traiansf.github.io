```mermaid
stateDiagram-v2
    state "Ciornă" as Draft
    state "Trimis" as Submitted
    state "În evaluare" as UnderReview
    state "Acceptat" as Accepted
    state "Respins" as Rejected
    state "Retras" as Withdrawn
    
    [*] --> Draft
    
    Draft --> Draft: atașează(f)
    Draft --> Submitted: trimite [fișier]
    
    Submitted --> UnderReview: preia(e)
    Submitted --> Withdrawn: retrage
    
    UnderReview --> UnderReview: înregistrează raport(r)
    UnderReview --> Accepted: acceptă [raport ✓]
    UnderReview --> Rejected: respinge [raport ✓]
    UnderReview --> Withdrawn: retrage
```

Diagrama arată ciclul de viață: manuscrisul pornește în Ciornă, se trimite cu fișier (R3), este preluat de editor (R4), rapoarte se adaugă fără schimbare de stare (R4), iar decizia necesită cel puțin un raport (R5). Retragerea este posibilă din Trimis și În evaluare (R6), iar Acceptat, Respins și Retras sunt finale intenționate fără tranziții de ieșire (R8).