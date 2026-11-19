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
    Draft --> Submitted: trimite (dacă fișier)
    
    Submitted --> UnderReview: preia(e)
    Submitted --> Withdrawn: retrage
    
    UnderReview --> UnderReview: înregistrează raport(r)
    UnderReview --> Accepted: acceptă (dacă raport ≥ 1)
    UnderReview --> Rejected: respinge (dacă raport ≥ 1)
    UnderReview --> Withdrawn: retrage
```

Manuscrisele progresează din **Ciornă** prin **Trimis** și **În evaluare**, unde deciziile (acceptare/respingere) cer cel puțin un raport înregistrat, sau pot fi retrase. Stările finale—**Acceptat**, **Respins**, **Retras**—nu au tranziții de ieșire; anumite acțiuni (trimite fără fișier, decizie fără raport, retragere din Ciornă) sunt refuzate prin menținerea stării și datelor.