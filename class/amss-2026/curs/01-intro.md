---
title: "AMSS 2026 — Lecture 1: Intro + the AI-mediated SDLC"
author: "Traian-Florin Șerbănuță"
date: "2026"
---

# Welcome

- AMSS 2026 — Analiza și Modelarea Sistemelor Software
- *Ediția AI-mediated*
- Instructor: Traian-Florin Șerbănuță
- Email: traian.serbanuta@unibuc.ro
- Semester: Fall 2026

::: notes
Welcome students. Brief self-introduction. Note that this is a redesigned course — students who have heard about previous AMSS editions from older students should expect a different shape.
:::

---

# Today's Agenda

1. Frame: the architect-critic loop + 5 course commitments
2. Live demo: an AI-driven design loop on a tiny scenario
3. What AI changes at each SDLC stage
4. Tooling preview
5. Course logistics

::: notes
Tell students: today is the framing day. Week 2 is where the work begins — Lab 1 has hands-on tooling onboarding, and W2 covers requirements with AI.

This lecture deliberately ends earlier than 100 minutes. There is room for questions throughout.
:::

---

# AI Is Changing the SDLC

- Requirements, models, code, tests — all increasingly AI-generated.
- The skill is no longer *producing* artifacts. It's *directing* AI to produce them and *judging* what comes back.
- This course teaches both halves.

::: notes
Set the stage. Many students have used ChatGPT or similar in courses. Today we name what they've already been doing implicitly and turn it into a discipline.
:::

---

# The Architect-Critic Loop

::: notes
This is the central mental model of the course. Name it now; refer back to it constantly across the next 13 weeks.
:::

. . .

- **Architect** — drive AI through the SDLC. Prompt, redirect, choose what to keep.
- **Critic** — read AI's output. Spot fabrication. Spot wrong multiplicity. Spot decorative pattern application.

::: notes
The slidy `. . .` produces an incremental reveal: the title appears first, then the two roles. Lets you set up the concept before naming the roles.
:::

---

# Your Role: Both Halves

You are simultaneously:

- **Architect / director (B):** drive the work
- **Critic / reviewer (A):** read the work

The architect-half makes you the owner of the design.
The critic-half makes you the owner of the quality.

::: notes
Why both? Pure-critic students stay passive; pure-architect students coast on AI output. A+B forces both halves and produces a trail of decisions that's hard to fake. (This rationale is in parent spec §1's "Design rationale".)
:::

---

# Five Course Commitments (1/5)

> **AI is the default tool, not an exception.**

Every artifact in this course — requirements, models, code, tests — is normally generated *with* AI. Your value-add is direction, judgment, and correction.

::: notes
This reverses the AMSS 2025 rule that explicitly forbade auto-generated artifacts. State the reversal plainly so students don't carry old assumptions in.
:::

---

# Five Course Commitments (2/5)

> **The trail is graded, not the running system.**

What gets graded: directed-design narrative + final reviewed artifact set + oral defense.
What does *not* get graded: running code, raw test pass-rates, hand-drawn diagrams.

::: notes
The grade lives in *what you did to AI's output*, not in the output itself. Code-quality grading is the parallel implementation course's job.
:::

---

# Five Course Commitments (3/5)

> **Implementation is a forcing function, not a deliverable.**

TDD-with-AI is *required* for the project — but its output is *never* a grading line item.

The reflection on what TDD revealed about your spec is what gets read.

::: notes
Why required-but-ungraded? Writing a testable spec is harder than writing a vague one. AI-generated tests against vague specs reveal gaps fast. We want the forcing function without competing with the parallel course's code grading.
:::

---

# Five Course Commitments (4/5)

> **Defensible literacy floor — F1 + F3 + F4.**

In the oral defense, *unaided*, you must demonstrate:

- **F1** — Read & critique any AI-generated UML diagram on the spot.
- **F3** — Articulate why you directed AI a certain way and what you accepted or rejected.
- **F4** — Defend traceability across your project: requirement → use case → class → state/sequence → test.

::: notes
You will hear F1+F3+F4 named twice more today (in the SDLC walkthrough and in the oral-defense rubric). Deliberate repetition. This is the spine of the course.
:::

---

# Five Course Commitments (5/5)

> **Tooling parity.**

Every student uses the same canonical agentic tooling: one editor extension, one model endpoint, one config file.

You may *also* use Claude Code, Copilot, Cursor on personal accounts — but graded artifacts must reproduce on the canonical setup.

::: notes
Tooling parity is what lets the cohort learn from each other's defect logs. It also lets the examiner reproduce student work during oral defense. Practical detail in Lab 1.
:::

---

# Watch For Both Moves

In the demo coming up:

- When I'm typing prompts → that's the **architect** move.
- When I'm reading AI's output and pointing at problems → that's the **critic** move.

You're going to do both halves yourself, starting in Lab 1.

::: notes
This handoff slide stays up until the demo trigger replaces it. Pause briefly so students can shift from listening to watching.
:::

---
