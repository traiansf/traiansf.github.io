# Exemplu pregătit pentru discuție — depozit

**Exemplu didactic construit; nu captură AI.** Alternativă de lucru în plen dacă nu există un răspuns AI disponibil. Nu demonstrează comportamentul vreunui model.

## Enunțul relevant

Starea I: F=10, A activă(4), R=4, D=6. F este stocul fizic, R suma rezervărilor active, D=F−R disponibilul. Rezervăm o cantitate întreagă q, cu 0<q≤D și identificator nefolosit. Ridicarea integrală a unei rezervări active scade F și R; anularea activă scade numai R. Refuzul păstrează întregul registru. Codurile, cantitățile și istoricul se păstrează; nu se reutilizează coduri. Formularul și importul folosesc aceleași operații.

## Propunerea

Canalele folosesc registrul comun. Rezervarea reușește numai cu identificator nefolosit, q pozitiv și q≤D; altfel refuză fără modificări. `ridica(A)`: acceptat, A ridicată(4), F=6, R=0, D=6; restul neschimbat. Anularea redă cantitatea disponibilului. Stocul fizic F nu se schimbă la o anulare acceptată. Păstrăm celelalte rezervări și relația D=F−R≥0.

## Observația de revizuire, tot construită didactic

Calculul ridicării este susținut de regulă. Lipsește condiția anulării și efectul refuzului. Verificați anularea după ridicare. Regula R4 permite numai anularea unei rezervări active și cere refuz fără modificări în celelalte situații; un invariant cantitativ nu înlocuiește aceste obligații.

## Decizia noastră

Confirmăm calculul și responsabilitatea comună. Precizăm pentru anulare: rezervarea trebuie să fie activă pentru succes; altfel refuz, registru identic. S5 din I produce mai întâi F=6, A ridicată(4), R=0, D=6; anularea ulterioară refuză și păstrează exact această stare. Condiția de succes este distinctă de precondițiile asumate (registru valid, identificatori nenuli, apeluri seriale).

Într-o rulare live folosim propunerea și observațiile efective. Dacă acestea sunt deja complete, le confirmăm; nu atribuim artificial omisiunile acestui exemplu unui răspuns real.
