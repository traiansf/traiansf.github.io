# Capturi AI reale — biblioteca, 7 octombrie 2026

Două rulări efective, câte una pentru fiecare rol, prin OpenAI Codex CLI 0.160.1. Instrumentul a declarat modelul `gpt-6.1-sol`, furnizorul `openai`, `reasoning effort: none`, `reasoning summaries: none`. Temperatura și o versiune mai precisă a modelului nu au fost raportate. Nu presupunem reproducerea textuală a răspunsurilor.

## Intrări și răspunsuri integrale

- Proiectant: [prompt complet](proiectant-01-prompt.md), [răspuns integral](proiectant-01-response.md).
- Evaluator AI: [prompt complet](evaluator-01-prompt.md), [răspuns integral](evaluator-01-response.md).
- [Metadate și amprente SHA-256](metadata.json).

Fiecare rol a rulat într-un context nou, într-un director temporar gol, fără configurația utilizatorului și fără reluarea unei sesiuni. Promptul cere răspuns textual fără instrumente. Proiectantul a primit o copie integrală a `brief.md` și sarcina de pe slide; evaluatorul AI a primit același enunț, răspunsul integral al proiectantului și sarcina de revizuire. Copiile contextului sunt incluse în prompturile păstrate, astfel încât modificările ulterioare ale enunțului nu schimbă intrarea capturată. Niciun rol nu a primit soluția de referință sau conversația de pregătire a cursului.

Comanda folosită, cu căile locale înlocuite prin descriptori:

```text
codex exec --ignore-user-config --skip-git-repo-check --ephemeral --color never -s read-only -C <director-gol> -o <fisier-raspuns> -
```

Promptul complet a fost trimis pe intrarea standard. Ambele procese s-au încheiat cu codul 0. Modelul a fost ales implicit de instrument; identitatea și setările de mai sus provin din antetul rulării.

## Selecție și utilizare

Am selectat prima rulare pentru fiecare rol: proiectarea permite verificarea legăturilor membru–cerere–exemplar în S2, iar revizuirea permite justificarea ordinii ridicării în S6 și discutarea limitelor unei verificări conceptuale. Nu au fost necesare alte încercări. Aceste exemple selectate nu măsoară performanța tipică a modelului.

Răspunsurile sunt păstrate integral, fără corecturi de conținut. Slide-urile extrag fragmente exacte: două rânduri din tabelul proiectantului (redate ca citat, cu omisiunea marcată), paragraful despre ordinea cererilor, celula evaluatorului AI despre R5 și două propoziții distincte despre concluzie și limite. Explicațiile și decizia profesorului sunt separate. La curs se folosesc numai slide-urile, fără rulări live sau documente suplimentare pentru studenți.

Pentru alte obiective pedagogice se pot genera mai multe încercări și alege cele potrivite. Se păstrează fiecare prompt/răspuns, inclusiv încercările nefolosite, și se notează motivul selecției. Nu este necesară construirea prealabilă a unui răspuns fictiv.
