# Laboratorul 1 — ghidul cadrului didactic: înțelegere, specificare, revizuire

Ghid pentru cadrul didactic, asociat cu [prezentarea laboratorului](Lab01.md). Fișierul este exclus din prezentările publicate prin fișierul Makefile al laboratorului.

**Planificare:** după cursurile 1 și 2. Aplicați introducerea tehnică din cursul 2; teoria aprofundată a cerințelor din cursul 3 nu este un prerechizit. **Durată:** 100 de minute. **Participanți:** aproximativ 100 de studenți în trei grupe de laborator; aceeași activitate se desfășoară separat cu fiecare grupă. Studenții programează fluent, dar sunt începători în analiză și proiectare. Exercițiul este formativ; distribuția revizuită a punctajului cursului nu este definită aici.

## Dovezile de învățare urmărite

Fiecare student ar trebui să distingă o cerință, o consecință dedusă, o ipoteză, o regulă încă neclarificată de beneficiar și o propunere de proiectare. Perechea pregătește o descriere a problemei cu limite clare și predări explicite ale sarcinilor și contextului (handoff); fiecare student explică o alegere și raționează despre o cerință nouă fără AI.

Laboratorul introduce conceptele domeniului, o invariantă și atribuirea responsabilităților prin analiza cerințelor. Nu încearcă să predea aprofundat toate cele cinci priorități ale cursului într-o singură întâlnire. Studenții întâlnesc comportamentul prin scenarii de rezervare/anulare și recunosc că revizuirea (review) specificației și a proiectării precedă implementarea.

## Materiale și pregătire

Distribuiți:

- [Fișa scenariului](scenarios/lab01/scenario.md): informațiile complete ale beneficiarului și scenariile.
- [Fișa de lucru](scenarios/lab01/worksheet.md): notițe individuale, descriere comună, predarea sarcinilor și dovezile revizuirii.
- [Exemplul pregătit](scenarios/lab01/prepared-fixture.md): alternativă pentru lucrul fără AI; se dezvăluie după analiza inițială fără ajutor.

Aceste fișiere sunt fișe sursă, nepublicate automat de fișierul Makefile al prezentărilor. Puneți-le în spațiul de lucru anunțat pentru laborator sau distribuiți copii tipărite. Păstrați soluțiile de referință din acest ghid doar pentru cadrul didactic pe durata activității.

Prezentarea pentru studenți trimite direct la scenariu și la fișa de lucru din depozitul de surse; diapozitivul despre spațiul de lucru trimite la exemplul pregătit. Oferiți copii locale sau tipărite când accesul la depozit nu este disponibil.

Înainte de fiecare grupă:

1. Stabiliți destinația predării, termenul și un canal alternativ accesibil. Aveți fișele disponibile local; tipărirea lor este suficientă pentru lucrul fără acces la instrumente.
2. Atribuiți identificatori perechilor și asigurați-vă că fiecare partener poate păstra o notiță cu autor identificat. Este acceptabil și un grup de trei: rotiți îndrumarea autorului, verificarea dovezilor și îndrumarea revizuirii, astfel încât toți trei să vorbească și să scrie individual.
3. Faceți accesul la depozitul de cod opțional pentru parcurgerea exercițiului. Dacă folosiți un depozit, furnizați adresa și convenția pentru ramuri. Nu petreceți laboratorul instalând instrumentul unui anumit furnizor.
4. Cereți studenților să vină cu orice instrument AI pe care îl folosesc deja, dacă au acces; îndrumați întrebările practice de configurare către tooling/SETUP.md. Alegerea instrumentului/modelului este liberă. O conversație nouă poate furniza contextul separat de revizuire.
5. Pregătiți-vă să explicați informațiile-sursă și să spuneți „nu s-a convenit; notați întrebarea” când studenții întreabă dincolo de ele. Nu inventați o regulă nouă pentru o pereche, evaluând apoi altă pereche după ea.
6. Nu dezvăluiți schimbarea duratei maxime la 60 de minute înainte de minutul 78. Pentru acea întrebare, precizați explicit că D este mâine.
7. Aveți prezentarea, fișa de lucru și exemplul pregătit disponibile fără internet. Exemplele sunt pregătite în scop didactic, nu rezultate înregistrate ale unui model.

