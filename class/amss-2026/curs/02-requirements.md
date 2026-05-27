---
title: "AMSS 2026 — Lecture 2: Requirements with AI"
author: "Traian-Florin Șerbănuță"
date: "2026"
---

# Today's Agenda

1. Frame: architect-critic recap + today's spine
2. Live demo: AI-driven requirements gathering
3. Requirements types: functional / non-functional / domain
4. Prompting for elicitation
5. AI failure modes catalogue
6. Use cases as a structuring lens
7. Bridge to W3 + Lab 1 preview

::: notes
Today is content; Lab 1 this week is your hands-on follow-through. The demo previews what Lab 1 asks you to do in pairs.

No re-introduction. Students saw who I was in W1. Open straight into structure.
:::

---

# Recap: Architect + Critic

- **Architect / director (B):** drive AI through the SDLC.
- **Critic / reviewer (A):** read AI's output and name what's wrong or missing.

Last week you saw one cycle of this on a class diagram. Today: same loop, different artifact.

::: notes
Slidy `. . .` not used here — students already saw the reveal in W1. Plain bullets are fine for the recap.
:::

---

# Today's Loop Runs on Requirements

- Architect prompt → AI generates a requirements doc.
- Critic reads it → finds fabrication, vague NFRs, over-spec'ing.
- Architect re-prompts with structure → AI tightens.

Each pass costs ~3-5 minutes with current models. In practice you'd iterate 3-5 times before locking the doc.

::: notes
The "iterate 3-5 times" point is what Lab 1 makes students do hands-on. Don't over-explain it now — it lands again in the close.
:::

---

# Four Threads in Today's Lecture

1. Requirements types — functional, non-functional, domain.
2. Prompting for elicitation — how vocabulary shapes AI output.
3. AI failure modes — fabrication, over-specification, vague NFRs.
4. Use cases as a structuring lens.

The demo touches all four; the deeper-dive segments name each one.

::: notes
Section preview. Brief. Students see the spine before the demo so they have hooks ready.
:::

---

# Literacy Floor: F1 + F3 + F4

From W1: in the oral defense, *unaided*, you must demonstrate:

- **F1** — read & critique AI-generated artifacts on the spot.
- **F3** — articulate why you directed AI a certain way.
- **F4** — defend traceability across your project.

Today drills F1 (failure-modes catalogue) and seeds F4 (traceability starts at requirements).

::: notes
First of two F1+F3+F4 mentions today (the second lands in the close). Deliberate repetition — say it the same way each time.
:::

---
