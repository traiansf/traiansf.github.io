# Lab 5 Instructor Runbook — Project Workshop + Checkpoint Defense

> Instructor-facing companion to `Lab05.md`. **Not** a slidy deck — the lab Makefile filters `*-instructor.md` out of the published tree. Read end-to-end before the session.
>
> Design reference: the master spec's Lab 5 row (`docs/superpowers/specs/2026-05-01-amss-ai-redesign-design.md` §3); the grading rubric is in §4 (December checkpoint, 1 pt). No per-lab spec file — this runbook is the working spec.
>
> This is the **December checkpoint**: a preserved 1-point gate plus workshop time. The checkpoint is a *cold* 3-minute F1+F3+F4 defense of each student's slice — the W14 oral defense in miniature.

## Pre-class checklist

- [ ] Confirm every team has an active **project repo** with slices started (per the project description in `proiect/README.md`).
- [ ] Have the **roster / scoring sheet** below ready (one row per student).
- [ ] Skim each team's repo beforehand if possible — note who looks behind.
- [ ] Have the **F1/F3/F4 prompt set** (below) on hand.
- [ ] No AI in the room for the checkpoint phase (it is unaided, like W14).

## Phase 1 — Workshop facilitation (60 min)

Supervised project work. Steer students toward checkpoint-relevant prep, not open coding:

- "Run your trace audit (W10) — does every requirement in your slice reach a test?"
- "Re-read your AI-generated diagrams — could you critique them cold in 3 minutes?"
- "Is your defect log written down, or still in your head?"

Healthy mid-project markers (~W10):

- A slice scoped and owned (one student, one coherent piece).
- Two diagrams (structural + behavioral) generated and at least partially reviewed.
- A partial requirement-to-test trace.
- A defect log with a few real entries.

Flag students with no readable artifact now — they are the checkpoint risk.

## Phase 2 — Checkpoint mechanics (40 min)

Each student gets ~3 minutes, cold. With ~12-15 students per lab section, budget ~2.5-3 min each; run briskly.

For each student, ask **one prompt per F** (pick from the bank):

**F1 — read & critique:**

- "Show me a diagram from your slice. Read it to me — is anything wrong or missing?"
- "If I claimed this multiplicity is right, how would you check?"

**F3 — rationale:**

- "Why did you direct AI to model it this way? What did you reject?"
- "Show me a prompt that failed and what you changed."

**F4 — traceability:**

- "Pick one requirement in your slice. Walk it to a test."
- "Which requirement needs this class?"

## The 1-point gate rubric (pass / partial)

The checkpoint is a **gate**, not a graded scale. Record one of:

- **Pass (1 pt):** the student does all three — reads/critiques a diagram, gives a real rationale, walks a partial trace — on a slice that is genuinely theirs. Completeness is *not* required.
- **Partial (0 pt now, recoverable):** the student cannot do one or more — can't read their own diagram, "the AI made it" with no rationale, or can't connect any requirement to any artifact. **Hand them the specific gap(s) to close before W14.**

A partial at the checkpoint is diagnostic, not punitive — the point is surfacing the gap with two weeks to fix it. Note: the 1 point is recoverable only if your offering's rules allow; otherwise it is a fixed gate — state which at the start.

**Worked PASS (excerpt):** *reads their class diagram, notes a missing aggregation they plan to fix; explains they split Bike from a type field because the states differ; walks REQ "rent" to a draft fare test.*

**Worked PARTIAL:** *"this is the diagram the AI made… I'm not sure why it's like that… the test is somewhere in the repo."* (No F1 read, no F3 reason, no F4 trace → partial; gaps: re-read your own diagrams, write your rationale, build one full trace.)

## Roster / scoring sheet

Fill per offering.

| student | team | F1 | F3 | F4 | gate | gaps to fix before W14 |
|---|---|---|---|---|---|---|
| | | | | | | |

## After the checkpoint

- Make sure every **partial** student leaves with a written gap list.
- Remind the room: **Lab 6** is the full cold-defense dry run, and **W14** is the graded defense — the checkpoint was the first rehearsal.