Nu cereți o aplicație, teste într-un cadru de programare, sintaxă UML, un șablon de proiectare numit, acces contra cost, un model anume sau reproducerea exactă a unui răspuns generat.

## Desfășurare pe minute

| Minute | Activitate | Intervenția cadrului didactic |
|---|---|---|
| 0–8 | Analiză fără ajutor | Dați imediat fișa completă. Fiecare student scrie scopul/limitele, distincția sală–rezervare, o cerere acceptată, una respinsă și o întrebare. Încă fără AI sau răspuns demonstrat. |
| 8–16 | Comparare și clarificarea distincțiilor | Cereți două interpretări diferite. Predați informație/consecință/alegere de proiectare/întrebare deschisă și sensul unei invariante. Urmăriți două cereri în conflict pentru a arăta de ce verificarea disponibilității pe fiecare cerere necesită o garanție mai puternică. |
| 16–26 | Spațiul de lucru și rolurile | Confirmați accesul la fișa de lucru. A îndrumă autorul; B verifică sursele. Pregătiți un context separat de revizuire. Până la minutul 26, treceți perechile cu dificultăți de acces la varianta fără AI. |
| 26–44 | Descriere comună și predarea sarcinii autorului | Treceți pe la perechi: întrebați „De unde provine regula?” și „Ce rezultat stabilește scenariul?”. Păstrați o copie a variantei înainte de revizuire. |
| 44–60 | Schimbarea rolurilor; revizuire separată | B îndrumă revizuirea; A verifică dovezile. Evaluatorul primește informațiile, versiunea salvată și criteriile. Observați dacă pachetul este suficient fără istoricul autorului. |
| 60–78 | Evaluare umană și modificări | Studenții acceptă, resping sau amână afirmațiile importante ale revizuirii, cu dovezi din sursă. Reiau scenariile afectate. Variantele corecte pot rămâne neschimbate. |
| 78–90 | Argumentare individuală și schimbare | Opriți asistenții. Fiecare student explică o decizie și răspunde independent la noul scenariu cu durată maximă. |
| 90–100 | Prezentare și colectare | Invitați două sau trei exemple concise, inclusiv o decizie justificată păstrată. Colectați lucrarea comună și toate notițele individuale. |

Cu aproximativ 16–17 perechi pe grupă, treceți pe la ele fără a organiza o examinare orală completă a tuturor. În etapele comune, selectați câțiva studenți din perechi diferite pentru o explicație scurtă. Colectați raționamentul scris al fiecăruia pentru feedback formativ; nu este necesară o rundă orală completă.

Etapele de pregătire și de evaluare a revizuirii lasă timp pentru a trece pe la perechi. Perechile cu spațiul de lucru pregătit își compară notițele inițiale și identifică o regulă încă neclarificată, în timp ce altele primesc ajutor pentru acces. În timpul evaluării revizuirii, perechile folosesc informațiile furnizate și rezultatele scenariilor; nu așteaptă la rând o semnătură a cadrului didactic. Interveniți punctual la neînțelegerile care blochează lucrul. O pereche care termină devreme poate cere fiecărui partener să explice o decizie păstrată sau să verifice un caz-limită suplimentar; aceasta nu creează o cerință nouă de predare.

Limitați efortul de redactare: sunt suficiente puncte scurte într-o singură descriere comună. Evidența revizuirii și sarcina predată trebuie să citeze informațiile, scenariile și versiunea acesteia, fără a le duplica textul complet. Notițele inițiale și raționamentul final individual rămân atribuite clar, dar nu constituie examinări orale separate.

Dacă rămâneți în urmă, scurtați prezentarea finală sau folosiți o propunere deja pregătită. Păstrați analiza individuală inițială, revizuirea separată, evaluarea umană și răspunsul individual la schimbare. Nu eliminați dovezile care disting învățarea de copiere.

## Rolul beneficiarului

Folosiți fișa drept sursă a cerințelor convenite. Întrebările Q1–Q3 sunt intenționat nerezolvate. Răspundeți prin una dintre formulările:

