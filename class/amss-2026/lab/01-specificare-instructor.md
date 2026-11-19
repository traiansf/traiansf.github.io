# Laboratorul 1 — ghid pentru profesor

**100 de minute, după cursurile 1–2; 17 slide-uri cu tot cu copertă.** Prima jumătate păstrează discuția în perechi despre problema spălătoriei; a doua este un atelier în care studenții desenează fluxul unei cereri ca diagramă de activitate UML și îl verifică față de enunț (decizia din 19 noiembrie 2026). Perechile pot folosi schițe și notițe, dar nu predau documente, diagrame, transcrieri AI sau fișe individuale. Nu se configurează un canal de încărcare și nu se solicită un repository pentru această activitate. Cerințele proiectului semestrial rămân separate.

Materiale: [prezentarea](01-specificare.md) și [varianta ei online](01-specificare-online.md), [enunțul](scenarios/01-specificare/scenario.md), [specificația diagramei de activitate](diagrame/activitate.md), [diagrama de referință și justificarea ei](scenarios/01-specificare/reference.md), [sprijinul facultativ pentru discuție](scenarios/01-specificare/worksheet.md). Fișa și specificația sunt referințe, disponibile pe calculator sau pe hârtie. Un trio poate înlocui o pereche; al treilea coleg urmărește sursele și intră apoi în rotație. Nu cerem teoria din cursurile următoare și nici cunoștințe anterioare de UML: slide-ul cu elementele diagramei și specificația sunt suficiente.

## Parcurs

| Minute | Activitate | Ce urmărește profesorul |
|---|---|---|
| 0–10 | Citat, prima interpretare și întrebări pentru beneficiar, în pereche. | Argument din regula alăturării intervalelor; legătura dintre o întrebare și o decizie. |
| 10–25 | Citirea faptelor și explicații cu roluri schimbate. | Distincția între convenit, dedus, ipoteză, întrebare și propunere. |
| 25–50 | Două perechi își pun explicațiile la încercare (13 min); schimbarea „maximum 90 de minute” (11 min). | Alt coleg poate justifica rezultatul din reguli; impactul unei reguli noi asupra programărilor existente. |
| 50–95 | Atelier: tranziția, sarcina și notația (7), lucru individual și verificare în pereche (16), verificarea la jumătate în plen (8), corecturi (6), diagrama de referință (8). | Fiecare element al diagramei are o regulă în enunț; nicio regulă inventată; Q1 și Q2 rămân deschise. |
| 95–100 | Încheiere: două sau trei perechi împărtășesc un exemplu. | Legătura dintre rezultat, element de diagramă și enunț. |

Nu cereți completarea tuturor celor opt scenarii. În schimbul între perechi, una alege un scenariu, cealaltă îl explică prima. Două sau trei exemple sunt suficiente în plen. Prima jumătate a fost comprimată de la 75 la 50 de minute: dacă ritmul întârzie, reduceți numărul răspunsurilor în plen, nu timpul atelierului; atelierul are nevoie de cel puțin 35 de minute pentru lucru și verificare.

## Referință pentru scenarii

Analiză a profesorului, nu output AI. S1 și S5 încep fără programări; toate celelalte scenarii pornesc separat numai cu programarea Ioanei Albastra 10:00–11:00. Identitățile sunt verificate, intervalele sunt în D.

| Scenariu | Rezultat și sursă |
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

## Schimbarea „maximum 90 de minute”

La minutul 39 propunem „De mâine, maximum 90 de minute”, cu o programare existentă a Ioanei pentru D = mâine, 10:00–12:00. Întrebarea esențială: limita afectează doar cererile noi sau și programările deja confirmate? Clarificăm și momentul intrării în vigoare. Nu anulăm sau scurtăm automat nimic. Dacă limita se aplică numai cererilor noi, programarea existentă rămâne, iar o cerere nouă de 120 de minute supusă noii reguli este respinsă. Limita nu este convenită: diagrama din atelier nu o include, iar o decizie „Durata depășește 90 de minute?” este o eroare de urmărit.

## Atelierul de diagrame

**Alegerea diagramei.** Folosim diagrama de activitate: problema este un flux scurt cu două decizii (F3, F4), trei rezultate (F7) și o extensie cu două condiții (F6), iar scenariile S1–S8 se pot urmări pe diagramă. O diagramă a cazurilor de utilizare ar ascunde exact regulile discutate în prima jumătate; justificarea completă este în [referință](scenarios/01-specificare/reference.md).

**Notația.** Specificația recomandă PlantUML, care desenează elementele UML (culoare, bifurcare, nod final de flux); Mermaid `flowchart` este acceptat ca aproximare, cu corespondența din specificație. Studenții aleg: pe hârtie, în notație text sau cu un asistent AI. Nu impuneți un instrument și nu consumați atelierul cu instalări: serverul online PlantUML nu cere cont. Slide-urile cu diagrame sunt construite cu blocuri `plantuml`; front matter-ul cere PNG (`diagram: engine: plantuml: mime-type: image/png`), pentru că PDF-ul produs de PlantUML pierde literele ă, ș, ț.

**Pași și puncte de control.**

