# Ghid pentru profesor — Cursul 3: Formularea problemei și a cerințelor

Prezentarea [03-cerinte.md](03-cerinte.md) are **32 de slide-uri cu tot cu copertă**, pentru 100 de minute. Enunțurile, prompturile, fragmentele AI discutate și comparațiile cu sursa sunt pe slide-uri; studenții folosesc numai coli albe și un pix. Acest document este pentru pregătirea profesorului.

## Ajustarea după Cursul 2

Feedbackul titularului din 10 octombrie 2026: studenții au participat bine, au dat exemple și au comentat, dar materialul a fost prea mult pentru 100 de minute. A fost parcurs aproape integral, într-un ritm prea rapid. Pentru Cursul 3, titularul a propus aproximativ 30 de slide-uri. Nu este necesară recuperarea unei secțiuni întregi din Cursul 2.

Reducerea de la 45 la 32 de slide-uri, incluzând coperta, este însoțită de restrângerea obiectivelor: clasificarea afirmațiilor în cele cinci tipuri din Cursul 2 (informație convenită, consecință dedusă, întrebare deschisă, ipoteză, propunere de proiectare), delimitarea problemei și formularea unor cerințe verificabile. Nu comprimăm vechiul volum în slide-uri mai dense. Studenții au timp să formuleze și să argumenteze răspunsuri; exemplele lor fac parte din bugetul întâlnirii.

Etapa capturilor folosește **răspunsuri AI reale**, inclusiv pentru greșelile discutate, în trei perechi prompt–răspuns. Rezolvările exercițiilor rămân în notele lor, pentru a fi discutate cât timp datele și întrebarea sunt pe ecran. Redeschiderea sesizărilor este exclusă; o discuție suplimentară despre această schimbare este opțională și nu intră în cele 100 de minute.

## Parcurs și repere

Numerele includ coperta generată automat. Nu planificați două minute pentru fiecare slide; unele sunt tranziții, altele rămân pe ecran pe durata unei activități.

| Interval | Slide-uri | Activitate și timp de discuție |
|---|---|---|
| 0–15 | 1–5 | Deschidere scurtă, citat, 7 min pentru analiza cererii și răspunsuri; problema, obiectivul și părțile interesate. |
| 15–35 | 6–14 | Recapitularea celor cinci tipuri de afirmații din Cursul 2, 2 min; limite și surse; 4 min pentru clasificarea unor afirmații AI reale, 4 min pentru două politici privind sesizările repetate; tipurile de cerințe, cu 3 min de clasificare. |
| 35–65 | 15–22 | Cerințe și exemple; 9 min de lucru în perechi, 3 min pentru sesizări repetate, 4 min pentru pragul de timp. |
| 65–90 | 23–29 | Tranziție și trei prompturi: 7 min; trei comparații cu răspunsurile: câte 5 min; 3 min pentru întrebări. |
| 90–100 | 30–32 | 7 min pentru transferul la înscrierea la consultații și discutarea răspunsurilor; 3 min de încheiere. |

Reperele cumulative sunt în notele tranzițiilor și în marcajele `.pace`. Duratele exercițiilor includ discutarea răspunsurilor; nu adăugați încă o etapă de corectare după fiecare durată anunțată.

## Exemplul principal

[Enunțul consolidat](scenarios/03-sesizari/brief.md) și [raționamentul de referință](scenarios/03-sesizari/reference.md) susțin pregătirea. Exemplul, răspunsurile administrației și loturile de măsurători sunt didactice. **Răspunsurile AI și revizuirile sunt capturi reale**, nu texte redactate pentru a simula un model AI. Loturile de timp nu sunt rezultate ale unor execuții.

Răspunsurile administrației se dezvăluie progresiv. La primul exercițiu acceptați întrebările utile chiar dacă ating o funcție pe care o vom exclude ulterior. Nu evaluați întrebările și ipotezele inițiale prin reguli pe care studenții nu le-au primit încă. Cereți de fiecare dată tipul afirmației: ipoteza din recapitulare devine informație convenită la R3, întrebarea deschisă despre „rapid” la Q1.

Pentru R3, permiteți discutarea ambelor politici înainte să arătați acordul asupra sesizărilor separate. Varianta comună ar modifica **ambele** reguli deja convenite: R1 nu ar mai crea o sesizare la fiecare trimitere validă, iar R2 ar permite și consultarea unei sesizări create de alt student. R3 confirmă păstrarea regulilor și pentru raportări despre aceeași defecțiune. Legătura importantă: o clarificare poate confirma o regulă sau poate cere revizuirea explicită a acordurilor anterioare.

