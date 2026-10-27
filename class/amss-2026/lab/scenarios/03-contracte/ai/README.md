# Pregătirea demonstrației AI comune — depozit

**Prompturi pregătite, nu capturi.** Profesorul conduce o singură analiză și o singură revizuire în plen, live sau pornind de la răspunsuri reale obținute înaintea laboratorului. Nu există încă asemenea răspunsuri în acest dosar. Studenții nu au nevoie de conturi AI și nu pornesc sesiuni proprii.

## Analiză

Folosiți `analist-prompt.md`, care conține instrucțiunea exactă și [enunțul](../scenario.md). `context.md` și hash-ul lui din `context-metadata.json` identifică versiunea pregătită. Nu adăugați soluția din referință. Cereți studenților predicții pentru S2, S3 și S5 înainte să afișați răspunsul.

## Revizuire

Deschideți un context nou, cu același enunț, sarcina analistului AI și propunerea integrală, folosind această instrucțiune:

> Ești evaluator (agent AI de revizuire). Verifică propunerea față de enunț și sarcina de analiză. Pentru fiecare observație indică fragmentul, regula relevantă și un scenariu cu starea de pornire și rezultatul așteptat. Verifică responsabilitățile, cantitățile la ridicare, refuzurile, efectul asupra altor rezervări și istoricul. Confirmă și afirmațiile corecte. Nu presupune un număr de greșeli și nu scrie cod. Răspunde în română, în maximum 350 de cuvinte.

Salvați promptul efectiv cu propunerea inclusă înainte de rulare, apoi răspunsul integral. Înregistrați data, instrumentul, modelul declarat și setările cunoscute; nu inventați metadate care nu sunt disponibile. Pentru capturi pregătite creați un dosar datat în `../captures/`, păstrând toate încercările și motivul selecției.

## Alternativa fără răspuns AI

Folosiți [exemplul pregătit](../prepared-fixture.md), etichetat drept **exemplu didactic construit**, și revizuiți-l în plen. Nu îl prezentați drept răspuns al unui model. Regulile rezumate rămân pe ecran, alături de fragmentul analizat. Nu distribuiți încercări separate studenților dacă instrumentul profesorului nu funcționează.
