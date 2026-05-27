# W2 Demo Runbook — City Bike-Sharing Requirements

> Procedural script for the W2 lecture's live demo. **Not** a slidy deck — pandoc is configured to skip files matching `*-demo.md` (filter installed during W1). Read end-to-end before running. Estimated runtime: 12-14 minutes inside the lecture's "Demo" segment.
>
> Spec reference: `docs/superpowers/specs/2026-05-27-amss-2026-w2-design.md` §4.

## 0. Setup (pre-class, ~1 min)

- VS Code open, Continue.dev installed and configured against the canonical course endpoint (see `class/amss-2026/tooling/SETUP.md`).
- Continue.dev mode set to **agentic chat**.
- Markdown preview pane open in VS Code — the demo's artifact is text, not a diagram. Students need to read the requirements doc as it appears.
- Browser tab pre-opened to `class/amss-2026/curs/02-requirements-demo-fallback/01-fallback-cycle1-output.png` in case the live AI fails.
- The deck's "Demo" trigger slide is on screen.

## 1. Architect prompt #1 — verbatim

Paste this into Continue.dev's chat (do **not** improvise — reproducibility outweighs naturalness):

> *"Generate a requirements document for a city bike-sharing app: users rent and return bicycles at stations across a city; payment is by app; staff rebalance bikes between stations. Cover functional, non-functional, and domain requirements."*

Wait for AI to produce the requirements document in the markdown preview pane.

**Time:** ~1 min to type, ~2-3 min for AI to generate (longer than W1 because the artifact is text-heavy).

## 2. Defect catalogue — pick 2-3 from the menu

Walk the requirements doc aloud. The following defects are common; pick the **2-3 that actually appear** in the live output. Over-spec'ing this catalogue is intentional — it absorbs model variance.

| # | Defect | What to point at | Critique question |
|---|---|---|---|
| 1 | Fabricated stakeholder | "City Hall API integration" or similar role with no link to user need | *"Where did this stakeholder come from in my prompt? Walk it back."* |
| 2 | Vague NFR | "The system shall be performant / scalable / user-friendly" | *"Can you write a test that proves this? If not, it's not a requirement."* |
| 3 | Over-specification | 30+ requirements when 8 would do — separate REQs for theft prevention, GPS jamming, weather sensors | *"Read the top 5 — does the system fail without each one? What's actually load-bearing?"* |
| 4 | Fabricated technology | "REQ: the system shall use Redis for caching" / "PostgreSQL backend" | *"Why is a database choice in the requirements? What user need does Redis serve?"* |
| 5 | Conflated requirements | One FR bundles distinct concerns ("user can rent, return, and report stolen bikes") | *"Split this — what's the success criterion for each piece?"* |
| 6 | Missing acceptance criterion | "Users should be able to rent a bike" with no measurable success | *"How do I know when this is done?"* |

If AI produces a clean requirements doc with no critique surface (low probability for a long-form text artifact, but possible) → jump to §7 "Make-it-fail reserve".

## 3. Critique walkthrough (~5 min)

Walk the chosen 2-3 defects, in any order. For each, ask the room first ("does anything look wrong with this requirement?") before delivering the critique. The pedagogical move gets named explicitly the first time:

> *"That's the **critic** half — reading what AI produced and naming what's missing or wrong. Next I'm doing the **architect** half — I'll re-prompt with structure."*

This is the moment students should remember from the lecture. Slow down here.

## 4. Architect prompt #2 — constructed live (use-case scaffold)

Type this into Continue.dev:

> *"Rewrite the requirements organized by use case. Each use case is one user goal. For each: who does it, what's the success criterion, and one realistic non-functional constraint. Drop fabricated stakeholders. Drop technology choices — those are implementation, not requirements."*

The use-case-scaffold instruction is *the* pedagogical pivot — it shows how vocabulary changes AI output quality. Wait for AI to produce the revised doc. Briefly point at the corrected pieces.

**Time:** ~1 min to type, ~2-3 min for AI to revise.

## 5. Recap (~1 min)

Verbatim closer:

> *"One architect-critic cycle on a requirements doc. The first pass produced everything plausible-sounding; the critic half found the failure-mode patterns; the architect half re-prompted with a use-case scaffold — and the second pass tightened automatically. That scaffold pattern is what Lab 1 asks you to do hands-on this week."*

Point back at the "two roles" recap slide from the frame.

## 6. Fallback path — live AI fails

If at any point the live AI fails (no response after 20s, network down, model produces unrelated garbage), don't freeze. Switch to:

- `02-requirements-demo-fallback/01-fallback-cycle1-output.png` — pre-recorded seed AI output
- (walk the same defect catalogue against the screenshot)
- `02-requirements-demo-fallback/02-fallback-cycle1-revised.png` — pre-recorded revised output

The pedagogical content is identical; only the live-typing aspect is lost. Acknowledge it briefly ("the model is having a moment — here's what I captured during dry-run") and continue.

## 7. Make-it-fail reserve — AI produces a clean doc

If AI's first output is suspiciously good, use this fallback prompt to restore the critique surface:

> *"Now redo this assuming the city has 50,000 daily riders and 2,000 bikes across 200 stations."*

This near-certainly triggers fabrication (peak-hour rebalancing routes, predictive ML for demand forecasting, etc.), restoring the critique surface.

If the make-it-fail also produces something clean (very rare for a long-form requirements artifact at this scale), fall back to `03-fallback-make-it-fail.png` and walk the screenshot.

## 8. Time budget reconciliation

| Beat | Duration |
|---|---|
| Prompt #1 typed | ~1 min |
| AI generates | ~2-3 min |
| Critique walkthrough | ~5 min |
| Prompt #2 typed | ~1 min |
| AI revises | ~2-3 min |
| Recap | ~1 min |
| **Total** | **12-14 min** |

If the demo runs ahead of schedule, do not pad. Use the saved time to take 1-2 questions from the room before transitioning to the requirements-types segment.

## 9. Lab 1 synergy

The demo is the *forerunner* of Lab 1's hands-on drill. Students will replicate the same loop on their own toy domain in pairs. The runbook's prompt #2 scaffold (use-case + measurable + drop-technology) is the rubric Lab 1's reflection asks them to apply against their own AI output.

## 10. Fallback assets

Captured during the solo dry-run (see spec §6.4). Files live alongside this runbook:

- `02-requirements-demo-fallback/01-fallback-cycle1-output.png`
- `02-requirements-demo-fallback/02-fallback-cycle1-revised.png`
- `02-requirements-demo-fallback/03-fallback-make-it-fail.png`

When the procurement decision changes the canonical endpoint, the dry-run reruns and the PNGs refresh.
