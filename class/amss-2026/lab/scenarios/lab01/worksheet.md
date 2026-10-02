# Laboratorul 1 — fișă de lucru: înțelegere, specificare, revizuire

ID pereche: __________  Student A: __________  Student B: __________

Mod de lucru: asistent AI / exemplu pregătit + revizuire între colegi / altul: __________

Instrument/model, dacă sunt cunoscute: __________  Context de revizuire sau coleg evaluator: __________

Fișa oferă un punct de plecare. Sunt suficiente puncte scurte; adaptați structura dacă o altă reprezentare comunică mai clar aceleași informații. Păstrați o singură descriere comună a problemei și citați identificatorii informațiilor/scenariilor din ea la predarea sarcinii și în evidența revizuirii, fără a copia aceleași reguli în mai multe secțiuni.

## Notițe inițiale individuale — fără AI, primele 8 minute

Fiecare partener își scrie propriile notițe, cu numele său:

- Cum formulez scopul și limitele:
- Sală versus rezervare:
- O cerere care poate fi acceptată, cu informația-sursă:
- O cerere care trebuie respinsă, cu informația-sursă:
- O întrebare de clarificat:

Păstrați aceste notițe când revizuiți descrierea comună. Nu le înlocuiți cu o rescriere făcută de AI.

## Descrierea comună a problemei

### Scop și limite

Ce rezultat dorește beneficiarul? Ce este inclus și ce este exclus?

### Concepte și reguli

| Concept sau regulă | Sensul în această problemă | Informație-sursă sau deducție |
|---|---|---|
| | | |

Explicați distincția dintre o sală și o rezervare, precum și regula care trebuie să rămână adevărată la confirmarea unei rezervări.

### Ce se cunoaște și ce rămâne de ales?

| Afirmație | Informație convenită / consecință / ipoteză / întrebare / propunere de proiectare | Sursa sau decizia necesară |
|---|---|---|
| | | |

O ipoteză trebuie etichetată vizibil, cu consecința ei dacă se dovedește greșită. O întrebare fără răspuns este un rezultat valid.

### Scenarii

Tratați fiecare scenariu independent, pornind de la starea inițială precizată în fișa cu informațiile beneficiarului. Nu transferați o rezervare sau o anulare dintr-un scenariu în altul.

| ID | Stare inițială și acțiune | Rezultat așteptat sau decizie deschisă | Informații verificate |
|---|---|---|---|
| S1 | | | |
| S2 | | | |
| S3 | | | |
| S4 | | | |
| S5 | | | |
| S6 | | | |
| S7 | | | |
| S8 | | | |

Adăugați un scenariu când distinge o regulă sau o alternativă importantă. Explicați limitele acoperirii pe care le identificați.

### Sarcina următoare de proiectare, cu limite clare

- **Versiunea de intrare și sursa:**
- **Sarcina și reprezentarea/rezultatul așteptat:**
- **Regulile pe care responsabilitățile propuse trebuie să le păstreze:**
- **Întrebările care blochează o parte a lucrului:**
- **Verificările și rezultatele de returnat:**
- **Punctul de revizuire umană înainte de implementare:**

## Predarea sarcinii către autor (handoff) — minutele 26–44

Studentul A îndrumă autorul; studentul B verifică față de sursă. Atașați toate informațiile scenariului și notițele voastre. Autorul poate ajuta la structurarea înțelegerii; voi rămâneți responsabili pentru decizii.

> Acționează ca asistent de analiză. Folosind doar informațiile beneficiarului și notițele atașate, redactează scopul, limitele, conceptele domeniului, regulile, scenariile de acceptare și întrebările deschise. Citează identificatorii informațiilor. Marchează separat propunerile de proiectare. Cere clarificări unde lipsesc reguli; nu răspunde în numele beneficiarului. Propune o sarcină următoare de proiectare, cu limite, intrări, responsabilități, verificări și un punct de oprire. Nu o implementa.

Dacă rezultatul este lung, cereți un rezumat scurt care păstrează trimiterile la informații și scenarii. Verificați o afirmație importantă din rezumat față de varianta detaliată.

Salvați o copie a variantei de lucru. Poate fi o copie de fișier, o versiune salvată sau un commit.

Identificatorul variantei supuse revizuirii: __________

## Predarea sarcinii pentru revizuire independentă — minutele 44–60

Schimbați rolurile: studentul B îndrumă evaluatorul; studentul A verifică afirmațiile acestuia. Deschideți un context nou și furnizați doar informațiile-sursă, varianta fixată și criteriile. Se permite același instrument/model; nu reutilizați conversația autorului. Dacă este necesar, schimbați acest pachet cu o pereche vecină pentru revizuire între colegi.

> Revizuiește descrierea problemei față de informațiile furnizate. Verifică limitele, distincțiile dintre concepte, precizia regulilor, scenariile de acceptare și dacă responsabilitățile propuse pot păstra regulile. Pentru fiecare afirmație, citează pasajul din variantă și informația-sursă sau un contraexemplu. Distinge între contradicție, întrebare nerezolvată și alternativă opțională. Identifică și deciziile susținute de informațiile furnizate. Nu inventa răspunsuri ale beneficiarului și nu impune o anumită notație, arhitectură sau tehnologie.

Păstrați suficient din pachet și din răspuns pentru a stabili ce a fost revizuit și de ce ați acționat. Nu sunt necesare exporturi complete ale conversațiilor.

## Evaluarea de către om — minutele 60–78

| Constatarea revizuirii și locul din variantă | Informație-sursă / scenariu / altă verificare | Acceptare / respingere / amânare și motiv | Modificare sau decizie păstrată; reverificare |
|---|---|---|---|
| | | | |

Nu există un număr obligatoriu de defecte, corectări sau prompturi repetate. O concluzie justificată că varianta este corectă este un rezultat util. Distingeți verificarea revizuirii de simplul acord cu ea.

## Explicație individuală — fără AI, minutele 78–90

Scrieți independent, cu numele vostru:

- O decizie pe care o pot apăra, informația care o susține și un scenariu care o verifică:
- O alternativă plauzibilă sau o ipoteză neconfirmată și consecința ei:
- Răspunsul meu la schimbarea anunțată de cadrul didactic: deciziile afectate, regula lipsă și două răspunsuri posibile, cu un scenariu care le distinge:

Cadrul didactic anunță schimbarea la minutul 78. Contează raționamentul vostru, nu o soluție finală șlefuită.

## Predarea lucrării

Structură sugerată în spațiul de lucru furnizat:

```text
lab01/<pair-id>/
  brief.md
  review.md
  individual/<student-a-id>.md
  individual/<student-b-id>.md
```

Fișierele individuale conțin atât notițele inițiale, cât și explicațiile finale. Un format echivalent, cu autorii identificați clar, este acceptabil. Predați la destinația anunțată în laborator; folosiți canalul alternativ anunțat dacă accesul la repository nu funcționează. Nu se cer transcrieri suplimentare ale conversațiilor.
