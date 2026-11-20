# Capturi AI — garanțiile la graniță (Cursul 8), 20 noiembrie 2026

Seria care înlocuiește pe slide-uri seria `../2026-11-19b/`, după feedbackul titularului din 20 noiembrie 2026 asupra enunțului: răspunsul de eșec al mesageriei este `eșec` (nu `eșec expediție`); R4 înregistrează rezultatul confirmării după ultimul răspuns al mesageriei; R5 păstrează numai interdicția de a apela mesageria la `trimisă` (fraza „registrul poate cere din nou trimiterea” a fost scoasă, iar faptul că retrimiterea la `netrimisă` nu este nici cerută, nici interzisă este spus în afara regulilor); R6 spune că `trimis` nu înseamnă nici că mesajul a ajuns, nici că a fost citit. Seriile anterioare rămân neschimbate. Lecția și formatul sunt aceleași: **garanții pe care nu le oferă nimeni**, printr-un audit al afirmațiilor (cine oferă fiecare garanție: registrul, site-ul, mesageria sau nimeni).

Instrument: Claude Code 2.1.329, `claude -p --model claude-haiku-4-5 --safe-mode`, fără unelte, fără contextul proiectului, fără sesiuni salvate (vezi `argv` în metadate); `capture.py` este copia neschimbată a celui din `../2026-11-19b/`. Fiecare încercare pornește un context nou. Temperatura nu este raportată; efortul nu a fost setat explicit. Metadatele păstrează ora UTC, hash-urile intrărilor și ieșirilor, costul și modelul raportat (`claude-haiku-4-5` la toate).

## Intrări

Contextul comun, `context-garantii.md` (SHA-256 `16139407…9279`), este enunțul `../../brief.md`, versiunea 20 noiembrie 2026 (regulile R1–R7, starea inițială și scenariile S1–S6), fără secțiunile „Alegeri de proiectare folosite în exemple” și „Sarcina de proiectare”, urmat de decizia B a cursului. Fiecare prompt = instrucțiunea + o linie goală + context (copii ale fișierelor din `../../ai/`). Instrucțiunile sunt cele din seria anterioară; în instrucțiunea notei, „eșec” înlocuiește „eșec expediție”.

| Prompt | Instrucțiunea | SHA-256 prompt |
|---|---|---|
| `nota-operare-prompt.md` | notă de proiectare pentru echipa de operare, cu o secțiune „Garanții” | `280d0adc…81c4` |
| `garantii-prompt.md` | interacțiunea și garanțiile pentru echipa de dezvoltare: consistența datelor, livrarea confirmărilor, repetarea cererilor | `8433a682…eea1` |
| `promisiuni-prompt.md` | paragraful „Ce vă garantăm la înscriere” pentru participanți, cu justificare tehnică | `171ea3c7…c9c1` |

Nu s-a modificat niciun prompt între rulări.

## Încercări

Toate s-au încheiat cu succes; 22 de rulări (șase pentru paragraf, câte opt pentru celelalte), cost total raportat 0.48 USD.

