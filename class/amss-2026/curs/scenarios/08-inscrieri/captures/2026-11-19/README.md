# Capturi AI — garanțiile la graniță (Cursul 8), 19 noiembrie 2026

Lecția AI a cursului (decizia din 19 noiembrie 2026, `docs/ai-lessons-and-lab-diagrams.md`): **garanții pe care nu le oferă nimeni**. Formatul de la curs este un audit al afirmațiilor: pentru fiecare garanție dintr-un text generat, cine o oferă (registrul, site-ul, expeditorul sau nimeni) și ce regulă a enunțului o susține.

Instrument: Claude Code 2.1.328, `claude -p --model claude-haiku-4-5 --safe-mode`, fără unelte, fără contextul proiectului, fără sesiuni salvate (vezi `argv` în metadate); `capture.py` este copia neschimbată a celui din `../2026-11-12/`. Fiecare încercare pornește un context nou. Temperatura nu este raportată; efortul nu a fost setat explicit. Metadatele păstrează ora UTC, hash-urile intrărilor și ieșirilor, costul și modelul raportat de instrument (`claude-haiku-4-5` la toate).

## Intrări

Contextul comun, `context-garantii.md` (SHA-256 `773a1314…cf4b`), este enunțul curent `../../brief.md` (regulile R1–R7, starea inițială și scenariile S1–S6), fără secțiunile „Alegeri de proiectare” și „Sarcina de proiectare”, urmat de decizia B a cursului (o retrimitere în `înscrie`, operația `retrimite confirmările()` apelată de un operator). Linia de versiune copiată din enunț spune încă „versiunea 12 noiembrie 2026”, deși enunțul a fost retușat ulterior; textul trimis este cel din fișier. Fiecare prompt = instrucțiunea + o linie goală + context (copii ale fișierelor din `../../ai/`).

| Prompt | Instrucțiunea | SHA-256 prompt |
|---|---|---|
| `nota-operare-prompt.md` | notă de proiectare pentru echipa de operare, cu o secțiune „Garanții” | `b3834d96…94a9` |
| `garantii-prompt.md` | interacțiunea și garanțiile pentru echipa de dezvoltare: consistența datelor, livrarea confirmărilor, repetarea cererilor | `90b0a39e…0f2e` |
| `promisiuni-prompt.md` | paragraful „Ce vă garantăm la înscriere” pentru participanți, cu justificare tehnică | `fad3c02a…6be6f` |

Prompturile nu cer prudență și nu numesc termenii („atomic”, „livrare”) pe care îi urmărim, cu excepția titlurilor de secțiune din `garantii`, care reiau întrebări firești ale unei echipe de dezvoltare. Nu s-a modificat niciun prompt între rulări.

## Încercări

Toate s-au încheiat cu succes; 20 de rulări, cost total raportat 0,42 USD.

| Încercare | Ce conține lista de garanții (pe scurt) |
|---|---|
| `haiku45-nota-01` | „Idempotență”, „Consistență de stare”; fără afirmații despre livrare. |
| `haiku45-nota-02` | „Atomicitate pe cerere”; „Consistență: retrimiteri periodice asigură sincronizarea confirmărilor cu starea reală”. |
| `haiku45-nota-03` | Garanții ale registrului; „Reîncercările sunt idempotente”. |
| `haiku45-nota-04` | „Atomicitate pe cerere”, „Durabilitate”. |
| `haiku45-nota-05` | Garanții ale registrului; „Nicio cerere nu pierde starea de acceptare din cauza erorilor de rețea cu expeditorul”. |
| `haiku45-nota-06` | „Atomicitate”, „Reziliență: datele sunt recuperabile prin reîncercări”. |
| `haiku45-nota-07` | Secțiunea „Operații și garanții”: numai garanții ale registrului; fără afirmații despre livrare. |
| `haiku45-nota-08` | „Atomicitate pe cerere” (o cerere acceptată consumă exact un loc; reîncercările nu generează înscrieri duble); „Înregistrare: … consemnat permanent”. **Selectat (fragmente).** |
| `haiku45-garantii-01` | „Atomicitate la loc”; „Expeditorul ar trebui să tolereze mesaje duplicate”. |
| `haiku45-garantii-02` | „Acceptarea … și înregistrarea … sunt atomice”; „chiar dacă expeditorul nu livrează”; în flux, reîncercarea nu reapelează expeditorul. **Selectat (un fragment).** |
| `haiku45-garantii-03` | „Atomicitate per cerere”, „Atomicitate: fiecare cerere este procesată complet sau refuzată”; „înregistrat permanent”. |
| `haiku45-garantii-04` | „Registrul nu garantează că participantul primește mesajul”; duplicatele rămân „răspunderea beneficiarului”. |
| `haiku45-garantii-05` | „locul garantat > confirmare garantată”; duplicarea mesajelor „acceptabilă și tolerantă”. |
| `haiku45-garantii-06` | „buffer fiabil între site … și expeditorul extern nedependabil”. |
| `haiku45-garantii-07` | „Atomicitate pe înscrierea acceptată”; responsabilitate pentru duplicate atribuită operatorului. |
| `haiku45-garantii-08` | „Livrarea efectivă la participant nu este garantată de sistem”; `trimisă`/`netrimisă` ca răspunsuri ale expeditorului. **Selectat (un fragment, formularea prudentă).** |
| `haiku45-promisiuni-01` | „Veți primi confirmare imediat … Dacă nu ajunge, îl reîncercăm automat”; justificare cu R5 pentru un mesaj care „nu a ajuns”. **Selectat (paragraful, promisiunile 1–4).** |
| `haiku45-promisiuni-02` | „o confirmare este trimisă imediat”; „Dacă confirmarea se pierde, o puteți solicita din nou la operatorul centrului”. |
| `haiku45-promisiuni-03` | „o putem retrimite la cererea voastră”; „Locurile sunt alocate în ordinea strict cronologică”. |
| `haiku45-promisiuni-04` | „dacă aceasta nu ajunge prima dată, o vom reîncerca automat”. |

## Selecție

Am ales `promisiuni-01` pentru că paragraful are patru promisiuni scurte cu garanți diferiți: două ale registrului (locul păstrat, locurile limitate), una care depinde și de site (același răspuns la reîncercare, prin identificatorul din R2) și una pe care nu o oferă nimeni (confirmarea primită „imediat” și retrimisă „automat”); justificarea citează R5 pentru un mesaj care „nu a ajuns”, confuzia exclusă de R6. `promisiuni-04` promite și ea retrimiterea automată; `promisiuni-02` și `promisiuni-03` mută promisiunea spre operator.

Din celelalte rulări am ales fragmente scurte care pun aceeași întrebare în vocabularul inginerilor: „atomicitate pe cerere” pentru ce este idempotența față de înscrieri și „consemnat permanent”, adevărat doar prin presupunerea R1 (`nota-08`); `esec` citit ca nelivrare (`garantii-02`); formularea prudentă, susținută de R6 (`garantii-08`), ca auditul să nu devină „găsește greșeala”. Captura din 12 noiembrie 2026 (analistul 01, „atomicitate”) rămâne arhivată în `../2026-11-12/` și este amintită în notele slide-ului de decizie.

Selecția a urmărit afirmații utile pentru audit, nu un rezultat tipic; nu descrie comportamentul obișnuit al modelului și nu este o evaluare statistică. Tabelul de mai sus rezumă rulările pentru pregătire; răspunsurile integrale sunt în fișierele `*-response.md`. Fragmentele de pe slide-uri sunt fidele, cu omisiunile marcate; comparația și decizia noastră apar separat.
