# AMSS 2026/2027 — Instrumente AI: roluri, predarea sarcinilor și revizuire

Alege un asistent și un model la care ai acces. Poți urma modul de lucru al cursului printr-o conversație în browser, un asistent integrat în editor sau un instrument local. Evaluarea urmărește analiza, deciziile de proiectare și justificarea lor. Nu este obligatoriu un anumit furnizor, abonament, model, nivel al efortului de raționament sau instrument pentru diagrame.

## Începe de aici

- [SETUP.md](SETUP.md): obține materialele, pregătește spațiul de lucru și exersează predarea unei sarcini (handoff), cu contextul necesar, de la analiză la revizuire (review).
- [template/AGENTS.md](template/AGENTS.md): instrucțiuni pe care le poți folosi cu orice asistent. Integrează-le în instrucțiunile existente din repository sau furnizează-le direct într-o conversație.
- `template/CLAUDE.md`: un punct de intrare opțional către aceleași instrucțiuni.
- `template/.claude/settings.json` și `template/.codex/config.toml`: fișiere de configurare opționale, fără setări. Nu selectează un model sau un nivel al efortului de raționament. Păstrează setările existente; nu le suprascrie prin copierea întregului director de șabloane.

Cursul urmărește elaborarea unei specificații și a unei proiectări substanțiale înaintea implementării aplicației. Pe parcurs, prototipurile mici, modelele executabile și exemplele de acceptare pot clarifica o incertitudine. Proiectul nu impune realizarea unei aplicații funcționale.

## Roluri și momente de revizuire

Tu răspunzi de formularea problemei și de acceptarea sau respingerea modificărilor. Fă mai întâi o analiză proprie scurtă; apoi deleagă o sarcină delimitată, cu un rol clar.

| Rol | Date de intrare | Rezultat de verificat |
|---|---|---|
| Analist | Descrierea inițială a problemei, răspunsurile beneficiarului, analiza ta inițială | Limitele soluției, cerințe, vocabularul domeniului, ipoteze, întrebări deschise, exemple de acceptare |
| Proiectant | Specificația revizuită și întrebările nerezolvate | Responsabilități și dependențe, contracte și invariante, comportament, alternative și justificări |
| Agent de revizuire | Descrierea inițială a problemei, artefactele curente, criterii explicite de revizuire | Constatări susținute de surse, scenarii sau contraexemple și limitele revizuirii |
| Autor de modele/prototipuri, când este util | O întrebare delimitată și proiectarea relevantă, deja revizuită | Un model sau experiment mic, verificări, rezultate și ce se poate sau nu se poate deduce din ele |

Folosește sesiuni separate pentru aceste roluri când este util; nu trebuie să ruleze simultan sau să folosească modele diferite. Pentru revizuire, începe o conversație nouă sau un context nou de agent și furnizează explicit sursele, artefactele și criteriile curente. Schimbarea rolului asistentului autor în aceeași conversație nu asigură contextul separat necesar revizuirii.

Revizuiește limitele soluției și ipotezele înainte de a dezvolta proiectarea. Revizuiește regulile domeniului, responsabilitățile, contractele, comportamentul și rezultatele validării înainte de a preda o proiectare substanțială unui agent de implementare. Constatările ulterioare pot justifica revizuirea documentată a unei decizii anterioare.

## O predare utilă a sarcinii și a contextului

O predare concisă ar trebui să precizeze:

1. Rolul, întrebarea de rezolvat, rezultatul așteptat și punctul de oprire.
2. Fișierele-sursă sau textul furnizat, cu versiunea exactă a artefactului revizuit.
3. Cerințele și deciziile convenite, distincte de ipoteze și întrebări deschise.
4. Constrângerile, scenariile, invariantele și celelalte criterii de revizuire relevante.
5. Verificările deja făcute și ce mai rămâne de verificat.

Păstrează rezumatul scurt și include trimiteri la sursele detaliate. Oferă agentului de revizuire atât materialul-sursă, cât și rezumatul, astfel încât să poată identifica informații lipsă sau denaturate. Dacă instrumentul nu poate deschide fișierele din repository, copiază sau atașează conținutul lor relevant.

## Ce trebuie păstrat

Pentru deciziile importante, consemnează rolul, instrumentul/modelul așa cum îl afișează instrumentul (sau „neafișat”), data și fragmentele relevante din datele de intrare și rezultate. Păstrează versiunea artefactului revizuit, constatările revizuirii și decizia ta pentru fiecare constatare importantă: acceptată, respinsă cu justificare sau lăsată deschisă, cu următoarea verificare precizată. Indică cerința, scenariul, secțiunea artefactului sau verificarea executată care susține decizia.

Afirmația unui asistent că un test a trecut nu arată că testul a fost executat. Marchează verificările ca propuse sau executate și păstrează rezultatele reale ale celor executate. Un exemplu didactic pregătit trebuie etichetat ca atare; nu îl prezenta drept o execuție înregistrată. O propunere corectă poate fi acceptată pe baza verificărilor; nu există un număr obligatoriu de defecte de găsit sau o cerință de a reproduce exact formulările generate.

Păstrează instrucțiunile, rezumatele și artefactele ușor de înțeles pentru colegii de echipă. Alege text, tabele, schițe, pseudocod, teste sau diagrame în funcție de întrebarea de proiectare; nicio notație anume nu este obligatorie.
