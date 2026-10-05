# Laboratorul 1 — ghidul profesorului: înțelegere, specificare, revizuire

Ghid pentru profesor, care însoțește [prezentarea laboratorului](Lab01.md). Makefile-ul laboratoarelor nu îl include în prezentările publicate.

**Planificare:** după cursurile 1 și 2. Laboratorul se sprijină pe introducerea tehnică din cursul 2; nu presupune teoria cerințelor din cursul 3. **Durată:** 100 de minute. **Participanți:** aproximativ 100 de studenți în trei grupe de laborator; aceeași activitate se desfășoară separat cu fiecare grupă. Studenții programează fluent, dar sunt începători în analiză și proiectare. Exercițiul este formativ; noul mod de punctare a cursului nu se stabilește aici.

## Rezultatele învățării urmărite

Fiecare student ar trebui să distingă cele cinci tipuri de afirmații din cursul 2: informație convenită, consecință dedusă, ipoteză, întrebare deschisă și propunere de proiectare. Perechea pregătește o descriere a problemei cu limite clare și predă explicit sarcinile și contextul (handoff); fiecare student explică, fără AI, o alegere și analizează o cerință nouă.

Pornind de la analiza cerințelor, laboratorul introduce conceptele domeniului, un invariant și atribuirea responsabilităților. Nu încearcă să predea aprofundat toate cele cinci priorități ale cursului într-o singură întâlnire. Studenții văd comportamentul în scenariile de programare/anulare și înțeleg că specificația și proiectarea se revizuiesc (review) înainte de implementare.

## Materiale și pregătire

Distribuiți:

- [Fișa scenariului](scenarios/lab01/scenario.md): informațiile complete ale beneficiarului și scenariile.
- [Fișa de lucru](scenarios/lab01/worksheet.md): notițe individuale, descriere comună, predarea sarcinilor și rezultatele revizuirii.
- [Exemplul pregătit](scenarios/lab01/prepared-fixture.md): alternativă pentru lucrul fără AI; se dezvăluie după analiza inițială fără ajutor.

Aceste fișiere sunt fișe-sursă; Makefile-ul prezentărilor nu le publică automat. Puneți-le în spațiul de lucru anunțat pentru laborator sau distribuiți copii tipărite. Cât durează activitatea, nu arătați studenților soluțiile de referință din acest ghid.

Prezentarea pentru studenți trimite direct la scenariu și la fișa de lucru din repository-ul cursului; diapozitivul despre spațiul de lucru trimite la exemplul pregătit. Oferiți copii locale sau tipărite când repository-ul nu este accesibil.

Înainte de fiecare grupă:

1. Stabiliți unde se predă lucrarea, termenul și un canal alternativ accesibil. Țineți fișele la îndemână, local; pentru lucrul fără instrumente ajung copiile tipărite.
2. Atribuiți identificatori perechilor și asigurați-vă că fiecare partener poate păstra o notiță care îi poartă numele. Se acceptă și grupuri de trei: rotiți îndrumarea analistului, verificarea afirmațiilor și îndrumarea revizuirii, astfel încât toți trei să vorbească și să scrie individual.
3. Exercițiul trebuie să poată fi parcurs și fără acces la un repository. Dacă folosiți unul, comunicați adresa și convenția de denumire a ramurilor. Nu petreceți laboratorul instalând instrumentul unui anumit furnizor.
4. Studenții care au deja acces la un instrument AI vin cu el; pentru întrebările practice de configurare, trimiteți-i la tooling/SETUP.md. Alegerea instrumentului/modelului este liberă. O conversație nouă ajunge drept context separat pentru revizuire.
5. Pregătiți-vă să explicați informațiile-sursă și să spuneți „nu s-a convenit; notați întrebarea” când studenții întreabă dincolo de ele. Nu inventați pentru o pereche o regulă nouă, după care să judecați apoi alte perechi.
6. Nu dezvăluiți schimbarea duratei maxime la 90 de minute înainte de minutul 78. Pentru acea întrebare, precizați explicit că D este mâine.
7. Asigurați-vă că prezentarea, fișa de lucru și exemplul pregătit sunt disponibile și fără internet. Exemplele sunt redactate în scop didactic; nu sunt rezultate înregistrate ale unui model.

