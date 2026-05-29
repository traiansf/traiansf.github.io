---
title: "AMSS 2026 — Lecture 4: Class Diagrams in the AI Loop"
author: "Traian-Florin Șerbănuță"
date: "2026"
---

# Today's Agenda

1. Frame: from behaviour (W3) to structure
2. Live demo: drive AI to a class diagram
3. Core notation: the reading floor
4. How AI gets class diagrams wrong
5. Reading critically: the F1 drill
6. Bridge to W5 + Lab 2

::: notes
W3 pinned behaviour with tests; today we model the structure that realises it — and Lab 2 this week is your hands-on follow-through. No re-introduction; open straight into structure.

Authoring note: this lecture reshapes 2025's `class/amss/curs/02-class.md` (Book-class compartments, aggregation/composition and generalization examples, and the over-complicated -> simplified diagram pair), reframed from "here is the notation" to "here is what AI gets wrong about it."
:::

---

# Recap: Architect + Critic

- **Architect / director (B):** drive AI through the SDLC.
- **Critic / reviewer (A):** read AI's output and name what's wrong or missing.

In W3 you critiqued AI-written tests. Today: the same loop, on a diagram.

::: notes
W3 was behaviour (tests); today is structure (classes). One breath of recap.
:::

---

# From Behaviour to Structure

- **W3 pinned what the system does** — a test says "a 60-minute rental costs €3.00."
- **Today: what objects realise it** — a `Rental`, a `Bike`, a `User`, a `Payment`, and how they relate.

The class diagram is the central structural artifact.

::: notes
The bridge from W3. The fare test implies objects: something holds the duration, something computes the charge. Today we draw that structure.
:::

---

# Four Threads Today

1. The class diagram as the central structural artifact.
2. Driving AI to produce one.
3. Reading it critically — multiplicity, fake associations, missing whole-part.
4. The literacy floor: what you must read & critique cold.

::: notes
Threads 3 and 4 are the payload. Brief preview before the demo.
:::

---

# Literacy Floor: F1 + F3 + F4

From W1: in the oral defense, *unaided*, you must demonstrate:

- **F1** — read & critique AI-generated artifacts on the spot.
- **F3** — articulate why you directed AI a certain way.
- **F4** — defend traceability across your project.

Today is F1 at its sharpest: read an AI-drawn class diagram and name what's wrong.

::: notes
First of two F1+F3+F4 mentions. F1 anchored this week — reading & critiquing a diagram cold IS the oral-defense skill. Same wording in the close.
:::

---

# Demo: Bike-Sharing Class Diagram

> Live: drive AI to draw the structure. Watch the multiplicities, the associations, and what's missing.

**Prompt to AI:** *"Generate a UML class diagram (as PlantUML) for the city bike-sharing app: users rent and return bicycles at stations across a city; payment is by app; staff rebalance bikes between stations."*

::: notes
Switch to Continue.dev with a PlantUML preview pane — students must SEE the rendered diagram. Run the runbook at `class/amss-2026/curs/04-class-diagrams-demo.md` for ~12-14 min. Fallback: runbook §8.
:::

---
