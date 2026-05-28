# Lab 1 Instructor Runbook — Tooling Onboarding + Requirements with AI

> Instructor-facing companion to `Lab01.md`. **Not** a slidy deck — the lab Makefile filters `*-instructor.md` out of the published tree. Read end-to-end before the session.
>
> Spec: `docs/superpowers/specs/2026-05-27-amss-2026-lab1-design.md`.

## Pre-class checklist

- [ ] Seed `lab01/README.md` into the course lab repo (template at the end of this file).
- [ ] Prepare per-pair credential sheets: model, apiBase, apiKey (the three `REPLACE_BEFORE_W1` values from `tooling/.continue/config.yaml`).
- [ ] Assign pair-ids (`p01`…`pNN`) and fill the roster table below.
- [ ] Verify the course endpoint is live; stage Gemini free-tier keys as fallback.
- [ ] Confirm every student has push access to the lab repo.

## Phase 1 — Onboarding facilitation (15 min)

Distribution sequence:

1. Hand each pair their credential sheet + pair-id + lab-repo URL.
2. Students paste credentials into `tooling/.continue/config.yaml`.
3. Smoke test: `Ctrl+L` → *"summarize this file"*. A coherent summary = pass.
4. Clone/pull → `git checkout -b lab01/<pair-id>` → push a stub.

**Exit gate:** every pair has (a) a working completion and (b) a pushed branch. Don't start the drill clock until most pairs clear both.

**Triage order for failures:** endpoint dead → Gemini fallback key → pair on the working laptop.

**Odd student count:** form one group of three; the third student is a second critic in both rounds (and the log scribe). Roles still swap; the trio just has two critics per round.

## Phase 2 — Drill floor-walking (60 min)

What healthy looks like at ~20 min: Round 1 draft generated, critic has named ≥2 failure modes, architect is composing the re-prompt.

Nudges for stuck pairs:

- "What happens if two people press the same button at once?"
- "Is 'the system shall be reliable' testable? How would you prove it?"
- "Did the AI invent a stakeholder you never mentioned?"

Watch the clock: if a pair is behind at ~45 min, tell them Round 2 is optional — Round 1 (which contains the required re-prompt) plus the reflection is the minimum.

## Phase 3 — Share-out facilitation (25 min)

1. **During the drill:** scan pushed reflections; pre-select 3-4 pairs covering *different* failure modes (variety, not the same mode four times). Leave one volunteer slot.
2. **0-3 min:** frame — same domain, same prompt, ~50 pairs.
3. **3-18 min:** selected pairs present (~3-4 min each): worst failure mode + the move that fixed it.
4. **18-23 min:** live tally — hands up per mode: *"Whose AI fabricated a stakeholder? A technology? Wrote a vague NFR? Over-specified? Conflated requirements? Missed an obvious case (omission)?"* Tally on the board.
5. **23-25 min:** close — the modes you tallied are what you critique every week; fabricated requirements propagate downstream. Bridge to Lab 2.

## Grading guide

Apply per pushed branch. **Pass requires both:**

1. `requirements.md` and `reflection.md` committed by deadline.
2. Reflection names ≥2 distinct failure modes (the five named modes, or omission) **and** line 3 gives a real prompting-move rationale (F3).

**Redo (not fail):** vacuous reflection — no named mode, or no rationale.

**Worked PASS example (vending machine):**

> 1. Fabrication — the AI invented a "loyalty-program integration" we never asked for.
> 2. Omission — it never handled exact-change-unavailable; easy to miss because the happy path looked complete.
> 3. We re-prompted with a use-case scaffold ("organize by user goal, success criterion each") because the flat list hid which requirements were missing.
> 4. The scaffold surfaced the change-making and sold-out cases the first pass omitted.
> 5. It still never specified what happens on power loss mid-vend — residual risk.

**Worked REDO example:**

> The AI made some mistakes. We fixed them by asking again. It was better the second time. We learned a lot. The vending machine requirements are done.

(No named failure mode, no rationale → redo. Hand it back with: "name two failure modes from the W2 catalogue, and say *why* you chose your re-prompt.")

## Pair-id ↔ roster

Fill per offering.

| pair-id | student A | student B |
|---|---|---|
| p01 | | |
| p02 | | |
| … | | |

## Paste-ready `lab01/README.md` (seed into the course lab repo before class)

~~~markdown
# Lab 1 — Requirements with AI

**Domain:** a vending machine (same for every pair).

**Starting prompt (Round 1):**
> "Generate a requirements document for a vending machine. Cover functional, non-functional, and domain requirements."

**Structure:** two rounds; swap architect/critic between them. Iterate at least once.

**Deliverable**, on branch `lab01/<your-pair-id>`:
- `lab01/<pair-id>/requirements.md` — your best AI-driven requirements doc.
- `lab01/<pair-id>/reflection.md` — exactly 5 lines:
  1. Worst failure mode + where.
  2. A second failure mode + why easy/hard to catch.
  3. What you changed in the re-prompt and why.
  4. What improved or didn't.
  5. One requirement the AI never got right.
- `lab01/<pair-id>/log.md` — optional: your prompt/critique log.

**Submit:**
```bash
git checkout lab01/<pair-id>      # the branch you created in onboarding
mkdir -p lab01/<pair-id>
git add lab01/<pair-id>
git commit -m "Lab 1: <pair-id> vending machine requirements + reflection"
git push -u origin lab01/<pair-id>
```

**Grading:** pass/redo. Pass = both files committed + reflection names ≥2 failure modes and explains why you re-prompted.
~~~
