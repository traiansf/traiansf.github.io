# W1 Demo Runbook — Library Kiosk

> Procedural script for the W1 lecture's live demo. **Not** a slidy deck — pandoc is configured to skip files matching `*-demo.md`. Read end-to-end before running. Estimated runtime: 12 minutes inside the lecture's "Demo" segment.
>
> Spec reference: `docs/superpowers/specs/2026-05-07-amss-2026-w1-design.md` §3.

## 0. Setup (pre-class, ~1 min)

- VS Code open, Continue.dev installed and configured against the canonical course endpoint (see `class/amss-2026/tooling/SETUP.md`).
- Continue.dev mode set to **agentic chat**.
- PlantUML rendering ready: either VS Code's PlantUML preview extension, or a terminal with `plantuml -tpng -pipe < file.puml > out.png` available.
- Browser tab pre-opened to `class/amss-2026/curs/01-intro-demo-fallback/01-fallback-cycle1-output.png` in case the live AI fails.
- The deck's "Demo" trigger slide is on screen.

## 1. Architect prompt #1 — verbatim

Paste this into Continue.dev's chat (do **not** improvise — reproducibility outweighs naturalness):

> *"Generate a UML class diagram in PlantUML for a small library kiosk. Users can borrow and return books. Staff can register returns. A book can be reserved while it is out on loan."*

Wait for AI to produce a PlantUML block. Render it (in-editor preview or pipe through `plantuml`). The diagram appears on screen for the room.

**Time:** ~1 min to type, ~1-2 min for AI to generate, depending on endpoint latency.

## 2. Defect catalogue — pick 2-3 from the menu

Walk the diagram aloud. The following defects are common; pick the **2-3 that actually appear** in the live output. Over-spec'ing this catalogue is intentional — it absorbs model variance.

| # | Defect | What to point at | Critique question |
|---|---|---|---|
| 1 | Multiplicity bug | `User --1..1-- Loan` instead of `0..*` | *"What if I'm borrowing two books at once?"* |
| 2 | Fabricated class | `Library` class with no behavior, just a top-level container | *"Read its methods aloud — what does this class actually do?"* |
| 3 | Missing association | `Reservation` linked to `Book` but not `User` | *"Who made this reservation? Walk the line back to the user."* |
| 4 | Conflated concepts | `Book` used for both abstract title and physical copy | *"If two physical copies exist, can both be on loan to the same user?"* |
| 5 | Missing guard / operation | Borrow with no availability check, or return with no state change | *"What stops me from borrowing a book that's already out?"* |
| 6 | Anemic class | `Staff` with no associations beyond `register_return()` | *"What does Staff *know about*? Who do they interact with?"* |

If AI produces a clean diagram with no critique surface (low probability for the kiosk prompt with current open-source coding models, but possible) → jump to §7 "Make-it-fail reserve".

## 3. Critique walkthrough (~4-5 min)

Walk the chosen 2-3 defects, in any order. For each, ask the room first ("does anything look wrong with this part?") before delivering the critique. The pedagogical move gets named explicitly the first time:

> *"What I just did is the **critic** half of the loop — I read AI's output and identified what's wrong. Now I'm going to do the **architect** half — I'll re-direct AI with what I learned."*

This is the moment students should remember from the lecture. Slow down here.

## 4. Architect prompt #2 — constructed live

Type this into Continue.dev, filling in the bracketed corrections from the chosen defects:

> *"Update the diagram: [correction 1], [correction 2], [correction 3]."*

For example, if defects 1, 2, and 3 fired:

> *"Update the diagram: a user can have multiple active loans (0..\*); remove the Library class — it has no behavior; a reservation must record which user made it."*

Wait for AI to produce the revised PlantUML. Render it. Briefly point at the corrected pieces.

**Time:** ~1 min to type, ~1-2 min for AI to revise.

## 5. Recap (~1 min)

Verbatim closer:

> *"That was one cycle of the architect-critic loop. The architect drove AI to produce something. The critic — me, with your help — read it, found the defects, and re-directed. Every UML artifact in this course is going to come out of this loop. By Lab 1 you'll be running it yourselves; by W4 you'll be running it on real spec material."*

Point back at the "two roles" slide from the frame segment.

## 6. Fallback path — live AI fails

If at any point the live AI fails (no response after 20s, network down, model produces unrelated garbage), don't freeze. Switch to:

- `01-fallback-cycle1-output.png` — pre-recorded seed AI output
- (walk the same defect catalogue against the screenshot)
- `02-fallback-cycle1-revised.png` — pre-recorded revised output

The pedagogical content is identical; only the live-typing aspect is lost. Acknowledge it briefly ("the model is having a moment — here's what I captured during dry-run") and continue.

## 7. Make-it-fail reserve — AI produces a clean diagram

If AI's first output is suspiciously good, use this fallback prompt to restore the critique surface:

> *"Now redo this for a system where books can be reserved by multiple users in a queue."*

This near-certainly fabricates a `WaitingList` or similar with shaky semantics (e.g., position numbers as primitive ints instead of associations, no link from queue entries to users). Critique against that.

If the make-it-fail also produces something clean (very rare with current coding-tier models), fall back to `03-fallback-make-it-fail.png` and walk the screenshot.

## 8. Time budget reconciliation

| Beat | Duration |
|---|---|
| Prompt #1 typed | ~1 min |
| AI generates | ~1-2 min |
| Critique walkthrough | ~4-5 min |
| Prompt #2 typed | ~1 min |
| AI revises | ~1-2 min |
| Recap | ~1 min |
| **Total** | **9-12 min** |

If the demo runs ahead of schedule, do not pad. Use the saved time to take 1-2 questions from the room before transitioning to the next segment.

## 9. Tooling-preview synergy

The demo doubles as the tooling preview. After the recap, the next segment ("Tooling preview") refers back to what students just saw — Continue.dev driving the canonical endpoint. That segment is therefore a brief tour, not a standing introduction.

## 10. Fallback assets

Captured during the solo dry-run (see spec §5.4). Files live alongside this runbook:

- `01-intro-demo-fallback/01-fallback-cycle1-output.png`
- `01-intro-demo-fallback/02-fallback-cycle1-revised.png`
- `01-intro-demo-fallback/03-fallback-make-it-fail.png`

When the procurement decision changes the canonical endpoint, the dry-run reruns and the PNGs refresh.
