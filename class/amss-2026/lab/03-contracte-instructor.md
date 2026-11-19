# Laboratorul 3 — ghid pentru profesor

**100 de minute, după cursurile 5–6; 16 slide-uri cu copertă.** [Prezentarea](03-contracte.md), [enunțul](scenarios/03-contracte/scenario.md), [specificația diagramei](diagrame/clase-operatii.md), [referința](scenarios/03-contracte/reference.md) și [sprijinul facultativ](scenarios/03-contracte/worksheet.md) alcătuiesc pachetul. Prima jumătate formulează responsabilitățile și contractele, individual, apoi în plen; a doua este etapa diagramei (decizia din 19 noiembrie 2026): fiecare student desenează **o diagramă de clase cu operații și restricții**, de mână, în Mermaid sau generată cu un asistent AI și verificată. Exercițiile nu cer documente de predat, încărcări, o notă separată sau implementare.

Etapa AI condusă de profesor (o analiză și o revizuire în plen, cu capturile Claude Haiku 4.5 din 27 octombrie 2026) a fost scoasă din prezentare la 19 noiembrie 2026. Promptul, contextul și capturile rămân neschimbate în [`ai/`](scenarios/03-contracte/ai/README.md), [capturile pregătite](scenarios/03-contracte/prepared-fixture.md) și [arhivă](scenarios/03-contracte/captures/2026-10-27/README.md). Confuzia din analiza 01 (identificatorul nefolosit, q>0 și D≥q trecute la precondiții) este exact greșeala de urmărit la diagramele generate.

## Parcurs

| Minute | Slide-uri | Activitate | Intervenția profesorului |
|---|---|---|---|
| 0–10 | 2–4 | Problema, citatul și recapitularea. | Clarificați fizic, rezervat activ, disponibil. |
| 10–18 | 5–6 | Scenariile S1 și S2; cine verifică regula: fiecare canal sau registrul comun? | „Poate importul ocoli regula?” |
| 18–30 | 7–8 | Contractul rezervării: individual, apoi în plen. | Cereți întregul registru după refuz. |
| 30–42 | 9 | Ridicarea și anularea, scenariile S3–S5. | „De ce nu putem reda cele 4 bucăți?” |
| 42–50 | 10 | Două operații succesive și ramura cu identificatorul reutilizat. | Colegul care verifică privește primul efectul limitat. |
| 50–55 | 11–12 | Sarcina diagramei; fiecare deschide specificația și își alege modul de lucru. | Amintiți că un desen fără erori nu este o verificare. |
| 55–71 | 13 | Lucru individual, cu lista de verificare pe ecran. | Treceți printre bănci; alegeți unul sau doi voluntari. |
| 71–87 | 14 | Verificarea în plen a diagramei unui voluntar; scenariul S5 calculat numai din note; corecturi. | „Ce spune nota pentru o rezervare deja ridicată?” |
| 87–95 | 15 | Diagrama convenită și comparația cu referința. | Arătați referința după ce clasa a convenit corecturile. |
| 95–100 | 16 | Încheiere. | Două sau trei exemple scurte. |

Studenții lucrează individual, apoi explică în plen: un voluntar explică, iar alt coleg verifică, fără prezentări formale (observația din 6 noiembrie 2026). Nu cereți teoria diagramelor de stări, a concurenței sau a validării exhaustive. Dacă prima jumătate întârzie, scurtați exercițiul cu două operații succesive la primul punct; nu tăiați din etapa diagramei sub 40 de minute.

## Răspunsuri și dificultăți de urmărit

Starea inițială **I**: F=10, A activă(4), R=4, D=6. Identificatorul B este nefolosit, deci disponibil pentru o rezervare nouă. Majoritatea scenariilor repornesc din I; continuările sunt marcate explicit.

| Scenariu | Rezultat |
|---|---|
| S1: rezervare B=6 | Acceptată; F=10, R=10, D=0; A rămâne activă(4). |
| S2 și S7: rezervare B=7 sau B=0 | Refuz; exact I. |
| S3: ridicare A | F=6, R=0, D=6; A ridicată(4). |
| S4: anulare A | F=10, R=0, D=10; A anulată(4). |
| S5: ridicare A, apoi anulare A | Primul pas ca mai sus; al doilea refuză și păstrează acea stare. |
| S6 (din I): anulare A, apoi reutilizarea identificatorului A | Prima acceptată; a doua refuzată, istoricul se păstrează. |

F este cantitatea fizică, R suma rezervărilor active, D=F−R. Invarianți: 0≤R≤F≤10; D≥0; identificatori unici și cantități pozitive. Dacă introducem P drept suma cantităților ridicate, F+P=10. Un invariant precum D≥0 nu specifică singur efectul corect al ridicării. `ridică(A)` înseamnă ridicarea produselor rezervate prin A, nu ștergerea rezervării.

Contractele trebuie să separe precondițiile din R1 (context: apeluri secvențiale, registru valid, identificator nevid, cantitate întreagă) de condiția de succes; postcondițiile descriu fiecare caz, succesul și refuzul. O cantitate zero sau prea mare are refuz explicit; la fel ridicarea sau anularea cu un identificator necunoscut (diferență față de precondiția identificatorilor cunoscuți din cursul 6). La succes modificăm doar rezervarea vizată și cantitățile indicate; la refuz păstrăm registrul **integral**, inclusiv istoricul.

