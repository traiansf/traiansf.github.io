# Laboratorul 3 — ghid pentru profesor

**100 de minute, după cursurile 5–6; 16 slide-uri cu copertă.** [Prezentarea](03-contracte.md), [enunțul](scenarios/03-contracte/scenario.md), [referința](scenarios/03-contracte/reference.md) și [sprijinul facultativ](scenarios/03-contracte/worksheet.md) alcătuiesc pachetul. Exercițiile nu cer documente de predat, încărcări, notă separată sau implementare.

## Parcurs

| Minute | Activitate | Intervenția profesorului |
|---|---|---|
| 0–10 | Problema, citatul și recapitularea. | Clarificați fizic, rezervat activ, disponibil. |
| 10–30 | Predicții și responsabilități în pereche. | „Poate importul ocoli regula?” |
| 30–55 | Contracte: rezervare 10 min; ridicare și anulare 15 min. | Cereți întregul registru după refuz. |
| 55–80 | O analiză AI, o revizuire și decizia, în plen. | Conduceți demonstrația; studenții prezic și verifică. |
| 80–100 | Comparație între perechi 14 min; încheiere 6 min. | Colegul care ascultă verifică primul efectul limitat. |

Reflecția individuală precede explicația în pereche; rolurile se schimbă. La comparația finală se întâlnesc două perechi, fără prezentări formale. Pentru un număr impar se poate forma un trio. Nu cereți teoria diagramelor de stări, a concurenței sau a validării exhaustive, care urmează în alte cursuri.

## Răspunsuri și dificultăți de urmărit

Starea inițială **I**: F=10, A activă(4), R=4, D=6. Codul B este disponibil pentru o rezervare nouă. Majoritatea scenariilor repornesc din I; continuările sunt marcate explicit.

| Scenariu | Rezultat |
|---|---|
| Rezervare B=6 | Acceptată; F=10, R=10, D=0; A rămâne activă(4). |
| Rezervare B=7 sau B=0 | Refuz; exact I. |
| Ridicare A | F=6, R=0, D=6; A ridicată(4). |
| Anulare A | F=10, R=0, D=10; A anulată(4). |
| Ridicare A, apoi anulare A | Primul pas ca mai sus; al doilea refuză și păstrează acea stare. |
| Anulare A, apoi reutilizarea codului A | Prima acceptată; a doua refuzată, istoricul se păstrează. |

F este cantitatea fizică, R suma rezervărilor active, D=F−R. Invarianți: 0≤R≤F≤10; D≥0; coduri unice și cantități pozitive. Dacă introducem P drept suma cantităților ridicate, F+P=10; nu avem reaprovizionare sau retururi. Un invariant precum D≥0 nu specifică singur efectul corect al ridicării. `ridica(A)` înseamnă ridicarea produselor rezervate prin A, nu ștergerea rezervării. Istoricul păstrează rezervările încheiate, codurile și cantitățile lor; nu cerem jurnalizarea fiecărui apel.

Contractele trebuie să separe R1 (apeluri seriale, registru valid, identificator nevid, cantitate întreagă) de condițiile de succes. O cantitate zero sau prea mare are refuz explicit. La fel și ridicarea/anularea cu un cod necunoscut: aceasta este o diferență explicită față de precondiția identificatorilor cunoscuți din cursul 6. La succes schimbăm doar rezervarea vizată și cantitățile indicate; la refuz păstrăm registrul **integral**, inclusiv istoricul. Disponibilul poate fi calculat sau stocat separat, dar în ultima variantă trebuie sincronizat. Nicio reprezentare nu este obligatorie.

## O singură analiză și o singură revizuire AI

Feedbackul din 27 octombrie cere o demonstrație comună, condusă de profesor; nu cereți fiecărei perechi să opereze un asistent AI. Studenții lucrează individual și între colegi în celelalte etape. Nu este necesar să aibă conturi AI.

