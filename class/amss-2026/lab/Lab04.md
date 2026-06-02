---
title: "AMSS 2026 — Lab 4: Critique Session — Behavioral Artifacts"
author: "Traian-Florin Șerbănuță"
date: "2026"
---

# Lab 4: Red-Team the Behaviour

Three phases, 100 minutes — **teams of 3-5. Same format as Lab 3.**

1. **Brief + rubric** (~10 min) — the domain, the three artifacts, the read-order.
2. **Defect hunt** (~60 min) — hunt every planted defect in three flawed behavioural artifacts, rating each by severity.
3. **Defect-hunt-off** (~30 min) — reveal ground truth, score, crown the sharpest critics.

Deliverable: a **severity-rated defect log** per team, committed to the course lab repo.

::: notes
The second critique/red-team lab. Lab 3 hunted flawed structure (class, package, component). Today is the same game on behaviour — sequence, state, activity. Same teams, same scoring, same deliverable. The novelty is the artifacts and the read-order, not the mechanics.
:::

---

# The Flip: From Structure to Behaviour

- **Lab 3:** you red-teamed flawed **structural** artifacts — class, package, component.
- **Today:** flawed **behavioural** artifacts — sequence, state, activity.

Same architect-and-critic loop, all critic. No AI to drive — pure reading and critique, against the clock.

::: notes
Emphasise the continuity: students already know the format from Lab 3. What changes is the catalogue — Week 6 (sequence) and Week 7 (state, activity) defects instead of Weeks 4-5 structural ones. The skill on trial is the same: read a behaviour model cold and name what's wrong.
:::

---

# Before You Start

- Form teams of **3-5**. One member is the **scribe** (owns the defect log + the commit).
- You receive at lab start: your **team-id**, the lab-repo URL, and the three artifacts (in `lab04/README.md` on clone).
- All three artifacts model the **same** system — the ATM below.

::: notes
No tooling onboarding — no model needed. The scribe keeps the single shared log so the team converges on one rating per defect. Teams self-form; the instructor balances stragglers. Same drill as Lab 3.
:::

---

# The Domain: ATM

The artifacts model an ATM. The **domain is honest** — every defect is in the artifacts, not the description.

- A customer **inserts a card** and enters a **PIN**; after 3 wrong PINs the card is **retained**.
- Once verified, the customer can **withdraw cash**: the ATM checks the balance with the **bank**, dispenses if funds suffice, and **ejects** the card.
- On **insufficient funds** or **cancel**, no cash is dispensed and the card is ejected.
- The ATM **prints a receipt** and returns to idle after each session (or on inactivity timeout).

::: notes
Lifted from the 2025 ATM lab — a domain everyone reasons about, with well-understood right answers, which is what lets us plant defects fairly. Read it once; the artifacts are where the work is.
:::

---

# The Three Artifacts

All three describe the same ATM, and **all three are flawed**:

1. A **sequence diagram** — the messages for "withdraw cash".
2. A **state machine** — the card/session lifecycle.
3. An **activity diagram** — the withdrawal workflow.

Find every planted defect. Rate each. The team that scores highest wins the hunt-off.

::: notes
The three behavioural views from Week 6 (sequence) and Week 7 (state, activity). Defects span both catalogues. Teams split the artifacts or sweep together — their call — but log into one shared deliverable.
:::

---

# Your Rubric: the Read-Orders

**Sequence (Week 6):**

1. Each **message** maps to a real responsibility?
2. **Order** causally possible? (no result before its cause)
3. **Returns** present? (no dangling calls)
4. **Failure path** modelled? (not just the happy path)

**State machine (Week 7):**

5. Every state **reachable**? Every state **escapable** (or final)?
6. **Guards** wherever one event branches? Initial present?

**Activity (Week 7):**

7. Every **decision merges**? Every **fork joins**? A path to a **final**?

::: notes
The combined Week 6 + Week 7 read-orders, verbatim — this is the team's hunting checklist. Walk each artifact against the relevant steps. A repeatable read-order beats ad-hoc staring; it is also exactly what the oral defense drills.
:::

---

# The Defect Vocabulary

Name each defect with the catalogue from Weeks 6-7:

- **Sequence:** fabricated message · impossible order · missing return · only the happy path · message to a stranger / invented lifeline.
- **State:** orphan / unreachable state · dead-end state · missed guard · no initial / final.
- **Activity:** missing merge · fork without join · no final · decision with no condition.

A defect named with the catalogue scores; a vague "this looks off" does not.