Nu cereți o aplicație, teste într-un cadru de programare, sintaxă UML, un șablon de proiectare numit, acces contra cost, un model anume sau reproducerea exactă a unui răspuns generat.

## Desfășurare pe minute

| Minute | Activitate | Intervenția profesorului |
|---|---|---|
| 0–8 | Analiză fără ajutor | Dați imediat fișa completă. Fiecare student scrie scopul/limitele, conceptele cu regula fiecăruia, ce trebuie să fie adevărat după o programare reușită, o cerere acceptată, una respinsă și o întrebare. Deocamdată fără AI și fără un răspuns-model. |
| 8–18 | Comparare și clarificarea distincțiilor | Cereți două interpretări diferite. Explicați cele cinci tipuri de afirmații și sensul unui invariant. Urmăriți două cereri în conflict ca să arătați de ce nu ajunge verificarea disponibilității pentru fiecare cerere în parte și e nevoie de o garanție mai puternică. |
| 18–26 | Spațiul de lucru și rolurile | Confirmați accesul la fișa de lucru. A îndrumă analistul; B verifică sursele. Pregătiți un context separat de revizuire. Până la minutul 26, treceți perechile cu dificultăți de acces la varianta fără AI. |
| 26–44 | Descriere comună și predarea sarcinii analistului | Treceți pe la perechi: întrebați „De unde provine regula?” și „Ce rezultat stabilește scenariul?”. Păstrați o copie a variantei înainte de revizuire. |
| 44–60 | Schimbarea rolurilor; revizuire separată | B îndrumă revizuirea; A verifică afirmațiile evaluatorului. Evaluatorul primește informațiile, versiunea salvată și criteriile. Observați dacă pachetul este suficient fără istoricul analistului. |
| 60–78 | Evaluare umană și modificări | Mai întâi, fiecare student clasifică singur constatările (5 minute). Apoi, pentru fiecare afirmație importantă a revizuirii, perechea decide dacă o acceptă, o resping sau o amână, cu trimiteri la sursă. Reiau scenariile afectate. Variantele corecte pot rămâne neschimbate; dacă revizuirea nu găsește probleme, perechea reia S1–S8 pe versiunea revizuită. |
| 78–90 | Argumentare individuală și schimbare | Opriți asistenții. Fiecare student explică o decizie și răspunde independent la scenariul nou despre durata maximă. |
| 90–100 | Prezentare și colectare | Cereți două sau trei exemple scurte, inclusiv o decizie justificată păstrată. Colectați lucrarea comună și toate notițele individuale. |

Cu circa 16–17 perechi pe grupă, treceți pe la ele, dar nu le examinați oral pe toate. În etapele comune, selectați câțiva studenți din perechi diferite pentru o explicație scurtă. Colectați raționamentul scris al fiecăruia pentru feedback formativ; nu este necesară o rundă orală completă.

Etapele de pregătire și de evaluare a revizuirii lasă timp pentru a trece pe la perechi. Perechile cu spațiul de lucru pregătit își compară notițele inițiale și identifică o regulă încă neclarificată, în timp ce altele primesc ajutor pentru acces. În timpul evaluării revizuirii, perechile folosesc informațiile din fișă și rezultatele scenariilor; nu stau la rând pentru semnătura profesorului. Interveniți punctual la neînțelegerile care blochează lucrul. O pereche care termină devreme poate cere fiecărui partener să explice o decizie păstrată sau să verifice un caz-limită suplimentar; asta nu adaugă nimic la ce trebuie predat.

Limitați efortul de redactare: sunt suficiente puncte scurte într-o singură descriere comună. Rezultatele revizuirii și sarcina predată trebuie să citeze informațiile, scenariile și versiunea descrierii, fără să le copieze textul complet. Notițele inițiale și raționamentul individual de la final au autori clar identificați, dar nu devin examinări orale separate.

Dacă rămâneți în urmă, scurtați prezentarea finală sau folosiți o propunere deja pregătită. Păstrați analiza individuală inițială, revizuirea separată, evaluarea umană și răspunsul individual la schimbare. Nu eliminați elementele care disting învățarea de copiere.

## Rolul beneficiarului

Folosiți fișa drept sursă a cerințelor convenite. Întrebările Q1–Q3 sunt lăsate intenționat deschise. Răspundeți cu una dintre formulările:

