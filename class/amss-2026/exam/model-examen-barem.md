---
title: "AMSS 2026/2027 — Model de examen: barem"
author: "Traian-Florin Șerbănuță"
lang: ro-RO
---

# Barem și justificări

Barem pentru [modelul de examen](https://traiansf.github.io/class/amss2026/exam/model-examen.html): 24 de întrebări, câte patru pentru fiecare domeniu evaluat, un singur răspuns corect, fără depunctare. Nota examenului este 3 × C / 24, unde C este numărul răspunsurilor corecte. Pe ansamblu, fiecare literă este răspunsul corect de șase ori; în interiorul unui caz, pozițiile nu urmează un tipar.

Pentru fiecare variantă greșită este notată regula sau contraexemplul care o exclude. Întrebările modelului nu se refolosesc la examen: formele de examen folosesc întrebări noi, echivalente ca dificultate.

| Caz | Domeniu principal | Întrebări | Chei |
|---|---|---|---|
| A — terenuri de tenis | Încadrarea problemei și cerințe | 1–4 | D, A, C, A |
| B — registrul arborilor | Modelarea domeniului | 5–8 | B, B, C, D |
| C — cardul de călătorie | Contracte și invarianți | 9–12 | C, A, D, B |
| D — cererea de decontare | Stări și comportament | 13–16 | B, D, A, C |
| E — cota de întreținere | Responsabilități, coeziune și cuplare | 17–20 | D, A, C, B |
| F — sasul unui laborator | Validarea modelului și schimbarea | 21–24 | A, D, C, B |

---

# Cazul A — Cerințe

**1. D.** Plângerea este un fapt raportat; cauza ei nu apare în enunț și ar cere o presupunere. A este R1. B este dat în prima frază. C nu este dat explicit, dar rezultă din R3: 30 de ore înseamnă cel puțin 24.

**2. A.** Azi, de la 18:00 la 19:00, rezervarea este în desfășurare. Dacă se numără printre cele viitoare, M are două și cererea se refuză (R1); altfel are una și cererea se acceptă. B este determinat: de marți până sâmbătă sunt patru zile, sub limita de 7 din R2. C nu privește cererea: nu se anulează nimic. D este o cerință de calitate și nu decide acceptarea.

**3. C.** Vineri la 10:00 sunt exact 24 de ore până la rezervare, iar R3 spune „cel puțin 24 de ore”: anularea este gratuită. A are rezultatul corect, dar nu verifică limita (48 de ore). B are limita corectă și rezultatul greșit. D: 23 de ore, deci anularea este taxată.

**4. A.** Limita din R1 depinde acum de tipul abonamentului, care nu exista în enunț. Pentru un membru premium, a treia și a patra rezervare devin acceptabile; scenariile care le refuzau trebuie revăzute. B ignoră schimbarea rezultatelor. C confundă o regulă a domeniului cu o cerință de calitate (tipologia din Cursul 3). D: R2 privește distanța în timp, nu numărul rezervărilor.

---

# Cazul B — Modelarea domeniului

**5. B.** R1 dă identitatea: numărul de inventar. A: combinația este identică pentru cei doi arbori, deci nu îi distinge. C: un arbore poate avea zero inspecții (R4), iar ordinea inspecțiilor nu este o identitate. D contrazice existența a doi arbori.

**6. B.** Modelul păstrează numai starea constatată la ultima inspecție; R4 cere inspecții distincte, fiecare cu data și starea ei, deci inspecția din martie se pierde. A: specia este o valoare pe care o pot avea mai mulți arbori. C: valoarea „necunoscută” reprezintă un arbore neinspectat, iar R4 permite zero inspecții. D: modelul păstrează parcurile și datele mutărilor (R3).

**7. C.** Inspecția privește un arbore (R4), iar mutarea nu schimbă identitatea (R1, R3). A contrazice „un singur arbore”. B contrazice R5. D contrazice „inclusiv niciuna” din R4.

**8. D.** R1: numărul nu se refolosește; R5: arborele tăiat rămâne în registru cu numărul lui. A și B refolosesc numărul; B contrazice și R5. C: nicio regulă nu leagă numărul de prima inspecție, iar un arbore poate avea zero inspecții.

---

# Cazul C — Contracte și invarianți

**9. C.** Soldul 2 este sub 3, deci `valideaza` refuză fără nicio modificare. A încalcă invariantul și condiția de succes. B scade incorect suma și raportează succes. D modifică soldul la refuz.

**10. A.** Tabelul promite `refuz` fără modificări când condiția lipsește: situația face parte din contract, deci condiția este o condiție de succes (Cursul 6). B ar lăsa rezultatul nespecificat, contrar tabelului. C: invariantul este „sold ≥ 0”; un card activ cu soldul 1 este valid. D: un contraexemplu — card activ cu soldul 0; `incarca(K, 1)` reușește, iar soldul devine 1, deci „sold ≥ 3” nu este garantat după o încărcare reușită.

**11. D.** Implementarea acceptă 250, deși contractul cere 1 ≤ s ≤ 200; soldul devine 260, deci invariantul rămâne adevărat, iar contractul este încălcat. A: comportament corect. B: implementarea refuză, corect. C încalcă și invariantul (sold −5), deci nu satisface condiția din întrebare.

**12. B.** Singura abatere a implementării greșite este blocarea cardului; contractul cere „fără nicio modificare”, deci K trebuie să rămână activ. A, C și D sunt adevărate pentru ambele implementări: amândouă întorc `refuz`, păstrează soldul 2 și respectă invariantul. Rezultatul întors și invariantul nu verifică singure efectul complet al refuzului.

---

# Cazul D — Stări și comportament

**13. B.** Ciornă → trimite → Trimisă → respinge → Ciornă → trimite → Trimisă (documentele sunt încă atașate) → aprobă → Aprobată; renunță nu are tranziție din Aprobată, deci este respins. A ignoră lipsa tranziției. C presupune un eveniment plătește care nu a avut loc. D se oprește după respinge.

**14. D.** Condiția lui trimite cere și documentele; fiind neîndeplinită, evenimentul este respins și starea rămâne Ciornă. A inventează o tranziție. B confundă trimite cu renunță. C ignoră jumătate din condiție.

**15. A.** Ciornă → Trimisă → Aprobată → Plătită. B: plătește este respins în Trimisă. C: aprobă este respins în Ciornă; urmează Trimisă, iar plătește este respins. D: după respinge, cererea este în Ciornă, iar aprobă și plătește sunt respinse.

**16. C.** Aprobată are o singură tranziție de ieșire, plătește; renunță nu apare pentru această stare. A: există o ieșire, deci nu este blocaj. B: enunțul spune că tabelul conține toate tranzițiile permise; nicio regulă nu cere renunță peste tot. D: stările finale intenționate sunt doar Plătită și Anulată.

---

# Cazul E — Responsabilități, coeziune și cuplare

**17. D.** Obiectivul dat este ca fiecare regulă de calcul să fie scrisă într-un singur loc; rotunjirea face parte din suma de plată (R1), deci aparține operației comune, care întoarce suma finală. A copiază regula în ambele canale: poate da aceleași sume, dar încalcă obiectivul și cere sincronizare la o schimbare. B și C pun regula într-un singur canal, iar celălalt ar trebui să o copieze.

**18. A.** În X regula este copiată în ambele canale, care trebuie actualizate împreună și verificate pentru concordanță. În Y regula este într-un singur loc, operația comună, împreună cu exemplele ei de verificare. B: în X și portalul calculează cota; în Y canalele nu aplică formula. C ignoră lista. D: noua regulă schimbă chiar calculul operației comune.

**19. C.** Operația citește apartamentul și luna din obiectul paginii de plată, deci depinde de structura lui: o schimbare a câmpurilor citite o poate afecta, iar lista ar trebui să construiască un asemenea obiect ca să o apeleze. A: aceeași sumă nu înseamnă aceleași dependențe. B: primirea unui obiect al portalului adaugă o dependență de structura lui; nu o elimină. D: citirea paginii de plată adaugă operației o obligație legată de un singur canal, fără legătură cu scopul calculului.

**20. B.** Separarea are nevoie de un motiv dat: regulile de împărțire se schimbă anual, deci izolarea lor poate limita efectul schimbărilor; pentru rotunjire, enunțul nu dă un asemenea motiv. A este un slogan care ignoră costul legăturilor suplimentare (Cursul 5). C: o separare internă nu schimbă faptul că ambele canale folosesc aceeași operație. D: faptul că rotunjirea afectează ambele canale este deja rezolvat de operația comună; nu justifică o componentă separată.

---

# Cazul F — Validarea modelului și schimbarea

**21. A.** Traseul este un contraexemplu pentru P în modelul greșit: o execuție concretă care ajunge în (D, D). B extinde rezultatul de la model la sistemul real. C: în (D, D) se pot închide ușile, deci nu este blocaj. D: P privește toate stările accesibile, nu doar starea inițială.

**22. D.** Specificația cere ca sasul să rămână blocat; intervenția manuală este în afara modelului. Starea Blocat este finală intenționat; verificăm drumul spre ea (și că ușile sunt închise acolo). A confundă o stare finală intenționată cu un blocaj. B: ambele uși sunt închise în Blocat, deci P este respectată. C: un model poate avea stări finale.

**23. C.** O explorare completă stabilește P pentru toate execuțiile acestui model finit, în ipotezele lui (acțiuni pe rând, uși care execută comenzile). A: sistemul real poate avea defecte și acțiuni nemodelate. B subestimează rezultatul: el este valid pentru model. D: explorarea acestui model nu acoperă alt model; un sas cu trei uși cere o justificare separată, fie o altă explorare, fie un argument de invariant.

**24. B.** Cerința adaugă o informație de timp sau o stare de așteptare și o condiție nouă pentru `deschide(U2)`; P trebuie reverificată după schimbare, iar cerința nouă devine ea însăși o proprietate de verificat. A tratează cerința ca afișare. C: P privește doar ușile deschise simultan, nu durata. D modifică altă ușă decât cea vizată.