Un exemplu de acceptare arată rezultatul prin care sistemul respectă cerința. Acesta poate fi și **respingerea corectă** a unei cereri; nu echivalăm „acceptarea sistemului” cu aprobarea fiecărei acțiuni a utilizatorului. În exercițiul despre R4, cereți să fie precizate și motivul respingerii, și starea păstrată.

Pentru Q1, distingeți timpul de afișare de timpul de actualizare de către personal și de timpul reparației; pragul numeric vine abia după această clarificare. Pragul de 95% privește timpul, nu permite afișări incorecte în restul lotului.

## Revizuirea și rolurile AI

[Arhiva capturilor din 10 octombrie 2026](scenarios/03-sesizari/captures/2026-10-10/README.md) păstrează șase încercări: două inițiale, două de analiză cu reguli și două de revizuire. Toate folosesc Claude Code 2.1.294, model declarat `claude-haiku-4-5`, contexte noi, fără unelte, fără configurația și fișierele proiectului. Intrările exacte, răspunsurile integrale și metadatele sunt păstrate. Temperatura nu este raportată; nu a fost setat explicit un nivel de efort. Selecția servește lecției, nu măsoară performanța tipică a modelului AI.

**Slide-urile 24–25 — fără clarificări.** Promptul integral cere o specificație pornind doar de la cererea administrației. A doua încercare introduce pragul „< 2 secunde” pentru încărcarea paginii și, după „Rezolvat”, o cerere de reluare și închiderea automată dacă studentul nu reacționează în trei zile. Studenții pot observa că și Q1 are 2 secunde: valoarea coincide, dar operația măsurată, comparația și condițiile diferă. Același răspuns furnizează fragmentele de pe slide-ul 10 (identificatorul unic, confirmarea prin email/mesaj și 99% timp de funcționare). Modelul AI nu primise R1–R4 sau Q1: întrebăm ce trebuie confirmat, nu îl acuzăm că a încălcat reguli necunoscute. Prima încercare introduce alte detalii neconfirmate, inclusiv verificarea în 24 de ore.

**Slide-urile 26–27 — analiza clarificată.** Un context nou primește cererea, R1–R4, Q1 și excluderile, fără răspunsul inițial sau soluția profesorului. Instrucțiunea exactă este pe slide. Primul analist AI păstrează numerele din Q1, dar omite rețeaua campusului și intervalul de la acțiunea în browser până la afișarea stării. Și a doua analiză AI are aceste omisiuni. Cerem un exemplu de măsurare diferită, apoi refacerea cerinței pe hârtie. Măsurarea doar a timpului serverului nu ar verifica acordul original.

**Slide-urile 28–29 — revizuirea.** Evaluatorul (agent AI de revizuire) primește sursa și răspunsul integral al primului analist AI într-un context separat, fără corecția profesorului și fără sarcina analistului AI. Pe slide-ul 28 studenții prezic dacă revizuirea va semnala condițiile restabilite. Prima revizuire confirmă corect pragul numeric, dar nu observă cele două condiții dispărute. Tabelul și decizia de a restabili condițiile sunt analiza profesorului, separată de citatul AI. Nici a doua revizuire nu identifică aceste două omisiuni, deși discută alte aspecte ale lui Q1.

Nu prezentăm revizuirea ca integral greșită: ea observă util că „afișează confirmarea” nu garantează explicit afișarea numărului și a stării. Lecția este că o constatare corectă sau o revizuire utilă poate rămâne incompletă. La curs se folosesc numai slide-urile, fără rulări live.

## Dacă discuția ocupă mai mult timp

- La minutul 35 începeți etapa exemplelor. Folosiți R3 ca sinteză a discuției despre cele două politici și prezentați pe scurt tabelul tipurilor de cerințe.
- La minutul 65 treceți la etapa capturilor AI; răspunsurile exercițiului în perechi se discută în cele 9 minute deja rezervate. Pe Q1 păstrați distincția dintre prag și medie.
- Absorbiți întâi depășirile în cele 3 minute de întrebări ale etapei capturilor AI. Prompturile sunt de citit și explicat pe scurt; cele trei comparații sunt locul principal al discuției. Păstrați exercițiul final și justificările studenților.

La final, notați unde s-a ajuns la minutele 35, 65 și 90 și ce distincție a cerut cele mai multe clarificări. Aceste observații vor calibra cursurile următoare; numărul de slide-uri singur nu măsoară încărcarea.
