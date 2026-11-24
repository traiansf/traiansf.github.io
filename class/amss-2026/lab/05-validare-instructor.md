# Laboratorul 5 — ghid pentru profesor

**100 de minute, după cursurile 9–10; 17 slide-uri cu copertă.** [Prezentarea](05-validare.md), [enunțul](scenarios/05-validare/scenario.md), [referința](scenarios/05-validare/reference.md), [sprijinul facultativ](scenarios/05-validare/worksheet.md), [exploratorul](scenarios/05-validare/model/explorare.py) cu [rezultatele lui](scenarios/05-validare/model/rezultate.txt) și specificația [diagramei de clase cu interfață](diagrame/clase-interfata.md) alcătuiesc pachetul. Exercițiile nu cer documente de predat, încărcări, o notă separată sau implementare.

Laboratorul are formatul cu atelier de diagrame (decizia din 19 noiembrie 2026, `docs/ai-lessons-and-lab-diagrams.md`). Tipul diagramei, clase cu interfață, a fost ales de titular la 24 noiembrie 2026. Problema este alta decât la cursul 10 (exportul raportului), cum cere regula „o problemă distinctă pentru fiecare temă”; foaia de parcurs propusese inițial aceeași problemă pentru amândouă.

## Parcurs

| Minute | Activitate | Intervenția profesorului |
|---|---|---|
| 0–10 | Problema, citatul și recapitularea. | Clarificați: o explorare stabilește proprietatea pentru modelul explorat. |
| 10–19 | „Prioritarii întâi”: scenariul S2 și proprietățile. | „De ce ajunge o singură execuție?” |
| 19–24 | „Doi la rând”: explorarea cu N = 2. | „Ce putem afirma?”; nu dezvăluiți N = 3. |
| 24–34 | „Un loc în plus”: contraexemplul S3, trasat. | Cereți depășirile lui o2 după fiecare chemare. |
| 34–44 | Unde stă limita: variantele E și L; argumentul pentru orice N. | „Ce reverificați la o regulă nouă?” |
| 44–50 | Ce trece prin interfață. | „Ce ar putea strica o realizare?” |
| 50–70 | Atelier: sarcina 2, lucru individual 14, autoverificare 4. | Treceți printre bănci; alegeți voluntarii. |
| 70–80 | Verificarea în plen a unei diagrame sau a două. | Fiecare observație numește punctul și regula. |
| 80–87 | Schimbările C1 și C2, pe diagramă. | „Pentru care a fost făcută interfața?” |
| 87–95 | Diagrama de referință. | Variantele acceptabile față de greșeli. |
| 95–100 | Încheiere. | Două-trei exemple scurte. |

**Repere de timp:** 10, 34, 50, 70, 87, 95. Dacă prima jumătate întârzie, scurtați discuția despre ce trece prin interfață (revine la verificarea în plen, punctul 4), nu trasarea lui S3 și nu atelierul. Atelierul are nevoie de cel puțin 15 minute de lucru individual și de verificarea în plen.

## Răspunsuri și dificultăți de urmărit

**„Prioritarii întâi”, S2:** p2, p3, p4; o1 depășit de trei ori; A3 infirmată. A1 și A2 se justifică prin argumente din R4, nu prin scenarii.

**„Doi la rând”, N = 2:** explorarea nu găsește contraexemplu (33 de stări accesibile). Afirmația permisă: „în modelul cu cel mult două bilete care așteaptă, A3 este respectată”. Greșeala de urmărit: „regula respectă A3”. Altă greșeală: „nu știm nimic, fiindcă am explorat doar un model mic”; știm totul despre acel model.

**S3, N = 3:** p3 (1, 1), p4 (2, 2), o1 (o2 rămâne 2), p5 (o2 = 3): A3 infirmată. Cu N = 2 nu apare, fiindcă doi obișnuiți ocupă ambele locuri și R3 refuză prioritarii. Dificultatea: studenții socotesc chemarea lui o1 drept depășire a lui o2; o1 a sosit înaintea lui o2.

**Reparația „un singur prioritar, apoi un obișnuit”** merge pe S3 și trece explorarea cu N = 2 și 3; cu trei obișnuiți și N = 4 încalcă A3. Cine o propune a găsit aceeași lecție.

