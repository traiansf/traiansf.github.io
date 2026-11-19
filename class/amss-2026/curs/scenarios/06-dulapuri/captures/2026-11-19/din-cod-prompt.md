Scrie contractul operației atribuie de mai jos: precondițiile, condiția de succes, postcondițiile pentru fiecare rezultat și invarianții. Apoi scrie cinci teste pentru ea, fiecare cu registrul dinainte, apelul, rezultatul așteptat și registrul așteptat după. Nu scrie cod. Răspunde în română, în maximum 350 de cuvinte.

# Registrul dulapurilor unui muzeu — operația atribuie

La intrarea într-un muzeu, vizitatorii primesc dulapuri pentru bagaje. Registrul ține asocierile vizitator–dulap: un vizitator are cel mult un dulap, iar un dulap are cel mult un vizitator. Identificatorii sunt cunoscuți, iar apelurile sunt secvențiale. Rezultatele posibile ale operației sunt `atribuit` și `refuz`.

Operația, în pseudocod:

```text
atribuie(v, d):
    elimină asocierea existentă a lui v, dacă există
    dacă d este ocupat: întoarce refuz
    adaugă v–d
    întoarce atribuit
```

Pentru teste: B = {V1–D1, V2–D2}; vizitatorul V3 nu are dulap, iar dulapul D3 este liber. Fiecare test pornește din B.
