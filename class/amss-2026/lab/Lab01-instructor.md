# Lab 1 Instructor Runbook — Tooling Onboarding + Requirements with AI

> Instructor-facing companion to `Lab01.md`. **Not** a slidy deck — the lab Makefile filters `*-instructor.md` out of the published tree. Read end-to-end before the session.
>
> Spec: `docs/superpowers/specs/2026-05-27-amss-2026-lab1-design.md`.
>
> Calibrated September 2026 with Claude Sonnet 5 (low effort), one run per prompt — live output varies; walk the defects that actually appear.

## Pre-class checklist

- [ ] Seed `lab01/README.md` into the course lab repo (template at the end of this file).
- [ ] Assign pair-ids (`p01`…`pNN`) and fill the roster table below.
- [ ] Remind students (course channel, a few days before) to do `tooling/SETUP.md` at home: install Claude Code or Codex in VS Code and sign in with their own Claude Pro / ChatGPT Plus account. There are no credentials to distribute.
- [ ] Check `tooling/template/` is current (`.claude/settings.json` pins Sonnet 5, low effort; `.codex/config.toml` pins GPT-6 Sol, low effort; `AGENTS.md` keeps the "answer directly" line Codex needs).
- [ ] Confirm every student has push access to the lab repo.

## Phase 1 — Onboarding facilitation (15 min)

Sequence:

1. Hand out pair-ids + lab-repo URL.
2. Students sign in to their assistant in the VS Code panel (Claude Code or Codex).
3. Clone/pull → `git checkout -b lab01/<pair-id>` → copy the contents of `tooling/template/` into the lab repo root (SETUP.md step 3).
4. Smoke test: open the lab repo folder, ask for a Mermaid class diagram of a parking lot; it renders in the Markdown preview.
5. Model check: Claude Code `/model` shows Sonnet 5, low effort; Codex model picker shows the `.codex/config.toml` model.
6. Commit the template files, push the branch.

**Exit gate:** every pair has (a) a working assistant on the course model and (b) a pushed branch. Don't start the drill clock until most pairs clear both.

**Triage order for failures:** wrong model shown → they opened the parent folder, reopen the repo folder itself (Codex: trust the folder) → no subscription yet / usage limit hit → pair with a colleague on the working laptop.

**Parity (say it once):** everyone uses the same model and effort level, pinned by the repository settings, so AI output is comparable across the cohort and reproducible in the oral defense. Other tools are fine for exploration; graded artifacts must reproduce with the course settings.

**Odd student count:** form one group of three; the third student is a second critic in both rounds (and the log scribe). Roles still swap; the trio just has two critics per round.

## Phase 2 — Drill floor-walking (60 min)

What healthy looks like at ~20 min: Round 1 draft generated, critic has named ≥2 failure modes, architect is composing the re-prompt.

**What the bare prompt actually produces (calibration):** a long, tidy document (~22 FR / 14 NFR / 8 DR plus assumptions) that *covers* the classic edge cases — exact change (with notify-and-cancel), sold out, cancel/refund, dispense jam, power-loss recovery, operator restock and cash audit. So "omission" is not the headline any more; the critic has to look for what is *wrong or unasked-for*:

| Observed defect | Where to point | Critique question |
|---|---|---|
| Over-specification / fabricated regulation | DR-3 expiry tracking, DR-5 age verification by ID scan, DR-6 tax, DR-7 UL/CE, DR-8 GDPR/CCPA, NFR-8 PCI DSS | "Which of these did the prompt ask for? Who is the stakeholder behind each?" |
| Fabricated technology | FR-5 "EMV or NFC", FR-2 "keypad, touchscreen, or button matrix" | "Is this a requirement or a design choice?" |
| Invented numbers | FR-9 "10 seconds", NFR-1 15 s, NFR-3 99% uptime, NFR-5 1% failure, NFR-11 15-min restock | "Where did this number come from? Who agreed to it?" |
| Vague NFR | NFR-6 "operable without prior training", NFR-7 "legible … at typical viewing distance" | "How would you test this?" |
| Conflated requirement | FR-19 restock + set prices + adjust inventory in one line | "If one part fails acceptance, does the whole requirement fail?" |
| No acceptance criteria | whole document | "Pick FR-13 — what test proves it?" |
| Omission (the one that remains) | two buyers / last item at once — not addressed | "What happens if two people press the same button at once?" |

Nudges for stuck pairs:

- "What happens if two people press the same button at once?"
- "Is 'operable without prior training' testable? How would you prove it?"
- "Did you ask for age verification, tax handling or GDPR? Then why is it here?"
- "Where does '99% uptime' come from?"

Watch the clock: if a pair is behind at ~45 min, tell them Round 2 is optional — Round 1 (which contains the required re-prompt) plus the reflection is the minimum.

## Phase 3 — Share-out facilitation (25 min)

1. **During the drill:** scan pushed reflections; pre-select 3-4 pairs covering *different* failure modes (variety, not the same mode four times). Leave one volunteer slot.
2. **0-3 min:** frame — same domain, same prompt, ~50 pairs.
3. **3-18 min:** selected pairs present (~3-4 min each): worst failure mode + the move that fixed it.
4. **18-23 min:** live tally — hands up per mode: *"Whose AI fabricated a regulation or stakeholder? A technology? Invented a number? Wrote a vague NFR? Over-specified? Conflated requirements? Missed an obvious case (omission)?"* Tally on the board.
5. **23-25 min:** close — the modes you tallied are what you critique every week; fabricated requirements propagate downstream. Bridge to Lab 2.

## Grading guide

Apply per pushed branch. **Pass requires both:**

1. `requirements.md` and `reflection.md` committed by deadline.
2. Reflection names ≥2 distinct failure modes (the five named modes, or omission) **and** line 3 gives a real prompting-move rationale (F3).

**Redo (not fail):** vacuous reflection — no named mode, or no rationale.

**Worked PASS example (vending machine):**

> 1. Fabrication / over-specification — the domain section invented age verification by ID scan, tax handling and UL/CE certification; we never mentioned any of it.
> 2. Vague NFR — "operable without prior training" (NFR-6); hard to catch because it sounds like a sensible goal until you try to write a test for it.
> 3. We re-prompted with a use-case scaffold plus a negative prompt ("organize by user goal, one acceptance criterion each; no regulations, technologies or numbers we did not give you") because the long flat list made it impossible to tell what was requested from what was invented.
> 4. The list shrank to what we asked for and each requirement got a testable criterion; it still slipped in "within 10 seconds" without a source.
> 5. It never addressed two buyers selecting the last item at once — residual risk.

(Older/weaker models often *omitted* exact change or sold-out outright; with the course setting, a reflection claiming those omissions should be checked against the pair's actual log.)

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
