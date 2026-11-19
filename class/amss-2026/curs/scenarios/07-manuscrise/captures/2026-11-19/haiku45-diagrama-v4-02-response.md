```mermaid
stateDiagram-v2
    state "Ciornă" as Draft
    state "Trimis" as Submitted
    state "În evaluare" as Review
    state "Acceptat" as Accepted
    state "Respins" as Rejected
    state "Retras" as Withdrawn
    
    [*] --> Draft
    
    Draft --> Submitted: trimite\n[fișier atașat]
    Submitted --> Review: preia(editor)
    Submitted --> Withdrawn: retrage
    
    Review --> Review: înregistrează raport
    Review --> Accepted: acceptă\n[raport înregistrat]
    Review --> Rejected: respinge\n[raport înregistrat]
    Review --> Withdrawn: retrage
```

Manuscrisul pornește din Ciornă și trece în Trimis după atașare și trimitere. Din Trimis, editorul îl preluează pentru evaluare, unde pot fi adăugate rapoarte și apoi luată o decizie (acceptare/respingere) sau poate fi retras. Acceptat, Respins și Retras sunt stări finale intenționate, fără tranziții de ieșire.