- „Aceasta este deja convenită: vedeți F…”
- „Cerințele lasă regula deschisă. Notați cine trebuie să o decidă și ce comportament depinde de ea.”
- „Aceasta poate fi o alternativă de proiectare. Explicați consecința; nu o prezentați drept cerință a beneficiarului.”

O pereche poate explora explicit o ipoteză, de exemplu permiterea rezervărilor simultane ale unui student în săli diferite. Acceptați explorarea dacă ipoteza rămâne etichetată și studenții nu susțin că problema este rezolvată. Scenariile de bază pentru disponibilitate folosesc studenți diferiți pentru a evita această întrebare.

Întrebările despre stocare, interfețe, precizia timpului, istoricul de audit sau timpii de răspuns pot avea sens. Ele nu implică automat un defect într-o descriere a cerințelor cu limite explicite. Aici nu este stabilită nicio regulă de păstrare a datelor sau alegere de tehnologie.

Explicați explicit diferența față de cursul 1 în privința concurenței: exemplul bibliotecii presupunea operații procesate pe rând. Informația F5 despre sălile de studiu cere acum tratarea cererilor simultane. Garanția mai puternică decurge dintr-o altă cerință furnizată; ea nu face incorect exercițiul anterior, cu limitele sale declarate. Păstrați discuția la nivelul garanției și al responsabilității, lăsând proiectarea mecanismului pentru o etapă ulterioară.

## Variante cu AI și fără AI

### Varianta cu AI

Autorul și evaluatorul pot folosi orice instrumente/modele disponibile. Notați ce s-a folosit, dacă se cunoaște. Un context separat de revizuire înseamnă o conversație nouă sau un context echivalent care conține pachetul ales explicit, fără conversația autorului. Pentru agenții care încarcă automat fișiere, expuneți informațiile și versiunea alese, nu conversația de lucru a autorului.

Un evaluator separat este o altă sursă de afirmații. Poate fi de acord dintr-un motiv bun, poate dezaproba greșit sau poate rata o problemă reală. Cereți în fiecare caz o decizie umană susținută de dovezi.

Dacă un rezultat lung copleșește perechea, cereți un rezumat concis care păstrează identificatorii surselor, apoi verificați o afirmație importantă din rezumat față de varianta completă. Rezumatul ajută navigarea; nu elimină nevoia de a verifica detaliile importante.

### Varianta fără AI

După analiza inițială, atribuiți exemplul A sau B. Spuneți explicit studenților: „Acesta este material didactic redactat de cadrul didactic, nu rezultatul unei rulări AI.”

- Perechile adaptează propunerea pregătită la propria descriere și scriu aceeași sarcină pentru autor pe care ar fi folosit-o cu AI.
- Schimbați informațiile-sursă, versiunea salvată și criteriile de revizuire cu o pereche vecină. Perechea care primește pachetul îl revizuiește fără a asculta întâi raționamentul autorilor. În fiecare pereche, schimbați persoana care îndrumă etapa următoare.
- Pentru varianta A, lăsați studenții să producă propria revizuire înainte de a dezvălui revizuirea pregătită. Apoi evaluați și afirmațiile acesteia.
- Pentru varianta B, cereți dovezi ale corectitudinii și ale limitelor rămase. Nu cereți studenților să inventeze o greșeală.
- Dacă o singură pereche lucrează fără AI, cadrul didactic sau o altă pereche poate îndeplini rolul de evaluator separat.

Notați „exemplu pregătit + revizuire între colegi”. Este un exercițiu echivalent de specificare și revizuire, nu o dovadă că un agent a executat sarcina predată.

## Descriere de referință a problemei

Acesta este un răspuns justificabil, nu o formulare sau o notație obligatorie.

**Scop și limite:** permite studenților cu identitate verificată să rezerve Alder sau Birch în D, să primească un rezultat clar și să își anuleze rezervarea înainte de început. Configurarea sălilor și verificarea identității sunt furnizate. Funcționalitățile din F8 sunt excluse. Q1 și Q2 rămân nerezolvate.