- „Aceasta este deja convenită: vedeți F…”
- „Cerințele lasă regula deschisă. Notați cine trebuie să o decidă și ce comportament depinde de ea.”
- „Aceasta poate fi o alternativă de proiectare. Explicați consecința; nu o prezentați drept cerință a beneficiarului.”

O pereche poate explora explicit o ipoteză, de exemplu permiterea programărilor simultane ale unui locatar pe mașini diferite. Acceptați explorarea dacă ipoteza rămâne etichetată și studenții nu susțin că problema este rezolvată. Scenariile de bază pentru disponibilitate folosesc locatari diferiți pentru a evita această întrebare.

Întrebările despre stocare, interfețe, precizia timpului, istoricul de audit sau timpii de răspuns pot avea sens. Nu înseamnă însă automat că o descriere a cerințelor cu limite explicite are un defect. Aici nu s-a stabilit nicio regulă de păstrare a datelor și nicio alegere de tehnologie.

Explicați clar diferența față de cursul 2 în privința concurenței: exemplul bibliotecii presupunea operații procesate pe rând (R6). Informația F5 despre mașinile de spălat cere acum tratarea cererilor simultane. Garanția mai puternică decurge dintr-o cerință diferită; nu face incorect exercițiul anterior, care avea alte limite declarate. Păstrați discuția la nivelul garanției și al responsabilității; proiectarea mecanismului rămâne pentru o etapă ulterioară.

## Variante cu AI și fără AI

### Varianta cu AI

Analistul și evaluatorul pot folosi orice instrumente/modele disponibile. Notați ce s-a folosit, dacă se cunoaște. Un context separat de revizuire înseamnă o conversație nouă sau un context echivalent care conține pachetul ales explicit, fără conversația analistului. Pentru agenții care încarcă automat fișiere, lăsați la vedere doar informațiile și versiunea alese, nu conversația de lucru a analistului.

Un evaluator separat este o altă sursă de afirmații. Poate fi de acord dintr-un motiv bun, poate dezaproba greșit sau poate rata o problemă reală. Cereți în fiecare caz o decizie umană justificată.

Dacă un rezultat lung copleșește perechea, cereți un rezumat concis care să păstreze identificatorii surselor, apoi verificați o afirmație importantă din rezumat față de varianta completă. Rezumatul ajută la orientare, dar detaliile importante tot trebuie verificate.

### Varianta fără AI

După analiza inițială, atribuiți exemplul A sau B. Spuneți explicit studenților: „Acesta este material didactic redactat de profesor, nu rezultatul unei rulări AI.”

- Perechile adaptează propunerea pregătită la propria descriere și scriu aceeași sarcină pentru analist pe care ar fi folosit-o cu AI.
- Schimbați informațiile-sursă, versiunea salvată și criteriile de revizuire cu o pereche vecină. Perechea care primește pachetul îl revizuiește fără a asculta întâi raționamentul celor care au redactat-o. În fiecare pereche, etapa următoare o îndrumă celălalt partener.
- Pentru varianta A, lăsați studenții să facă singuri revizuirea înainte de a dezvălui revizuirea pregătită. Apoi evaluați și afirmațiile acesteia.
- Pentru varianta B, cereți justificarea corectitudinii și precizarea limitelor rămase. Nu cereți studenților să inventeze o greșeală.
- Dacă o singură pereche lucrează fără AI, profesorul sau o altă pereche poate îndeplini rolul de evaluator separat.

Notați „exemplu pregătit + revizuire între colegi”. Este un exercițiu echivalent de specificare și revizuire, nu o confirmare că un agent a executat sarcina predată.

## Descriere de referință a problemei

Acesta este un răspuns justificabil, nu o formulare sau o notație obligatorie.

**Scop și limite:** permite locatarilor cu identitate verificată să programeze Albastra sau Verdea în D, să primească un rezultat clar și să își anuleze programarea înainte de început. Configurarea mașinilor și verificarea identității există deja. Funcționalitățile din F8 sunt excluse. Q1 și Q2 rămân nerezolvate.

**Concepte ale domeniului:**