Slide-urile conțin **capturi reale pregătite** Claude Haiku 4.5, din 27 octombrie 2026 (Claude Code 2.1.311, fără unelte și fără contextul proiectului). [Fragmentele selectate](scenarios/03-contracte/prepared-fixture.md) și [arhiva](scenarios/03-contracte/captures/2026-10-27/README.md) păstrează promptul exact, contextul, răspunsurile integrale și ambele încercări pentru fiecare rol. Analiza 01 calculează corect S2, S3 și S5, dar trece codul nou, q>0 și disponibilitatea printre precondiții, apoi le folosește ca motive de refuz. Revizuirea 02 semnalează corect lipsa efectului limitat (R5), dar acceptă precondițiile. Selecția nu descrie performanța tipică a modelului.

O rulare live poate înlocui capturile: folosiți [instrucțiunea și contextul](scenarios/03-contracte/ai/README.md) cu instrumentul disponibil al profesorului, fără a impune un model, și nu furnizați referința cu soluții. Discutați atunci rezultatul efectiv, nu omisiunile capturii.

1. **Analiză, 10 min:** cereți două predicții individuale; profesorul trimite o singură sarcină cu enunțul integral. Afișați răspunsul și comparați responsabilitatea registrului și calculul ridicării. Limitați așteptarea la două minute incluse în etapă; dacă instrumentul nu răspunde, folosiți captura pregătită. Nu treceți la configurări de conturi în timpul laboratorului.
2. **Revizuire, 10 min:** într-un context nou, transmiteți evaluatorului (agent AI de revizuire) același enunț, sarcina exactă și propunerea integrală. Cereți afirmații susținute, omisiuni și contradicții, cu fragment, regulă și scenariu; fără număr obligatoriu de defecte. Studenții prezic ce ar trebui să observe evaluatorul AI despre precondiții înainte de a vedea revizuirea. Dacă analiza a fost live și revizuirea nu răspunde, o puteți revizui între colegi în plen, etichetând corect parcursul.
3. **Decizie, 5 min:** o afirmație acceptată ori corectată, justificată prin regulă și scenariu. Un răspuns corect este suficient pentru o discuție utilă. Nu impuneți rescrierea printr-un nou prompt și nu adăugați alte rulări de analiză în paralel.

**Regulile rămân vizibile:** la afișarea rezultatului live, folosiți două ferestre alăturate, una cu slide-ul de repere și una cu răspunsul. Nu înlocuiți tot ecranul cu o conversație care nu mai arată regulile. La capturile noi, puneți fragmentele și rezumatul regulilor pe același slide, cu proveniență și omisiuni marcate. Păstrați promptul, contextul, răspunsul integral, data, instrumentul, modelul declarat și setările cunoscute; nu cereți studenților transcrieri.

## Comparația finală

Pornim cu A activă(4), B activă(6), F=10, R=10, D=0. Anularea lui A produce F=10, R=6, D=4; B rămâne activă(6). Ridicarea ulterioară a lui B produce F=4, R=0, D=4; A rămâne anulată(4). În ramura separată pornită imediat după anularea lui A, reutilizarea codului A se refuză și păstrează exact acea stare. Nu confundați ramura cu continuarea după ridicarea lui B.

## Varianta online

[Prezentarea online](03-contracte-online.md) păstrează cele 16 slide-uri, regulile, scenariile, capturile pregătite și toate duratele. Întâlnirea Teams se desfășoară numai în plen, fără grupuri separate:

- Predicțiile individuale se scriu în chat și se trimit la semnal.
- Explicațiile se dau în ștafetă: un coleg propune, un coleg numit verifică regula și continuă cu următoarea operație.
- La comparația finală, un voluntar explică, alt coleg verifică primul ce rămâne neschimbat. Notițele nu se colectează; camera și partajarea ecranului de către studenți sunt facultative.
- **Aceeași demonstrație AI este condusă de profesor**, care partajează analiza și revizuirea, păstrând regulile vizibile. Nu distribuim rolurile de operare AI între studenți și nu pornim analize proprii în paralel.

Profesorul sau un student poate prezenta slide-urile; profesorul conduce în continuare etapa AI. Nu faceți push pe `main` în timpul întâlnirii sincronizate: deploy-ul repornește serviciul. Dacă discuția online cere mai mult timp, ascultați mai puține explicații, păstrând comparația finală și toate scenariile.
