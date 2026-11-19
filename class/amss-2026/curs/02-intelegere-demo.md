# Exemplu pregătit pentru Cursul 2 — Înțelegem înainte de a delega

Ghid pentru profesor; nu se distribuie studenților. Etapa „Delegăm și verificăm” ocupă minutele 60–85: 6 minute de introducere despre delegare și predarea sarcinii, apoi 19 minute pentru exemplul pregătit. Totul este inclus în `02-intelegere.md`: profesorul afișează slide-urile, fără rulări live, calculator personal sau autentificare în instrumente AI. Studenții folosesc coli albe, fără dispozitive sau fișe. Demonstrațiile live pot fi folosite la laborator.

## Lecția AI a cursului

Decizia din 19 noiembrie 2026 (`../docs/ai-lessons-and-lab-diagrams.md`) dă fiecărui curs altă lecție despre folosirea AI, în alt format. Lecția Cursului 2: **agentul AI completează golurile pe care nu le-ați observat.** O cerere incompletă primește un răspuns la fel de sigur ca una completă; deciziile pe care beneficiarul nu le-a luat (durate, limite, amenzi, termene, prioritate) apar în răspuns ca fapte și rămân invizibile dacă nu le căutăm. Formatul: două prompturi alăturate, solicitarea simplă și solicitarea cu R1–R6; studenții listează „ce a hotărât agentul AI în locul nostru?”. Nu folosim aici perechea analist–evaluator.

Segmentul precedent (proiectare și revizuire `gpt-6.1-sol`, capturi din 7 octombrie 2026) a fost înlocuit; capturile lui rămân arhivate în `scenarios/02-biblioteca/captures/2026-10-07/`.

## Capturile folosite

[Arhiva din 19 noiembrie 2026](scenarios/02-biblioteca/captures/2026-11-19/README.md): șase rulări reale prin Claude Code 2.1.328, model `claude-haiku-4-5`, câte trei pentru fiecare prompt, fiecare într-un context nou, fără unelte. Prompturile sunt în `scenarios/02-biblioteca/ai/` și, identice, lângă răspunsuri. Selecția: promptul A, rularea 2; promptul B, rulările 2 și 1. Toate încercările sunt păstrate, cu motivul selecției; selecția nu descrie comportamentul tipic al modelului.

Etapa următoare („Revedem deciziile și sintetizăm”) folosește în continuare capturile din 9 octombrie 2026 (titlu = exemplar). Este tot o decizie luată în locul nostru, de data aceasta greșită; notele leagă cele două etape.

## Parcurs (minutele 60–85)

| Minute | Slide | Ce se întâmplă |
|---|---|---|
| 60–66 | „Delegăm și verificăm”, „AI poate accelera aceste activități”, „Proiectăm înainte de a implementa”, „Ce conține o predare utilă a sarcinii?” | Introducerea delegării; ultima frază („lasă aceste decizii implicite”) pregătește exemplul. |
| 66–69 | „Două prompturi, aceeași sarcină” | Promptul A integral, promptul B descris. Predicții pe tablă. |
| 69–72 | „Răspunsul la promptul A: membri și împrumuturi” | Individual: lista deciziilor luate în locul bibliotecii. |
| 72–76 | „Răspunsul la promptul A: cereri și întârzieri” | Continuarea listei; pentru fiecare decizie, cine ar trebui s-o ia. Lista clasei. |
| 76–79 | „Ce a hotărât agentul AI în locul nostru” | Comparația noastră cu R1–R6. |
| 79–83 | „Același prompt, cu R1–R6” | Individual, apoi răspunsuri: ce are sursă în R1–R6 și ce este tot hotărât de agentul AI. |
| 83–85 | „Decizia noastră: deciziile ascunse devin întrebări” | Decizia și ce reținem. |

## Răspunsuri așteptate

**Predicții (66–69).** Orice listă cu durate, limite, amenzi, notificări sau ordinea cererilor este bună; scrieți 3–4 pe tablă și reveniți la ele.

**Răspunsul la promptul A (69–76).** Decizii de găsit în fragmente: cont activ/inactiv; abonament care expiră; limită de cărți împrumutate simultan; scadență „implicit 14-30 zile”; fereastră de 48 de ore pentru ridicare; penalități, blocaj, taxă, suspendarea contului; ordinea FIFO; prioritate opțională pentru membrii cu mai puține întârzieri. Toate sunt reguli ale bibliotecii: le hotărăște bibliotecara; echipa le poate propune. Ordinea FIFO este o alegere plauzibilă, dar tot o alegere: solicitarea nu spune cum se servesc cererile. Acceptați și alte observații întemeiate, de exemplu „exemplare > 0”: agentul AI a hotărât că o carte are mai multe exemplare, ceea ce solicitarea nu spune (R1 o confirmă ulterior).

**Comparația noastră (76–79).** Fiecare decizie față de R1–R6: nicio durată; R2 nu limitează împrumuturile; R1 nu menționează abonamente; R6 exclude amenzile și prelungirile; R6 păstrează rezervarea până la ridicare; R5 cere numai ordinea înregistrării. Toate cele trei rulări cu promptul A au fixat o scadență, o limită și penalități și au trimis notificări: repetarea nu face din ele regulile bibliotecii. Subliniați că am comparat cu R1–R6 pentru că le cunoaștem acum; la momentul solicitării, fiecare rând era o întrebare pentru bibliotecară.

**Promptul B (79–83).** Prima propoziție a rulării 2 („fără notificări, amende, expirare sau autentificare”) este susținută de R6. „Marcă temporală” este o alegere de reprezentare: R6 cere ordinea procesării; o marcă temporală o păstrează numai dacă două cereri nu primesc aceeași valoare. „Împrumut imediat” (rularea 1) este o regulă nouă: R4 respinge cererea pentru un titlu cu exemplar disponibil, iar împrumutul (R2) privește un exemplar ales. Lista s-a scurtat mult, dar nu a dispărut.

**Decizia (83–85).** Deciziile din răspunsul la A devin întrebări pentru bibliotecară; aici R2, R5 și R6 au răspuns deja. Din B păstrăm ce are sursă; marca temporală rămâne propunere; „împrumut imediat” nu îl preluăm. Lista „ce a hotărât în locul nostru?” este o verificare pe care o facem fără alt agent AI.

Exercițiul final are o întrebare legată de această lecție („Numiți o decizie pe care un agent AI ar lua-o în locul bibliotecarei, dacă primește numai solicitarea ei. Cine trebuie s-o ia?”).

## Dacă discuția ocupă mai mult timp

- Comprimați introducerea (minutele 60–66) la „AI poate accelera” și „Ce conține o predare utilă”; păstrați cele două slide-uri cu răspunsul la promptul A și lista clasei.
- La comparația noastră, citiți doar rândurile pe care clasa nu le-a găsit.
- Treceți la „Revedem deciziile și sintetizăm” la minutul 85.

## Verificare înainte de curs

- Fiecare exercițiu poate fi rezolvat doar din proiecție, pe o coală albă.
- Regulile și scenariile din prezentare și enunț sunt coerente.
- Citatele corespund capturilor, iar explicațiile profesorului sunt distincte.
- Toate slide-urile sunt lizibile în HTML și PDF.
- Nu sunt necesare rulări live, fișe, descărcări sau autentificări în instrumente AI.

Vechiul exemplu construit din `fallback/02-intelegere-fallback.md` rămâne doar un material separat de contrast, cu eticheta sa originală; nu este sursa capturilor actuale și nu trebuie deschis la curs.
