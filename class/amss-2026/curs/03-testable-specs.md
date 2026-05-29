---
title: "AMSS 2026 — Lecture 3: Testable Specs & TDD-as-Spec"
author: "Traian-Florin Șerbănuță"
date: "2026"
---

# Today's Agenda

1. Frame: from requirements (W2) to testable specs
2. Live demo: is your spec testable?
3. Tests as the executable form of requirements
4. How AI-written tests fail
5. The vague-spec loop
6. Traceability: use case → scenario → test

::: notes
Last week we elicited requirements; today we make them testable. No re-introduction — students saw who I am in W1/W2. Open straight into structure.

Authoring note (spec gate §6.10): this lecture is authored fresh. It does **not** draw on the 2025 testing lecture (`class/amss/curs/10-testing.md`), which is reserved for W11 (model evaluation & quality). Do not "restore" 2025 testing content here.
:::

---

# Recap: Architect + Critic

- **Architect / director (B):** drive AI through the SDLC.
- **Critic / reviewer (A):** read AI's output and name what's wrong or missing.

Last week (W2) you drove AI to produce a requirements doc — and critiqued it. Today: can you *test* what you wrote?

::: notes
W2 produced prose requirements. W3 asks the harder question: is that prose precise enough to turn into something executable? Keep the recap to one breath; the hook is the next slide.
:::

---

# A Requirement That Looks Fine — Until You Test It

From last week's bike-sharing doc:

> *"Users are charged for renting a bike."*

What would a test assert? `fare(60) == ?`

You can't fill in the blank — the spec never says the price. **That gap is invisible in prose and obvious in a test.**

::: notes
This is the whole lecture in one slide. The prose looks complete; the moment you try to write the assertion, the hole appears. Don't resolve it here — the demo resolves it live.
:::

---

# Four Threads in Today's Lecture

1. A test is the executable form of a requirement.
2. AI writes tests too — and they fail in their own ways.
3. The loop: if AI can't write a passing test from your spec, your spec is too vague.
4. Traceability: use case → scenario → test.

::: notes
Section preview. Threads 2 and 3 are the central payload. Brief — students need hooks before the demo.
:::

---

# Literacy Floor: F1 + F3 + F4

From W1: in the oral defense, *unaided*, you must demonstrate:

- **F1** — read & critique AI-generated artifacts on the spot.
- **F3** — articulate why you directed AI a certain way.
- **F4** — defend traceability across your project.

Today drills F1 on *tests*, and extends F4: the test is the new end of the trace.

::: notes
First of two F1+F3+F4 mentions today (the second lands in the close). Say it the same way each time. F4 is the anchored one this week — the trace gains an executable tail.
:::

---

# Demo: Bike-Sharing Fare — Is Your Spec Testable?

> Live: drive AI to write a test for a requirement from last week. Watch what price it invents.

**Prompt to AI:** *"Here's a requirement from last week's bike-sharing app: 'Users are charged for renting a bike.' Write a pytest test for the fare calculation."*

::: notes
Switch to Continue.dev with an editor pane and a terminal pane visible. Run the runbook at `class/amss-2026/curs/03-testable-specs-demo.md` for ~12-14 min. This slide stays on screen as the lecture-side anchor. If live AI fails, the runbook §8 covers the fallback path.
:::

---

# A Test Is a Requirement You Can Run

- A **requirement** says what the system should do.
- A **test** says it in a form the machine checks for you.

> Same intent. One is prose; the other fails loudly when violated.

::: notes
Core reframe of the segment. The test isn't a separate QA artifact — it's the requirement, made executable.
:::

---

# Acceptance Criterion ↔ Assertion

**Prose acceptance criterion:**

> "A 60-minute rental costs €3.00."

**The same thing, executable:**

```python
def test_paid_ride_charges_per_minute():
    assert fare(60) == 3.00
```

The assertion *is* the acceptance criterion — you just can't hand-wave it.

::: notes
Use the demo's fare example so students stay in one mental model. The point: writing the assertion forces you to know the exact number. Prose lets you dodge it.
:::

---

# If You Can't Write the Assertion, the Spec Is Underspecified

Try to test "users are charged for renting a bike":

```python
def test_fare():
    assert fare(60) == ???   # the spec never said
```

No number → no test → the requirement isn't done yet.

::: notes
The constructive form of the mantra. The inability to write the assertion is diagnostic — it tells you exactly where the spec is vague. This is what the demo just showed live.
:::

---

# Two Kinds of Spec: Prose and Executable

| | Prose spec | Executable spec (test) |
|---|---|---|
| Readable by | humans | humans + machine |
| Fails when violated? | silently | loudly |
| Pins exact behaviour? | optional | required |

Both are specs. The test is the one you can't fake.

::: notes
Not "tests replace requirements" — they're the same requirement at two precision levels. The executable one forces precision the prose one lets you skip.
:::

---
