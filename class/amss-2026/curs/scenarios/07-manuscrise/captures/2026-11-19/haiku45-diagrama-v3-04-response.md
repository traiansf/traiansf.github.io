```mermaid
stateDiagram-v2
    state "Ciornă" as Draft
    state "Trimis" as Submitted
    state "În evaluare" as UnderReview
    state "Acceptat" as Accepted
    state "Respins" as Rejected
    state "Retras" as Withdrawn

    [*] --> Draft

    Draft --> Draft: atașează(f) / file := f
    Draft --> Submitted: trimite [file != empty] / sent_time := now()
    
    Submitted --> UnderReview: preia(e) / editor := e
    Submitted --> Withdrawn: retrage / withdrawn_time := now()
    
    UnderReview --> UnderReview: înregistrează raport(r) / reports := reports + {r}
    UnderReview --> Accepted: acceptă [reports != empty] / decision_time := now()
    UnderReview --> Rejected: respinge [reports != empty] / decision_time := now()
    UnderReview --> Withdrawn: retrage / withdrawn_time := now()
```

Diagrama ilustrează ciclul de viață al manuscriselor: pornind din Ciornă, unde se pot atașa și modifica fișiere, manuscrisul progresează prin Trimis către În evaluare, unde se înregistrează rapoarte. Acceptarea sau respingerea necesită prezența cel puțin unui raport și marchează tranziția către stări finale (Acceptat, Respins), iar retragerea este posibilă din Trimis sau În evaluare. Stările finale sunt intenționate și nu permit tranziții de ieșire, iar toate datele (fișier, editor, rapoarte, momente) se păstrează pe tot parcursul ciclului.