| Concept | Sens | De ce contează distincția |
|---|---|---|
| Mașină | Mașină de spălat din listă, care poate fi programată, cu o identitate și programul spălătoriei. | Albastra și Verdea au disponibilitate independentă. |
| Programare | Dreptul confirmat al unui anumit locatar de a folosi o mașină într-un interval, identificat printr-un cod. | O mașină poate avea multe programări nesuprapuse; anularea uneia nu elimină mașina. |
| Identitatea locatarului | Identitate verificată, transmisă de serviciul de cazare. | Doar titularul poate anula programarea. |
| Interval/stare | Când se aplică dreptul și dacă blochează acum disponibilitatea. | Intervalele adiacente sunt permise; o programare anulată nu își mai blochează intervalul. |

O înregistrare cu starea „anulată” este o propunere de proiectare. Ștergerea înregistrării active poate satisface și ea comportamentul cerut; beneficiarul nu a specificat păstrarea datelor sau istoricul de audit. Nu impuneți niciuna dintre reprezentări. Conceptul de mașină nu implică o clasă Machine.

**După o programare reușită** (ce ar trebui să noteze studenții la analiza inițială): există o nouă programare confirmată pentru locatarul, mașina și intervalul cerute, cu un cod returnat; nicio altă programare confirmată pentru aceeași mașină nu i se suprapune; celelalte programări nu s-au schimbat.

**Reguli convenite și consecințe deduse:**

- Cereți o mașină din listă și un interval de durată pozitivă în interiorul programului (F1–F3).
- Păstrați „nu există două programări confirmate suprapuse pentru aceeași mașină”, inclusiv pentru cereri simultane (F4–F5).
- Respingeți anularea de către altcineva decât titularul fără a modifica programarea; permiteți anularea de către titular înainte de început și eliberați intervalul (F6).
- Returnați un cod la programarea reușită; explicați regula convenită încălcată la respingere (F7).
- Pentru intervale de durată pozitivă în aceeași zi, suprapunerea pentru aceeași mașină se poate exprima prin `a.start < b.end && b.start < a.end`. Acesta este un predicat dedus, nu singura reprezentare acceptabilă. Sunt suficiente textul sau o schiță clară a capetelor intervalelor.

**O propunere utilă de proiectare:** o singură decizie de programare verifică regulile pentru timp și mașină și confirmă programarea dacă nu există conflict; față de deciziile concurente, ea se comportă ca un pas indivizibil. O proiectare ulterioară trebuie să explice mecanismul și verificarea lui. O tranzacție în baza de date, o operație serializată sau un alt mecanism potrivit pot fi luate în considerare ulterior; astăzi nu se cere un anumit mecanism.

**Sarcina următoare, cu limite clare:** pornind de la versiunea acceptată a descrierii și tabelul scenariilor, proiectați rezultatele programării/anulării și stabiliți cine răspunde de impunerea fiecărei reguli. Identificați cazurile care cer răspunsuri la Q1/Q2, fără să le decideți. Returnați o reprezentare care explică rezultatele normale, respinse și anulate, garanția de concurență încă de validat și verificările prin scenarii. Opriți-vă pentru revizuire umană înainte de implementare.

## Soluțiile scenariilor

Se aplică toate precondițiile din sursă. Fiecare scenariu este independent: S1 și S5 încep fără programări; S2–S4 și S6–S8 încep fiecare doar cu programarea confirmată a Ioanei pentru Albastra 10:00–11:00. Ignorați efectele celorlalte scenarii. În interiorul unui scenariu, respectați ordinea acțiunilor.

| Scenariu | Concluzie așteptată | Sursă și raționament |
|---|---|---|
| S1 | Confirmă și returnează un cod. | F1–F4, F7: mașină cunoscută, interval valid, fără conflict existent. |
| S2 | Respinge pentru suprapunere. | F4: aceeași mașină are deja o programare confirmată 10:00–11:00. |
| S3 | Se poate confirma dacă sunt satisfăcute celelalte verificări convenite. | F4 permite explicit ca un interval să înceapă la sfârșitul altuia. |
| S4 | Se poate confirma dacă sunt satisfăcute celelalte verificări convenite. | F4 limitează conflictele de disponibilitate la aceeași mașină; identitatea distinctă a lui Radu evită Q1. |
| S5 | Exact o confirmare și o respingere pentru conflict. | F5 stabilește rezultatul pentru cereri simultane în conflict, altfel valide. Nu stabilește care locatar are prioritate. |
| S6 | Anulează programarea Ioanei; Radu poate obține apoi intervalul eliberat. | F6 și celelalte verificări ale programării, deja satisfăcute. |
| S7 | Respinge anularea; programarea Ioanei continuă să blocheze intervalul. | F6: Radu nu este titularul. |
| S8 | Identifică Q1 și nu promite un rezultat. | F4 spune că mașinile nu intră în conflict între ele; regula pentru programările aceluiași locatar pe mașini diferite este neclarificată. |

