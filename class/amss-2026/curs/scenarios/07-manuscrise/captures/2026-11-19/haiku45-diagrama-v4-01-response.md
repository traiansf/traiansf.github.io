```mermaid
stateDiagram-v2
    [*] --> Draft
    
    state "Ciornă" as Draft
    state "Trimis" as Submitted
    state "În evaluare" as Review
    state "Acceptat" as Accepted
    state "Respins" as Rejected
    state "Retras" as Withdrawn
    
    Draft --> Draft: atașează(f)
    Draft --> Submitted: trimite [fișier]
    
    Submitted --> Review: preia(e)
    Submitted --> Withdrawn: retrage
    
    Review --> Review: înregistrează raport(r)
    Review --> Accepted: acceptă [≥1 raport]
    Review --> Rejected: respinge [≥1 raport]
    Review --> Withdrawn: retrage
    
    Accepted --> [*]
    Rejected --> [*]
    Withdrawn --> [*]
```

Manuscrisul pornește în Ciornă, unde se pot atașa fișiere și de unde se trimite (dacă are fișier) în starea Trimis. Un editor prelucrează manuscrisul şi-l duce în evaluare, unde se înregistrează rapoarte și se iau decizii (acceptare sau respingere) numai dacă există cel puțin un raport. Din orice stare intermediară (Trimis sau În evaluare), manuscrisul poate fi retras. Stările Acceptat, Respins și Retras sunt finale și nu permit tranziții suplimentare.