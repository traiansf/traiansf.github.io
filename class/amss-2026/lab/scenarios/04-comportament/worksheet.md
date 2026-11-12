# Sprijin facultativ pentru discuție — ghișeul de echipamente

Folosiți [enunțul](scenario.md) la lucrul individual și la discuția în plen. Notițele sunt facultative, rămân la voi și nu se predau.

## Stări și tranziții

Pentru fiecare rând: stare curentă → eveniment → condiție → stare următoare → efect. Un eveniment nepermis este refuzat, fără modificări. Întrebări de verificare: în ce stare sosește o reîncercare? Ce decide un refuz: starea sau condiția? Ce date rămân după anulare?

**Repere:** `ridica` cu identificator nou numai din Rezervată, numai de titular; reîncercarea (același identificator) primește același `ridicat`; `anuleaza` numai din Rezervată; Anulată este finală intenționată; Ridicată permite reîncercarea și actualizarea notificării, fără o a doua ridicare.

## Interacțiunea

Pentru `ridica`: cine apelează pe cine, ce se întoarce, ce înregistrează registrul la fiecare pas. Marcați pasul în care se schimbă starea și pasul în care este apelat expeditorul; verificați ce rămâne înregistrat când expeditorul răspunde `esec`. Despre expeditor presupunem numai că răspunde `trimis` sau `esec`.

## Exemple

Fiecare scenariu S1–S7 din enunț repornește din I (A și B Rezervate), exceptând continuările marcate. Pentru fiecare, spuneți rezultatul, starea rezervării, ce se înregistrează și dacă expeditorul a fost apelat. La refuz, precizați explicit ce nu se modifică.

## Analiza și revizuirea AI

Profesorul conduce o singură analiză și o singură revizuire în plen. Preziceți rezultatul lui S4 (reîncercare după eșec) înainte de răspuns, apoi verificați o afirmație folosind o regulă și un scenariu. Nu porniți sesiuni AI proprii. Dacă instrumentul nu răspunde, discutăm capturile reale pregătite, cu aceeași metodă.

## Exercițiul final

Din I, `ridica(c1, A, T1)` cu `esec`, apoi `ridica(c8, A, T1)` cu identificator nou. Separat, după primul pas, reîncercarea `ridica(c1, A, T1)` cu `trimis`. Pregătiți explicația pentru fiecare rezultat, pentru notificare și pentru ce deosebește cele două cereri.