| Încercare | Ce conține (pe scurt) |
|---|---|
| `haiku45-nota-01` | „Idempotență: Reîncercările returnează același rezultat și nu modifică starea sistemului.” |
| `haiku45-nota-02` | „Atomicitate pe înscrierea: Consum de loc și înregistrare a cererii sunt simultane” (folosire corectă). |
| `haiku45-nota-03` | „etichetele «trimisă» și «netrimisă» … nu garantează livrarea efectivă”. |
| `haiku45-nota-04` | „trei operații atomice”; „Atomicitate pe apel: fiecare cerere produce exact o actiune”. |
| `haiku45-nota-05` | Garanții ale registrului; fără afirmații despre livrare. |
| `haiku45-nota-06` | „Atomicitate pe înscrierie: o cerere acceptată consumă exact un loc”. |
| `haiku45-nota-07` | „Atomicitate: O cerere fie acceptă o înscrierea și apelează mesageria, fie refuză integral”. |
| `haiku45-nota-08` | „Livrarea efectivă a mesajelor și citirea lor de participant sunt în afara modelului sistemului.” |
| `haiku45-garantii-01` | Retrimiterea poate genera mesaje duplicate; garanții ale registrului. |
| `haiku45-garantii-02` | „Registrul nu garantează ca mesajul să ajungă participantului”. |
| `haiku45-garantii-03` | „Atomicitate la acceptare” (loc și înscriere împreună). |
| `haiku45-garantii-04` | „Atomicitate pentru acceptare: înscrierea și apelul de confirmare formează o unitate; eșecul confirmării nu anulează înscrierea”; limita livrării corect enunțată. **Selectat (două puncte).** |
| `haiku45-garantii-05` | „Registrul garantează că răspunsul și comportamentul extern (apeluri mesagerie) sunt determinist”. **Selectat (o frază).** |
| `haiku45-garantii-06` | „livrarea efectivă rămâne răspunderea mesageriei”; „recuperarea confirmărilor pierdute”. **Selectat (două fragmente).** |
| `haiku45-garantii-07` | „Apeluri garantate”; „Atomicitate pe acceptare”; reîncercarea întoarce „același răspuns (`acceptat` sau `refuz`)”. |
| `haiku45-garantii-08` | „Atomicitate a acceptării”; „Retrimiteri manuale” prin operator. |
| `haiku45-promisiuni-01` | „Veți primi o confirmare … imediat”; „veți primi din nou răspunsul «acceptat»” la reîncercare; „echipa noastră va încerca din nou trimiterea”, iar justificarea spune „poate”. **Selectat (paragraful, promisiunile 1–4).** |
| `haiku45-promisiuni-02` | locul „garantat”; „nu putem garanta că acel mesaj ajunge întotdeauna”; operatorii „pot reîncerca”. |
| `haiku45-promisiuni-03` | „vă retrimittem mesajul”; „Echipa noastră poate retrimite oricând confirmarile care nu au ajuns”. |
| `haiku45-promisiuni-04` | „Înscrierea se procesează instant”; „îți trimitem o confirmare prin e-mail”. |
| `haiku45-promisiuni-05` | „centrul poate retrimite notificări … manual”; „noi garantez doar trimiterea apelului”. |
| `haiku45-promisiuni-06` | „Imediat după acceptare, veți primi un mesaj de confirmare”; „Chiar dacă mesajul se pierde”. |

## Selecție

Am ales `promisiuni-01` pentru că paragraful are patru promisiuni numerotate, cu garanți diferiți: una a registrului (acceptarea), una pe care nu o oferă nimeni („Veți primi o confirmare … imediat”), una care depinde și de site („veți primi din nou răspunsul «acceptat»” la reîncercare, prin identificatorul din R2) și una pe jumătate a registrului („rămâneți înscris”) și pe jumătate a nimănui („echipa noastră va încerca din nou trimiterea”, unde justificarea spune „poate”, iar operația B încearcă numai confirmările `netrimisă`).

Din celelalte rulări: `garantii-04`, „atomicitate” pentru o proprietate care o contrazice (eșecul confirmării nu anulează înscrierea), lângă o limită corect enunțată, ca auditul să nu devină „găsește greșeala”; `garantii-06`, livrarea atribuită mesageriei și „confirmările pierdute” pentru `netrimisă`, confuzia exclusă de R6; `garantii-05`, apeluri ale mesageriei declarate deterministe, deși varianta B apelează din nou mesageria la o reîncercare cu confirmarea `netrimisă`.

Selecția a urmărit afirmații utile pentru audit, nu un rezultat tipic; nu descrie comportamentul obișnuit al modelului și nu este o evaluare statistică. Răspunsurile integrale sunt în fișierele `*-response.md`. Fragmentele de pe slide-uri sunt fidele, cu omisiunile marcate și cu greșelile de scriere ale răspunsurilor; comparația și decizia noastră apar separat.
