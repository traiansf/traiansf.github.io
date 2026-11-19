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
    Draft --> Submitted: trimite [fișier ✓]
    
    Submitted --> UnderReview: preia(e)
    Submitted --> Withdrawn: retrage
    
    UnderReview --> UnderReview: înregistrează raport(r)
    UnderReview --> Accepted: acceptă [raport ✓]
    UnderReview --> Rejected: respinge [raport ✓]
    UnderReview --> Withdrawn: retrage
```

Manuscrisul parcurge șase stări: Ciornă (inițială) → Trimis → În evaluare → una din stările finale (Acceptat, Respins, Retras). Tranziția către Trimis necesită fișier atașat; acceptarea sau respingerea necesită cel puțin un raport înregistrat. Stările finale (Acceptat, Respins, Retras) nu permit tranziții de ieșire, iar datele (fișier, editor, rapoarte) se păstrează pe întreg ciclul de viață conform R8.