# Ghid pentru profesor — Cursul 3: Formularea problemei și a cerințelor

Prezentarea [03-cerinte.md](03-cerinte.md) are **32 de slide-uri cu tot cu copertă**, pentru 100 de minute. Enunțurile, prompturile, fragmentele AI discutate și comparațiile cu sursa sunt pe slide-uri; studenții folosesc numai coli albe și un pix. Acest document este pentru pregătirea profesorului.

## Ajustarea după Cursul 2

Feedbackul titularului din 10 octombrie 2026: studenții au participat bine, au dat exemple și au comentat, dar materialul a fost prea mult pentru 100 de minute. A fost parcurs aproape integral, într-un ritm prea rapid. Pentru Cursul 3, titularul a propus aproximativ 30 de slide-uri. Nu este necesară recuperarea unei secțiuni întregi din Cursul 2.

Reducerea de la 45 la 32 de slide-uri, incluzând coperta, este însoțită de restrângerea obiectivelor: clasificarea afirmațiilor în cele cinci tipuri din Cursul 2 (informație convenită, consecință dedusă, întrebare deschisă, ipoteză, propunere de proiectare), delimitarea problemei și formularea unor cerințe verificabile. Nu comprimăm vechiul volum în slide-uri mai dense. Studenții au timp să formuleze și să argumenteze răspunsuri; exemplele lor fac parte din bugetul întâlnirii.

Etapa capturilor folosește **răspunsuri AI reale**: un prompt și un răspuns, ale căror numere studenții le urmăresc până la enunț (decizia din 19 noiembrie 2026; vezi mai jos). Rezolvările exercițiilor rămân în notele lor, pentru a fi discutate cât timp datele și întrebarea sunt pe ecran. Redeschiderea sesizărilor este exclusă; o discuție suplimentară despre această schimbare este opțională și nu intră în cele 100 de minute.

## Parcurs și repere

Numerele includ coperta generată automat. Nu planificați două minute pentru fiecare slide; unele sunt tranziții, altele rămân pe ecran pe durata unei activități.

| Interval | Slide-uri | Activitate și timp de discuție |
|---|---|---|
| 0–15 | 1–5 | Deschidere scurtă, citat, 7 min pentru analiza cererii și răspunsuri; problema, obiectivul și părțile interesate. |
| 15–35 | 6–14 | Recapitularea celor cinci tipuri de afirmații din Cursul 2, 2 min; limite și surse; 4 min pentru clasificarea unor afirmații AI reale, 4 min pentru două politici privind sesizările repetate; tipurile de cerințe, cu 3 min de clasificare. |
| 35–65 | 15–22 | Cerințe și exemple; 9 min de lucru în perechi, 3 min pentru sesizări repetate, 4 min pentru pragul de timp. |
| 65–90 | 23–29 | Tranziție și prompt: 3 min; trei fragmente de urmărit până la sursă: câte 4 min; tabelul nostru de proveniență: 4 min; decizia: 3 min; 3 min pentru întrebări. |
| 90–100 | 30–32 | 7 min pentru transferul la înscrierea la consultații și discutarea răspunsurilor; 3 min de încheiere. |

Reperele cumulative sunt în notele tranzițiilor și în marcajele `.pace`. Duratele exercițiilor includ discutarea răspunsurilor; nu adăugați încă o etapă de corectare după fiecare durată anunțată.

## Exemplul principal

[Enunțul consolidat](scenarios/03-sesizari/brief.md) și [raționamentul de referință](scenarios/03-sesizari/reference.md) susțin pregătirea. Exemplul, răspunsurile administrației și loturile de măsurători sunt didactice. **Răspunsurile AI sunt capturi reale**, nu texte redactate pentru a simula un model AI. Loturile de timp nu sunt rezultate ale unor execuții.

Răspunsurile administrației se dezvăluie progresiv. La primul exercițiu acceptați întrebările utile chiar dacă ating o funcție pe care o vom exclude ulterior. Nu evaluați întrebările și ipotezele inițiale prin reguli pe care studenții nu le-au primit încă. Cereți de fiecare dată tipul afirmației: ipoteza din recapitulare devine informație convenită la R3, întrebarea deschisă despre „rapid” la Q1.

Pentru R3, permiteți discutarea ambelor politici înainte să arătați acordul asupra sesizărilor separate. Varianta comună ar modifica **ambele** reguli deja convenite: R1 nu ar mai crea o sesizare la fiecare trimitere validă, iar R2 ar permite și consultarea unei sesizări create de alt student. R3 confirmă păstrarea regulilor și pentru raportări despre aceeași defecțiune. Legătura importantă: o clarificare poate confirma o regulă sau poate cere revizuirea explicită a acordurilor anterioare.

Un exemplu de acceptare arată rezultatul prin care sistemul respectă cerința. Acesta poate fi și **respingerea corectă** a unei cereri; nu echivalăm „acceptarea sistemului” cu aprobarea fiecărei acțiuni a utilizatorului. În exercițiul despre R4, cereți să fie precizate și motivul respingerii, și starea păstrată.

Pentru Q1, distingeți timpul de afișare de timpul de actualizare de către personal și de timpul reparației; pragul numeric vine abia după această clarificare. Pragul de 95% privește timpul, nu permite afișări incorecte în restul lotului.

