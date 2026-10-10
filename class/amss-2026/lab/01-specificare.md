---
title: "AMSS 2026/2027 — Laboratorul 1: Înțelegere, specificare, revizuire"
author: "Traian-Florin Șerbănuță"
lang: ro-RO
---

# Înțelegem aceeași problemă? {.transition}

**0–10 min · Observăm și discutăm în perechi**

Cum știm că două persoane interpretează la fel o regulă?

::: notes
Transferăm în alt domeniu metoda din cursul 2: înțelegem cererea, încercăm exemple și verificăm revizuirea. Schițele și notițele sprijină conversația, fără documente de predat.

**Organizare:** minutul 0 din 100; interval 0–10 (10 min), inclusiv coperta și citatul. Perechi sau un trio; 14 slide-uri cu copertă. Nu presupunem teoria din cursurile 3–4. []{.pace at=0 of=100}
:::

---

# Citatul zilei

> „Simplitatea este o condiție necesară pentru fiabilitate.”
>
> Original: “Simplicity is prerequisite for reliability.”

— **Edsger W. Dijkstra**

[Sursa: How do we tell truths that might hurt? — EWD498](https://www.cs.virginia.edu/~evans/cs655/readings/ewd498.html)

::: notes
O regulă clară poate fi explicată unui coleg și încercată pe un exemplu. Simplitatea descrierii nu înseamnă să omitem tocmai cazul care desparte două interpretări.

**Sursă:** transcriere universitară; afirmație marcată drept adnotare manuscrisă. Original: arhiva Dijkstra, UT Austin, EWD498.
:::

---

# O spălătorie pentru cămin

Locatarii se programează la **Albastra** sau **Verdea**, într-o singură zi viitoare **D**, între **08:00 și 22:00**. Identitatea lor este deja verificată.

**Regulă convenită:** pe aceeași mașină, programările confirmate nu se suprapun; una poate începe exact când se termină alta.

Ioana are Albastra **10:00–11:00**. Radu cere aceeași mașină **11:00–12:00**.

Un minut individual, apoi cu un coleg: **acceptăm cererea? Ce informație justifică răspunsul?**

::: notes
Acceptăm: intervalele sunt alăturate, nu suprapuse. Exersăm argumentul din regulă înainte de AI sau de o formulă de comparare a intervalelor. Nu se cer instalări, repository sau alegerea unei tehnologii.

**Organizare:** 6 min, inclusiv discuția. []{.pace dur=6}
:::

---

# Construim o explicație comună {.transition}

**10–30 min · Un coleg explică, celălalt cere exemple; apoi schimbați rolurile**

Ce știm și ce trebuie întrebat?

::: notes
O întrebare deschisă nu anulează toate regulile cunoscute. Distingem informația convenită, consecința dedusă, ipoteza, întrebarea și propunerea de proiectare folosindu-le în conversație.

**Organizare:** minutul 10 din 100; interval 10–30 (20 min). Fișa este o referință, fără formular de completat. []{.pace at=10}
:::

---

# Reguli pe care le putem explica

- **Cererea:** locatar, mașină și interval valid în D, între 08:00 și 22:00; începutul precedă sfârșitul.
- **Disponibilitatea:** fără suprapuneri pe aceeași mașină; intervalele alăturate sunt permise.
- **Anularea:** titularul poate anula înainte de început; intervalul devine disponibil. Alt locatar nu poate anula.
- **Întrebare:** poate același locatar folosi două mașini în intervale suprapuse? Beneficiarul nu a decis.

Explicați colegului o regulă printr-un exemplu și o întrebare prin **două răspunsuri posibile**. Folosiți schițe sau notițe cât vă ajută.

[Fișa completă: F1–F8, Q1–Q3 și exemple](https://github.com/traiansf/traiansf.github.io/blob/main/class/amss-2026/lab/scenarios/01-specificare/scenario.md)

::: notes
Citim și limitele din fișă: confirmarea are cod, respingerea explică regula; plăți, notificări, recurență și administrare sunt excluse. F5 garantează exact o acceptare pentru două cereri simultane conflictuale pe o mașină liberă; nu convenim prioritatea. Anularea la sau după început și limitele viitoare sunt întrebări separate.

**Organizare:** 19 min: 4 citire, 6 explicații, 6 schimbarea rolurilor, 3 răspunsuri comune. []{.pace dur=19}
:::

---

# Punem explicația la încercare {.transition}

**30–50 min · Comparăm cu o altă pereche**

Ce exemplu desparte două interpretări?

::: notes
Scopul schimbului este să observăm ce ar înțelege altcineva din explicația noastră. Nu cerem un număr de greșeli sau un tabel completat pentru fiecare scenariu.

**Organizare:** minutul 30 din 100; interval 30–50 (20 min). []{.pace at=30}
:::

---

# Alegeți un caz pentru colegi

**Fiecare caz pornește separat:** Ioana are Albastra 10:00–11:00; celelalte intervale sunt libere. Toate cererile sunt pentru D.

| Caz | Ce încearcă cineva |
|---|---|
| Suprapunere | Radu cere Albastra 10:30–11:30. |
| Limită | Radu cere Albastra 11:00–12:00. |
| Anulare | La 09:00 Ioana anulează; Radu cere apoi 10:00–11:00. |
| Întrebare deschisă | Ioana cere și Verdea 10:30–11:30. |

Fără suprapuneri pe aceeași mașină; alăturarea este permisă. Titularul poate anula înainte de început. Suprapunerea aceluiași locatar pe mașini diferite rămâne neconvenită.

**Ce rezultat puteți promite și de ce?** Cealaltă pereche îl explică prima.

::: notes
Rezultate: respingere, confirmare, anulare urmată de confirmare, respectiv rezultat încă neconvenit. Comparați două cazuri care au făcut perechile să ezite; nu trebuie parcurse toate public. Extensie: Radu nu poate anula programarea Ioanei; încercarea o păstrează.

**Organizare:** 19 min: 2 alegerea cazului, 12 schimb între perechi, 5 discuție. []{.pace dur=19}
:::

---

# Comparăm cu AI sau cu alți colegi {.transition}

**50–75 min · Verificăm afirmațiile și discutăm revizuirea**

Ce rămâne adevărat chiar dacă lipsește o decizie?

::: notes
Separăm rezultatul garantat de alegerea încă deschisă. Putem face aceeași verificare pe răspunsul pregătit, pe unul generat de studenți sau pe explicația altei perechi.

**Organizare:** minutul 50 din 100; interval 50–75 (25 min). Capturile sunt disponibile și fără un instrument AI funcțional. Nu consumăm etapa cu configurări. []{.pace at=50}
:::

---

# O concluzie AI de verificat

**Prompt real**, cu fișa completă drept context:

> Analizează regulile pilotului. Propune o descriere concisă a conceptelor și explică rezultatele S2, S3, S5 și S8. Distinge regulile convenite de întrebările deschise. Nu scrie cod și nu decide în numele beneficiarului. Răspunde în română, în maximum 350 de cuvinte.

**Captură · Haiku 4.5 · 10.10.2026 · analist 01**, fragment:

> Beneficiarul trebuie să decidă asupra Q1 înainte ca S8 și S5 să aibă rezultate garantate.

**S5:** două cereri simultane valide pentru Albastra liberă, 13:00–14:00. **F5:** exact una este acceptată, fără prioritate convenită. **Q1** privește același locatar pe mașini diferite. Este justificată concluzia despre S5?

::: notes
Nu. F5 garantează deja numărul acceptărilor; nu spune cine câștigă. Q1 privește S8, pe două mașini, nu S5. Analistul AI descrie corect garanția în secțiunea despre S5, apoi o contrazice în concluzie. Păstrăm ambele în răspunsul integral.

**Organizare:** 12 min: 2 citire, 6 comparație în pereche, 4 argumente comune. La rulare proprie furnizați și fișa, nu doar instrucțiunea. []{.pace dur=12}
:::

---

# Verificăm și revizuirea

Într-un context nou, dați unui **evaluator (agent AI de revizuire)** fișa, sarcina și răspunsul. Cereți observații legate de reguli și cazuri. Sau invitați altă pereche să facă această verificare.

**Captură reală · Haiku 4.5 · 10.10.2026 · evaluator 02**, fragment:

> Propunerea corect deduce rezultatul (una/una), dar greșit o conectează la întrebarea existentă.

**Acceptați observația?** Explicați colegului ce corectați și ce păstrați: F5 garantează exact o acceptare la două cereri simultane conflictuale pe mașina liberă.

::: notes
Observația este susținută: Q1 privește mașini diferite, iar S5 aceeași mașină. Fragmentul este din revizuirea 02, care a primit și sarcina analistului AI. În activitatea studenților furnizăm explicit și sarcina analistului AI, ca revizuirea să poată aprecia limitele cerute. Nu acceptăm automat toate observațiile dintr-o revizuire.

**Organizare:** 12 min: 5 revizuire sau captură, 4 decizie în pereche cu roluri schimbate, 3 discuție. []{.pace dur=12}
:::

---

# Discutăm o schimbare {.transition}

**75–100 min · Gândim individual, apoi comparăm explicațiile**

Ce trebuie clarificat înainte de a schimba regulile?

::: notes
O regulă nouă poate afecta și situații deja acceptate. Nu o aplicăm retrospectiv fără să stabilim ce a cerut beneficiarul.

**Organizare:** minutul 75 din 100; interval 75–100 (25 min): schimbare 14, conversație finală 10, tranziție 1. []{.pace at=75}
:::

---

# „De mâine, maximum 90 de minute”

Beneficiarul propune o **durată maximă de 90 de minute**. Până acum nu exista o limită convenită.

Ioana are deja confirmată pentru **D = mâine** o programare la Albastra, **10:00–12:00**.

Gândiți individual, apoi discutați în pereche:

1. Ce întrebare puneți înainte de a modifica programarea Ioanei?
2. Comparați două răspunsuri posibile ale beneficiarului.
3. Dacă regula se aplică numai cererilor noi, ce se întâmplă cu programarea existentă și cu o cerere nouă de 120 de minute?

::: notes
Clarificăm dacă limita afectează numai cereri noi sau și programări confirmate și momentul intrării în vigoare. Nu anulăm sau scurtăm automat programarea existentă. La punctul 3, programarea Ioanei rămâne, iar o cerere nouă supusă limitei este respinsă. Sistemul nu decide politica în locul beneficiarului.

**Organizare:** 14 min: 2 individual, 7 în pereche, 5 compararea răspunsurilor. []{.pace dur=14}
:::

---

# Ce a clarificat conversația?

Câteva perechi împărtășesc un exemplu:

- o regulă pe care au înțeles-o diferit la început;
- o întrebare care schimbă rezultatul promis;
- o observație de revizuire pe care au acceptat-o sau respins-o, cu motiv.

Păstrați ce vă ajută pentru studiu. **Nu avem documente de predat; încheiem prin explicații și întrebări.**

::: notes
Ascultăm două sau trei exemple, fără prezentări formale din partea tuturor. Urmărim dacă studenții pot lega rezultatul de enunț și pot distinge o regulă neconvenită de una deja garantată.

**Organizare:** 10 min; încheiere la minutul 100. []{.pace dur=10}
:::
