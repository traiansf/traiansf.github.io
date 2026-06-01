---
title: "AMSS 2026 — Lab 2: Class Diagrams from Spec"
author: "Traian-Florin Șerbănuță"
date: "2026"
---

# Lab 2: Class Diagrams from AI

Three phases, 100 minutes — **you work solo this time.**

1. **Brief + spec** (~10 min) — read the 1-page spec; recall the read-order.
2. **Drive-and-critique drill** (~70 min) — drive AI to a class diagram, critique it, re-prompt twice.
3. **Share-out** (~20 min) — compare which defects the AI produced across the room.

Deliverable: a PlantUML class diagram + a critique log (1 page max), committed to the course lab repo.

::: notes
The hands-on follow-through of the W4 lecture. In W4 you watched the architect-critic loop on a bike-sharing class diagram; today you run it yourself, alone, on a different domain. Solo — because the oral defense is individual and cold.
:::

---

# Before You Start

- Continue.dev already working from Lab 1 — same endpoint, same config.
- You receive at lab start: your **student-id**, the lab-repo URL, and the **1-page spec** (also in `lab02/README.md` on clone).
- This is an **individual** lab. You play both roles — architect *and* critic — yourself.

::: notes
No tooling onboarding this week; the endpoint was activated in Lab 1. Anyone whose endpoint regressed switches to the Gemini free-tier config now (tooling/SETUP.md).
:::

---

# The Domain: Library Kiosk

A neighbourhood library runs a self-service kiosk. This spec is **honest — no planted tricks.** The defects you will catch come from the AI, not the spec.

- The library owns a **catalogue of titles**. A *title* (book) has an ISBN, a title, and one or more authors.
- A popular title may have **several physical copies**. A *copy* has its own barcode and a condition. A copy belongs to the library and stays in the catalogue even when nobody has borrowed it.
- A **member** has a membership number, a name, and an email. Members come in two kinds: **standard** (up to 3 open loans) and **staff** (up to 10).
- To borrow, a member scans a **copy**. That opens a **loan**: one member, one copy, a start date, a due date (14 days on). A copy on loan cannot be borrowed by anyone else until returned.
- A member may have many loans over time, and several open at once (up to their limit). A loan always refers to **exactly one copy and one member**.
- On return, the member scans the copy; the loan closes with a return date, and records a **fine** if late.
- The kiosk shows a member their open loans and any fines owed.

::: notes
The full spec is also seeded in lab02/README.md. The traps are natural: title-vs-copy (multiplicity), the library *holds* copies that outlive loans (aggregation), loan = one copy + one member (M:N trap), standard-vs-staff (is-a). Read it once and start driving.
:::

---
