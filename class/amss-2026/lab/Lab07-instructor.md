# Lab 7 Instructor Runbook — Final Presentations

> Instructor-facing companion to `Lab07.md`. **Not** a slidy deck — the lab Makefile filters `*-instructor.md` out of the published tree. Read end-to-end before the session.
>
> Design reference: the master spec's Lab 7 row (`docs/superpowers/specs/2026-05-01-amss-ai-redesign-design.md` §3); the grading rubric is the **project barem** in §4 and in `proiect/README.md`. No per-lab spec file — this runbook is the working spec.
>
> This is the graded finale: back-to-back team presentations + per-student **cold** F1+F3+F4 oral defense + a reflection segment. Lab 7 does **not** introduce a new rubric — it applies the project barem.

## Pre-class checklist

- [ ] Post the **presentation order** (teams back to back) in advance.
- [ ] Have the **project barem** (`proiect/README.md` §Barem) and a **final scoring sheet** per student.
- [ ] Carry over each student's **Lab 6 gap list** — verify the gaps were closed.
- [ ] Have a **diagram pool** for F1 (from all repos) so you can show any student any diagram.
- [ ] No AI in the room — the defense is unaided.
- [ ] Confirm every student is present for their own defense (absence = no oral-defense points).

## Time budget (100 min)

Scale to the number of teams. For N teams:

- Per team: ~5 min overview + ~5 min/student slice + cold defense woven in.
- Reserve ~5 min/team for the reflection segment.
- Keep a hard clock — back-to-back means one overrun cascades. Post per-team slots.

## Running a team

1. **Overview (~5 min):** the team presents the system-level model and how slices fit. Check coherence + requirements traceability (documentation, 1 pt).
2. **Per student (~5 min slice + defense):** the student presents their slice (the W12 5-min shape), then you run the cold defense (below).
3. Move to the next team promptly.

## The cold defense (per student) — applying the barem

Ask across all three F's (this is the 3-point integrity check):

- **F1:** show a diagram (theirs or another team's) — "read it, what's wrong?"
- **F3:** "why did you direct AI this way? what did you reject?"
- **F4:** "walk a requirement of your slice to its test" / "which requirement needs this class?"

Score the **oral defense (3 pts)** on F1+F3+F4 demonstrated cold (see worked levels below). Confirm the repo-based points while you have the slice open:

- **Narrative + defect log (2 pts):** is the trail real — failed prompts, rejected outputs, ≥5 substantive defects?
- **Documentation (1 pt):** overview coherence, traceability, repo hygiene.
- **Patterns (1 pt):** applied deliberately (structure present), or just labeled? (W8-W9 lens.)
- **Checkpoint (1 pt):** already recorded in Lab 5.

## Oral-defense scoring guide (3 pts)

- **3 — strong:** reads/critiques cold (names defect, reads multiplicity aloud, gives fix); rationale tied to reasons not authority; walks a trace both directions, ideally names a link they fixed.
- **2 — adequate:** does all three but shallowly — finds an issue with a nudge, rationale partly "the AI did it", trace walked one direction with help.
- **1 — weak:** manages one of the three; leans on "the AI said it was good"; struggles to read own diagram or trace.
- **0 — fails the integrity check:** cannot read own diagram, no rationale, cannot trace. Delegated everything to AI.

The defense is where a polished-but-unowned project is exposed — weight what the *student* can do unaided over the repo's gloss.

## The reflection segment (per team, ~5 min)

Prompt each team:

- "Where did AI help most this semester? Where did it fail?"
- "Give one concrete example where your critique caught something AI got wrong."
- "What would you direct differently next time?"

Ungraded, but it consolidates the course thesis — let students articulate the architect-and-critic value in their own words. Keep it brief.

## Final scoring sheet (per student)

| student | team | oral defense /3 | narrative+log /2 | docs /1 | patterns /1 | checkpoint /1 | total /8 |
|---|---|---|---|---|---|---|---|
| | | | | | | | |

Final grade per student: **8 (project) + 1 (attendance) + 1 (din oficiu) = 10** (see `proiect/README.md`).

## After the finals

- Record totals; flag any student who failed the integrity check (oral defense 0) for the resit path (written R2 exam, `exam/`).
- The course is complete — the project trail + cold defense were the whole point.
