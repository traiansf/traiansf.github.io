# W2 Demo Runbook — City Bike-Sharing Requirements

Calibrated September 2026 with Claude Sonnet 5 (low effort), one run per prompt — live output varies; walk the defects that actually appear.

> Procedural script for the W2 lecture's live demo. **Not** a slidy deck — pandoc is configured to skip files matching `*-demo.md` (filter installed during W1). Read end-to-end before running. Estimated runtime: 12-14 minutes inside the lecture's "Demo" segment.
>
> Spec reference: `docs/superpowers/specs/2026-05-27-amss-2026-w2-design.md` §4.

## 0. Setup (pre-class, ~1 min)

- VS Code open on a demo repository that contains the course settings from `class/amss-2026/tooling/template/` (see `class/amss-2026/tooling/SETUP.md`).
- Claude Code panel open and signed in; `/model` shows **Sonnet 5, low effort** (the course settings).
- Markdown preview pane ready in VS Code — the demo's artifact is text, not a diagram. If the assistant answers in the panel rather than writing a file, ask it to save the document as `requirements.md` and open that in the preview. Students need to read the requirements doc as it appears.
- Browser tab pre-opened to `class/amss-2026/curs/02-requirements-demo-fallback/01-fallback-cycle1-output.png` in case the live AI fails.
- The deck's "Demo" trigger slide is on screen.

## 1. Architect prompt #1 — verbatim

Paste this into the Claude Code panel (do **not** improvise — reproducibility outweighs naturalness):

> *"Generate a requirements document for a city bike-sharing app: users rent and return bicycles at stations across a city; payment is by app; staff rebalance bikes between stations. Cover functional, non-functional, and domain requirements."*

Wait for AI to produce the requirements document in the markdown preview pane.

**Time:** ~1 min to type, ~2-3 min for AI to generate (longer than W1 because the artifact is text-heavy).

## 2. Defect catalogue — pick 2-3 from the menu

Walk the requirements doc aloud. The calibration run produced a polished, well-organised document with **far more** critique surface than the demo has time for (34 FRs, 17 NFRs, 10 domain requirements from a three-sentence prompt). Pick the **2-3 that actually appear** and are quickest to show; #1-#3 are the strongest openers. All rows below were observed.

| # | Defect | What to point at (calibration example) | Critique question |
|---|---|---|---|
| 1 | Over-specification | Sheer size: 60+ requirements; whole sections the prompt never asked for (support/disputes, admin analytics, notifications) | *"Read the top 5 — does the system fail without each one? What's actually load-bearing?"* |
| 2 | Invented features | Guest rentals, promo codes, e-bikes with battery levels, cargo bikes, age rules, a "lost bike" liability workflow — the prompt said *bicycles*, rent, return, pay, rebalance | *"Which sentence of my prompt asked for this? If none, who decided it's in scope?"* |
| 3 | Fabricated stakeholder | "City transportation authority (regulator)" plus a mandated public data feed (GBFS) | *"Where did this stakeholder come from in my prompt? Walk it back."* |
| 4 | Technology / standards as requirements | Bluetooth lock validation, biometric login, WCAG 2.1 AA, PCI-DSS, GBFS | *"Is this a user need or a design decision? What's the need underneath it?"* |
| 5 | Precise-looking invented numbers | "50,000 concurrent users", "99.9% uptime", "7 years" retention | *"This NFR *is* testable — but where did 50,000 come from? Who signs off on that number?"* |
| 6 | Conflated requirements | One FR bundles distinct concerns: pay-per-ride + subscriptions + passes in one line; one notification FR covers battery, trip end, payment issues *and* promotions | *"Split this — what's the success criterion for each piece?"* |
| 7 | Vague NFR (a few remain) | "Support multiple languages relevant to the city's population"; "mixed bike types without redesign" | *"Can you write a test that proves this? If not, it's not a requirement."* |
| 8 | Missing acceptance criteria | No FR says how you'd know it's done ("Users shall be able to report bike issues") | *"How do I know when this is done?"* |

Note the shift from older models: the classic "the system shall be performant" and "use Redis/PostgreSQL" barely appear now. The NFRs mostly carry numbers — the critique is that the numbers are *invented*, not that they're missing. Say so to the room; it's the more realistic trap.

If AI produces a short, grounded doc with little critique surface → jump to §7 "Make-it-fail reserve".

## 3. Critique walkthrough (~5 min)

Walk the chosen 2-3 defects, in any order. For each, ask the room first ("does anything look wrong with this requirement?") before delivering the critique. The pedagogical move gets named explicitly the first time:

> *"That's the **critic** half — reading what AI produced and naming what's missing or wrong. Next I'm doing the **architect** half — I'll re-prompt with structure."*

This is the moment students should remember from the lecture. Slow down here.

## 4. Architect prompt #2 — constructed live (use-case scaffold)

Type this into the Claude Code panel:

> *"Rewrite the requirements organized by use case. Each use case is one user goal from my prompt — renting, returning, paying, rebalancing; nothing else. For each: who does it, what's the success criterion, and one realistic non-functional constraint. Use only the roles I named. Drop technology and standards choices — those are implementation, not requirements. Don't invent numbers: if a threshold needs a decision from me, write TBD."*

The use-case-scaffold instruction is *the* pedagogical pivot — it shows how vocabulary changes AI output quality. The extra clauses target what the calibration run actually over-produced (invented features, the regulator, standards, invented numbers). Wait for AI to produce the revised doc. **Re-check it** rather than trusting its summary: count the use cases, look for features that survived under a new heading, and check that the TBDs are really there (the follow-up was not calibrated).

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

Not calibrated (the first prompt left plenty to critique). Scale cues typically pull in more invented machinery (demand forecasting, routing, predictive rebalancing) and more invented numbers — critique whatever appears against the prompt.

If the make-it-fail also produces something clean, fall back to `03-fallback-make-it-fail.png` and walk the screenshot.

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

Recapture these with the course settings (Sonnet 5, low effort) whenever the pinned model changes; the September 2026 calibration output is a ready source for `01-fallback-cycle1-output.png`.
