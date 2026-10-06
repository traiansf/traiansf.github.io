# AMSS 2026/2027 — Instrumente AI: roluri, predarea sarcinilor și revizuire

Alege un asistent și un model la care ai acces. Poți urma modul de lucru al cursului printr-o conversație în browser, un asistent integrat în editor sau un instrument local. Se evaluează analiza, deciziile de proiectare și justificarea lor. Nu este obligatoriu un anumit furnizor, abonament, model, nivel al efortului de raționament sau instrument pentru diagrame.

## Începe de aici

- [SETUP.md](SETUP.md): obține materialele, pregătește spațiul de lucru și exersează predarea unei sarcini (handoff), cu contextul necesar, de la analiză la revizuire (review).
- [template/AGENTS.md](template/AGENTS.md): instrucțiuni pe care le poți folosi cu orice asistent. Adaugă-le la instrucțiunile pe care repository-ul le are deja sau dă-le direct asistentului, într-o conversație.
- `template/CLAUDE.md`: un punct de intrare opțional către aceleași instrucțiuni.
- `template/.claude/settings.json` și `template/.codex/config.toml`: fișiere de configurare opționale, fără setări. Nu selectează un model sau un nivel al efortului de raționament. Păstrează setările existente; nu le suprascrie copiind întregul director de șabloane.

În curs, specificația și proiectarea se elaborează temeinic înainte ca aplicația să fie implementată. Pe parcurs, o incertitudine poate fi clarificată prin prototipuri mici, modele executabile și exemple de acceptare. Proiectul nu cere o aplicație funcțională.

## Roluri și momente de revizuire

Tu răspunzi de formularea problemei și de acceptarea sau respingerea modificărilor. Fă mai întâi o scurtă analiză proprie, apoi deleagă o sarcină delimitată, cu un rol clar.

| Rol | Date de intrare | Rezultat de verificat |
|---|---|---|
| Analist | Descrierea inițială a problemei, răspunsurile beneficiarului, analiza ta inițială | Limitele soluției, cerințe, vocabularul domeniului, ipoteze, întrebări deschise, exemple de acceptare |
| Proiectant | Specificația revizuită și întrebările nerezolvate | Responsabilități și dependențe, contracte și invarianți, comportament, alternative și justificări |
| Agent de revizuire | Descrierea inițială a problemei, artefactele curente, criterii explicite de revizuire | Constatări susținute de surse, scenarii sau contraexemple și limitele revizuirii |
| Autor de modele/prototipuri, când este util | O întrebare delimitată și partea de proiectare implicată, deja revizuită | Un model sau experiment mic, verificări, rezultate și ce se poate sau nu se poate deduce din ele |

Când este util, folosește sesiuni separate pentru aceste roluri; nu e nevoie ca ele să ruleze simultan sau să folosească modele diferite. Pentru revizuire, începe o conversație nouă sau un context nou de agent și dă-i explicit sursele, artefactele și criteriile curente. Dacă îi spui asistentului care a scris artefactul să treacă la alt rol în aceeași conversație, revizuirea nu are loc într-un context separat.

Revizuiește limitele soluției și ipotezele înainte de a dezvolta proiectarea. Revizuiește regulile domeniului, responsabilitățile, contractele, comportamentul și rezultatele validării înainte de a preda o proiectare substanțială unui agent de implementare. Ce constați ulterior poate justifica revizuirea unei decizii anterioare, cu motivul consemnat.

## O predare utilă a sarcinii și a contextului

O predare concisă ar trebui să precizeze:

1. Rolul, întrebarea de rezolvat, rezultatul așteptat și momentul în care agentul se oprește.
2. Fișierele-sursă sau textul primit, cu versiunea exactă a artefactului revizuit.
3. Cerințele și deciziile convenite, separate de ipoteze și de întrebările deschise.
4. Constrângerile, scenariile, invarianții și celelalte criterii după care se face revizuirea.
5. Verificările deja făcute și ce mai rămâne de verificat.

Rezumatul trebuie să fie scurt și să trimită la sursele detaliate. Dă evaluatorului (agentului de revizuire) atât materialul-sursă, cât și rezumatul, ca să poată observa informațiile lipsă sau denaturate. Dacă instrumentul nu poate deschide fișierele din repository, copiază sau atașează părțile de care are nevoie.

## Ce trebuie păstrat

Pentru deciziile importante, consemnează rolul, instrumentul/modelul așa cum îl afișează instrumentul (sau „neafișat”), data și fragmentele importante din datele de intrare și din rezultate. Păstrează versiunea artefactului revizuit, constatările revizuirii și decizia ta pentru fiecare constatare importantă: acceptată, respinsă cu justificare sau lăsată deschisă, cu următoarea verificare precizată. Indică cerința, scenariul, secțiunea din artefact sau verificarea executată pe care se sprijină decizia.

Dacă un asistent afirmă că un test a trecut, asta nu înseamnă că testul a fost executat. Marchează verificările ca propuse sau executate și păstrează rezultatele reale ale celor executate. Un exemplu didactic pregătit trebuie etichetat ca atare; nu îl prezenta drept o execuție înregistrată. O propunere corectă poate fi acceptată pe baza verificărilor; nu trebuie găsit un anumit număr de defecte și nici reproduse exact formulările generate.

Scrie instrucțiunile, rezumatele și artefactele astfel încât colegii de echipă să le înțeleagă ușor. Alege text, tabele, schițe, pseudocod, teste sau diagrame în funcție de întrebarea de proiectare; nicio notație anume nu este obligatorie.
