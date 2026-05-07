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

# Demo: Library Kiosk

> Live AI design loop. Watch the architect move and the critic move.

**Prompt to AI:** *"Generate a UML class diagram for a small library kiosk: users borrow and return books; staff register returns; books can be reserved while on loan."*

::: notes
Switch to Continue.dev. Run the runbook at `class/amss-2026/curs/01-intro-demo.md` for the full 12 min. This slide stays on screen as the lecture-side anchor — students glance back at the prompt while the diagram appears in the editor.

If live AI fails, the runbook §6 covers the fallback path.
:::

---

# What AI Changes at Each SDLC Stage

The next 7 slides walk the SDLC stage by stage.

For each: **what AI does well** vs. **where AI fails**.

This is also the rest of your semester — each stage previews a future week.

::: notes
Section opener. Brief — students just came back from a demo, give them a beat to reset before the survey.
:::

---

# Requirements Gathering (W2 preview)

**AI does well:**

- Drafts long lists of plausible-looking requirements fast.
- Surfaces stakeholder roles and use cases you might not have considered.

**AI fails at:**

- Fabricating non-functional requirements without grounding.
- Vague NFRs ("the system shall be performant").
- Over-specifying — generating 200 requirements where 20 would do.

::: notes
W2 lecture covers the failure modes in detail. Lab 1 is a hands-on requirements drill.
:::

---

# Test/Spec Design (W3 preview)

**AI does well:**

- Generates test scaffolds from a clear specification.
- Surfaces edge cases the spec doesn't mention.

**AI fails at:**

- Producing tests for vague specs — they pass for the wrong reasons.
- Over-fitting tests to a particular implementation.

> If AI can't produce a passing test from your spec, your spec is too vague.

::: notes
This last line is the W3 mantra. The required-but-ungraded TDD loop in the project hangs on this idea.
:::

---

# Structural Modeling (W4-5 preview)

**AI does well:**

- Drafts a class diagram from a one-page spec in seconds.
- Suggests reasonable class names and relationships.

**AI fails at:**

- Wrong multiplicities (you saw one in the demo).
- Fabricated classes with no behavior.
- Conflating abstract concepts with concrete instances.

::: notes
W4 = class diagrams. W5 = object/package/component/deployment. The demo we just did is the prototypical W4 exercise.
:::

---

# Behavioral Modeling (W6-7 preview)

**AI does well:**

- Generates sequence diagrams for happy-path scenarios.
- Sketches state machines for object lifecycles.

**AI fails at:**

- Fabricating messages between objects that don't exist.
- Missing guards on state transitions.
- Orphan states / unreachable transitions.

::: notes
W6 = use cases + sequence. W7 = state + activity.
:::

---

# Patterns (W8-9 preview)

**AI does well:**

- Recognizes textbook pattern situations and applies them.
- Knows the GoF vocabulary.

**AI fails at:**

- Decorating code with patterns that solve nothing.
- Overusing patterns where simple code would do.
- Calling something "Visitor" when it's just an `if/else` on a type tag.

::: notes
W8 = pattern selection. W9 = pattern integration & critique. The critique frame is heavy here — many AI pattern applications look right and are wrong.
:::

---

# Quality, Traceability, Evaluation (W10-11 preview)

**AI does well:**

- Cross-references artifacts on demand.
- Spots structural gaps if asked the right question.

**AI fails at:**

- Maintaining traceability across iterations.
- Self-evaluating its own output.
- Catching consistency issues without being prompted.

::: notes
W10 = the full trace (requirement → use case → class → state/sequence → test). W11 = quality criteria + simulation. F4 (defensible traceability) is anchored here.
:::

---

# Coding (Out of Scope Here)

Implementation is a *parallel course's* domain — not ours.

We use it as our **forcing function**: TDD-with-AI is required for the project, but its output is never graded.

What gets read is your *reflection on what the loop revealed*.

::: notes
This is the third commitment again, in concrete form. Recap briefly so students understand why they will write code but it won't be graded.
:::

---

# Back to F1 + F3 + F4

Every stage above gets evaluated through the same three abilities:

- **F1** — read & critique what AI produced.
- **F3** — articulate why you directed AI the way you did.
- **F4** — defend the trace from one stage to the next.

This is the literacy floor. The oral defense tests it directly.

