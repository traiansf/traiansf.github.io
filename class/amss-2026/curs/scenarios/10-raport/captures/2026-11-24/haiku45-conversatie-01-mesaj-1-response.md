**V3 — interfață**

Recomand V3 pentru că aplică principii SOLID și oferă flexibilitate maximă. Separarea ascunderii (vizibil) de formatare este clară, dar mai important: interfața Formator elimină condiția pe format din `exportă`. Aceasta înseamnă că noile formate se adaugă fără modificarea operației principale — beneficiarul ar putea solicita în viitor XML sau alt format, și `exportă` rămâne neschimbată. 

V1 amestecă responsabilități și este greu de extins. V2 este mai bun decât V1 (separează ascunderea), dar V3 inversează corect dependența: apelantul controlează formatul, nu `exportă`. Dezavantajul minor (introducere interfață) este neglijabil comparativ cu beneficiile.