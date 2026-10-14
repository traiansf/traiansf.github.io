# Laboratorul 2 — ghid pentru profesor

**100 de minute, după cursurile 3–4; 14 slide-uri cu copertă.** Exersăm cerințe, identitate, relații și verificarea modelului prin exemple. Lucrăm în perechi sau trio, cu schimbarea colegului care propune și a celui care cere justificări. Schițele sunt suportul discuției; nu există predare obligatorie, încărcare, rubrică de documente sau notă separată pentru această activitate.

Materiale: [prezentare](02-modelare.md), [scenariu](scenarios/02-modelare/scenario.md), [sprijin facultativ pentru discuție](scenarios/02-modelare/worksheet.md), [capturi pregătite](scenarios/02-modelare/prepared-fixture.md). Scenariul și sprijinul pentru discuție pot fi consultate pe calculator sau tipărite. Hârtia și conversația sunt suficiente; nu rezervăm timp pentru configurări. Dacă un instrument AI nu funcționează, perechile folosesc captura sau cer colegilor aceeași verificare.

## Ritmul întâlnirii

| Minute | Activitate | Intervenția profesorului |
|---|---|---|
| 0–10 | Citat, reflecție inițială, comparație A17/A18 și J1–J3. | Cereți un exemplu de informație pierdută și o întrebare pentru organizatori. |
| 10–35 | Citirea regulilor, schiță și explicații cu roluri schimbate. | „De ce este responsabilul legat aici?” |
| 35–55 | Două perechi își explică reciproc modelele. | Colegii care nu au desenat schița aleg un caz și o interpretează primii. |
| 55–80 | Comparație cu AI sau captura pregătită; revizuire. | Cereți să se distingă o alegere de reprezentare de o cerință. |
| 80–100 | Maximum doi responsabili per vizită; discuție finală. | Ascultați două sau trei explicații, fără prezentări formale. |

## Modelul de referință

Analiză a profesorului, nu un răspuns AI. Aparatul este un lucru fizic cu identitate stabilă; vizita este o ocazie distinctă în istoricul lui. Problema raportată aparține vizitei; nu este un diagnostic confirmat și nici o proprietate a aparatului, suprascrisă la fiecare vizită. Responsabilul se asociază vizitei, nu aparatului (R5).

| Relație | Număr permis |
|---|---|
| Aparat → vizite | Zero sau mai multe. |
| Vizită → aparat | Exact unul. |
| Vizită → probleme raportate | Una sau mai multe. |
| Problemă raportată → vizită | Exact una. |
| Vizită → voluntar responsabil | Zero sau unul, înainte de schimbarea finală. |
| Voluntar → vizite | Zero sau mai multe. |

La înregistrarea J2 pentru A17, J1, P1 și asocierea J1–Mara rămân; J2 are P2 și Radu. P1 nu se copiază automat. J3 pentru A18 poate exista fără responsabil. P1 și P3 sunt distincte, deși textele coincid. Nu deducem că A17 și A18 sunt același aparat din modelul comun T2, nici că doi voluntari sunt aceeași persoană din nume.

Sunt acceptabile cuvinte, tabele sau diagrame care exprimă aceste distincții. „Original” și relația de sursă de la cursul 4 nu se transferă aici. Nu cereți clase, scheme SQL, operații cu pre/postcondiții sau teoria responsabilităților din cursul 5. Dacă o pereche termină devreme, poate verifica, pe schița celeilalte, și revenirea: cine răspundea de J1 după înregistrarea lui J2.

La comparația între perechi, B alege unul dintre cazurile afișate și îl explică folosind schița lui A. A ascultă, apoi clarifică. Repetați cu schița lui B și rolurile inversate. Verificați sensul relațiilor, nu convenția grafică. La cazul A19, modelul trebuie să admită un aparat înregistrat fără vizite (R2); la cazul J4, două probleme distincte pentru aceeași vizită, chiar dacă datele inițiale aveau doar câte una.

## Comparația cu AI

Instrucțiunea analistului AI și un fragment real sunt pe slide-ul 10; arhiva conține contextul complet. Pentru rulări proprii folosiți R1–R6 și datele inițiale; schimbarea la doi responsabili se introduce abia la minutul 80. Analistul AI 01 propune o identitate de forma (cod vizită + ordine). R3 nu o impune: este o alegere de reprezentare posibilă, cu condiții de unicitate și stabilitate, nu o încălcare automată. O ordine de afișare modificabilă nu trebuie confundată cu identitatea.

Evaluatorul (agent AI de revizuire) 02 primește regulile, sarcina exactă și răspunsul integral într-un context nou. Observă corect că formatul nu este specificat și că datele nu spun dacă P1–P3 sunt coduri globale sau locale vizitei, apoi întreabă de ce nu se folosește un cod global. Selectăm această observație pe slide-ul 11. Acceptăm nevoia de a explica alegerea; întrebarea nu face obligatoriu codul global. Un număr local unic și stabil, împreună cu codul vizitei, poate respecta aceleași reguli. Perechile precizează ce aleg și de ce.

Sarcina de revizuire de pe slide este pentru activitatea studenților; instrucțiunea arhivată este în capturile pregătite. Nu cerem un număr de defecte sau transcrierea conversației AI. Arhiva păstrează și prima revizuire, înlocuită după corectarea transmiterii diacriticelor și completarea intrării cu sarcina exactă. Dacă perechile citesc răspunsul integral, observați și că posibilitatea de a avea mai multe probleme la o vizită este cerută de R3, deși evaluatorul AI o discută sub titlul „Alegeri de design neexplicite”. Exemplul J4 o verifică.

## Schimbarea și încheierea

La minutul 80 organizatorii schimbă R4: orice vizită poate avea zero, unul sau doi responsabili. Se schimbă cardinalitatea vizită → voluntari; voluntar → vizite rămâne zero sau mai multe. Perechile formulează două exemple de acceptare succesive, în forma din cursul 3: starea inițială → cine cere ce → rezultatul observabil.

| Starea inițială | Cine cere ce | Rezultatul observabil |
|---|---|---|
| J1–Mara; J2–Radu | Un organizator cere adăugarea Marei la J2 | Acceptată: J1–Mara; J2–Mara și Radu. |
| J1–Mara; J2–Mara și Radu | Un organizator cere adăugarea Ioanei (M3) la J2 | Respinsă: asocierile ambelor vizite se păstrează. |

Precizați și ce rămâne neschimbat: aparatele, vizitele și problemele lor. Respingerea nu elimină un responsabil pentru a face loc altuia. Perechile pun o întrebare despre responsabilitatea comună: răspund amândoi de tot sau fiecare de o parte? Cine poate retrage un responsabil? Nu cerem cod, migrarea unei baze de date sau proiectarea efectuării reparației.

Încheiați cu exemple din două sau trei perechi: o neînțelegere, un caz care a clarificat modelul, o sugestie AI acceptată sau respinsă. Notați pentru pregătirea următoare dificultățile recurente. Nu colectați fișe individuale; eventualele notițe rămân studenților. Dacă ritmul întârzie, reduceți numărul răspunsurilor în plen, păstrând comparația între colegi și conversația finală.