**Concepte ale domeniului:**

| Concept | Sens | De ce contează distincția |
|---|---|---|
| Sală | Spațiu din listă care poate fi rezervat, cu o identitate și un program. | Alder și Birch au disponibilitate independentă. |
| Rezervare | Dreptul confirmat al unui anumit student de a folosi o sală într-un interval, identificat printr-un cod. | O sală poate avea multe rezervări nesuprapuse; anularea uneia nu elimină sala. |
| Identitatea studentului | Identitate verificată, furnizată de serviciul universității. | Calitatea de titular controlează anularea. |
| Interval/stare | Când se aplică dreptul și dacă blochează acum disponibilitatea. | Intervalele adiacente sunt permise; o rezervare anulată nu își mai blochează intervalul. |

O înregistrare cu starea „anulată” este o alegere de proiectare. Ștergerea înregistrării active poate satisface și ea comportamentul cerut; beneficiarul nu a specificat păstrarea datelor sau istoricul de audit. Nu impuneți niciuna dintre reprezentări. Conceptul de sală nu implică o clasă Room.

**Reguli convenite și consecințe deduse:**

- Cereți o sală din listă și un interval de durată pozitivă în interiorul programului (F1–F3).
- Păstrați „nu există două rezervări confirmate suprapuse pentru aceeași sală”, inclusiv pentru cereri simultane (F4–F5).
- Respingeți anularea de către altcineva decât titularul fără a modifica rezervarea; permiteți anularea de către titular înainte de început și eliberați intervalul (F6).
- Returnați un cod la rezervarea reușită; explicați regula convenită încălcată la respingere (F7).
- Pentru intervale de durată pozitivă în aceeași zi, suprapunerea pentru aceeași sală se poate exprima prin `a.start < b.end && b.start < a.end`. Acesta este un predicat dedus, nu singura reprezentare acceptabilă. Sunt suficiente textul sau o schiță clară a capetelor intervalelor.

**O propunere utilă de proiectare:** o singură decizie de rezervare răspunde de validarea regulilor pentru timp/sală și de confirmarea unei rezervări fără conflict, ca decizie indivizibilă față de deciziile concurente. O proiectare ulterioară trebuie să explice mecanismul și verificarea lui. O tranzacție în baza de date, o operație serializată sau un alt mecanism potrivit pot fi luate în considerare ulterior; astăzi nu se cere un anumit mecanism.

**Sarcina următoare, cu limite clare:** pornind de la versiunea acceptată a descrierii și tabelul scenariilor, proiectați rezultatele rezervării/anulării și responsabilitățile de impunere a regulilor. Identificați cazurile care cer răspunsuri la Q1/Q2. Returnați o reprezentare care explică rezultatele normale, respinse și anulate, garanția de concurență încă de validat și dovezile din scenarii. Opriți pentru revizuire umană înainte de implementare.

## Soluțiile scenariilor

Se aplică toate precondițiile din sursă. Fiecare scenariu este independent: S1 și S5 încep fără rezervări; S2–S4 și S6–S8 încep fiecare doar cu rezervarea confirmată a Anei pentru Alder 10:00–11:00. Ignorați efectele celorlalte scenarii. În interiorul unui scenariu, respectați ordinea acțiunilor.

| Scenariu | Concluzie așteptată | Sursă și raționament |
|---|---|---|
| S1 | Confirmă și returnează un cod. | F1–F4, F7: sală cunoscută, interval valid, fără conflict existent. |
| S2 | Respinge pentru suprapunere. | F4: aceeași sală are deja o rezervare confirmată 10:00–11:00. |
| S3 | Se poate confirma dacă sunt satisfăcute celelalte verificări convenite. | F4 permite explicit ca un interval să înceapă la sfârșitul altuia. |
| S4 | Se poate confirma dacă sunt satisfăcute celelalte verificări convenite. | F4 limitează conflictele de disponibilitate la aceeași sală; identitatea distinctă a lui Ben evită Q1. |
| S5 | Exact o confirmare și o respingere pentru conflict. | F5 stabilește rezultatul pentru cereri simultane în conflict, altfel valide. Nu stabilește care student are prioritate. |
| S6 | Anulează rezervarea Anei; Ben poate obține apoi intervalul eliberat. | F6 și celelalte verificări ale rezervării, deja satisfăcute. |
| S7 | Respinge anularea; rezervarea Anei continuă să blocheze intervalul. | F6: Ben nu este titularul. |
| S8 | Identifică Q1 și nu promite un rezultat. | F4 spune că sălile nu intră în conflict; regula pentru rezervările aceluiași student în săli diferite este neclarificată. |

