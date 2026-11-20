# Capturi AI — garanțiile la graniță (Cursul 8), 19 noiembrie 2026, a doua serie

**Arhivată la 20 noiembrie 2026.** Enunțul s-a schimbat (răspunsul de eșec `eșec`, R5 fără „poate cere din nou trimiterea”, R6: `trimis` nu înseamnă livrare); slide-urile folosesc acum seria [`../2026-11-20/`](../2026-11-20/README.md). Această serie rămâne neschimbată.

A doua serie din aceeași zi, cu enunțul în forma de pe slide-uri: serviciul extern se numește **mesageria** (nu „expeditor de confirmări”), răspunsul ei de eșec este `eșec expediție` (nu `esec`), iar numărul de locuri este un parametru în R1, cu locurile libere date în starea inițială. Prima serie, cu denumirile anterioare, rămâne neschimbată în `../2026-11-19/`. Lecția și formatul sunt aceleași: **garanții pe care nu le oferă nimeni**, printr-un audit al afirmațiilor (cine oferă fiecare garanție: registrul, site-ul, mesageria sau nimeni).

Instrument: Claude Code 2.1.328, `claude -p --model claude-haiku-4-5 --safe-mode`, fără unelte, fără contextul proiectului, fără sesiuni salvate (vezi `argv` în metadate); `capture.py` este copia neschimbată a celui din `../2026-11-19/`. Fiecare încercare pornește un context nou. Temperatura nu este raportată; efortul nu a fost setat explicit. Metadatele păstrează ora UTC, hash-urile intrărilor și ieșirilor, costul și modelul raportat (`claude-haiku-4-5` la toate).

## Intrări

Contextul comun, `context-garantii.md` (SHA-256 `a01c503b…6e11`), este enunțul `../../brief.md`, versiunea 19 noiembrie 2026 (regulile R1–R7, starea inițială și scenariile S1–S6), fără secțiunile „Alegeri de proiectare folosite în exemple” și „Sarcina de proiectare”, urmat de decizia B a cursului. Fiecare prompt = instrucțiunea + o linie goală + context (copii ale fișierelor din `../../ai/`). Instrucțiunile sunt cele din prima serie, cu „mesagerie” în loc de „expeditor” și „eșec expediție” în loc de „esec”; instrucțiunea paragrafului nu se schimbă.

| Prompt | Instrucțiunea | SHA-256 prompt |
|---|---|---|
| `nota-operare-prompt.md` | notă de proiectare pentru echipa de operare, cu o secțiune „Garanții” | `7e9ea690…44a1` |
| `garantii-prompt.md` | interacțiunea și garanțiile pentru echipa de dezvoltare: consistența datelor, livrarea confirmărilor, repetarea cererilor | `029ed80b…4606` |
| `promisiuni-prompt.md` | paragraful „Ce vă garantăm la înscriere” pentru participanți, cu justificare tehnică | `97ebe414…afbb` |

Nu s-a modificat niciun prompt între rulări.

## Încercări

Toate s-au încheiat cu succes; 22 de rulări (șase pentru paragraf, câte opt pentru celelalte), cost total raportat 0.48 USD.

