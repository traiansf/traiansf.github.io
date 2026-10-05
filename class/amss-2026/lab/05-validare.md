---
title: "AMSS 2026 — Lab 5: Validare și abstractizare"
author: "Traian-Florin Șerbănuță"
date: "2026"
---

# Lab 5: Validare și abstractizare

**Plan de laborator — scenariul și materialele de lucru urmează să fie dezvoltate înainte de publicare.**

Aplicăm cursurile **9–10**, deja predate: proprietăți și limite ale verificării, apoi alegerea unei abstractizări potrivite unei variații.

Lucrăm pe o problemă dată, diferită de proiectele echipelor. Nu ne bazăm pe reconstrucția și migrarea unui sistem existent, care se predau abia la cursul 11.

---

# Citatul zilei

> „[…] să arate prezența erorilor, dar niciodată absența lor.”
>
> Original: “show the presence of bugs, but never to show their absence”

— **Edsger W. Dijkstra**

[Sursa: Concern for Correctness as a Guiding Principle for Program Composition — EWD288](https://www.cs.utexas.edu/~EWD/transcriptions/EWD02xx/EWD288.html)

::: notes
Arhiva universitară a autorului, paragraful The first moral of this story. Fragment din afirmația despre testarea programelor; începutul omis este marcat.

Legătura cu tema: Despre testare: exemplele pot expune o eroare, dar nu dovedesc singure corectitudinea pentru toate execuțiile. Distingeți testarea de demonstrație și de explorarea exhaustivă a unui model finit.
:::

---

# Problema propusă

Un raport de activitate poate fi exportat ca text sau CSV. Câmpurile marcate pentru ascundere trebuie să lipsească în toate formatele.

Se vor da câmpurile, politica de ascundere, regulile formatelor, înregistrări reprezentative și o posibilă cerință pentru un al treilea format. Streaming-ul și extensiile externe sunt în afara exercițiului.

Ce proprietăți verificăm? Unde păstrăm regula comună și ce poate varia?

---

# Parcurs propus — 100 de minute

| Minute | Activitate |
|---|---|
| 0–10 | Anticipați individual rezultatele verificărilor. |
| 10–30 | Formulați proprietățile și limitele modelului. |
| 30–55 | Examinați și rulați verificările date sau parcurgeți explicit scenarii manuale. |
| 55–75 | Comparați variante de proiectare pentru cazul în care apare un al treilea format. |
| 75–90 | Revizuiți separat decizia și justificarea ei. |
| 90–100 | Explicați alegerea și limitele verificării. |

---

# Ce comparăm și ce păstrăm

- O condiție pe format, funcții separate și o abstractizare pentru formatare.
- Cum respectă fiecare variantă aceeași politică de ascundere.
- Cât costă introducerea formatului nou și ce dependențe apar.
- Proprietățile, rezultatele reale sau scenariile manuale și limitele lor.
- O alegere justificată, fără a presupune că soluția cea mai extensibilă este întotdeauna mai bună.

Exemplele selectate nu demonstrează singure o proprietate pentru toate intrările. Exercițiul este formativ: nu are punctaj separat și nu cere implementarea unei aplicații.
