# Capturi AI reale — 19 noiembrie 2026: forma cererii

Lecția AI a cursului 4, conform deciziei din 19 noiembrie 2026 (`docs/ai-lessons-and-lab-diagrams.md`): **forma cererii modelează modelul**. Aceleași fapte au fost trimise cu două cereri: „scrie clasele” (A) și „descrie conceptele, relațiile și cardinalitățile” (B). Capturile mai vechi, din [10 octombrie 2026](../2026-10-10/README.md), rămân neschimbate.

## Intrări și execuție

- [Contextul trimis](context-fapte.md): R1–R5 și scenariile S1–S4 din [enunțul curent](../../brief.md), fără R6 (limitele exercițiului) și fără S5. Ultima propoziție din R6 spune „Nu cerem clase, tabele de baze de date sau o notație anume”; am omis R6 ca cele două prompturi să difere numai prin cerere. Fără titlul „pentru Cursul 4” și fără mențiunea „Exemplu didactic”.
- Cererea A: [`clase-instructiune.md`](clase-instructiune.md), prompt complet [`clase-prompt.md`](clase-prompt.md) (instrucțiunea, linia `CONTEXT`, contextul).
- Cererea B: [`concepte-instructiune.md`](concepte-instructiune.md), prompt complet [`concepte-prompt.md`](concepte-prompt.md).

| Fișier | SHA-256 |
|---|---|
| `context-fapte.md` | `c8a1dc8ebeee962a32e486e58a3614baa1055d92c7df9e8e0dad782e20e11e3d` |
| `clase-prompt.md` | `0f794e58e3916df11d506a3d08e326b679d56a4f140b3d6dc34c93c4af62ad99` |
| `concepte-prompt.md` | `cbd459dcb343c4ff41f01d8867c265a517ef1ad24fd30a8ff06b607b751bd215` |

`capture.py` este copia nemodificată a celui din 10 octombrie 2026: Claude Code 2.1.328, `claude -p --model claude-haiku-4-5 --safe-mode`, fără unelte, MCP, setări sau sesiuni salvate, într-un director temporar gol; fiecare rulare pornește un context nou. Modelul raportat: `claude-haiku-4-5`. Temperatura nu este raportată; efortul nu a fost setat. Metadatele fiecărei rulări păstrează argumentele, ora UTC, hash-urile, costul și modelul raportat.

## Toate încercările

Toate rulările au pornit la 19 noiembrie 2026, 14:12 UTC, în paralel; costul total este 0,11 USD.

| Rulare | Cerere | Ce conține | Selecție |
|---|---|---|---|
| [haiku45-clase-01](haiku45-clase-01-response.md) | A | Python: `Fotografie` creează originalul (cu conținut `None`), `Versiune.editeaza`, referințe între obiecte, `ValueError`. | Păstrată. |
| [haiku45-clase-02](haiku45-clase-02-response.md) | A | Python cu tipuri: `id_foto: str`, `id_versiune: int`, `fotografie_id`, `sursa_id`, `original_id`, clasa `Arhiva` cu dicționare și `contor_versiuni`, `ValueError`. | **Pe slide-uri.** |
| [haiku45-clase-03](haiku45-clase-03-response.md) | A | Python: referințe, clasa `Arhiva` cu contor, comentariu „Validare” fără verificare efectivă. | Păstrată. |
| [haiku45-concepte-01](haiku45-concepte-01-response.md) | B | „Entități”, relații 1:N, notație de cardinalitate amestecată, „arbore (pădure)” de versiuni. | Păstrată. |
| [haiku45-concepte-02](haiku45-concepte-02-response.md) | B | Relații 1:N, „0..1 : 0..N”, „DAG cu un rădăcină”. | Păstrată. |
| [haiku45-concepte-03](haiku45-concepte-03-response.md) | B | Trei concepte (fotografie, versiune, original), relații și cardinalități cu trimiteri la S3, S4. | **Pe slide-uri.** |

## Selecție

Lecția a apărut în toate cele șase rulări: cele trei răspunsuri la cererea A sunt cod Python cu metode, validări și alegeri de reprezentare absente din fapte; cele trei răspunsuri la cererea B rămân la concepte, relații și cardinalități, fără tipuri, contoare sau excepții. Nu a fost nevoie de rulări suplimentare. Trei rulări pe cerere nu sunt o măsurare; nu prezentăm rezultatul ca frecvență.

- **Clase 02** arată cele mai multe decizii de implementare separabile pe slide: tipuri diferite pentru cele două feluri de identificatori, identificatori păstrați în locul referințelor, un contor care generează identificatorii (enunțul complet spune, prin R6, că sunt deja disponibili), o excepție pentru un identificator repetat și o clasă care coordonează operațiile. Rulările 01 și 03 folosesc referințe între obiecte și ar fi dat mai puține elemente de sortat.
- **Concepte 03** este cea mai curată pentru verificarea cardinalităților (trimite la S3 și S4) și aduce „Original” ca al treilea concept, pe care îl discutăm ca rol al unei versiuni. Rularea 02 repetă tema „DAG” a capturilor din octombrie, iar 01 are o notație de cardinalitate confuză; am evitat ambele, ca să nu mutăm discuția de la forma cererii.

Fragmentele de pe slide-uri sunt literale, cu omisiunile marcate (`# […]` în cod, `[…]` în text); slide-ul de sortare enumeră elemente din răspuns, iar sortarea noastră apare separat. Răspunsurile nu au fost editate.
