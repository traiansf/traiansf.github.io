# Revizuire a Specificației

## Alinieri Corecte

Specificația se aliniază bine cu majoritate regulilor:

- **R1, R2, R3, R4**: Toate sunt transcrise corect în „Cerințe Funcționale". Exemplele (1–3) ilustrează comportamentul așteptat și refuzul operațiilor neautorizate.
- **Q1**: Pragul de performanță este transcris exact, inclusiv precizarea că „Toate consultările respectă R2 și R4", ceea ce corespunde cererii că rezultatele incorecte nu sunt tolerate.

## Omisiuni Identificate

**1. Excluderile convenite lipsesc din specificație**

Regula inițială precizează: „Sunt excluse: autentificarea, fotografiile, notificările, prioritizarea, repartizarea echipelor, termenele de reparație și redeschiderea."

Specificația nu menționează aceste limitări. Efectul: o persoană care citește doar specificația poate presupune că sistemul trebuie să suporte fotografi sau notificări, ceea ce depășește scopul exercițiului.

**Recomandare**: Adăugați o secțiune „Exclusii" care enumeră explicit ceea ce nu este dezvoltat.

---

**2. Imprecizie în confirmarea R1**

Regula spune: „afișează numărul și starea". Specificația (Exemplul 1) spune: „Sistem creează sesizare #42, stare "înregistrată", afișează confirmarea".

„Confirmarea" este inferată a conține numărul și starea, dar nu este explicit. Efectul: implementatorul ar putea afișa doar „Sesizare creată cu succes" fără număr.

**Recomandare**: Reformulați: „afișează confirmarea cu numărul unic și starea inițială 'înregistrată'".

---

**3. Lipsa de precizare asupra mesajului de eroare în R1**

Regula spune: „indică informația lipsă". Specificația spune: „afișează eroarea".

Aceasta nu este eroare, ci alegere de design acceptabilă (mesajul trebuie să fie clar pentru utilizator).

---

## Ce Este Corect

- Exemplul 2 demonstrează clar refuzul unei cereri neautorizate cu motiv.
- Exemplul 3 confirmă că sesizări duplicate se tratează independent.
- Restricția Q1 asupra utilizatorilor neavutorizați este corect inclusă.

---

## Limitări ale Verificării

Specificația nu poate verifica:
- Dacă UI-ul afișează efectiv confirmarea în formatul așteptat.
- Dacă performanța Q1 se realizează sub condiții reale (setul de date specific, configurația rețelei, browserul).
- Comportamentul concurent (care este exclus din reguli, dar poate apărea în practică).