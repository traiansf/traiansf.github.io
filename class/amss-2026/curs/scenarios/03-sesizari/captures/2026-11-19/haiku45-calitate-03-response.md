# Cerințe de calitate — Prima versiune

## Înregistrare sesizări

**CQ1.1 — Validare date obligatorii:** La trimiterea unei sesizări noi, sistemul verifică prezența locului și descrierii. Dacă oricare lipsește, afișează mesajul specific al datei lipsă și nu creează înregistrarea. Pragul: 100% din cazurile cu date incomplete sunt respinse cu indicarea câmpului lipsă. Măsurare: se testează cu perechi loc/descriere în toate combinațiile incomplete și incomplete.

**CQ1.2 — Înregistrare cu date valide:** La trimiterea unei sesizări noi cu loc și descriere nevide, sistemul creează o înregistrare cu identificator unic, autorul (utilizatorul curent), starea inițială „înregistrată" și timestamp. Pragul: 100% din cazurile cu date complete crează înregistrare și afișează identificatorul generat. Măsurare: se verifică prezența identificatorului în răspuns și în evidențele sistemului.

## Acces și control

**CQ2.1 — Izolarea sesizărilor studentului:** Un student autentificat poate consulta exclusiv sesizările proprii. Pragul: 100% din consultările unui student afișează doar sesizările pe care le-a creat; nu sunt vizibile sesizări ale altor studenți sau ale administrației. Măsurare: se autentifică doi studenți diferiți, fiecare crează sesizări și se verifică că fiecare vede doar ale sale.

**CQ2.2 — Drepturi de administrație:** Personalul administrației autentificat poate consulta toate sesizările. Pragul: 100% din sesizările din sistem sunt vizibile unui administrator. Măsurare: se verifică vizibilitatea completă după conectarea unui cont de administrație.

**CQ2.3 — Protecția modificării:** Studentul nu poate modifica starea sesizărilor proprii. Pragul: 100% din încercările studentului de a schimba starea sunt respinse. Măsurare: se încearcă modificarea stării prin interfață și se verifică absența actualizării.

## Gestionarea stării

**CQ3.1 — Tranzițiile válide:** Administrația poate schimba starea doar în ordinea „înregistrată" → „în lucru" → „rezolvată". Orice altă tranziție, inclusiv repetarea stării curente, este respinsă cu motiv clar. Pragul: 100% din tranzițiile invalide sunt respinse. Măsurare: se testează toate combinațiile de schimbare și se verifică acceptarea tranzițiilor valide și respingerea celorlalte.

**CQ3.2 — Independență sesizări:** Sesizări repetate se păstrează și se actualizează independent. Pragul: modificarea stării unei sesizări nu afectează starea celorlalte cu același loc și descriere. Măsurare: se creează două sesizări identice, se actualizează una și se verifică că cealaltă rămâne neschimbată.

## Performanță

**CQ4.1 — Latență consultare:** Cu 10.000 sesizări în sistem și 20 de consultări simultane, cel puțin 95% din 1.000 de consultări valide ale propriilor sesizări afișează starea corectă în maxim 2 secunde. Pragul: ≥950 consultări răspund în ≤2 secunde cu date corecte. Măsurare: test de sarcină în rețeaua campusului; se lansează 20 de sesiuni simultane care consultă sesizări proprii și se cronometrează răspunsul.