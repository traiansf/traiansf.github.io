# AMSS 2026 — Pregătirea mediului de lucru

Ai nevoie de un mediu în care să citești și să editezi fișierele cursului și de acces la un asistent ales de tine atunci când exercițiul folosește AI. Folosește instrumente la care ai deja acces. Nu este obligatoriu un abonament plătit, un anumit model, editor sau extensie pentru diagrame.

## 1. Obține materialele

Folosește fișierele furnizate pentru curs sau laborator ori clonează depozitul public cu sursele cursului:

```bash
git clone https://github.com/traiansf/traiansf.github.io.git
cd traiansf.github.io/class/amss-2026
```

Depozitul conține și alte cursuri, precum și materiale ale site-ului. Lucrează cu fișierele indicate din `class/amss-2026`. Dacă nu folosești Git, poți începe cu un director de fișiere furnizat de cadrul didactic.

Pentru activitatea proprie, folosește spațiul de lucru al laboratorului sau depozitul echipei indicat de cadrul didactic. Păstrează o copie a descrierii inițiale a problemei, analiza ta inițială, versiunile succesive ale artefactelor și dovezile revizuirii (review). Dacă folosești Git, identifică versiunile revizuite prin commit-uri; altfel, salvează versiuni cu nume clare.

## 2. Pregătește asistentul

Deschide spațiul de lucru indicat în editorul cu asistentul ales sau furnizează fișierele/textul relevant într-o conversație din browser ori într-o aplicație locală. Verifică la ce materiale are acces asistentul; simpla menționare a unui fișier local într-un prompt din browser nu îi furnizează conținutul.

Citește [instrucțiunile cursului](template/AGENTS.md). Furnizează-le în conversație sau integrează-le în instrucțiunile folosite deja de depozitul tău. Păstrează îndrumările existente, specifice proiectului. Poți folosi aceste instrucțiuni cu orice asistent.

Fișierele din `template/` sunt opționale. Copiază numai fișierele de care ai nevoie, după ce verifici destinația. Șabloanele de configurare pentru furnizori nu conțin setări de model impuse de curs. Păstrează configurația personală și datele de autentificare separat de materialele partajate ale cursului. Configurația de proiect Codex este o modalitate opțională de a adăuga setări pentru proiect; consultă [documentația oficială de configurare](https://learn.chatgpt.com/docs/config-file/config-basic) dacă alegi să o folosești.

## 3. Încearcă o sarcină scurtă de analiză

Înainte de a folosi AI, scrie câteva rânduri cu propria analiză a acestei descrieri a problemei:

> Un departament dorește ca studenții să poată rezerva săli de studiu pentru a-și planifica lucrul în grup.

Identifică un obiectiv, o întrebare pe care ai adresa-o departamentului și o ipoteză pe care nu ar trebui să o adopți fără să o precizezi. Apoi oferă asistentului descrierea problemei și notițele tale:

> Lucrează ca analist. Separă faptele furnizate de ipoteze. Identifică problema, limitele posibile ale soluției și întrebările fără răspuns despre regulile de funcționare. Propune două exemple concrete de acceptare, marcând orice rezultat așteptat care nu este încă stabilit. Explică o consecință a unei ipoteze. Oprește-te înainte de proiectarea unei aplicații.

Citește răspunsul. Marchează o contribuție utilă și o afirmație care necesită confirmare. Salvează descrierea problemei, notițele tale și rezultatul; le vei transmite unui agent de revizuire.

Dacă nu poți folosi un asistent, utilizează această **propunere didactică pregătită** pentru exercițiul de revizuire. Este intenționat incompletă și nu reprezintă un răspuns AI înregistrat:

> Obiectiv: să ajute grupurile să își planifice timpul de studiu. Reguli propuse: fiecare student poate avea o singură rezervare, iar fiecare rezervare durează o oră. Exemplu de acceptare: un student selectează o sală disponibilă pentru mâine și primește confirmarea.

Compară fiecare afirmație cu descrierea inițială a problemei. Identifică regulile de funcționare care necesită răspunsuri de la beneficiar și ce ar trebui să precizeze un exemplu de acceptare util.

## 4. Pornește un context separat pentru revizuire

Deschide o sesiune sau o conversație nouă, cu același asistent sau cu altul. Furnizează explicit descrierea inițială a problemei, notițele tale, propunerea salvată și această sarcină de revizuire:

> Lucrează ca agent de revizuire. Compară propunerea cu descrierea inițială a problemei. Verifică dacă introduce reguli de funcționare care nu au fost furnizate, ascunde o întrebare nerezolvată sau oferă un exemplu de acceptare fără un rezultat așteptat clar. Pentru fiecare constatare, indică textul relevant și explică o consecință concretă. Distinge un defect de o întrebare pentru beneficiar sau de o îmbunătățire opțională. Dacă o afirmație este justificată, precizează dovezile care o susțin. Nu rescrie încă propunerea.

Evaluează tu constatările. Consemnează o constatare pe care o accepți sau o respingi și motivul, ori explică de ce propunerea poate rămâne în forma actuală. Revizuiește analiza unde este justificat și salvează un rezumat pentru predarea unei sarcini (handoff) către etapa următoare, cu tot contextul necesar. Mediul de lucru este pregătit dacă poți verifica datele de intrare și rezultatele și poți explica o decizie; nu este necesar să obții un anumit răspuns de la model.

## 5. Aplică modul de lucru în activitățile cursului

Urmează [îndrumările despre roluri, predarea sarcinilor și dovezi](README.md). Elaborează și revizuiește specificația și proiectarea înainte de o implementare substanțială. Folosește un model executabil mic sau un prototip atunci când ajută la rezolvarea unei întrebări concrete; proiectul cursului nu impune o aplicație funcțională.

În lucrul în echipă, partajați proiectarea curentă și dovezile care o susțin. Fiecare student trebuie să poată explica independent raționamentul. Folosiți reprezentarea care clarifică întrebarea: text, tabele, schițe, pseudocod sau diagrame.

## Dacă mediul de lucru nu este disponibil

- **Nu ai acces la un asistent sau ai atins o limită de utilizare:** continuă singur analiza inițială și examinează critic exemplul pregătit pentru exercițiu. Consemnează că ai revizuit un exemplu pregătit. Anunță cadrul didactic pentru a organiza o revizuire separată între colegi sau cu un asistent disponibil; nu pretinde că ai efectuat o execuție AI pe care nu ai realizat-o.
- **Asistentul nu poate citi fișiere:** copiază sau atașează descrierea problemei și secțiunile relevante ale artefactelor, cu identificatorii versiunilor.
- **Noul agent de revizuire nu are context:** furnizează explicit rezumatul de predare și sursele inițiale. Nu presupune că știe conversația anterioară.
- **O diagramă nu se afișează:** exprimă aceleași relații sau același comportament într-un tabel ori într-o schiță, astfel încât analiza să poată continua.

## Orientare opțională

[Laboratorul 0](https://traiansf.github.io/class/amss2026/lab/Lab00.html) oferă pași simpli pentru acces, salvarea notițelor și verificarea uneltelor, inclusiv alternative fără AI. Poate fi parcurs individual. Exercițiile tehnice de analiză și proiectare urmează după cursul 2.