Verificări suplimentare utile: 10:00–10:00 încalcă F3; 07:30–08:30 depășește programul; exact 08:00–22:00 satisface limitele temporale convenite dacă mașina este liberă. Poate fi o regulă nepractică într-un caz real, dar profesorul nu trebuie să inventeze o limită de durată pentru a o respinge.

Aceste parcurgeri verifică interpretarea cerințelor. Nu arată că toate execuțiile unei implementări viitoare le vor respecta.

## Soluțiile exemplului pregătit

### Propunerea din varianta A

- A1 și A2 sunt compatibile cu cerințele. Starea este o reprezentare permisă, nu obligatorie.
- Limita „cel mult o programare pe locatar în ziua D” din A3 nu este convenită potrivit F3/Q3. Contraexemplu: cu S1 confirmat, Ioana cere Albastra 15:00–16:00; A3 o respinge, deși nicio informație convenită nu o împiedică. Limita decide implicit și Q1 (S8 ar fi respins), deși A7 pune aceeași întrebare: A3 și A7 nu sunt consecvente. Eliminați limita din regulile curente sau propuneți-o clar beneficiarului.
- Inegalitățile nestricte din A4 clasifică greșit intervalele adiacente drept suprapuse. S3 este contraexemplul. Comparațiile stricte sunt o corectare potrivită pentru intervalele de durată pozitivă.
- A5 nu garantează F5. Contraexemplu: Ioana citește „liber”; Radu citește „liber”; Ioana confirmă; Radu confirmă. Ambele verificări independente trec, dar rezultatul combinat încalcă F4/F5. Cereți o decizie de programare indivizibilă față de deciziile concurente, lăsând alegerea mecanismului pentru pasul următor de proiectare.
- A6 respectă regulile de anulare din fișă și consemnează cazul neclarificat al limitei temporale.
- A7 păstrează limitele și etichetează corect o întrebare deschisă. Tehnologia rămâne de ales.
- A8 are un punct de revizuire potrivit, dar pentru o predare completă a sarcinii ar trebui să includă explicit verificările așteptate și regulile încă neclarificate.

### Revizuirea pregătită a variantei A

| Constatare | Judecata omului | Verificare/acțiune |
|---|---|---|
| C1 | Acceptare. | A3 inventează o limită pe locatar; Q3 o lasă neconvenită. Revizuiți regula și verificați cererea Ioanei pentru Albastra 15:00–16:00, apoi S8. |
| C2 | Acceptare. | A4 respinge S3. Corectați predicatul/formularea și reluați S2 și S3. |
| C3 | Respingere. | Intercalarea de mai sus contrazice garanția pretinsă pentru A5. Corectați responsabilitatea de proiectare și păstrați o verificare pentru viitorul mecanism de concurență. |
| C4 | Respingere ca modificare obligatorie. | Sursa nu impune stocare relațională. Poate fi luată în considerare ulterior, ca alternativă opțională. |
| C5 | Acceptarea constatării justificate. | S6 și S7 susțin A6; Q2 rămâne deschisă. Nu este necesar un prompt nou de corectare. |

Aceste soluții ilustrează atât acceptarea, cât și respingerea constatărilor evaluatorului. Nu punctați studenții după numărul defectelor raportate. Un răspuns care citează C1–C5 fără a explica legătura cu sursa nu arată o judecată independentă.

Limita din A3 (un număr maxim de programări) este intenționat diferită de schimbarea de la minutul 78 (o durată maximă): studenții care au respins A3 nu primesc la final aceeași întrebare.

### Varianta B

Varianta B se pretează la o acceptare motivată. Studenții trebuie să arate că B4 tratează S2/S3, B5 formulează garanția pentru cererile combinate din F5, B6 tratează S6/S7 și B7 lasă S8 nerezolvat. Ei pot îmbunătăți prezentarea sau propune altă reprezentare, dar trebuie să distingă îmbunătățirea de un defect.