Verificări suplimentare utile: 10:00–10:00 încalcă F3; 08:30–09:30 depășește programul; exact 09:00–17:00 satisface limitele temporale convenite dacă sala este liberă. Poate fi o regulă nepractică într-un caz real, dar cadrul didactic nu trebuie să inventeze o limită de durată pentru a o respinge.

Aceste parcurgeri verifică interpretarea cerințelor. Nu demonstrează că toate execuțiile unei implementări viitoare le vor respecta.

## Soluțiile exemplului pregătit

### Propunerea din varianta A

- A1 și A2 sunt compatibile cu cerințele. Starea este o reprezentare permisă, nu obligatorie.
- Limita obligatorie de 60 de minute din A3 nu este aprobată potrivit F3/Q3. Eliminați-o din regulile curente sau propuneți-o clar beneficiarului pentru analiză.
- Inegalitățile nestricte din A4 clasifică greșit intervalele adiacente drept suprapuse. S3 este contraexemplul. Comparațiile stricte sunt o corectare potrivită pentru intervalele de durată pozitivă.
- A5 nu stabilește F5. Contraexemplu: Ana citește „liber”; Ben citește „liber”; Ana confirmă; Ben confirmă. Ambele verificări independente trec, dar rezultatul combinat încalcă F4/F5. Cereți o decizie de rezervare indivizibilă față de deciziile concurente, lăsând alegerea mecanismului pentru pasul următor de proiectare.
- A6 respectă regulile de anulare furnizate și consemnează cazul neclarificat al limitei temporale.
- A7 păstrează limitele și etichetează corect o întrebare deschisă. Tehnologia rămâne de ales.
- A8 are un punct de revizuire potrivit, dar pentru o predare completă a sarcinii ar trebui să includă explicit dovezile așteptate și regulile încă neclarificate.

### Revizuirea pregătită a variantei A

| Afirmație | Judecata omului | Dovezi/acțiune |
|---|---|---|
| R1 | Acceptare. | A3 inventează o limită obligatorie; Q3 o lasă neaprobată. Revizuiți regula și verificați o cerere de 90 de minute, într-un interval liber din program. |
| R2 | Acceptare. | A4 respinge S3. Corectați predicatul/formularea și reluați S2 și S3. |
| R3 | Respingere. | Intercalarea de mai sus contrazice garanția pretinsă pentru A5. Corectați responsabilitatea de proiectare și păstrați o verificare pentru viitorul mecanism de concurență. |
| R4 | Respingere ca modificare obligatorie. | Sursa nu impune stocare relațională. Aceasta poate fi o alternativă opțională ulterior. |
| R5 | Acceptarea constatării justificate. | S6 și S7 susțin A6; Q2 rămâne deschisă. Nu este necesar un prompt nou de corectare. |

Aceste soluții ilustrează atât acceptarea, cât și respingerea afirmațiilor evaluatorului. Nu punctați studenții după numărul defectelor raportate. Un răspuns care citează R1–R5 fără a explica dovezile din sursă nu demonstrează suficient o judecată independentă.

### Varianta B

B susține acceptarea motivată. Studenții trebuie să arate că B4 tratează S2/S3, B5 formulează garanția pentru cererile combinate din F5, B6 tratează S6/S7 și B7 lasă S8 nerezolvat. Ei pot îmbunătăți prezentarea sau propune altă reprezentare, dar trebuie să distingă îmbunătățirea de un defect.

