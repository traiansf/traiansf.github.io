# Capturi pregătite pentru discuție — depozit

Material pentru etapa AI, condusă de profesor în plen, când nu folosim o rulare live. Răspunsuri reale Claude Haiku 4.5, din 27 octombrie 2026 (Claude Code 2.1.311, fără unelte și fără contextul proiectului); enunțul este un exemplu didactic. Fragmentele sunt fidele, cu omisiunile marcate; răspunsurile integrale, metadatele și toate încercările sunt în [arhivă](captures/2026-10-27/README.md). Selecția nu descrie performanța tipică a modelului.

## Sarcina analistului AI

Context: [enunțul efectiv trimis](captures/2026-10-27/context.md).

> Propune o repartizare a responsabilităților pentru modificarea registrului și formulează contractele operațiilor rezerva, ridica și anuleaza: precondiții, condiții de succes, efecte, refuzuri și invarianți. Calculează S2, S3 și S5. Compară pe scurt cu verificări separate în formular și import. Nu scrie cod. Răspunde în română, în maximum 450 de cuvinte.

Fragmente din [analistul AI 01](captures/2026-10-27/haiku45-analist-01-response.md), contractul `rezerva` și scenariul S3; restul răspunsului este omis:

> **Precondiții:** id ≠ 0; id nu apare deja în registru; q > 0; D ≥ q
>
> **Refuz:** Orice precondițiune încălcată ⇒ stare neschimbată
>
> **S3:** `ridica(A)` — A activ ✓ → Marcheaza A ridicată; F=10−4=**6**; R=4−4=**0**; D=6 (nemodificat).

Înainte de revizuire: ce parte este susținută de reguli? Ce promite contractul pentru `rezerva(B,7)` dacă D ≥ q este precondiție?

## Sarcina de revizuire

Într-un context nou, evaluatorul (agent AI de revizuire) primește enunțul, sarcina analistului AI și răspunsul integral. Instrucțiunea exactă:

> Ești evaluator (agent AI de revizuire). Verifică propunerea față de enunț și sarcina de analiză. Pentru fiecare observație indică fragmentul, regula relevantă și un scenariu cu starea de pornire și rezultatul așteptat. Verifică responsabilitățile, cantitățile la ridicare, refuzurile, efectul asupra altor rezervări și istoricul. Confirmă și afirmațiile corecte. Nu presupune un număr de greșeli și nu scrie cod. Răspunde în română, în maximum 350 de cuvinte.

Fragmente din [evaluatorul AI 02](captures/2026-10-27/haiku45-evaluator-02-response.md); restul răspunsului este omis:

> **3. Efect asupra altor rezervări** Propunerea nu enumeră explicit "alte rezervări rămân neschimbate". […]
>
> **Concluzie:** Propunerea e substantiv corectă. […] Nu sunt remedieri logice necesare.

## Decizia noastră

Confirmăm calculele S2, S3 și S5 și responsabilitatea comună a registrului. Acceptăm observația evaluatorului AI: R5 cere ca o operație să nu modifice alte rezervări, iar contractul trebuie să o spună. Corectăm ce nu a observat nici evaluatorul AI: codul nou, q>0 și q≤D sunt **condiții de succes**, nu precondiții; refuzul lor este promis și păstrează întregul registru. Precondițiile rămân cele din R1 (registru valid, apeluri pe rând, cantitate întreagă, identificator nenul). „id ≠ 0” nu este cerut de enunț.

Într-o rulare live folosim propunerea și observațiile efective. Dacă acestea sunt deja complete, le confirmăm; nu atribuim omisiunile acestor capturi unui alt răspuns.
