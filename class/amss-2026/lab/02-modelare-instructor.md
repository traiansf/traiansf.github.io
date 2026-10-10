# Laboratorul 2 — ghid pentru profesor

**100 de minute, după cursurile 3–4; 14 slide-uri cu copertă.** Exersăm cerințe, identitate, relații și verificarea modelului prin exemple. Lucrăm în perechi sau trio, cu schimbarea colegului care propune și a celui care cere justificări. Schițele sunt suportul discuției; nu există predare obligatorie, încărcare, rubrică de documente sau notă separată pentru această activitate.

Materiale: [prezentare](02-modelare.md), [scenariu](scenarios/02-modelare/scenario.md), [sprijin facultativ pentru discuție](scenarios/02-modelare/worksheet.md), [capturi pregătite](scenarios/02-modelare/prepared-fixture.md). Fișa poate fi consultată pe calculator sau tipărită. Hârtia și conversația sunt suficiente; nu rezervăm timp pentru configurări. Dacă un instrument AI nu funcționează, perechile folosesc captura sau cer colegilor aceeași verificare.

## Ritmul întâlnirii

| Minute | Activitate | Intervenția profesorului |
|---|---|---|
| 0–10 | Citat, reflecție inițială, comparație A17/A18 și J1–J3. | Cereți un exemplu de informație pierdută. |
| 10–35 | Citirea regulilor, schiță și explicații cu roluri schimbate. | „De ce este responsabilul legat aici?” |
| 35–55 | Două perechi își explică reciproc modelele. | Invitați colegul să interpreteze primul schița. |
| 55–80 | Comparație cu AI sau captura pregătită; revizuire. | Cereți să se distingă o alegere de o cerință. |
| 80–100 | Maximum doi responsabili per vizită; discuție finală. | Ascultați două sau trei explicații, fără prezentări formale. |

## Modelul de referință

Analiză a profesorului, nu output AI. Aparatul este un lucru fizic cu identitate stabilă; vizita este o ocazie distinctă în istoricul lui. Problema raportată aparține vizitei și nu este diagnosticul sau o proprietate care o înlocuiește permanent pe cea anterioară a aparatului. Responsabilul se asociază vizitei, nu doar aparatului.

| Relație | Număr permis |
|---|---|
| Aparat → vizite | Zero sau mai multe. |
| Vizită → aparat | Exact unul. |
| Vizită → probleme raportate | Una sau mai multe. |
| Problemă raportată → vizită | Exact una. |
| Vizită → voluntar responsabil | Zero sau unul, înainte de schimbarea finală. |
| Voluntar → vizite | Zero sau mai multe. |

La înregistrarea J2 pentru A17, J1, P1 și asocierea J1–Mara rămân; J2 are P2 și Radu. P1 nu se copiază automat. J3 pentru A18 poate exista fără responsabil. P1 și P3 sunt distincte, deși textele coincid. Nu deducem aparate egale din modelul T2 și nici voluntari egali din nume.

Sunt acceptabile cuvinte, tabele sau diagrame care exprimă aceste distincții. „Original” și relația de sursă de la cursul 4 nu se transferă aici. Nu cereți clase, scheme SQL, operații cu pre/postcondiții sau teoria responsabilităților din cursul 5. Dacă o pereche termină devreme, poate încerca o vizită cu două probleme sau un aparat încă fără vizite.

## Comparația cu AI

Instrucțiunea analistului AI și un fragment real sunt pe slide-ul 10; arhiva conține contextul complet. Analistul AI 01 propune o identitate de forma (cod vizită + ordine). R3 nu o impune: este o posibilă reprezentare, cu condiții de unicitate și stabilitate, nu o încălcare automată. O ordine de afișare modificabilă nu trebuie confundată cu identitatea.

Evaluatorul (agent AI de revizuire) 02 primește regulile, sarcina exactă și răspunsul integral într-un context nou. Observă corect că formatul nu este specificat de context. Selectăm această observație pe slide-ul 11, apoi perechile explică ce aleg și de ce. Nu cerem un număr de defecte sau transcrierea conversației AI. Arhiva păstrează și prima revizuire, înlocuită după corectarea transmiterii diacriticelor și completarea inputului cu sarcina exactă.

## Schimbarea și încheierea

La minutul 80 convenim explicit zero până la doi voluntari responsabili de aceeași vizită. J2 îi poate asocia pe Mara și Radu, în timp ce J1 rămâne legată de Mara. Un al treilea responsabil ar depăși noua limită. Nu cerem cod sau migrarea unei baze de date.

Încheiați cu exemple din două sau trei perechi: o neînțelegere, un caz care a clarificat modelul, o sugestie AI acceptată sau respinsă. Notați pentru pregătirea următoare dificultățile recurente. Nu colectați fișe individuale; eventualele notițe rămân studenților. Dacă ritmul întârzie, reduceți citirea în plen și numărul prezentărilor, păstrând comparația între colegi și conversația finală.
