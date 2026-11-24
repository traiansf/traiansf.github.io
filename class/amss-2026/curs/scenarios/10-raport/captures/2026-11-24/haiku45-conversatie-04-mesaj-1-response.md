**V3 — interfață**

Recomand V3 pentru că oferă cel mai bun echilibru între simplitate și flexibilitate. Prin introducerea interfeței Formator, operația `exportă` devine independentă de formatul specific — nu mai conține condiții pe format și nu va necesita modificări dacă se adaugă noi formate în viitor. 

V1 concentrează prea multă logică într-o singură funcție și repetă ascunderea pentru fiecare ramură. V2 elimină repetarea, dar `exportă` rămâne dependentă de formate prin condiție.

V3 respectă principiile de design (Open/Closed, Separation of Concerns): ascunderea se aplică o singură dată, iar responsabilitatea formatării este delegată implementărilor interfeței. Complexitatea adăugată este minimă și se justifică prin claritate și extensibilitate.