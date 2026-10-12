# Laboratorul 1 — ghid pentru profesor

**100 de minute, după cursurile 1–2; 14 slide-uri cu tot cu copertă** (anterior 20). Accentul este pe înțelegere reciprocă, exemple și discuția revizuirii. Perechile pot folosi schițe și notițe, dar nu predau documente, transcrieri AI sau fișe individuale. Nu se configurează un canal de încărcare și nu se solicită un repository pentru această activitate. Cerințele proiectului semestrial rămân separate.

Materiale: [prezentarea](01-specificare.md) și [varianta ei online](01-specificare-online.md), [scenariul](scenarios/01-specificare/scenario.md), [sprijinul facultativ pentru discuție](scenarios/01-specificare/worksheet.md), [capturile pregătite](scenarios/01-specificare/prepared-fixture.md). Fișa este o referință, disponibilă pe calculator sau hârtie. Un trio poate înlocui o pereche; al treilea coleg urmărește sursele și intră apoi în rotație. Nu cerem teoria din cursurile următoare.

## Parcurs

| Minute | Activitate | Ce urmărește profesorul |
|---|---|---|
| 0–10 | Citat, prima interpretare și întrebări pentru beneficiar, în pereche. | Argument din regula alăturării intervalelor; legătura dintre o întrebare și o decizie. |
| 10–30 | Citirea faptelor și explicații cu roluri schimbate. | Distincția între convenit, dedus, ipoteză, întrebare și propunere. |
| 30–50 | Două perechi își pun explicațiile la încercare. | Alt coleg poate justifica rezultatul din reguli. |
| 50–75 | Comparație cu AI sau captura; revizuire și decizie. | Numărul acceptărilor și prioritatea nu sunt aceeași garanție. |
| 75–100 | Schimbarea limitei de durată și conversație finală. | Impactul asupra programărilor existente și întrebarea pentru beneficiar. |

Nu cereți completarea tuturor celor opt cazuri. În schimbul între perechi, una alege un caz, cealaltă îl explică prima. Două sau trei exemple sunt suficiente în plen. Dacă ritmul întârzie, reduceți numărul răspunsurilor în plen, păstrând conversația între colegi și schimbarea finală.

## Referință pentru cazuri

Analiză a profesorului, nu output AI. S1 și S5 încep fără programări; toate celelalte cazuri pornesc separat numai cu programarea Ioanei Albastra 10:00–11:00. Identitățile sunt verificate, intervalele sunt în D.

| Caz | Rezultat și sursă |
|---|---|
| S1 | Confirmare cu cod, F3–F4 și F7. |
| S2 | Respingere: suprapunere 10:30–11:00 pe aceeași mașină, F4. |
| S3 | Confirmare: alăturarea 11:00 este permisă, F4. |
| S4 | Confirmare: altă mașină, alt locatar, F4. |
| S5 | Exact o confirmare și o respingere, F5; nu știm care cerere câștigă. |
| S6 | Titularul anulează înainte de început; intervalul se eliberează și cererea ulterioară se confirmă, F6 și F4. |
| S7 | Respingem anularea făcută de alt locatar; programarea rămâne, F6. |
| S8 | Rezultatul depinde de Q1: același locatar pe mașini diferite. |

F5 cere doar garanția observabilă pentru cereri simultane. Nu sunt necesare mutexuri, tranzacții sau teoria concurenței. Nu acceptăm o limită implicită de o programare pe zi, respingerea intervalelor alăturate sau tratarea lui Q1 ca decizie deja luată. Plățile, recurența, listele de așteptare, administrarea, defecțiunile și notificările sunt excluse. Anularea la sau după început este Q2; limitele viitoare sunt Q3.

## Capturile și revizuirea

Analistul AI 01 primește fișa și sarcina delimitată la concepte plus S2, S3, S5 și S8. Descrie corect o acceptare și o respingere în S5, dar concluzionează că S5 ar depinde de Q1. Pe slide-ul 10 studenții verifică acest fragment prin F5: prioritatea nu este decisă, însă numărul acceptărilor este deja garantat.

