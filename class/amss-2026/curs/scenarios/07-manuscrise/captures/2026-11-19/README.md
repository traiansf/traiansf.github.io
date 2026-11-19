# Capturi AI — diagrama de stări generată, manuscrise (Cursul 7), 19 noiembrie 2026

Instrument: Claude Code 2.1.328, `claude -p --model claude-haiku-4-5 --safe-mode`, fără unelte, fără contextul proiectului, fără sesiuni salvate (vezi `argv` în metadate). `capture.py` este o copie a celui din `../2026-11-12/`; fiecare încercare pornește un context nou, iar scriptul refuză suprascrierea unei încercări. Temperatura nu este raportată; efortul nu a fost setat explicit. Metadatele păstrează ora UTC, hash-urile intrărilor și ieșirilor, costul și modelul raportat de instrument (`claude-haiku-4-5` la toate încercările). Răspunsurile nu au fost modificate (sunt salvate cu terminatori CRLF, cum le-a scris scriptul pe Windows).

Lecția (decizia din 19 noiembrie 2026, `docs/ai-lessons-and-lab-diagrams.md`): o diagramă Mermaid generată se randează curat și arată completă, dar poate să nu corespundă tabelului de tranziții.

## Intrări

Contextul comun este `context-diagrama.md`: enunțul curent (`../../brief.md`), fără titlul de versiune și fără sarcina de proiectare, care cere tabelul de tranziții (SHA-256 `f98716ba60a5b17947f53e6e595d2d452d0000d74e0312b7c7082a741bc24895`; vezi `context-diagrama-metadata.json`). Fiecare prompt este instrucțiunea + contextul.

| Prompt | Instrucțiunea, pe scurt | SHA-256 |
|---|---|---|
| `diagrama-prompt.md` | diagrama de stări în Mermaid, cu stări, tranziții, evenimente, condiții | `5796e2878161eefd6298779439f1be19279fbb802f4828ba175153b37313da2c` |
| `diagrama-v2-prompt.md` | + „trebuie să se randeze fără erori”, `state "Nume" as X` | `9d901af8bd0e4c3cd8f3e5d0bc363b864f0e5b9c1017a43b5275639022652f8c` |
| `diagrama-v3-prompt.md` | + etichete UML „eveniment [condiție] / efect” | `a6798e86dcc055db626684add39b9985ab3abb06b205e2a5abf3f29fd10c3b9e` |
| `diagrama-v4-prompt.md` | diagramă „compactă”, stare compusă permisă, evenimente și condiții, randare | `71a76b28c8e6e7e06698a5042987d03feb95c47fdc5f2b9a0f71e6b26c95bbfe` |

**Schimbările de prompt.** v2 a fost adăugat după ce toate cele cinci răspunsuri la primul prompt au dat erori de sintaxă la randare. v3 și v4 au rulat în paralel, după ce toate cele cinci răspunsuri v2 corespundeau tabelului: v3 cere mai mult conținut pe săgeți, v4 o formă mai scurtă; nu am cerut nicăieri o greșeală.

## Încercări

Randarea a fost verificată cu mermaid-cli (`mmdc`) din instalarea locală. „Corespunde tabelului” înseamnă că fiecare rând al tabelului de tranziții din `../../reference.md` are săgeata lui, cu condiția corectă, și că nu există săgeți declanșate de evenimente fără rând; săgețile `X --> [*]` spre starea finală nu sunt socotite tranziții.

| Încercări | Randare | Conținut față de tabel |
|---|---|---|
| `haiku45-diagrama-01`…`05` | **eroare de sintaxă** la toate: nume de stări între ghilimele în tranziții (`Trimis --> "În evaluare"`) | corespund tabelului (02, 03, 05 au și săgeți spre `[*]`) |
| `haiku45-diagrama-v2-01`…`05` | corectă | corespund tabelului (02, 04 au săgeți spre `[*]`; 05 are condiții în engleză) |
| `haiku45-diagrama-v3-01`…`04` | corectă | corespund tabelului, cu efecte pe săgeți (01–03 au săgeți spre `[*]`) |
| `haiku45-diagrama-v4-01` | corectă | corespunde tabelului (săgeți spre `[*]`) |
| `haiku45-diagrama-v4-02` | se randează, dar afișează `\n` literal în etichete | **lipsește bucla `atașează(f)`** |
| `haiku45-diagrama-v4-03` | corectă | corespunde tabelului. **Proiectată ca încercare corectă.** |
| `haiku45-diagrama-v4-04` | corectă | **lipsește bucla `atașează(f)`**; săgeți spre `[*]` din cele trei stări finale. **Selectată.** |

Total: 18 încercări, aproximativ 0,67 USD (între 0,022 și 0,065 USD pe încercare).

## Selecție

Lecția cere o diagramă care se randează curat și nu corespunde tabelului. Numai v4-02 și v4-04 omit un rând (bucla `atașează(f)`); am ales v4-04 pentru că se randează fără artefacte și pentru că explicația ei afirmă că diagrama conține „tranzițiile permise de reguli”. Consecința omisiunii se găsește prin trasare: din I0 (Ciornă fără fișier) condiția lui `trimite` nu poate fi îndeplinită, deci toate stările de după Ciornă sunt inaccesibile. v4-03, la aceeași cerere, corespunde tabelului și se proiectează după comparație. Dintre cele 18 încercări, 16 conțin toate rândurile tabelului; selecția nu descrie comportamentul tipic al modelului. Primele cinci încercări, corecte ca model dar nerandabile, arată reciproca: nici o randare eșuată nu spune că diagrama este greșită.

Pe slide-uri, codul Mermaid al încercărilor v4-04 și v4-03 este randat exact cum a fost generat (fără terminatorii CR), cu tema implicită Mermaid; v4-04 apare și ca fragment text, cu omisiunile marcate, pentru comparația rând cu rând. Comparația, consecința și decizia noastră apar separat.
