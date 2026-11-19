```mermaid
stateDiagram-v2
    state "Ciornă" as Draft
    state "Trimis" as Sent
    state "În evaluare" as Evaluating
    state "Acceptat" as Accepted
    state "Respins" as Rejected
    state "Retras" as Withdrawn

    [*] --> Draft

    Draft --> Draft: atașează(file)
    Draft --> Sent: trimite [file exists]
    
    Sent --> Evaluating: preia(editor)
    Sent --> Withdrawn: retrage
    
    Evaluating --> Evaluating: înregistrează raport(r)
    Evaluating --> Accepted: acceptă [report exists]
    Evaluating --> Rejected: respinge [report exists]
    Evaluating --> Withdrawn: retrage
```

Diagrama prezintă ciclul de viață al unui manuscris prin șase stări și tranziții permise, inclusiv self-loopuri pentru operații ce nu schimbă starea (atașare, înregistrare rapoarte). Acceptarea și respingerea necesită cel puțin un raport înregistrat; stările finale (Acceptat, Respins, Retras) nu au tranziții de ieșire. Orice eveniment fără tranziție permisă în starea curentă, sau cu condiție neîndeplinită, este refuzat și manuscrisul rămâne neschimbat.