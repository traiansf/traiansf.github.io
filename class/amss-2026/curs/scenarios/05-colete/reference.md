# Raționament de referință — colete

Analiză de pregătire, construită pentru [enunț](brief.md); nu este o captură AI.

## Responsabilități și alternative

Formularul web și aplicația operatorului citesc și interpretează intrarea și prezintă rezultatul. Operația comună decide acceptarea și prețul; întoarce fie `acceptat(preț)`, fie `refuz(motiv)`. Ea nu citește elemente de formular și nu afișează mesaje. O verificare în canal poate ajuta utilizatorul, dar nu înlocuiește verificarea comună. La apel direct, aceeași intrare trebuie să primească rezultatul convenit.

**Varianta A:** o funcție comună conține R2–R4. Coeziune: regulile contribuie la aceeași decizie, estimarea. Cost: funcția trebuie revizuită dacă evoluează independent eligibilitatea și tarifele.

**Varianta B:** operația comună coordonează două funcții interne, `accepta` și `pret`. Prima decide eligibilitatea; a doua primește un colet deja acceptat. Canalele nu apelează direct `pret`. Cost: încă o legătură între funcții, care trebuie explicată și verificată. Pentru domeniul actual, ambele variante pot fi justificate. Nici numărul de fișiere, nici numărul de clase nu măsoară singure coeziunea sau cuplarea.

**Alternativa cu copiere:** poate produce răspunsuri corecte astăzi, dar fiecare schimbare comună cere găsirea și sincronizarea ambelor implementări. Exemplul cu `masa < 1000` la web și `masa <= 1000` la ghișeu este un defect construit pentru contrast, nu rezultatul unei rulări AI.

## Verificări

S1: `1000 ≤ 1000`, plic permis, preț 10. S2: depășește limita plicului, refuz chiar dacă masa respectă R2. S3: cutie permisă, treapta de 18 lei. S4: refuz înainte de calcul. S5: capătul superior este inclus, următoarea valoare nu este. Verificarea R5 compară acceptarea și suma ori refuzul pentru fiecare intrare în cele două canale, nu doar numărul de apeluri. Dacă sunt aplicabile mai multe motive de refuz, R6 nu le fixează prioritatea; textele nu trebuie să coincidă. Un ambalaj diferit de plic/cutie ajunge la verificarea R3 și este refuzat.

La C1, un plic de 1200 g este acceptat la **18 lei**, nu la 10: limita ambalajului și pragul tarifului aveau inițial aceeași valoare, dar sensuri diferite. Separăm aceste decizii, chiar dacă rămân în aceeași funcție. Schimbarea culorii unui buton afectează numai canalul; schimbarea pragului tarifar afectează calculul și exemplele aferente. Un al treilea canal folosește aceeași operație fără să copieze politica.

## Criterii de revizuire

Pentru fiecare observație: fragmentul propunerii → regula rezumată → scenariul care o verifică → decizia noastră. O propunere corectă se confirmă prin S1–S5 și apoi se pune la încercare prin C1. Nu cerem defecte obligatorii și nu deducem performanța generală a unui model dintr-o captură.