B5 formulează o obligație de proiectare; nu demonstrează că o anumită implementare o îndeplinește. B8 păstrează explicit această limită. Este rezonabil să se ceară validarea mecanismului într-o sarcină ulterioară; nu este rezonabil să se pretindă că sursa cere PostgreSQL sau o anumită ierarhie de clase.

## Schimbarea individuală: răspuns-model și alternative acceptabile

La minutul 78, spuneți:

> Considerați că D este mâine. Beneficiarul propune acum: „De mâine, o rezervare ar trebui să dureze cel mult 60 de minute.” Există deja o rezervare aprobată de 90 de minute pentru mâine.

Un răspuns solid:

> Limita este o regulă nouă propusă; nu făcea parte din cerințele inițiale. Afectează acceptarea rezervării, scenariile și posibil invarianta rezervărilor confirmate. Trebuie să clarific dacă limita se aplică doar cererilor făcute după adoptare sau și rezervărilor deja aprobate. Exceptarea rezervării existente păstrează promisiunea făcută titularului, aplicând limita cererilor noi. Aplicarea la rezervările existente cere o tranziție convenită și o decizie despre titularii afectați; nu le-aș scurta sau anula implicit rezervarea. Rezervarea existentă de 90 de minute distinge aceste reguli, iar o cerere nouă de 90 de minute trebuie verificată potrivit regulii alese.

Alte răspunsuri solide pot propune o dată ulterioară de intrare în vigoare, pot căuta un interval mai scurt de înlocuire cu acordul titularului sau pot identifica o a treia opțiune. Dovada esențială este recunoașterea cerinței schimbate, urmărirea consecințelor ei și refuzul de a inventa regula de tranziție lipsă.

Dacă se alege exceptarea rezervărilor existente, „toate rezervările confirmate durează cel mult 60 de minute” nu este invarianta globală corectă. Studenții pot formula în schimb regula pentru rezervările nou acceptate după momentul intrării în vigoare. Este o extensie utilă pentru studenții care termină mai devreme, nu o condiție pentru finalizarea laboratorului 1.

Un răspuns slab este „adaugă `duration <= 60` și șterge rezervările vechi nevalide”: ignoră autoritatea beneficiarului și angajamentele existente. Oferiți feedback întrebând ce regulă aprobată autorizează ștergerea.

## Ghid pentru feedback

Folosiți aceste observații pentru feedback punctual; aici nu se stabilește o notă numerică sau o condiție pentru promovarea cursului.

| Dovadă | Pregătită pentru discuția de feedback | Necesită revizuire |
|---|---|---|
| Formularea problemei | Scop delimitat și informații/întrebări/alegeri distincte. | Reguli adăugate prezentate drept convenite; lipsa limitelor sistemului. |
| Model și scenarii | Distincție sală/rezervare; rezultate așteptate legate de informațiile-sursă. | Se presupune global o singură rezervare pe sală; se ignoră adiacența sau titularul. |
| Predarea sarcinilor | Versiunea de intrare, limitele, rezultatul, verificările și punctul de oprire pentru revizuire. | „Fă să fie corect” fără limite sau sursă; implementare delegată înainte de clarificarea întrebărilor de proiectare. |
| Revizuire | Afirmație verificată față de variantă și sursă; decizie umană explicată. | Evaluator acceptat doar pe baza autorității; preferință opțională de proiectare tratată drept contradicție. |
| Raționament individual | Studentul poate explica fără ajutor o regulă, o alternativă și o consecință a schimbării. | Repetă materialul comun fără a identifica dovezi sau decizii afectate. |

Un student poate demonstra rezultatele cu o primă variantă corectă și fără un prompt nou de corectare. Un student fără acces la AI poate demonstra același raționament. Cereți explicații suplimentare despre notițele proprii fiecărui student pentru care autorul sau înțelegerea sunt neclare.

## Legătura de încheiere

Întrebați: „Ce decizie trebuie să ia beneficiarul, ce decizie puteți lua voi ca proiectanți și ce dovezi ați cere celui care preia sarcina următoare?”

Legați răspunsurile de modelele domeniului și responsabilitățile din tema următoare. Evitați promisiunea că laboratoarele viitoare vor cere o anumită diagramă, un instrument fix sau o aplicație implementată.
