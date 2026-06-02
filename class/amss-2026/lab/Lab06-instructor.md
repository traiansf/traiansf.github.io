# Lab 6 Instructor Runbook — Project Workshop + Cold-Defense Dry Run

> Instructor-facing companion to `Lab06.md`. **Not** a slidy deck — the lab Makefile filters `*-instructor.md` out of the published tree. Read end-to-end before the session.
>
> Design reference: the master spec's Lab 6 row (`docs/superpowers/specs/2026-05-01-amss-ai-redesign-design.md` §3); the F1+F3+F4 rubric is detailed in §1/§4 and taught in W12. No per-lab spec file — this runbook is the working spec.
>
> This is the **dress rehearsal** for the W14 oral defense: a full cold F1+F3+F4 drill with **random selection**. Ungraded, but the per-student gap list it produces is the deliverable.

## Pre-class checklist

- [ ] Have the **roster** ready for random selection (names on cards / a shuffler).
- [ ] Have a **pool of diagrams** to show for F1 — pull 4-5 from various teams' repos (so you can show a student *another* team's diagram).
- [ ] Have the **F1/F3/F4 question bank** (below) and a **feedback sheet** per student.
- [ ] Carry over the **Lab 5 partial list** — prioritise calling on those students.
- [ ] No AI in the room for the dry-run phase (it is unaided, like W14).

## Phase 1 — Workshop facilitation (50 min)

Supervised work, focused on closing **Lab 5 checkpoint gaps**:

- "What gaps did your checkpoint surface? Are they closed?"
- "Re-run your trace audit — any broken links left?"
- "Practise reading one diagram aloud to a teammate — could they follow it?"

Encourage **peer mock-questioning** — teammates ask each other F1/F3/F4 while you circulate. The students who rehearse aloud now perform best in phase 2.

## Phase 2 — Cold-defense dry-run mechanics (50 min)

Call students **at random**. With ~12-15 per section, aim for ~3-4 min each; not everyone will be called — that's fine (random is the point). Prioritise Lab 5 partials.

For each called student, ask **one F at random** (or rotate F1 -> F3 -> F4 across students for coverage):

### F1 — read & critique (often on ANOTHER team's diagram)

- "Read this diagram aloud. What's wrong or missing?"
- "Is this multiplicity right? How would you check?"
- "Is this a real association, or decoration?"

### F3 — rationale (on the student's own slice)

- "Why did you direct AI to model it this way? What did you reject?"
- "Show me a prompt that failed — what did you change?"
- "Why this pattern here? What problem does it solve?"

### F4 — traceability (on the student's own slice)

- "Walk this requirement to its test."
- "Which requirement needs this class?"
- "Find an inconsistency between two of your artifacts."

## Giving actionable feedback

After each student, name **one strength + one specific gap**:

- Strength: the strong move they made (read aloud, reason-not-authority, walked the trace).
- Gap: the exact thing to fix before W14 ("you couldn't connect the test to a requirement — build that trace this week").

Be concrete. "Good job" teaches nothing; "you deferred to the AI on the multiplicity — read it aloud next time" does.

## Common gaps to watch for (W12 red flags)

- "The AI said it was good" — delegated evaluation. **Instant red flag.**
- Can't read their **own** diagram cold.
- Can't connect any requirement to any test.
- Rationale is all authority ("the tutorial did it"), no reason.

Flag these loudly — there's still time to fix them.

## Feedback sheet (per student)

Fill live; hand the gap to the student.

| student | team | F asked | strength | gap to fix before W14 |
|---|---|---|---|---|
| | | | | |

## After the dry run

- Ensure every called student has a written **gap**.
- Announce: **W13** is workshop / open Q&A — bring your gap list and close it. **W14 + Lab 7** is the graded defense.
- For students not called: the same questions apply — they should self-rehearse with their gap list from Lab 5.
