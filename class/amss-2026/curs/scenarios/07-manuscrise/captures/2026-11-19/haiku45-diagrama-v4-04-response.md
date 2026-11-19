```mermaid
stateDiagram-v2
    [*] --> Draft
    
    state "Ciornă" as Draft
    state "Trimis" as Submitted
    state "În evaluare" as UnderReview
    state "Acceptat" as Accepted
    state "Respins" as Rejected
    state "Retras" as Withdrawn
    
    Draft --> Submitted: trimite [fișier]
    Submitted --> UnderReview: preia(e)
    Submitted --> Withdrawn: retrage
    UnderReview --> UnderReview: înregistrează raport
    UnderReview --> Accepted: acceptă [≥1 raport]
    UnderReview --> Rejected: respinge [≥1 raport]
    UnderReview --> Withdrawn: retrage
    
    Accepted --> [*]
    Rejected --> [*]
    Withdrawn --> [*]
```

Diagrama prezintă ciclul de viață al manuscrisului cu șase stări și tranzițiile permise de reguli: de la Ciornă prin Trimis și În evaluare spre stările finale. Stările Acceptat, Respins și Retras sunt finale intenționate (R8) și nu permit tranziții de ieșire, iar tranzițiile critice sunt condiționate: trimite necesită fișier atașat (R3), iar acceptare/respingere necesită cel puțin un raport (R5).