::: notes
Scoring rewards the right name. The vocabulary is the Week 6 sequence catalogue plus the Week 7 state/activity catalogue. Teams should keep this slide visible while hunting.
:::

---

# Severity — Rate Every Defect

- **High (3)** — breaks the behaviour or propagates downstream: an orphan/dead-end state, a missing failure path, cash dispensed before authorisation.
- **Medium (2)** — wrong but local: a fabricated message, a missed guard, a missing final.
- **Low (1)** — cosmetic or clarity: an invented log lifeline, an untriggered transition.

Every logged defect needs a severity. Rating *is* the skill.

::: notes
Severity is graded and scored, exactly as in Lab 3. The bands map to "does this corrupt the behaviour, is it locally wrong, or is it cosmetic". Calibrating severity is the judgement the oral defense checks.
:::

---

# Phase 2: The Defect Hunt (60 min)

As a team, walk each artifact with the read-order. For **every** defect, log:

- **Artifact** (sequence / state / activity)
- **Defect name** (from the catalogue) + **where** (the message, state, or node)
- **Severity** (high / med / low)
- **One line: why it matters**

Divide and conquer, or sweep together — but converge on one shared log.

::: notes
Healthy pace: first artifact swept with ~5 defects logged by ~20 min. Remind teams the log is the deliverable AND the scoring sheet — be precise about location so adjudication is fast. The scribe keeps it in one file.
:::

---

# How the Hunt-Off Is Scored

Calibrate — precision counts (same rules as Lab 3):

- **Correct defect** scores its severity weight (high 3 / med 2 / low 1).
- **Severity** must be within one band for full credit; off by two bands loses a point.
- **False positive** — a "defect" that isn't real — costs a point (minus 1).
- No double-counting the same defect under two names.

Spraying guesses backfires. Find the real defects, rate them honestly.

::: notes
The false-positive penalty makes this a critic's exercise, not a guessing game. State it before the hunt so teams self-censor weak claims. Highest net score wins; ties broken by who caught the highest-severity defect.
:::

---

# The Defect Log (Deliverable)

One table, all three artifacts, on branch `lab04/<team-id>`:

| Artifact | Defect (catalogue name) | Where | Severity | Why it matters |
|---|---|---|---|---|
| sequence | only happy path | no insufficient-funds branch | high | the costly case is unmodelled |
| state | orphan state | `Blocked` | high | nothing ever reaches it |
| activity | fork without join | dispense / receipt | high | flows never synchronise |

::: notes
The example rows show the expected precision — name, exact location, severity, one-line rationale. The "where" column is what makes a claim adjudicable. Commit as `lab04/<team-id>/defect-log.md`.
:::

---

# Phase 3: Defect-Hunt-Off + Submit (30 min)

- We reveal ground truth **artifact by artifact**; each team scores its own log live.
- Each team nominates its **best catch** (highest-severity real defect) — bonus point.
- Highest net score wins.

```bash
git checkout -b lab04/<team-id>
mkdir -p lab04/<team-id>
git add lab04/<team-id>/defect-log.md
git commit -m "Lab 4: <team-id> ATM defect log"
git push -u origin lab04/<team-id>
```

::: notes
The reveal is the teaching beat: for each planted defect, name it, place it, and rate it — students see where they over- or under-called. Best-catch bonus rewards finding the deep one, not just the count. Push fails -> paste the log to the shared doc, fix git after.
:::

---

# Grading — Pass / Redo

Pass needs both:

1. `defect-log.md` committed by the team by the deadline.
2. The log names **at least five** real defects across the three artifacts, each with a severity and a one-line reason, **including at least one high**.

The competition is for sharpness and bragging rights; the gate is an honest, catalogue-named log. We grade your critique, not your speed.

::: notes
Low-stakes literacy gate, scored at the team level, identical to Lab 3. The bar is on Critique (naming + locating defects) and severity judgement. The hunt-off score drives engagement but is not itself the grade.
:::

---

# Why This Matters

You have now red-teamed both **structure** (Lab 3) and **behaviour** (Lab 4) — naming defects and rating them cold is exactly the **Critique** skill the oral defense checks. Flawed behaviour propagates to tests and code.

Next: **Week 9** deepens patterns; the labs now turn to **your own project** — **Lab 5** is the checkpoint defense.

::: notes
Closer. Tie back to the literacy floor; the two critique labs (3, 4) complete the red-team arc. From here the labs shift to project work — Lab 5 is the intermediate checkpoint defense (Week 10). The severity-rated defect log is the through-line into the project's critique discipline.
:::
