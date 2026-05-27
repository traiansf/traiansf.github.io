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

# Demo: Bike-Sharing Requirements

> Live AI requirements gathering. Watch for fabrication, vague NFRs, and over-spec'ing.

**Prompt to AI:** *"Generate a requirements document for a city bike-sharing app: users rent and return bicycles at stations across a city; payment is by app; staff rebalance bikes between stations. Cover functional, non-functional, and domain requirements."*

::: notes
Switch to Continue.dev with the markdown preview pane open. Run the runbook at `class/amss-2026/curs/02-requirements-demo.md` for the full 12-14 min. This slide stays on screen as the lecture-side anchor.

If live AI fails, the runbook §6 covers the fallback path.
:::

---

# Three Types of Requirements

| Type | Question it answers | One-line example |
|---|---|---|
| **Functional** | What does the system *do*? | "A user can return a bike at any station." |
| **Non-functional** | How well does it do it? | "Rental confirmation appears within 2 seconds." |
| **Domain** | What external rules apply? | "Bikes must comply with EN 14764 city-bike safety standard." |

::: notes
Three side-by-side. Examples grounded in the bike-sharing scenario from the demo, so students stay in one mental model.
:::

---

# Functional Requirements: Where AI Fails

- AI fabricates user roles ("city hall liaison", "fleet operations manager") that weren't in your prompt.
- AI conflates concerns: one FR bundles rent + return + report-stolen as a single bullet.
- AI omits the boring core (login, list-bikes, view-history) and reaches for the dramatic edge (theft recovery).

> Watch for: stakeholders that don't trace back to your prompt.

::: notes
Foreshadows §5.6 failure-modes catalogue. Don't name "fabrication" yet — that slide owns the term.
:::

---

# Non-Functional Requirements: Where AI Fails

- "The system shall be performant" — measurable as what?
- "High availability" — 99%? 99.9%? Over what window?
- "User-friendly" — by which standard? Tested how?

> If you can't write a test that proves it, it's not a requirement.

::: notes
This line ("if you can't write a test...") foreshadows the W3 testable-specs mantra. Plant it here; W3 picks it up explicitly.
:::

---

# Domain Requirements: Where AI Fails

- AI invents regulations that sound plausible but don't exist ("GDPR Article 47" — there is no Article 47).
- AI overspecifies compliance: 15 separate REQs for one regulation when one umbrella REQ would do.
- AI misses real domain constraints: helmet-law jurisdictions, bike-lane requirements, weather/seasonal closures.

> Watch for: regulations cited without article numbers, or article numbers you can't look up.

::: notes
The GDPR Article 47 detail — verify against the live AI output. Some models hallucinate plausible-looking citations; others don't. Adjust based on what the dry-run shows.
:::

---

# Negative Example: Denver Airport Baggage System

**Goal:** fully automated baggage handling for all airlines.

**What went wrong:**

- Unclear & changing requirements (scope shifts from airlines).
- Stakeholder misalignment (conflicting airline needs).
- Overly ambitious design (unrealistic automation).
- Poor communication (incomplete, inconsistent docs).

**Impact:** 16-month delay, $560M cost overrun, system never operational.

> Clear, stable, agreed-upon requirements are essential.

::: notes
Reused from 2025's `class/amss/curs/03-requirements.md`. The Denver story still lands — it's a canonical example of requirements failure independent of AI.

Connect to today's frame: AI doesn't fix Denver-style failures; if anything, AI lets you write 30 fabricated requirements faster, which makes the Denver problem worse without a strong critic.
:::

---

# Prompting Move #1: Scaffolded > Direct

**Direct:** *"Give me requirements for a bike-sharing app."*

Returns: a long, unstructured list. Mixes FR/NFR/domain. Fabricates stakeholders.

**Scaffolded:** *"Give me requirements for a bike-sharing app, organized by use case. Each use case is one user goal; for each, list FR, NFR, and domain constraints separately."*

Returns: structured by intent. Easier to read, critique, and iterate on.

::: notes
This is the move the demo's prompt #2 demonstrated. Re-anchor by referring back to the demo screen.
:::

---

# Prompting Move #2: Stakeholder Role Priming

**Without priming:** *"List non-functional requirements for the kiosk."*

**With priming:** *"You are a safety auditor for urban micromobility. List non-functional requirements for the kiosk from that role."*

The role concentrates AI's output on what that role cares about — safety NFRs become concrete, ones outside the role drop.

> Roles are filters. Pick the filter that matches what you want AI to surface.

::: notes
Doesn't eliminate fabrication, but compresses the output toward one frame at a time. Useful when you need depth in one area.
:::

---

# Prompting Move #3: Negative Prompting

Say what NOT to include:

- *"… no technology choices (no databases, no frameworks)."*
- *"… no fabricated stakeholders — use only roles I named in the prompt."*
- *"… no vague adjectives — every NFR has a measurable threshold."*

This won't catch every failure mode, but it preempts the most common ones.

::: notes
Negative prompting is cheap. Free defect prevention. The cost is one extra clause in the prompt; the benefit is AI doesn't have to pick which trap to fall into.
:::