**Exercițiul cu două operații:** din A activă(4), B activă(6), F=10, R=10, D=0, anularea lui A produce F=10, R=6, D=4; ridicarea ulterioară a lui B produce F=4, R=0, D=4. În ramura separată pornită imediat după anularea lui A, reutilizarea identificatorului A se refuză (D=4 ar ajunge, deci refuzul vine numai din istoric) și păstrează exact acea stare.

## Etapa diagramei

**Ce primesc studenții:** enunțul și [specificația](diagrame/clase-operatii.md), care pornește de la [diagrama conceptuală](diagrame/clase-conceptuale.md) a Laboratorului 2 și adaugă: operații cu parametri și rezultate, puse la componenta care are responsabilitatea lor; dependențe „apelează” de la canale; atribute derivate (`/D`); note care încep cu `pre:`, `succes:`, `post:`, `refuz:`, `inv:`. Are listă de verificare, erori frecvente, un exemplu rezolvat (abonamente la o sală de escaladă) și un prompt sugerat.

**Cum lucrează:** fiecare alege. De mână, pornind de la contractele din prima jumătate; direct în Mermaid; sau cu un asistent AI, căruia îi dă enunțul complet și specificația. Nu impunem un instrument și nu cerem conturi AI.

**Puncte de control:**

- **Minutul 55:** toți au început; cine nu știe de unde să pornească desenează Registru și Rezervare, apoi cele trei operații.
- **Minutul 65:** alegeți voluntarii; de preferință o diagramă de mână și una generată.
- **Minutul 71:** verificarea în plen, pe listă. Un coleg calculează scenariul S5 numai din notele diagramei: o notă incompletă nu dă rezultatul celui de-al doilea pas. Dacă nu se oferă nimeni, verificați o diagramă scrisă de dumneavoastră cu „pre: q ≤ D”.
- **Minutul 87:** clasa convine corecturile; abia apoi arătați referința.

**Ce urmăriți (greșeli ale studenților):**

- „pre: q ≤ D”, „pre: id nefolosit” sau „pre: rezervarea este activă”: refuzul promis rămâne nespecificat;
- refuz fără „registrul neschimbat”;
- „inv: celelalte rezervări nu se modifică”: este postcondiție;
- „inv: D > 0”: încălcat după S1;
- `ridică()` la Rezervare, care nu poate modifica F; operații dublate la Registru și Rezervare;
- verificări copiate în Formular și Import; `setF()` publice;
- postcondiții vagi („registrul se actualizează”, „stare validă”);
- R și D stocate fără invariant care să le lege de F și de rezervări.

**Ce urmăriți la diagramele generate cu AI:** aceeași confuzie precondiție/condiție de succes ca în captura din 27 octombrie; tipuri `boolean`/`void` sau excepții în loc de `refuz`; clase `Service`/`Repository`/`Controller`; invarianți care includ efectul limitat; citate din enunț care nu spun ce li se atribuie. Lăudați și ce este corect, cu regula lui.

**Referința** este justificată punct cu punct în [referință](scenarios/03-contracte/reference.md). Atributul `marcaj` (activă, ridicată, anulată) urmează verbul enunțului; evită „stare”, care în acest laborator numește valorile întregului registru. Variante acceptabile: R și D păstrate ca atribute obișnuite, cu invarianți; câte o notă pentru fiecare operație; `stare` în loc de `marcaj`, dacă nu se confundă cu starea registrului.

**Limitele Mermaid** (detalii în specificație): notele se leagă de clase, nu de operații, deci fiecare notă începe cu numele operației; nu există secțiuni pentru precondiții sau postcondiții; rezultatele cu spații se rup pe rânduri (scrieți `acceptat|refuz`). Pe proiector, notele diagramei de referință sunt mici: studenții o pot deschide mărită în prezentarea HTML sau în referință.

Nu impuneți rescrierea printr-un nou prompt; corecturile se fac direct pe diagramă. Nu colectați diagrame sau fișe. Notați numai dificultățile recurente pentru pregătirea următoare.

## Varianta online

[Prezentarea online](03-contracte-online.md) păstrează cele 16 slide-uri, regulile, scenariile, specificația și toate duratele. Întâlnirea Teams se desfășoară numai în plen, fără grupuri separate:

- Predicțiile individuale se scriu în chat și se trimit la semnal.
- Explicațiile se dau în ștafetă: un coleg propune, un coleg numit verifică regula și continuă cu următoarea operație; obiecțiile se scriu în chat.
- **Etapa diagramei:** linkurile enunțului și specificației se pun în chat. Voluntarul își partajează ecranul sau lipește diagrama în chat ca text Mermaid; oricine o poate vedea desenată în [Mermaid Live](https://mermaid.live). Colegi numiți o verifică punct cu punct și calculează S5 din note; ceilalți scriu „de acord” sau o obiecție. Diagrama convenită se poate scrie ca text Mermaid în chat, corectat de un coleg, înainte de referință.
- Notițele și diagramele nu se colectează; camera și partajarea ecranului de către studenți sunt facultative.

Profesorul sau un student poate prezenta slide-urile. Nu faceți push pe `main` în timpul întâlnirii sincronizate: deploy-ul repornește serviciul. Dacă discuția online cere mai mult timp, ascultați mai puține explicații în prima jumătate, păstrând verificarea unei diagrame la jumătatea etapei.
