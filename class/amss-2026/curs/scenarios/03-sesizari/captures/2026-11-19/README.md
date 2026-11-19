# Capturi AI reale — sesizări în campus, 19 noiembrie 2026

Pentru segmentul AI al Cursului 3 („Numere precise: de unde vin?”, slide-urile „Cerem cerințe de calitate verificabile” – „Decizia noastră: precis nu înseamnă convenit” din `../../../../03-cerinte.md`). Lecția: **precizia inventată** — un număr specific nu este și un număr confirmat. Trei rulări efective prin **Claude Code 2.1.328**, model cerut și raportat **`claude-haiku-4-5`**, fiecare într-un context nou, într-un director temporar gol, fără unelte, fără setările utilizatorului și fără fișierele proiectului.

## Intrarea

- [Promptul integral](calitate-prompt.md): „Enunțul de mai jos conține cererea administrației campusului și regulile convenite cu ea.”, [contextul](context.md) și [instrucțiunea](calitate-instructiune.md). SHA-256 `829bfc0017d6904c26c2229b08c3c52428ffef1ca0c79cd55e24ad0aa4ec2bd7`.
- Contextul: secțiunile „Cererea inițială” și „Limite și reguli convenite” din `../../brief.md`, integral. SHA-256 `09fe5682cf4c06be0bb9f0ae59dbfce0b5676bb402d2b53a73611e64ed635f5b`; enunțul avea atunci SHA-256 `4c78e3bbcb6eb10f911998c625beae07c3563d1a8425a398a1cf16a5e2d270b0` ([metadate](context-metadata.json)).
- Instrucțiunea: SHA-256 `3d761d0980bd25f85d6f45dac30276ccdd32fe25a44578eddc2a7e3eb75eceaf`.

Instrucțiunea cere un prag numeric pentru fiecare cerință de calitate. Enunțul conține un singur prag convenit (Q1). Nu am cerut modelului să inventeze valori, nu i-am cerut greșeli și nu am schimbat promptul între repetări.

## Toate încercările și selecția

| Rulare | Numere fără sursă în enunț | Q1 | Utilizare |
|---|---|---|---|
| **[calitate-01](haiku45-calitate-01-response.md)** | „max 1 secundă” pentru afișarea erorii, respingere și tranziții (CQ1–CQ3); „20 utilizatori simultani; fiecare cu 50 sesizări în portofoliu”; „După 1.000 de operații” (CQ4); CQ6 nou, „2+ cereri ... în paralel”, deși enunțul nu analizează concurența. Procentele 100%/0% reformulează regulile. | Valorile corecte și punctele de măsurare; lipsește rețeaua campusului. | **Selectat.** |
| [calitate-02](haiku45-calitate-02-response.md) | Dimensiuni de test alese de model: „10 combinații”, „minimum 5 sesizări”, „15 scenarii de tranziție valide și 10 invalide”, „2 conturi student și 1 admin”, „50 sesizări noi”. | Integral, cu rețeaua campusului. | Păstrat; menționat în notele deciziei. |
| [calitate-03](haiku45-calitate-03-response.md) | Niciun prag de timp nou; procente de 100% care reformulează regulile; câteva date de test („doi studenți”, „două sesizări identice”). | Integral (și ca „95%”), cu rețeaua campusului. | Păstrat; menționat pe slide-ul deciziei ca rulare fără alt prag de timp. |

**Motivul selecției.** `calitate-01` așază în aceeași formă numere susținute de enunț (Q1), numere care reformulează reguli (100%, 0%), numere schimbate față de sursă (20 de utilizatori în loc de 20 de consultări) și numere fără sursă (1 secundă, 50 de sesizări, 1.000 de operații, CQ6). Este exact materialul unui tabel de proveniență. `calitate-03` arată că un răspuns poate rămâne la pragul convenit; slide-ul o spune. Selecția nu descrie comportamentul tipic al modelului și nu este o evaluare statistică. Toate cele trei rulări sunt păstrate; nu au existat alte încercări.

## Execuție și metadate

[capture.py](capture.py) este copia scriptului din `../../../08-inscrieri/captures/2026-11-12/`, neschimbată. Comanda a avut forma `python capture.py haiku45-calitate-01 calitate-prompt.md`; scriptul execută, cu promptul pe intrarea standard:

```text
claude -p --model claude-haiku-4-5 --safe-mode --setting-sources "" --tools "" --strict-mcp-config --disable-slash-commands --no-chrome --no-session-persistence --output-format json
```

Rulările au pornit la 19 noiembrie 2026, 14:13 UTC, în paralel. Toate s-au încheiat cu codul 0, într-un singur tur, fără refuzuri de permisiune; costul raportat a fost între 0,016 și 0,021 USD pe rulare, 0,055 USD în total. Fiecare `*-metadata.json` păstrează argumentele, directorul de lucru, momentele UTC, versiunea instrumentului, modelul raportat, identificatorul sesiunii, consumul de tokenuri și amprentele promptului și ale răspunsului; fiecare `*-result.json` păstrează rezultatul JSON integral. Temperatura nu este raportată; nivelul de efort nu a fost setat explicit. S-a folosit promptul de sistem implicit al Claude Code, cu personalizările dezactivate prin `--safe-mode`.

Fișierele `*-response.md` păstrează integral câmpul `result`, fără corecturi de formulare, diacritice sau terminologie.

## Folosirea pe slide-uri

Slide-urile „Urmăriți fiecare număr până la sursă (1)–(3)” citează, din `calitate-01`, titlurile CQ1, CQ3, CQ4, CQ5 și CQ6 și liniile „Măsurare” și „Condiții”, cu omisiunile marcate `[…]`; la CQ1 și CQ3, linia „Măsurare” este alăturată titlului. Tabelul de proveniență și decizia sunt analiza noastră, separate de citate.
