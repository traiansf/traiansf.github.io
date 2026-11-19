# Capturi AI reale — biblioteca, 19 noiembrie 2026

Pentru segmentul AI al Cursului 2 („Delegăm și verificăm”, slide-urile „Două prompturi, aceeași sarcină” – „Decizia noastră: deciziile ascunse devin întrebări” din `../../../../02-intelegere.md`). Lecția: **agentul AI completează golurile pe care nu le-ați observat.** Șase rulări efective prin **Claude Code 2.1.328**, model cerut și raportat **`claude-haiku-4-5`**, fiecare într-un context nou, într-un director temporar gol, fără unelte, fără setările utilizatorului și fără fișierele proiectului.

## Intrările

- [Promptul A](cerere-simpla-prompt.md): solicitarea bibliotecarei și [instrucțiunea comună](instructiune.md). SHA-256 `cd0ecb95bd6e1d028d8035daae5203af93533742ed62949696d8051e8809e4e6`.
- [Promptul B](cerere-cu-reguli-prompt.md): aceeași solicitare, propoziția „La întrebările noastre, bibliotecara a precizat regulile de mai jos.”, regulile R1–R6 copiate integral din `../../brief.md` și aceeași instrucțiune. SHA-256 `2f34600f47b48578477dd57abaf11d9eccc1f1a78016773683706982f63ac13c`.
- Instrucțiunea comună: SHA-256 `fac48bc8bedda75ea4716d94f64f62b841a9543964b2aaeecd46f051235ce3e4`. [Metadatele contextului](context-metadata.json) păstrează și amprenta enunțului la momentul capturii.

Prompturile diferă numai prin reguli. Instrucțiunea nu cere o anumită regulă, nu cere greșeli și nu numește durate, limite sau amenzi. Nu s-a schimbat niciun prompt între repetări.

## Toate încercările și selecția

| Rulare | Prompt | Ce hotărăște răspunsul fără să i se fi cerut | Utilizare |
|---|---|---|---|
| [simpla-01](haiku45-simpla-01-response.md) | A | Limită „maxim N cărți”, durată de 14 zile, amenzi și penalizări, notificări; la returnare, prima cerere devine „automat” următorul împrumut. | Păstrat; citat în notele comparației. |
| **[simpla-02](haiku45-simpla-02-response.md)** | A | Cont activ/inactiv, abonament care expiră, limită de împrumuturi, scadență „implicit 14-30 zile”, fereastră de 48 de ore pentru ridicare, penalități și suspendarea contului, prioritate opțională pentru membrii cu mai puține întârzieri, ordinea FIFO, notificări. | **Selectat** pentru slide-urile cu răspunsul la promptul A și comparația noastră. |
| [simpla-03](haiku45-simpla-03-response.md) | A | Limită „ex: 5 cărți”, scadență „ex: peste 14 zile”, amendă la întârziere, notificări, stare „DEPĂȘIT”. | Păstrat; citat în notele comparației. |
| [reguli-01](haiku45-reguli-01-response.md) | B | Respectă R1–R6 în operații; în „Fluxul complet”: „Dacă exemplar disponibil: împrumut imediat. Altfel: cerere în așteptare.”, o regulă pe care R4 nu o conține. | **Selectat** pentru fragmentul „împrumut imediat”. |
| **[reguli-02](haiku45-reguli-02-response.md)** | B | Respectă R1–R6; înregistrează cererea „cu marcă temporală”; încheie cu „fără notificări, amende, expirare sau autentificare”. Numește „Îndeplinit” cererea cu exemplar rezervat, deși R2 o declară îndeplinită abia la ridicare (nefolosit pe slide). | **Selectat** pentru propoziția finală și marca temporală. |
| [reguli-03](haiku45-reguli-03-response.md) | B | Respectă R1–R6; ordinea prin „timestamp” și un concept „Coadă de așteptare”. | Păstrat, neproiectat. |

**Motivul selecției.** Promptul A: toate cele trei rulări au fixat o scadență, o limită de împrumuturi și penalități, plus notificări; `simpla-02` conține cele mai multe decizii distincte, scrise ca fapte, într-un text scurt, ușor de citat pe două slide-uri. Promptul B: `reguli-02` arată cum regulile închid golurile (propoziția finală) și o alegere de reprezentare care rămâne (marca temporală); `reguli-01` arată o decizie care rămâne chiar cu regulile. Selecția servește lecției; nu descrie comportamentul tipic al modelului și nu este o evaluare statistică. Toate cele șase rulări sunt păstrate; nu au existat alte încercări.

## Execuție și metadate

[capture.py](capture.py) este copia scriptului din `../../../08-inscrieri/captures/2026-11-12/`, neschimbată. Comanda a avut forma `python capture.py haiku45-simpla-01 cerere-simpla-prompt.md`; scriptul execută, cu promptul pe intrarea standard:

```text
claude -p --model claude-haiku-4-5 --safe-mode --setting-sources "" --tools "" --strict-mcp-config --disable-slash-commands --no-chrome --no-session-persistence --output-format json
```

Rulările au pornit la 19 noiembrie 2026, 14:12 UTC, câte trei pentru fiecare prompt, în paralel. Toate s-au încheiat cu codul 0, într-un singur tur, fără refuzuri de permisiune; costul raportat a fost între 0,013 și 0,020 USD pe rulare, 0,095 USD în total. Fiecare `*-metadata.json` păstrează argumentele, directorul de lucru, momentele UTC, versiunea instrumentului, modelul raportat, identificatorul sesiunii, consumul de tokenuri și amprentele promptului și ale răspunsului; fiecare `*-result.json` păstrează rezultatul JSON integral. Temperatura nu este raportată; nivelul de efort nu a fost setat explicit. S-a folosit promptul de sistem implicit al Claude Code, cu personalizările dezactivate prin `--safe-mode`.

Fișierele `*-response.md` păstrează integral câmpul `result`, fără corecturi de formulare, diacritice sau terminologie (de exemplu „Membre”, „Céreri”, „Împrumturi”).

## Folosirea pe slide-uri

Slide-urile citează fragmente fidele, cu omisiunile marcate `[…]`; punctele unei liste pot fi redate pe un rând, despărțite prin „—”, iar paragrafele promptului A pe rânduri succesive. Termenii răspunsurilor („Carte”, „entitate”, „coadă FIFO”, „marcă temporală”) rămân neschimbați în citate; comparația și decizia folosesc vocabularul cursului (titlu, exemplar, concept, ordinea înregistrării). Comparația cu R1–R6 și decizia sunt analiza noastră, separate de citate.