| Încercare | Ce conține (pe scurt) |
|---|---|
| `haiku45-nota-01` | „Atomicitate pe operație: fiecare apel mesageriei este independent”; limita: registrul nu garantează livrarea. |
| `haiku45-nota-02` | „Determinism”, „Izolare”; fără afirmații despre livrare. |
| `haiku45-nota-03` | „locul este consumat permanent”; „confirmările nereușite sunt retrimise la cerere”. |
| `haiku45-nota-04` | „Atomicitate: O cerere acceptată consumă exact un loc și generează exact o înscriere”. |
| `haiku45-nota-05` | „Atomicitate pe participant” (cel mult o înscriere per atelier); „livrarea efectivă rămâne responsabilitatea serviciului extern”. **Selectat (fragmente).** |
| `haiku45-nota-06` | Garanții ale registrului; fără afirmații despre livrare. |
| `haiku45-nota-07` | Garanții ale registrului; „Garantiile nu acoperă: livrarea efectivă a mesajelor, citirea acestora …”. |
| `haiku45-nota-08` | „suma (înscrisuri acceptate + locuri rămase) = locuri totale”; „Recuperare asistată”. |
| `haiku45-garantii-01` | „Nu garantăm că participantul a primit efectiv mesajul; garantăm doar răspunsurile mesageriei și ciclul de reapelare”. **Selectat (un fragment).** |
| `haiku45-garantii-02` | „Retrimiterea poate produce mesaje duplicate”; reîncercarea unei cereri refuzate întoarce `refuz`. |
| `haiku45-garantii-03` | o înscriere „atomiț[ă]”; deduplicarea mesajelor atribuită centrului. |
| `haiku45-garantii-04` | „Atomicitate pe acceptare”; „Fără garanție de livrare efectivă”. |
| `haiku45-garantii-05` | Garanții ale registrului; duplicatele posibile; fără „atomicitate”. |
| `haiku45-garantii-06` | retrimiterea „evitând mesaje duplicate pentru cele deja `trimisă`”. |
| `haiku45-garantii-07` | „Atomicitate pe acceptare: … sau nu face nimic”; limita livrării corect enunțată. |
| `haiku45-garantii-08` | „Confirmările nelivrate (răspunsul mesageriei este `eșec expediție`) sunt retrimitibile: … omisiunile temporare”; „atomice la acceptare: fie ambele se modifică, fie niciuna”. **Selectat (un fragment).** |
| `haiku45-promisiuni-01` | „Veți primi o confirmare … o vom reîncerca automat”; „sistemul vă va recunoaște”; justificarea: registrul „o reîncearcă automat”. **Selectat (paragraful, promisiunile 1–4).** |
| `haiku45-promisiuni-02` | „Vă trimitem instant un email de confirmare”; retrimiterea prin operator, „pe cerere”. |
| `haiku45-promisiuni-03` | „locul … instant și permanent rezervat”; „Sistemul reîncercă activ trimiterea confirmării”. |
| `haiku45-promisiuni-04` | „Imediat după acceptare, trimitem o confirmare”; „echipa noastră poate retrimite confirmarea”. |
| `haiku45-promisiuni-05` | „vă trimitem o confirmare prin email”; „Eșecul livrării nu anulează înscrierea”. |
| `haiku45-promisiuni-06` | „veți primi pe email o notificare”; retrimiterea „evită duplicate în orice caz”. |

## Selecție

Am ales `promisiuni-01` pentru că paragraful are patru promisiuni numerotate, cu garanți diferiți: două ale registrului (locul rezervat; eșecul confirmării nu anulează înscrierea), una care depinde și de site („sistemul vă va recunoaște” la reîncercare, prin identificatorul din R2) și una pe care nu o oferă nimeni („Veți primi o confirmare … o vom reîncerca automat”); justificarea transformă „poate” din R5 în „automat”.

Din celelalte rulări: `nota-05`, „atomicitate pe participant” pentru un invariant (unicitatea) și livrarea atribuită serviciului extern, o garanție pe care R6 nu o conține; `garantii-08`, „confirmările nelivrate” pentru răspunsul `eșec expediție`, confuzia exclusă de R6; `garantii-01`, limita corectă despre livrare, ca auditul să nu devină „găsește greșeala”, deși aceeași frază prezintă presupunerea R6 drept garanție.

Selecția a urmărit afirmații utile pentru audit, nu un rezultat tipic; nu descrie comportamentul obișnuit al modelului și nu este o evaluare statistică. Răspunsurile integrale sunt în fișierele `*-response.md`. Fragmentele de pe slide-uri sunt fidele, cu omisiunile marcate și cu greșelile de tastare ale răspunsurilor; comparația și decizia noastră apar separat.
