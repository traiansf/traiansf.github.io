```mermaid
stateDiagram-v2
    state "Ciornă" as Ciorna
    state "În evaluare" as InEvaluare
    
    [*] --> Ciorna
    
    Ciorna --> Ciorna: atașează(f)
    Ciorna --> Trimis: trimite [fișier anexat]
    
    Trimis --> InEvaluare: preia(e)
    Trimis --> Retras: retrage
    
    InEvaluare --> InEvaluare: înregistrează raport(r)
    InEvaluare --> Acceptat: acceptă [≥1 raport]
    InEvaluare --> Respins: respinge [≥1 raport]
    InEvaluare --> Retras: retrage
    
    Acceptat --> [*]
    Respins --> [*]
    Retras --> [*]
```

Diagrama include toate șase stări și tranzițiile permise între ele. Condițiile dintre paranteze drepte specifică când tranzițiile sunt valide: `trimite` necesită fișier anexat, iar `acceptă`/`respinge` necesită cel puțin un raport înregistrat. Stările Acceptat, Respins și Retras sunt finale intenționate (R8), fără tranziții de ieșire; evenimentele refuzate rămân în starea curentă conform R7.