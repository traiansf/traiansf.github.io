# Ghid pentru profesor — Cursul 3: Formularea problemei și cerințe

Prezentarea [03-cerinte.md](03-cerinte.md) are **30 de slide-uri cu tot cu copertă**, pentru 100 de minute. Enunțurile, prompturile, fragmentele AI discutate și comparațiile cu sursa sunt pe slide-uri; studenții folosesc numai coli albe și un pix. Acest document este pentru pregătirea profesorului.

## Ajustarea după Cursul 2

Feedbackul titularului din 10 octombrie 2026: studenții au participat bine, au dat exemple și au comentat, dar materialul a fost prea mult pentru 100 de minute. A fost parcurs aproape integral, într-un ritm prea rapid. Pentru Cursul 3, titularul a propus aproximativ 30 de slide-uri. Nu este necesară recuperarea unei secțiuni întregi din Cursul 2.

Reducerea de la 45 la 30 de slide-uri, incluzând coperțile, este însoțită de restrângerea obiectivelor: separarea informațiilor convenite de ipoteze și propuneri, delimitarea problemei și formularea unor cerințe verificabile. Nu comprimăm vechiul volum în slide-uri mai dense. Studenții au timp să formuleze și să argumenteze răspunsuri; exemplele lor fac parte din bugetul întâlnirii.

La cererea titularului, demo-ul folosește acum **răspunsuri AI reale**, inclusiv pentru greșelile discutate. Pentru a păstra cele 30 de slide-uri, tabelul care relua rezolvarea exercițiului în perechi a fost eliminat; răspunsurile rămân în notele exercițiului. Etapa finală de revizuire are trei perechi prompt–răspuns. Exercițiul separat despre redeschidere și lista de predare au fost înlocuite de acest parcurs; redeschiderea rămâne exclusă în enunț.

## Parcurs și repere

Numerele includ coperta generată automat. Nu planificați două minute pentru fiecare slide; unele sunt tranziții, altele rămân pe ecran pe durata unei activități.

| Interval | Slide-uri | Activitate și timp de discuție |
|---|---|---|
| 0–15 | 1–5 | Deschidere scurtă, citat, 7 min pentru analiza cererii și răspunsuri; problema, obiectivul și părțile interesate. |
| 15–35 | 6–12 | Limite și surse; 4 min pentru clasificarea unor afirmații AI reale, 4 min pentru două politici privind sesizările repetate. |
| 35–65 | 13–20 | Cerințe și exemple; 9 min de lucru în perechi, 3 min pentru sesizări repetate, 4 min pentru pragul de timp. |
| 65–90 | 21–27 | Tranziție și trei prompturi: 7 min; trei comparații cu răspunsurile: câte 5 min; 3 min pentru întrebări. |
| 90–100 | 28–30 | 7 min pentru transferul la înscrierea la consultații și discutarea răspunsurilor; 3 min de încheiere. |

Reperele cumulative sunt în notele tranzițiilor și în marcajele `.pace`. Duratele exercițiilor includ discutarea răspunsurilor; nu adăugați încă o etapă de corectare după fiecare durată anunțată.

## Exemplul principal

[Enunțul consolidat](scenarios/03-sesizari/brief.md) și [raționamentul de referință](scenarios/03-sesizari/reference.md) susțin pregătirea. Scenariul, răspunsurile administrației și loturile de măsurători sunt didactice. **Răspunsurile AI și revizuirile sunt capturi reale**, nu texte redactate pentru a simula un model. Loturile de timp nu sunt rezultate ale unor execuții.

Răspunsurile administrației se dezvăluie progresiv. Pe primul exercițiu acceptați întrebările utile chiar dacă ating o funcție pe care o vom exclude ulterior. Nu evaluați întrebările și ipotezele inițiale prin reguli pe care studenții nu le-au primit încă.

