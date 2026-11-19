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
    Draft --> Submitted: trimite [file != null] / time_submit := now
    Submitted --> UnderReview: preia(e) / editor := e
    Submitted --> Withdrawn: retrage / time_withdraw := now
    UnderReview --> UnderReview: înregistrează raport(r) / reports.add(r)
    UnderReview --> Accepted: acceptă [reports.size > 0] / time_decision := now
    UnderReview --> Rejected: respinge [reports.size > 0] / time_decision := now
    UnderReview --> Withdrawn: retrage / time_withdraw := now
    Accepted --> [*]
    Rejected --> [*]
    Withdrawn --> [*]
```

Diagrama modelează ciclul de viață al unui manuscris prin șase stări: **Ciornă** (inițială) unde se atașează fișiere, **Trimis** după validare, **În evaluare** cu înregistrare de rapoarte, și trei stări finale (**Acceptat**, **Respins**, **Retras**). Tranzițiile impun condiții (fișier prezent pentru trimitere, rapoarte înregistrate pentru decizie) și înregistrează momente și date; absence unei tranziții reprezentează refuzul unui eveniment în acea stare. Ciclul reflectă regulile R3–R6, iar stările finale nu au ieșiri conform R8.