1. **50–57, sarcina și notația.** Citiți sarcina împreună; regulile F3–F7 și Q1 sunt pe slide. Pe slide-ul cu elementele, insistați pe două distincții: decizia alege un singur drum, iar condițiile ei se exclud; o casetă este o acțiune (verb), nu o stare.
2. **57–73, lucru.** 11 minute individual, 5 minute verificare în pereche cu lista de pe ecran. Treceți printre perechi. **Control la minutul 63:** fiecare student are cel puțin culoarele și prima decizie; cine nu a pornit primește întrebarea „ce face sistemul imediat după ce primește cererea?”. Căutați doi voluntari: unul cu o diagramă pe hârtie și unul cu o diagramă în notație text sau generată cu AI, de preferință cu o eroare instructivă.
3. **73–81, verificarea la jumătate.** Voluntarul arată diagrama; clasa o parcurge cu lista. Rețineți numai observațiile care numesc punctul din listă și regula din enunț. Dacă diagrama a fost generată cu AI, întrebați ce a verificat autorul și ce a corectat. **Control:** clasa ajunge la o variantă corectată în comun (pe tablă sau în textul voluntarului).
4. **81–87, corecturi individuale**, cu slide-ul de verificare la jumătate pe ecran.
5. **87–95, referința.** Comparați varianta corectată în comun cu diagrama de referință: ce lipsește, ce este în plus, ce este doar altă formă (ordinea deciziilor, validitatea împărțită în mai multe decizii). Anularea are două minute: arătați doar ramura Q2.

**Erori de urmărit** (lista completă și justificarea elementelor sunt în [referință](scenarios/01-specificare/reference.md)):

- suprapunerea scrisă astfel încât respinge S3 (alăturarea tratată ca suprapunere);
- o decizie pentru Q1 (programările locatarului pe cealaltă mașină) sau pentru durata maximă din prima parte;
- F5 desenat ca bifurcare ori ca decizie de prioritate („Cine a cerut primul?”);
- lipsa ramurii pentru cererea invalidă sau o respingere fără regula numită (F7);
- toate acțiunile într-un singur culoar, sau casete-stări („Confirmată”) în loc de acțiuni;
- la anulare, ramura Q2 cu un rezultat ales.

**AI în atelier.** Fiecare student decide dacă folosește un asistent AI; nu cerem conturi, abonamente sau un anumit model. Specificația conține promptul sugerat și pașii de verificare. Urmăriți ca studenții să dea asistentului enunțul integral și specificația, nu doar sarcina, și ca diagrama generată să treacă prin aceeași listă: o randare fără erori nu verifică nicio regulă. Fără acces AI, studenții lucrează pe hârtie sau în notație text.

**Ce nu mai facem.** Analiza AI și revizuirea în plen (fostele slide-uri 8–10, 50–75) au fost scoase pe 19 noiembrie 2026. [Capturile pregătite](scenarios/01-specificare/prepared-fixture.md) și [arhiva](scenarios/01-specificare/captures/2026-10-10/README.md) rămân neschimbate: trei rulări reale Claude Haiku 4.5 din 10 octombrie 2026, cu prompturi și rezultate integrale.

## Încheierea

La final, ascultați două sau trei perechi: ce au înțeles diferit, ce scenariu le-a schimbat interpretarea, ce element al diagramei au corectat la verificare și ce regulă a cerut corectura. Nu colectați lucrări individuale sau diagrame și nu adăugați punctaj de participare. Notați pentru pregătirea următoare dificultățile recurente ale grupei.

## Varianta online

[Prezentarea online](01-specificare-online.md) păstrează slide-urile, scenariile, diagramele și timpii de mai sus, pentru o întâlnire Teams în care toți vorbesc în plen, fără grupuri separate. Se schimbă doar forma conversației:

- **Răspuns în chat, trimis la semnal**, în locul primei reflecții în pereche: fiecare scrie, dar trimite abia la semnal, ca răspunsurile să rămână independente. Citiți două răspunsuri diferite și invitați-le autorii să le explice.
- **Ștafeta** în locul schimbării rolurilor: un coleg explică o regulă, altul cere un exemplu sau sursa, apoi explică el regula următoare. Dați cuvântul pe nume sau după mâinile ridicate; camera nu este necesară.
- **Colegul numit** în locul celeilalte perechi: cine alege un scenariu numește colegul care răspunde primul, iar acesta alege scenariul următor; ceilalți scriu în chat „de acord” sau o obiecție.
- **Atelierul:** fiecare lucrează singur și își verifică diagrama cu lista; în locul verificării în pereche, scrie în chat punctul la care a ezitat, iar profesorul răspunde la microfon punctelor care se repetă. La jumătate, unul sau doi voluntari își partajează ecranul (diagrama, o fotografie a foii) sau trimit textul PlantUML ori Mermaid în chat; observațiile se scriu în chat la semnal, cu punctul din listă și regula, iar autorul lor le explică la microfon. Cât timp un voluntar partajează, regulile rămân vizibile pentru cei care urmăresc sesiunea sincronizată; altfel reveniți la slide între observații.

Prezentarea poate fi partajată de profesor sau preluată de un student, de exemplu pentru moderarea scenariilor (26–39). Cu sesiunea sincronizată, studenții urmăresc slide-urile la <https://cs.unibuc.ro/~tserbanuta/amss/now>, iar ecranul partajat rămâne liber pentru fișă, pentru diagrama unui voluntar sau pentru asistentul AI al unui coleg. Un student care preia prezentarea o partajează din HTML-ul publicat sau primește controlul prin Teams; nu trimiteți în chat parola profesorului sau linkul de control. În plen discuția durează mai mult: dacă ritmul întârzie, citiți mai puține răspunsuri din chat în prima jumătate, dar păstrați verificarea la jumătate și referința. Mesajele din chat nu se colectează și nu se notează.