---

# This Is What Lab 1 Drills

This week's lab (Lab 1, Week 2 lab slot):

- 60 min in pairs.
- Drive AI to produce a requirements doc for an assigned toy domain.
- Iterate at least once. Use one of the three prompting moves above.
- 5-line reflection on the AI failure modes you observed.

Deliverable: the doc + reflection committed to the lab repo.

::: notes
Lab 1 brief is in `class/amss-2026/lab/Lab01.md` (forthcoming — own spec). This slide stays high-level to survive Lab 1 spec details still being open.
:::

---

# Failure Mode #1: Fabrication

**Definition:** AI invents requirements (stakeholders, regulations, features) that weren't grounded in your prompt or the domain.

**Example:** "REQ: integrate with the City Hall API for bike-lane closure notifications" — when no such API was mentioned, and probably doesn't exist.

**Critique question:** *"Walk this back to my prompt. What did I ask for that produced this?"*

::: notes
Most common failure mode for requirements. AI compensates for thin prompts by filling space with plausible-looking detail.
:::

---

# Failure Mode #2: Over-Specification

**Definition:** AI produces dozens of requirements when the system needs a handful.

**Example:** 30 separate REQs covering theft prevention, GPS jamming detection, weather sensors, accelerometer alerts, GDPR data-export, audit logs, … for a kiosk that mostly rents bikes.

**Critique question:** *"Read the top 5. Does the system fail without each one? What's load-bearing?"*

::: notes
This is the lazy version of over-engineering — AI doesn't have to choose what matters, so it lists everything. Forces the critic to apply a prioritization filter.
:::

---

# Failure Mode #3: Vague Non-Functional Requirements

**Definition:** NFRs phrased as adjectives with no measurable threshold.

**Example:** "The system shall be performant." / "User-friendly." / "Highly available."

**Critique question:** *"Can you write a test that proves this? If not, it's not a requirement."*

::: notes
Plants the W3 mantra a second time. Vague NFRs are the loudest signal of a thin requirements pass — students should learn to spot them in seconds.
:::

---

# Failure Mode #4: Conflated Requirements

**Definition:** One requirement bundles distinct concerns; success criteria can't apply.

**Example:** "REQ-12: User can rent, return, and report stolen bikes."

That's three requirements, each with its own success criterion, masquerading as one.

**Critique question:** *"Split this. What's the test for each piece?"*

::: notes
Conflation hides incomplete thinking. A single REQ implies a single test; if three tests fit, three REQs were needed.
:::

---

# Failure Mode #5: Fabricated Technology Choices

**Definition:** AI puts implementation choices (database, language, framework) into requirements.

**Example:** "REQ-7: the system shall use Redis for caching."

Redis is not a requirement — it's an implementation. The actual requirement is something like "rental confirmation appears within 2 seconds."

**Critique question:** *"Why is a database in the requirements? What user need does Redis serve?"*

::: notes
This conflates requirements with design. AI does it because training data conflates them. Be ruthless about cutting tech choices from requirements; they re-enter at architecture.
:::

---

# You Saw These in the Demo

The bike-sharing requirements doc cycle 1 had (pick what actually appeared):

- Fabricated stakeholders (likely)
- Vague NFRs (very likely)
- Over-specification (very likely)
- Fabricated technology (possible)

Cycle 2 — with the use-case scaffold — dropped most of them. **Scaffolds are how the architect-half corrects the critic-half's findings.**

::: notes
This slide ties the abstract catalogue back to the concrete demo students just watched. Re-reference whatever actually fired in the live cycle.
:::

---

# Use Case = One User Goal

A **use case** is one thing a user wants to accomplish with the system.

For the bike-sharing app:

- *Rent a bike* (one user goal)
- *Return a bike* (another user goal)
- *Report a stolen bike* (another user goal)

Each use case is a hook — you can list FR, NFR, and domain requirements *per use case*, instead of in one giant flat list.

::: notes
No UML notation yet — just the vocabulary. "Use case" is a structural noun: a way of grouping requirements by intent.
:::

---

# Use Cases as a Scaffold for AI

Look at what happened in the demo:

**Prompt #1 (flat):** "Generate requirements for a bike-sharing app."
→ Long unstructured list, fabricated stakeholders, vague NFRs.

**Prompt #2 (use-case-scaffolded):** "Rewrite organized by use case. For each: who, success criterion, one NFR."
→ Tighter output. Each requirement now traces to one user goal.

> The scaffold gives AI a vocabulary; vocabulary tightens output.

::: notes
This is the central move of the lecture. The architect-half doesn't write requirements — it writes the SCAFFOLD that lets AI write better requirements.
:::

---

# UML Notation Is Coming — In W6

Today: "use case" as a structural noun. No diagrams.

In **W6** (Behavioral I): the UML notation — actors, ovals, system boundary, include / extend / generalization relationships. Plus sequence diagrams.

Until then: think of use cases as labeled buckets for requirements, nothing more.

::: notes
Clean boundary. Students should not leave today thinking they know how to draw a use case diagram. They should leave knowing what a use case IS, conceptually.
:::

---
