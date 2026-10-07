Nu am identificat defecte în proiectarea prezentată față de R1–R6 și S1–S6. Descrierea operațiilor și rezultatele scenariilor sunt consecvente cu regulile.

| Afirmația verificată | Reguli | Justificare verificabilă |
|---|---|---|
| Cererea privește titlul; împrumutul și rezervarea privesc exemplarul. | R1, R4, R5 | În S1, împrumutarea C1 nu afectează disponibilitatea C2. În S6, cererile pentru același titlu primesc exemplare diferite. |
| Împrumutul acceptă un exemplar disponibil sau rezervat membrului solicitant; respingerea păstrează starea. | R2 | S3 respinge împrumutarea unui exemplar deja împrumutat. S2 respinge ridicarea de către M3 și permite ridicarea de către M2, titularul rezervării. |
| Ridicarea creează un împrumut nou, încheie rezervarea și îndeplinește cererea. | R2, R5 | În S2, C1 trece din rezervat lui M2 în împrumutat lui M2; rezervarea activă încetează. |
| Returnarea închide împrumutul, păstrează istoricul și alocă exemplarul în aceeași operație. | R3, R5 | S4 verifică istoricul și respingerea celei de-a doua returnări. S2 verifică rezervarea la returnare. |
| Cererea se acceptă numai fără exemplare disponibile și fără duplicat neîncheiat. | R4 | S5 verifică ambele respingeri. Pentru o cerere deja cu exemplar rezervat, proiectarea o include explicit între cererile neîncheiate, deci respinge și acel duplicat. |
| Alocarea urmează ordinea depunerii și omite cererile care au deja exemplar rezervat. | R5 | În S6, C2 este alocat lui M2, apoi C1 lui M4. Ridicarea mai devreme de către M4 nu afectează rezervarea lui M2. |
| Împrumuturile active și rezervările active nu coexistă pe același exemplar; fiecare cerere primește cel mult un exemplar. | R2, R3, R5 | Returnarea închide împrumutul înaintea rezervării, iar ridicarea încheie rezervarea în cadrul aceleiași operații. S6 verifică evitarea unei a doua alocări către M2. |
| O cerere îndeplinită permite o cerere ulterioară, cu reverificarea condițiilor. | R4 | După S2, ambele exemplare sunt împrumutate, iar cererea lui M2 este îndeplinită; o nouă cerere M2/T poate fi acceptată conform R4. |

**Alternative de proiectare, fără defect constatat:** stările explicite ale cererii, numărul de ordine și disponibilitatea calculată sunt alegeri compatibile cu regulile. Alte reprezentări ar fi acceptabile dacă păstrează aceleași condiții și rezultate.

**Întrebări despre extinderi:** expirarea, anularea, realocarea după eliberarea unei rezervări și limitele de împrumut nu sunt lacune ale acestui exercițiu. Sunt în afara domeniului delimitat de R6.

Revizuirea verifică descrierea conceptuală și traseele S1–S6, pornind din stările inițiale precizate, inclusiv independența S2–S6. Nu verifică o implementare, persistența datelor sau executarea efectivă a schimbărilor împreună. Concluzia presupune identificatori cunoscuți și procesare secvențială, conform R6.