## Lecția AI: precizia inventată

Decizia din 19 noiembrie 2026 (`../docs/ai-lessons-and-lab-diagrams.md`) dă fiecărui curs altă lecție despre folosirea AI, în alt format. Lecția Cursului 3: **precizia inventată.** Numerele, pragurile și țintele de calitate dintr-un răspuns AI par să aibă o sursă, dar adesea nu au; „specific” nu înseamnă „confirmat”. Formatul: un tabel de proveniență, în care fiecare număr din răspuns este urmărit până la o regulă a enunțului sau marcat nesusținut. Nu folosim aici perechea analist–evaluator. Segmentul precedent (cerere inițială, analist, evaluator; capturi din 10 octombrie 2026) a fost înlocuit; [arhiva lui](scenarios/03-sesizari/captures/2026-10-10/README.md) rămâne neschimbată. Slide-ul 10 citează în continuare trei afirmații din răspunsul inițial 2 de atunci și arată acum promptul inițial integral; „99% timp de funcționare” este primul număr fără sursă, reluat la tranziția etapei AI.

[Arhiva capturilor din 19 noiembrie 2026](scenarios/03-sesizari/captures/2026-11-19/README.md) păstrează trei rulări prin Claude Code 2.1.328, model `claude-haiku-4-5`, contexte noi, fără unelte, fără configurația și fișierele proiectului. Promptul (`scenarios/03-sesizari/ai/calitate-prompt.md`) conține enunțul cu R1–R4, Q1 și excluderile și cere cerințe de calitate verificabile, fiecare cu prag numeric, condiții și mod de măsurare. Rularea 1 este selectată; selecția servește lecției, nu măsoară performanța tipică a modelului AI.

**Slide-ul 24 — promptul (3 min).** Instrucțiunea exactă și Q1 integral sunt pe slide. Enunțul are un singur prag convenit; instrucțiunea cere câte un prag pentru fiecare cerință. Cereți predicții: ce numere vor apărea în afara celor din Q1?

**Slide-urile 25–27 — urmărirea numerelor (câte 4 min).** Pe hârtie, un tabel: număr din răspuns → regula sursă sau „nesusținut”. Răspunsuri așteptate:

- 25 (CQ1, CQ3): 100% și 0% reformulează R1 și R4 (regula se aplică fiecărei cereri). „Max 1 secundă” nu are sursă: Q1 fixează un timp numai pentru consultare.
- 26 (CQ5): 10.000, 20 de consultări simultane, 950 din 1.000 și 2 secunde vin din Q1. „20 utilizatori simultani” nu înseamnă 20 de consultări simultane; „50 sesizări în portofoliu” nu are sursă (Q1 nu fixează setul de date). Punctele de măsurare sunt păstrate; lipsește rețeaua campusului.
- 27 (CQ4, CQ6): „1.000 de operații” este o dimensiune de verificare aleasă de agentul AI; R3 cere rezultatul. CQ6 este o cerință nouă: enunțul nu analizează concurența actualizărilor; „0” și „100%” par riguroase, dar măsoară ceva neconvenit.

**Slide-ul 28 — tabelul nostru (4 min).** Trei verdicte, trei acțiuni: ce este susținut păstrăm, ce este schimbat corectăm după sursă, ce este nesusținut ducem la administrație sau scoatem. Răspunsul nu marchează nicăieri diferența: „max 1 secundă” și „2 secunde” au aceeași formă.

**Slide-ul 29 — decizia (3 min, apoi 3 min de întrebări).** Păstrăm CQ5 cu valorile din Q1 și rețeaua campusului; „max 1 secundă” devine o întrebare pentru administrație; 50 de sesizări și 1.000 de operații sunt propuneri pentru planul de verificare; CQ6 nu se păstrează. Slide-ul spune că rularea este selectată și că altă rulare a păstrat doar pragul de timp din Q1 (rularea 3). Rularea 2 a păstrat Q1 integral, dar a ales numere pentru teste.

Nu prezentăm răspunsul ca integral greșit: CQ5 transcrie corect valorile din Q1, iar procentele de 100% reformulează corect regulile. Lecția este că numerele corecte și cele inventate arată la fel. La curs se folosesc numai slide-urile, fără rulări live.

## Dacă discuția ocupă mai mult timp

- La minutul 35 începeți etapa exemplelor. Folosiți R3 ca sinteză a discuției despre cele două politici și prezentați pe scurt tabelul tipurilor de cerințe.
- La minutul 65 treceți la etapa capturilor AI; răspunsurile exercițiului în perechi se discută în cele 9 minute deja rezervate. Pe Q1 păstrați distincția dintre prag și medie.
- Absorbiți întâi depășirile în cele 3 minute de întrebări ale etapei capturilor AI. Promptul este de citit pe scurt; urmărirea numerelor (slide-urile 25–27) este locul principal al discuției. Dacă timpul presează, la slide-ul 27 discutați numai CQ6 și treceți la tabel. Păstrați exercițiul final și justificările studenților.

La final, notați unde s-a ajuns la minutele 35, 65 și 90 și ce distincție a cerut cele mai multe clarificări. Aceste observații vor calibra cursurile următoare; numărul de slide-uri singur nu măsoară încărcarea.
