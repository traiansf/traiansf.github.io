# Capturi AI — verificare afirmată, verificare executată (Cursul 9), 27 noiembrie 2026

Serie nouă după redenumirea din enunț (`încheie` → `finalizează`, R4 încheiere → finalizare, P2 încheiere posibilă → finalizare posibilă, Încheiată → Finalizată), cerută de titular la 27 noiembrie 2026. Seria din [24 noiembrie 2026](../2026-11-24/README.md) rămâne arhivată.

Instrument: Claude Code 2.1.332, `claude -p --model claude-haiku-4-5 --safe-mode`, fără unelte, fără contextul proiectului, fără sesiuni salvate (vezi `argv` în metadate). `capture.py` și `ruleaza.py` sunt copiile neschimbate din seria din 24 noiembrie; fiecare încercare pornește un context nou. Temperatura nu este raportată; efortul nu a fost setat explicit.

## Intrări

`explorator-prompt.md` = `explorator-instructiune.md` + `context-trei-lucrari.md`, cu denumirile noi; în rest, identic cu seria din 24 noiembrie. Sesiunea nu avea unelte, deci asistentul AI nu putea rula codul; promptul nu spune asta. Nu s-a modificat promptul între rulări.

## Încercări

Șase rulări, toate încheiate cu succes; cost total raportat 0,46 USD.

| Încercare | Raportul scris | Codul, rulat de noi |
|---|---|---|
| `haiku45-explorator-01` | descrie exploratorul; „P1 e garantată de reprezentare”; „Rezultatele se raportează conform cererii”. **Selectat.** | 42 de stări, 62 de tranziții; P1 „OK” tipărit fără verificare; P2, P3 OK |
| `haiku45-explorator-02` | descrie exploratorul, fără rezultate | 42, 62, P1–P3 respectate |
| `haiku45-explorator-03` | „**Rezultat:** 27 stări accesibile și 48 tranziții”; P3 încălcată, prin o secvență nepermisă. **Selectat.** | 42, 62; P1 ÎNCĂLCATĂ (verificare greșită); P2, P3 RESPECTATĂ; secvența de blocaj este un text fix în cod |
| `haiku45-explorator-04` | descrie exploratorul, fără rezultate. **În notele prezentării.** | 42, 41 „tranziții”; P1 VIOLATĂ, prin `ocupă(X, M)`, `ocupă(X, C)` (verificare greșită) |
| `haiku45-explorator-05` | descrie exploratorul, fără rezultate | 42, 62, P1–P3 OK |
| `haiku45-explorator-06` | descrie exploratorul, fără rezultate | 42, 41 „tranziții”, P1–P3 OK |

`ruleaza.py` extrage codul neschimbat în `rulari/<încercare>.py` și păstrează ieșirea în `rulari/<încercare>.txt` (Python 3.10.11, `python -I -X utf8 ruleaza.py`; fără `-X utf8`, consola Windows nu poate tipări diacriticele). Codul a fost citit înainte de rulare: importă numai `collections.deque` și nu citește sau scrie fișiere.

## Selecție

Lecția cere deosebirea dintre o verificare afirmată și una executată. Am ales 03 (rezultate cu numere, prezentate ca rezultat, fără nicio rulare, infirmate de propriul cod; în plus, o verificare greșită a lui P1 și o secvență de blocaj scrisă ca text fix) și 01 (niciun rezultat, cu un argument în proză pentru P1 pe care codul nu îl verifică), la același prompt; 04 apare în note, ca „contraexemplu” tipărit de un program rulat. Spre deosebire de seria veche, nicio rulare nu scrie apeluri de unelte ca text. Selecția nu descrie comportamentul tipic al modelului și nu este o evaluare statistică. Modelul de referință este `../../model/trei_lucrari.py`.
