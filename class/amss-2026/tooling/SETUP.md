# AMSS 2026/2027 — Pregătirea mediului de lucru

Ai nevoie de un mediu în care să citești și să editezi fișierele cursului, iar pentru exercițiile cu AI, de acces la un asistent ales de tine. Folosește instrumente la care ai deja acces. Nu sunt obligatorii un abonament plătit, un anumit model, un anumit editor sau o extensie pentru diagrame.

## 1. Obține materialele

Folosește fișierele primite la curs sau la laborator ori clonează repository-ul public cu sursele cursului:

```bash
git clone https://github.com/traiansf/traiansf.github.io.git
cd traiansf.github.io/class/amss-2026
```

Repository-ul conține și alte cursuri, precum și materiale ale site-ului. Lucrează cu fișierele indicate din `class/amss-2026`. Dacă nu folosești Git, poți începe cu un director de fișiere primit de la cadrul didactic.

Pentru lucrul tău, folosește spațiul de lucru al laboratorului sau repository-ul echipei, după cum indică cadrul didactic. Păstrează o copie a descrierii inițiale a problemei, analiza ta inițială, versiunile succesive ale artefactelor și rezultatele revizuirii (review). Dacă folosești Git, marchează versiunile revizuite prin commituri; altfel, salvează versiuni cu nume clare.

## 2. Pregătește asistentul

Deschide spațiul de lucru indicat în editorul în care folosești asistentul ales sau dă-i fișierele ori textul de care are nevoie într-o conversație din browser sau într-o aplicație locală. Verifică la ce materiale are acces asistentul: dacă doar pomenești un fișier local într-un prompt din browser, asistentul nu îi vede conținutul.

Citește [instrucțiunile cursului](template/AGENTS.md). Dă-le asistentului în conversație sau adaugă-le la instrucțiunile pe care repository-ul tău le folosește deja. Păstrează îndrumările specifice proiectului care există deja. Poți folosi aceste instrucțiuni cu orice asistent.

Fișierele din `template/` sunt opționale. Copiază numai fișierele de care ai nevoie, după ce verifici destinația. Șabloanele de configurare pentru furnizori nu conțin setări de model impuse de curs. Păstrează configurația personală și datele de autentificare separat de materialele partajate ale cursului. Configurația de proiect Codex este o cale opțională de a adăuga setări la nivelul proiectului; consultă [documentația oficială de configurare](https://learn.chatgpt.com/docs/config-file/config-basic) dacă alegi să o folosești.

## 3. Încearcă o sarcină scurtă de analiză

Înainte de a folosi AI, scrie câteva rânduri cu propria analiză a acestei descrieri a problemei:

> Un departament dorește ca studenții să poată rezerva săli de studiu pentru a-și planifica lucrul în grup.

Identifică un obiectiv, o întrebare pe care ai adresa-o departamentului și o ipoteză pe care nu ar trebui să o adopți fără să o precizezi. Apoi dă asistentului descrierea problemei și notițele tale:

> Lucrezi ca analist. Separă faptele date de ipoteze. Identifică problema, limitele posibile ale soluției și întrebările fără răspuns despre regulile de funcționare. Propune două exemple concrete de acceptare și marchează orice rezultat așteptat care nu este încă stabilit. Explică o consecință a unei ipoteze. Oprește-te înainte de a proiecta o aplicație.

Citește răspunsul. Marchează o contribuție utilă și o afirmație care trebuie confirmată. Salvează descrierea problemei, notițele tale și rezultatul; le vei transmite unui agent de revizuire.

Dacă nu poți folosi un asistent, pentru exercițiul de revizuire lucrează cu această **propunere didactică pregătită**. Este intenționat incompletă și nu reprezintă un răspuns AI înregistrat:

> Obiectiv: să ajute grupurile să își planifice timpul de studiu. Reguli propuse: fiecare student poate avea o singură rezervare, iar fiecare rezervare durează o oră. Exemplu de acceptare: un student selectează o sală disponibilă pentru mâine și primește confirmarea.

Compară fiecare afirmație cu descrierea inițială a problemei. Identifică regulile de funcționare pentru care ai nevoie de răspunsul beneficiarului și ce ar trebui să precizeze un exemplu de acceptare util.

## 4. Pornește un context separat pentru revizuire

Deschide o sesiune sau o conversație nouă, cu același asistent sau cu altul. Dă-i explicit descrierea inițială a problemei, notițele tale, propunerea salvată și această sarcină de revizuire:

> Lucrezi ca agent de revizuire. Compară propunerea cu descrierea inițială a problemei. Verifică dacă introduce reguli de funcționare care nu apar în descriere, dacă ascunde o întrebare nerezolvată sau dacă dă un exemplu de acceptare fără un rezultat așteptat clar. Pentru fiecare constatare, citează textul în cauză și explică o consecință concretă. Distinge un defect de o întrebare pentru beneficiar sau de o îmbunătățire opțională. Dacă o afirmație este justificată, precizează ce anume o susține. Nu rescrie încă propunerea.

Evaluează tu constatările. Consemnează o constatare pe care o accepți sau o respingi, cu motivul, ori explică de ce propunerea poate rămâne cum este. Revizuiește analiza acolo unde se justifică și salvează un rezumat cu tot contextul necesar, pentru a preda sarcina (handoff) etapei următoare. Mediul de lucru este pregătit dacă poți verifica datele de intrare și rezultatele și poți explica o decizie; nu trebuie să obții un anumit răspuns de la model.

## 5. Aplică modul de lucru în activitățile cursului

Urmează [ghidul despre roluri, predarea sarcinilor și revizuire](README.md). Elaborează și revizuiește specificația și proiectarea înainte de o implementare substanțială. Folosește un model executabil mic sau un prototip atunci când ajută la rezolvarea unei întrebări concrete; proiectul cursului nu impune o aplicație funcțională.

Când lucrați în echipă, partajați proiectarea curentă și verificările care o susțin. Fiecare student trebuie să poată explica singur raționamentul. Folosiți reprezentarea care clarifică întrebarea: text, tabele, schițe, pseudocod sau diagrame.

## Dacă mediul de lucru nu este disponibil

- **Nu ai acces la un asistent sau ai atins o limită de utilizare:** continuă singur analiza inițială și examinează critic exemplul pregătit pentru exercițiu. Notează că ai revizuit un exemplu pregătit. Anunță cadrul didactic, ca să se organizeze o revizuire separată între colegi sau cu un asistent disponibil; nu pretinde că ai rulat un asistent AI dacă nu ai făcut-o.
- **Asistentul nu poate citi fișiere:** copiază sau atașează descrierea problemei și secțiunile din artefacte de care e nevoie, cu identificatorii versiunilor.
- **Noul agent de revizuire nu are context:** dă-i explicit rezumatul de predare și sursele inițiale. Nu presupune că știe ce s-a discutat în conversația anterioară.
- **O diagramă nu se afișează:** exprimă aceleași relații sau același comportament într-un tabel ori într-o schiță, astfel încât analiza să poată continua.

## Orientare opțională

[Laboratorul 0](https://traiansf.github.io/class/amss2026/lab/Lab00.html) oferă pași simpli pentru acces, salvarea notițelor și verificarea instrumentelor, inclusiv alternative fără AI. Poate fi parcurs individual. Exercițiile tehnice de analiză și proiectare încep după cursul 2.