**Variantele E și L:** sub L, S3 dă p3, p4, o1, o2; A3 respectată. La o regulă nouă, E cere reverificarea lui A3, L nu. Argumentul pentru orice N este în referință: cel mai vechi bilet are cel puțin atâtea depășiri ca oricare altul. Nu toți îl vor găsi; puneți întrebarea „cine mai este depășit când este depășit cel mai nou?”. L are un cost: regula aleasă nu este respectată întotdeauna; îl notăm ca întrebare pentru beneficiar.

## Atelierul de diagrame

**Moduri de lucru:** de mână, în Mermaid (mermaid.live sau previzualizarea GitHub) ori cu un asistent AI, din enunț și specificație, urmat de revizuire. Cine folosește un asistent AI îi dă și varianta L, de pe slide (enunțul nu o conține, ca să nu anticipeze discuția), dar nu îi dă referința.

**Ce urmăriți la bănci:** registrul legat direct de realizări (punctul 3); nimeni nu fixează realizarea sau lipsește `fixează regula(r)` (3); `alege(registru)` sau depășiri trecute prin interfață (4); limita scrisă în fiecare realizare (5); interfață fără contract (6); interfețe pentru bilet, ghișeu sau automat (1); săgeata realizării inversată (2); „Doi la rând” desenată ca realizare, deși R5 numește numai două reguli folosite azi (2; acceptabilă dacă autorul spune că sub L ar respecta A3).

**Erori ale diagramelor generate cu un asistent AI.** Promptul din specificație, cu varianta L și enunțul, a fost rulat de cinci ori cu Claude Haiku 4.5 la 24 noiembrie 2026 ([rulările](scenarios/05-validare/captures/2026-11-24/README.md)); toate diagramele se randează. Au apărut: „Doi la rând” desenată ca realizare (trei rulări din cinci) și chiar varianta L ca realizare (una); biletele, cu depășiri, trecute prin interfață (patru), uneori cu un text care spune contrariul la punctul 7; o postcondiție inventată sau A3 cerută realizărilor („depășiri < 2”); limita aplicată unui bilet oarecare, nu celui mai vechi; operațiile registrului repetate la automat și la ghișeu; automatul sau biletul lipsă; C2 rezolvată fără schimbarea contractului. **Toate cele cinci răspunsuri declară fiecare punct al listei îndeplinit:** cereți studentului să arate elementul din diagramă, nu bifa. Rularea 02 este aproape de referință; un răspuns corect este la fel de util, dacă studentul îl verifică. Cele cinci rulări nu descriu comportamentul obișnuit al modelului.

**Verificarea în plen:** cereți clasei să inventeze o realizare proastă (întoarce ultimul bilet; întoarce un număr inexistent) și să spună ce se strică pe diagrama voluntarului. Ultimul bilet: A3 rămâne respectată sub L. Număr inexistent: registrul trebuie să verifice rezultatul sau contractul este încălcat; enunțul nu spune ce face atunci registrul, deci este o decizie de notat.

**Referința:** pe slide, contractele sunt scrise sub diagramă, ca să fie lizibile la proiector; în [referință](scenarios/05-validare/reference.md) sunt note legate de clase.

Exploratorul este opțional: rezultatele sunt pe slide-uri. Îl puteți rula pe calculatorul din laborator, `python explorare.py doi_la_rand 3`, dacă are Python; nu depindeți de el.

Nu se predau, nu se încarcă și nu se notează diagrame.

## Varianta online

[Prezentarea online](05-validare-online.md) păstrează cele 17 slide-uri, regulile, scenariile, diagrama de referință și toate duratele. Întâlnirea Teams se desfășoară numai în plen, fără grupuri separate:

- Predicțiile se scriu în chat și se trimit la semnal (biletele chemate în S2, depășirile lui o2 în S3, răspunsul la variantele E și L). Puneți în chat linkul prezentării.
- Trasarea lui S3 se face în ștafetă: un coleg dictează câte un pas, profesorul completează tabelul pe ecranul partajat, un coleg numit verifică regula.
- **Atelierul:** lucru individual, cu aceleași trei moduri; întrebările se pun în chat. Puneți în chat linkurile enunțului și specificației. Cereți dinainte unui voluntar și unui coleg numit să se pregătească.
- **Verificarea în plen:** voluntarul își partajează ecranul sau trimite textul Mermaid, pe care profesorul îl randează în mermaid.live. La diagrama de referință, colegii trimit în chat numărul punctului la care diferă.

Nu faceți push pe `main` în timpul întâlnirii sincronizate: deploy-ul repornește serviciul.