Evaluatorul (agent AI de revizuire) 02 primește într-un context nou regulile, sarcina și răspunsul integral. Fragmentul de pe slide-ul 11 observă corect asocierea greșită cu Q1. Răspunsul integral continuă să insiste pe prioritate; cereți studenților să distingă „cine este acceptat” de „câte cereri sunt acceptate”. Nu deducem lipsa oricărei garanții.

[Arhiva](scenarios/01-specificare/captures/2026-10-10/README.md) păstrează trei rulări reale Claude Haiku 4.5, cu prompturi și rezultate integrale. Prima revizuire a primit o instrucțiune cu diacritice deteriorate și fără sarcina exactă a analistului AI; critică astfel și lipsa unor cazuri care nu fuseseră cerute. Este păstrată ca istoric, nu folosită pe slide. Revizuirea 02 corectează ambele limite ale inputului. Nu atribuim agentului AI o eroare de context introdusă de profesor.

Instrumentele studenților sunt facultative. Fără acces AI, folosim fragmentele de pe slide sau cerem altei perechi aceeași verificare. Nu impunem abonament sau model și nu consumăm etapa cu instalări.

## Schimbarea finală

La minutul 75 propunem „De mâine, maximum 90 de minute”, cu o programare existentă a Ioanei pentru D = mâine, 10:00–12:00. Întrebarea esențială: limita afectează doar cererile noi sau și programările deja confirmate? Clarificăm și momentul intrării în vigoare. Nu anulăm sau scurtăm automat nimic. Dacă limita se aplică numai cererilor noi, programarea existentă rămâne, iar o cerere nouă de 120 de minute supusă noii reguli este respinsă.

La final, ascultați două sau trei perechi: ce au înțeles diferit, ce caz le-a schimbat interpretarea, ce observație au acceptat ori respins și de ce. Nu colectați lucrări individuale și nu adăugați punctaj de participare. Notați pentru pregătirea următoare dificultățile recurente ale grupei.

## Varianta online

[Prezentarea online](01-specificare-online.md) păstrează slide-urile, cazurile, capturile și timpii de mai sus, pentru o întâlnire Teams în care toți vorbesc în plen, fără grupuri separate. Se schimbă doar forma conversației:

- **Răspuns în chat, trimis la semnal**, în locul primei reflecții în pereche: fiecare scrie, dar trimite abia la semnal, ca răspunsurile să rămână independente. Citiți două răspunsuri diferite și invitați-le autorii să le explice.
- **Ștafeta** în locul schimbării rolurilor: un coleg explică o regulă, altul cere un exemplu sau sursa, apoi explică el regula următoare. Dați cuvântul pe nume sau după mâinile ridicate; camera nu este necesară.
- **Colegul numit** în locul celeilalte perechi: cine alege un caz numește colegul care răspunde primul, iar acesta alege cazul următor; ceilalți scriu în chat „de acord” sau o obiecție.
- **Rolurile AI pe ecrane diferite:** la o rulare live, un voluntar partajează analistul AI, iar alt coleg evaluatorul, într-un context nou. Fără rulare, folosiți capturile de pe slide-uri.

Prezentarea poate fi partajată de profesor sau preluată de un student, de exemplu pentru moderarea etapei 30–50. Cu sesiunea sincronizată, studenții urmăresc slide-urile la <https://cs.unibuc.ro/~tserbanuta/amss/now>, iar ecranul partajat rămâne liber pentru fișă sau pentru asistentul AI al unui coleg. Un student care preia prezentarea o partajează din HTML-ul publicat sau primește controlul prin Teams; nu trimiteți în chat parola profesorului sau linkul de control. În plen discuția durează mai mult: dacă ritmul întârzie, citiți mai puține răspunsuri din chat, dar păstrați schimbarea finală. Mesajele din chat nu se colectează și nu se notează.