Pentru R3, permiteți discutarea ambelor politici înainte să arătați acordul asupra sesizărilor separate. Legătura importantă: alegerea schimbă rezultatul cerut și drepturile de consultare. Pentru Q1, distingeți timpul de afișare de timpul de actualizare de către personal și de timpul reparației; pragul numeric vine abia după această clarificare.

## Revizuirea și rolurile AI

[Arhiva capturilor din 10 octombrie 2026](scenarios/03-sesizari/captures/2026-10-10/README.md) păstrează șase încercări: două inițiale, două de analiză cu reguli și două de revizuire. Toate folosesc Claude Code 2.1.294, model declarat `claude-haiku-4-5`, contexte noi, fără unelte, fără configurația și fișierele proiectului. Intrările exacte, răspunsurile integrale și metadatele sunt păstrate. Temperatura nu este raportată; nu a fost setat explicit un nivel de efort. Selecția servește lecției, nu măsoară performanța tipică a modelului.

**Slide-urile 22–23 — fără clarificări.** Promptul integral cere o specificație pornind doar de la cererea administrației. A doua încercare introduce sub două secunde pentru încărcarea paginii și, după „Rezolvat”, o cerere de reluare și închiderea automată dacă studentul nu reacționează în trei zile. Studenții pot observa că și Q1 are 2 secunde: valoarea coincide, dar operația măsurată, comparația și condițiile diferă. Același răspuns furnizează fragmentele de pe slide-ul 9 (identificatorul unic, confirmarea prin email/mesaj și 99% timp de funcționare). Modelul nu primise R1–R4 sau Q1: întrebăm ce trebuie confirmat, nu îl acuzăm că a încălcat reguli necunoscute. Prima încercare introduce alte detalii neconfirmate, inclusiv verificarea în 24 de ore.

**Slide-urile 24–25 — analiza clarificată.** Un context nou primește cererea, R1–R4, Q1 și excluderile, fără răspunsul inițial sau soluția profesorului. Instrucțiunea exactă este pe slide. Analistul 1 păstrează numerele din Q1, dar omite rețeaua campusului și intervalul de la acțiunea în browser până la afișarea stării. Și a doua analiză are aceste omisiuni. Cerem un exemplu de măsurare diferită, apoi refacerea cerinței pe hârtie. Măsurarea doar a timpului serverului nu ar verifica acordul original.

**Slide-urile 26–27 — revizuirea.** Evaluatorul (agent AI de revizuire) primește sursa și răspunsul integral al analistului 1 într-un context separat, fără corecția profesorului. Prima revizuire confirmă corect pragul numeric, dar nu observă cele două condiții dispărute. Tabelul și decizia de a restabili condițiile sunt analiza profesorului, separată de citatul AI. Nici a doua revizuire nu identifică aceste două omisiuni, deși discută alte aspecte ale lui Q1.

Nu prezentăm revizuirea ca integral greșită: ea observă util că „afișează confirmarea” nu garantează explicit afișarea numărului și a stării. Lecția este că o constatare corectă sau o revizuire utilă poate rămâne incompletă. La curs se folosesc numai slide-urile, fără rulări live.

## Dacă discuția ocupă mai mult timp

- La minutul 35 începeți etapa exemplelor. Folosiți R3 ca sinteză a discuției despre cele două politici, fără a mai cere un tur de răspunsuri la tabelul tipurilor de cerințe.
- La minutul 65 treceți la demo; răspunsurile exercițiului în perechi se discută în cele 9 minute deja rezervate. Pe Q1 păstrați distincția dintre prag și medie.
- Absorbiți întâi depășirile în cele 3 minute de întrebări ale demo-ului. Prompturile sunt de citit și explicat pe scurt; cele trei comparații sunt locul principal al discuției. Păstrați exercițiul final și justificările studenților.

La final, notați unde s-a ajuns la minutele 35, 65 și 90 și ce distincție a cerut cele mai multe clarificări. Aceste observații vor calibra cursurile următoare; numărul de slide-uri singur nu măsoară încărcarea.