::: notes
Second mention of F1+F3+F4 (first was in commitment #4). Deliberate repetition — say it the same way each time.
:::

---

# What You Just Saw: The Course Tooling

- **Editor:** VS Code with the Continue.dev extension.
- **Endpoint:** the canonical course model endpoint (configured in `tooling/.continue/config.yaml`).
- **Mode:** agentic chat — file-and-repo aware, not browser ChatGPT.

This is what every student in the cohort runs.

::: notes
Refer back to the demo briefly. Don't re-introduce Continue.dev as if for the first time — students just watched it work.

The actual canonical endpoint depends on the procurement decision (institutional `llm.fmi.unibuc.ro` / per-student Gemini free-tier / pooled paid API). Whichever it ends up being, the *config* is the same shape.
:::

---

# Where We Install: Lab 1

- Lab 1 (Week 2): hands-on tooling onboarding. Don't try alone before then.
- Setup guide: `tooling/SETUP.md` in the course repo.
- Estimated time: ~30 min on a working laptop.

::: notes
Lab 1 walks every student through install + first AI-driven requirements gathering. Pre-requisites: VS Code + Git. Course-issued endpoint credentials are handed out at the start of Lab 1.
:::

---

# Tooling Parity (BYO Allowed, On Top)

You may also use, on your personal accounts:

- Claude Code, GitHub Copilot, Cursor — anything you have access to.

**But:** every graded artifact must reproduce on the canonical setup.

This is what lets the examiner reproduce your work during the oral defense.

::: notes
Be explicit: BYO is a power-user upgrade, not a substitute. Students who only run their personal tools and skip the canonical setup will fail the oral defense's reproduction check.
:::

---

# Schedule

- **14 weeks** of lectures, one per week (100 min each).
- **7 labs**, biweekly (Weeks 2, 4, 6, 8, 10, 12, 14 — 100 min each).
- Course landing page: `traiansf.github.io/class/amss2026/`.

::: notes
Walk the schedule briefly. Note that lab weeks alternate — students don't have a lab every week.
:::

---

# Final Grade

| Component | Points |
|---|---|
| Project | 8 |
| Attendance | 1 |
| *Din oficiu* | 1 |
| **Total** | **10** |

::: notes
*Din oficiu* = mandatory by university convention; everyone gets it. Real differentiation lives in the project's 8 points.
:::

---

# The Project

- **Teams of 3-5 students.**
- Domain announced by **31 October 2026**.
- Multiple teams may share a domain — the directed-design trails differ.
- Each student owns a **slice** of their team's system.
- December checkpoint (Lab 5): 1 of the 8 project points.
- Final defense (W14 + Lab 7): the rest.

::: notes
Project README has the full rubric. Slice ownership is what makes the cold-defense work — every student must be able to walk their own slice end-to-end.
:::

---

# Oral Defense — F1 + F3 + F4

Cold defense, 3 of 8 project points. *Unaided*, you must:

- **F1** — Read & critique any AI-generated UML diagram from any team's repo.
- **F3** — Articulate rationale for your own design decisions.
- **F4** — Defend traceability across your project's slices.

This is the integrity check.

::: notes
Third mention of F1+F3+F4. State it the same way you stated it in the frame and in the SDLC-changes transition.

Cold-defense means examiners may pick a teammate's slice and ask you to walk it. Impossible to fake without genuine team-wide traceability awareness.
:::

---

# Resit Exam (Restanță)

For students who fail the regular evaluation path:

- Single 90-min written paper.
- Format: critique an AI-generated artifact set + short-answer rationale + traceability walk.
- **No AI in the room.**
- Tests the same competence (F1+F3+F4) as the oral defense.

::: notes
Template at `exam/examen-2026.pdf`. The resit is a fallback path, not a different skillset.
:::

---

# Academic Integrity

- AI use is **expected** for almost every artifact in this course.
- The *directed-design narrative* is your record of what you did with AI.
- The *cold defense* is the integrity check — examiners verify you understand your own work.
- One-page statement attached to the syllabus (circulated before W2).

::: notes
Be explicit: AI use is not "cheating" in this course; it's the assignment. What's not OK: outsourcing the *direction* and *judgment*. The oral defense surfaces that gap immediately.
:::

---

# Communication

- *Teams link / mailing list — to be circulated before W2.*
- Office hours: by appointment (email).
- Course repo: GitHub (link circulated with the team-formation announcement).

::: notes
Placeholder for now. Update this slide once the Teams channel is set up.
:::

---

# That's It For Today

- Next week: requirements with AI.
- Lab 1 (Week 2 lab slot): tooling onboarding + first AI-driven requirements drill.

Questions?

::: notes
Closer slide. Open the floor for questions; don't run out the clock.
:::
