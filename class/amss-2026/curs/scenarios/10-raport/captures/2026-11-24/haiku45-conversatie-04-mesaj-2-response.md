**V3 — interfață**

Aveți dreptate. V3 este alegerea profesionistă. Prin formalizarea interfeței Formator, codul devine extensibil fără modificări la `exportă`: noile formate se adaugă ca noi realizări ale interfeței, nu ca noi ramuri de condiție. Aceasta respectă principiul Open/Closed și face sistemul mai ușor de testat și de întreținut.

V2 funcționează, dar lasă o condiție în `exportă`, ceea ce o face fragilă pe termen lung. V3 elimină această fragilitate și face intențiile designului clare.