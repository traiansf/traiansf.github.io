# Capturi AI reale — biblioteca, 9 octombrie 2026

Conversații cu modele AI mai slabe, pentru slide-urile „O ipoteză implicită: titlu = exemplar” (inițial „Când o ipoteză inițială este greșită”) și „Corecție locală sau reproiectare?” din `../../../../02-intelegere.md`. Patru rulări efective: două cu Claude Haiku 4.5 (Claude Code 2.1.294) și două cu `gpt-6-luna`, reasoning effort `low` (OpenAI Codex CLI 0.161.0). Temperatura nu a fost raportată; nu presupunem reproducerea textuală a răspunsurilor.

## Conversația

Fiecare rulare este o singură conversație de trei mesaje, ca a unui student care nu a clarificat încă cererea:

1. [Cererea bibliotecarei](mesaj-1-prompt.md), fără precizările R1–R6: „Propune un model de date și operațiile principale.”
2. [Un defect raportat](mesaj-2-prompt.md): M3 a împrumutat cartea cerută înainte de M2. „Corectează modelul.”
3. [Două exemplare din același titlu](mesaj-3-prompt.md): „Ce face sistemul tău? Corectează modelul dacă e nevoie.”

Răspunsuri integrale: `<rulare>-mesaj-<n>-response.md`, de exemplu [haiku45-02-mesaj-1-response.md](haiku45-02-mesaj-1-response.md). [Metadate și amprente SHA-256](metadata.json).

Fiecare rulare a pornit într-un director temporar gol, fără unelte. Claude Code a rulat fără setările utilizatorului (`--setting-sources ""`), cu toate uneltele dezactivate; mesajele 2–3 au continuat sesiunea prin `--resume`. Codex a rulat cu `--ignore-user-config`, sandbox read-only; mesajele 2–3 au continuat sesiunea prin `codex exec resume --last`. Ambele instrumente au adăugat propriul prompt de sistem. Niciun model nu a primit enunțul clarificat, soluția de referință sau conversația de pregătire.

## Ce s-a întâmplat

| Rulare | Mesajul 1 | Mesajul 2 | Mesajul 3 |
|---|---|---|---|
| haiku45-01 | Separă cartea de exemplar | Stare „rezervat” pe exemplar | Împrumut direct dacă există exemplar disponibil |
| **haiku45-02** | **O singură entitate „Cărți”, cu stare disponibilă/împrumutată** | **Stare „rezervată” pe carte și refuzul împrumutului când există cereri** | **„Corectură majoră: Exemplare vs. Cărți”** |
| luna-01 | Separă cartea de exemplar | Rezervare legată de exemplar | Rezervă exemplarul de pe raft |
| luna-02 | Separă cartea de exemplar | Rezervare legată de exemplar | Rezervă exemplarul disponibil, fără cerere |

## Selecție și utilizare

Am selectat `haiku45-02`, singura rulare care confundă titlul cu exemplarul: ilustrează o ipoteză inițială greșită, o corecție locală și reproiectarea forțată ulterior. Celelalte trei rulări au separat corect conceptele din primul răspuns; slide-urile o spun explicit. Selecția arată o greșeală posibilă, nu performanța tipică a acestor modele.

Răspunsurile sunt păstrate fără corecturi de conținut, inclusiv lipsa diacriticelor; s-au normalizat doar sfârșiturile de linie. Slide-urile citează fragmente exacte, cu omisiunile marcate; o listă poate fi redată pe un singur rând. Explicațiile profesorului sunt separate.
