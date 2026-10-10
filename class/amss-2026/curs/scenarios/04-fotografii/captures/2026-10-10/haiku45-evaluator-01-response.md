# Evaluare: Model de domeniu pentru arhiva fotografică

## Afirmații susținute și corecte

**Concepte și relații fundamentale**: Modelul identifică corect identitatea stabilă a Fotografiei și Versiunii, atributul modificabil (Legenda) segregat pe Fotografie, și relațiile (N:1 fotografie–versiune, recursivă sursă). Acestea aliniate cu R1–R4 și scenariile S1–S4. ✓

**Restricții**: Patru restricții enunțate (stabilitate identificatori, unicitate original, izolare versiuni, coerență fotografie) acoperă regulile și permit verificarea corectă a S4. ✓

**Reprezentări**: Propunerea acceptă alegeri multiple (flag `esOriginal` vs. relație dedicată) fără a prescrie, respectând R6. ✓

---

## Imprecizii terminologice și structurale

**"Pădure" vs. "arbore"**: Propunerea zice „Fiecare Fotografie definește o **pădure** de versiuni cu rădăcina în original" (linie 1, secțiunea Rezultat structural). O pădure este o colecție de arbori disjuncți. Aici, însă, există o **singură rădăcină** (originalul), iar toate versiunile derivate se conectează la aceasta — direct sau indirect (R3, R4). Aceasta este o **structură de arbore**, nu de pădure. Pădure ar implica mai mulți arbori deconectați.

**"Doi copaci independenți"**: Linia a doua clarifică că „V3 și V4 din V1 nu sunt definiți [separat]", dar apelativul „copaci independenți" este inexact. V3 și V4 sunt **ramuri independente** ale aceluiași arbore cu rădăcina în original, nu doi arbori disjuncți. S3 confiră că pot deriva amândoi din V1, dar rămân într-o structură unică.

**"Orice configurație DAG"**: Descrierea „modelul permite orice configurație DAG cu original ca sursă indirectă" este supracercitoare. Un DAG general permite cicluri și căi multiple către același nod. Structura descrisă — unde fiecare versiune are exact o sursă, originala este singura fără sursă, și orice versiune nouă trebuie să derive din una existentă — este un **arbore** (caz special de DAG), nu o DAG arbitrară.

---

## Omisiuni minore

**R6 — Excluderi**: Modelul nu menționează explicit că respinge ștergere, albume, drepturi sau algoritmi, deși propunerea notează corect că nu prescrie bază de date sau notație. Enumerarea explicită ar consolida claritatea.

**S5 — Comportament nedefinit**: Propunerea remarcă corect că importul repetat nu e modelat; nu deduce identitate din egalitate fișierelor.

---

## Concluzie

Modelul este structurally sound și satisface regulile. Principala observație: terminologia „pădure" și „DAG" depășesc descrierea reală (arbore cu rădăcină unică). Corecția ar fi să se zică „**fiecare Fotografie definește un arbore de versiuni cu originalul ca rădăcină**".