B5 formulează o obligație de proiectare; nu arată că o anumită implementare o îndeplinește. B8 păstrează explicit această limită. Este rezonabil să se ceară validarea mecanismului într-o sarcină ulterioară; nu este rezonabil să se pretindă că sursa cere PostgreSQL sau o anumită ierarhie de clase.

## Schimbarea individuală: răspuns-model și alternative acceptabile

La minutul 78, spuneți:

> Considerați că D este mâine. Beneficiarul propune acum: „De mâine, o programare ar trebui să dureze cel mult 90 de minute.” Există deja o programare confirmată de 120 de minute pentru mâine.

Un răspuns solid:

> Limita este o regulă nouă propusă; nu făcea parte din cerințele inițiale. Afectează acceptarea programării, scenariile și eventual invariantul programărilor confirmate. Trebuie să clarific dacă limita se aplică doar cererilor făcute după adoptare sau și programărilor deja confirmate. Exceptarea programării existente păstrează promisiunea făcută titularului, iar limita se aplică doar cererilor noi. Aplicarea la programările existente cere o tranziție convenită și o decizie despre titularii afectați; nu le-aș scurta sau anula implicit programarea. Programarea existentă de 120 de minute distinge aceste reguli, iar o cerere nouă de 120 de minute trebuie verificată potrivit regulii alese.

Alte răspunsuri solide pot propune o dată ulterioară de intrare în vigoare, pot căuta un interval mai scurt de înlocuire cu acordul titularului sau pot identifica o a treia opțiune. Esențial este ca studentul să recunoască cerința schimbată, să-i urmărească consecințele și să nu inventeze regula de tranziție care lipsește.

Dacă se alege exceptarea programărilor existente, „toate programările confirmate durează cel mult 90 de minute” nu este invariantul global corect. Studenții pot formula în schimb regula pentru programările nou acceptate după momentul intrării în vigoare. Este o extensie utilă pentru studenții care termină mai devreme, nu o condiție pentru finalizarea laboratorului 1.

Un răspuns slab este „adaugă `duration <= 90` și șterge programările vechi nevalide”: ignoră autoritatea beneficiarului și angajamentele existente. Ca feedback, întrebați ce regulă convenită permite ștergerea.

## Ghid pentru feedback

Folosiți aceste observații pentru feedback punctual; aici nu se stabilește o notă numerică sau o condiție pentru promovarea cursului.

| Aspect urmărit | Pregătită pentru discuția de feedback | Necesită revizuire |
|---|---|---|
| Formularea problemei | Scop delimitat și cele cinci tipuri de afirmații distincte. | Reguli adăugate prezentate drept convenite; lipsa limitelor sistemului. |
| Model și scenarii | Distincție mașină/programare; rezultate așteptate legate de informațiile-sursă. | Se presupune global o singură programare pe mașină; se ignoră adiacența sau titularul. |
| Predarea sarcinilor | Versiunea de intrare, limitele, rezultatul, verificările și momentul în care sarcina se oprește pentru revizuire. | „Fă să fie corect” fără limite sau sursă; implementare delegată înainte de clarificarea întrebărilor de proiectare. |
| Revizuire | Afirmație verificată față de variantă și sursă; decizie umană explicată. | Evaluatorul crezut pe cuvânt; preferință opțională de proiectare tratată drept contradicție. |
| Raționament individual | Studentul poate explica fără ajutor o regulă, o alternativă și o consecință a schimbării. | Repetă materialul comun fără a identifica justificări sau decizii afectate. |

Un student poate atinge aceste rezultate și cu o primă variantă corectă, fără un prompt nou de corectare. Un student fără acces la AI poate demonstra același raționament. Când nu e clar cine a scris notițele unui student sau dacă le-a înțeles, cereți-i explicații suplimentare.

## Legătura de încheiere

Întrebați: „Ce decizie trebuie să ia beneficiarul, ce decizie puteți lua voi ca proiectanți și ce verificări ați cere celui care preia sarcina următoare?”

Legați răspunsurile de cursurile următoare: formularea problemei și cerințe (cursul 3), modelarea domeniului (cursul 4) și responsabilitățile (cursul 5). Nu promiteți că laboratoarele viitoare vor cere o anumită diagramă, un instrument fix sau o aplicație implementată.
