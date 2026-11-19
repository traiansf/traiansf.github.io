```mermaid
stateDiagram-v2
    state "Ciornă" as Draft
    state "Trimis" as Sent
    state "În evaluare" as UnderReview
    state "Acceptat" as Accepted
    state "Respins" as Rejected
    state "Retras" as Withdrawn

    [*] --> Draft

    Draft --> Draft: atașează(f) / file := f
    Draft --> Sent: trimite [file ≠ ∅] / time_sent := now
    
    Sent --> UnderReview: preia(e) / editor := e
    Sent --> Withdrawn: retrage / time_withdrawn := now
    
    UnderReview --> UnderReview: înregistrează raport(r) / reports += r
    UnderReview --> Accepted: acceptă [reports ≠ ∅] / time_decision := now
    UnderReview --> Rejected: respinge [reports ≠ ∅] / time_decision := now
    UnderReview --> Withdrawn: retrage / time_withdrawn := now
    
    Accepted --> [*]
    Rejected --> [*]
    Withdrawn --> [*]
```

Diagrama prezintă ciclul de viață al unui manuscris prin șase stări: Ciornă (inițială), Trimis, În evaluare, și trei stări finale (Acceptat, Respins, Retras). Tranzițiile sunt etichetate conform standardului UML cu eveniment, condiție (în paranteze pătrate) și efect asupra datelor (după bară oblică). Stările finale nu au tranziții de ieșire, iar unele tranziții impun condiții prealabile—de exemplu, acceptarea și respingerea necesită cel puțin un raport înregistrat.