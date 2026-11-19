# Cerințele de calitate pentru prima versiune

## 1. Funcționalitate — Înregistrare sesizării

**C1.1** Sistemul acceptă o sesizare nouă dacă și numai dacă câmpurile „loc" și „descriere" sunt ambele nevide. Orice încercare cu cel puțin un câmp gol este respingă cu indicarea exactă a câmpului lipsă și nu creează nicio înregistrare. Modalitate de măsurare: test manual cu 10 combinații (amândouă pline, amândouă goale, fiecare gol separat, cu spații).

**C1.2** O sesizare acceptată primește un identificator unic și starea inițială „înregistrată". Sistemul afișează imediat identificatorul și starea pe ecranul utilizatorului. Modalitate: verificare directă a răspunsului pentru minimum 5 sesizări noi.

## 2. Funcționalitate — Schimbarea stării

**C2.1** Administrația poate modifica starea doar pe tranzițiile: „înregistrată" → „în lucru" și „în lucru" → „rezolvată". Orice altă tentativă de schimbare (inclusiv repetarea stării curente) este respingă cu un mesaj de eroare și starea rămâne neschimbată. Modalitate: test cu 15 scenarii de tranziție valide și 10 invalide, verificare stare finală.

**C2.2** Un student nu poate modifica starea sesizării sale. Orice cerere de modificare dintr-un cont student este respingă. Modalitate: autentificare ca student și tentativă de modificare a unei sesizări proprii; verificare că starea nu se schimbă.

## 3. Acces și vizibilitate

**C3.1** Un student vede doar sesizările pe care le-a creat; nu vede sesizări ale altor studenți. Administrația vede toate sesizările. Modalitate: verificare API/interfață cu 2 conturi student și 1 admin; fiecare student consultează 10 sesizări, se contează cele vizibile și se confiră că aparțin numai acelui student.

## 4. Performanță

**C4.1** Cu 10.000 sesizări existente și 20 de consultări simultane pe propriile sesizări, cel puțin 950 din 1.000 consultări valide afișează starea corectă în cel mult 2 secunde, măsurate de la acțiunea de consultare în browser la afișarea completă a stării. Modalitate: test de încărcare simulat pe rețeaua campusului; cronometrare din click până la randare HTML completă.

## 5. Integritate

**C5.1** O sesizare creare nu modifică autorul, identificatorul sau starea sesizărilor existente. Modalitate: 50 sesizări noi se creează paralel; se verifică că sesizările anterioare rămân neschimbate.