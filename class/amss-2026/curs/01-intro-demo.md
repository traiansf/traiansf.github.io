# W1 Demo Runbook — Library Kiosk

Calibrated September 2026 with Claude Sonnet 5 (low effort), one run per prompt — live output varies; walk the defects that actually appear.

> Procedural script for the W1 lecture's live demo. **Not** a slidy deck — pandoc is configured to skip files matching `*-demo.md`. Read end-to-end before running. Estimated runtime: 12 minutes inside the lecture's "Demo" segment.
>
> Spec reference: `docs/superpowers/specs/2026-05-07-amss-2026-w1-design.md` §3.

## 0. Setup (pre-class, ~1 min)

- VS Code open on a demo repository that contains the course settings from `class/amss-2026/tooling/template/` (see `class/amss-2026/tooling/SETUP.md`).
- Claude Code panel open and signed in; `/model` shows **Sonnet 5, low effort** (the course settings).
- Mermaid rendering ready: either VS Code's Markdown preview with the "Markdown Preview Mermaid Support" extension, or a terminal with `mmdc -i file.mmd -o out.png` available.
- Browser tab pre-opened to `class/amss-2026/curs/01-intro-demo-fallback/01-fallback-cycle1-output.png` in case the live AI fails.
- The deck's "Demo" trigger slide is on screen.

## 1. Architect prompt #1 — verbatim

Paste this into the Claude Code panel (do **not** improvise — reproducibility outweighs naturalness):

> *"Generate a UML class diagram in Mermaid for a small library kiosk. Users can borrow and return books. Staff can register returns. A book can be reserved while it is out on loan."*

Wait for AI to produce a Mermaid block. Render it (in-editor preview or `mmdc`). The diagram appears on screen for the room.

**Time:** ~1 min to type, ~1-2 min to generate and render (the model itself answered in ~15 s in calibration; use the slack to let the room read the diagram).

## 2. Defect catalogue — pick 2-3 from the menu

Walk the diagram aloud. The calibration run produced a tidy-looking diagram (abstract `Person` with `User`/`Staff`, `Book`, `Loan`, `Reservation`, two status enums, `0..*` loans) whose defects are *semantic*, not syntactic — students have to read it, not just scan it. Pick the **2-3 that actually appear** in the live output. Rows 1-4 were observed; row 5 is a spare.

| # | Defect | What to point at | Critique question |
|---|---|---|---|
| 1 | Conflated concepts | `Book` carries both title data (`isbn`, `title`, `author`) and copy state (`status`) | *"The library owns three copies of this title. How many `Book` objects is that — and which one is on loan?"* |
| 2 | Status enum contradicts the prompt | `BookStatus { AVAILABLE, ON_LOAN, RESERVED }` — one value at a time | *"My prompt said a book can be reserved *while* it is on loan. Which value does it hold then?"* Follow-up: *"Isn't this status already derivable from `Loan` and `Reservation`?"* |
| 3 | Anemic class | `Staff` has only a dashed `..>` dependency to `Loan` (with multiplicities on a dependency) | *"What does Staff *know about*? Is `registers return` a lasting relationship or a one-off use — and why does a dependency have `0..*` on it?"* |
| 4 | Generalisation that forbids a real case | `Person <|-- User`, `Person <|-- Staff` as disjoint subclasses | *"A librarian wants to borrow a book on her lunch break. Which class is she?"* |
| 5 | Spare (older/weaker models; not seen in calibration) | `User 1..1 Loan`, a behaviourless `Library` container, or `Reservation` not linked to `User` | *"What if I'm borrowing two books at once?"* / *"What does this class actually do?"* |

If AI produces a diagram without rows 1-4 → jump to §7 "Make-it-fail reserve".

## 3. Critique walkthrough (~4-5 min)

Walk the chosen 2-3 defects, in any order. For each, ask the room first ("does anything look wrong with this part?") before delivering the critique. The pedagogical move gets named explicitly the first time:

> *"What I just did is the **critic** half of the loop — I read AI's output and identified what's wrong. Now I'm going to do the **architect** half — I'll re-direct AI with what I learned."*

This is the moment students should remember from the lecture. Slow down here.

## 4. Architect prompt #2 — constructed live

Type this into the Claude Code panel, filling in the bracketed corrections from the chosen defects:

> *"Update the diagram: [correction 1], [correction 2], [correction 3]."*

For example, if defects 1, 2, and 3 fired:

> *"Update the diagram: separate a book title from its physical copies — loans are of copies, reservations are of titles; remove the BookStatus enum and derive availability from loans and reservations; make Staff a real participant — link it to the loans whose return it registers."*

Only ask for fixes to defects that are actually on screen. In calibration, the old scripted correction (asking for `0..*` loans, no `Library`, a `User`–`Reservation` link) targeted defects the model had not made: it said so honestly, then "fixed" the non-problem by adding a redundant `Reservation.userId` next to the existing association.

Wait for AI to produce the revised Mermaid. Render it. **Re-check it, don't just admire it:** point at each requested change, and scan for new attributes that duplicate an association (like `userId`) or labels that now read backwards. A regression in the revision is a second critique beat, not a failure of the demo.

**Time:** ~1 min to type, ~30 s for AI to revise; spend the rest of the ~1-2 min on the re-check.

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

Not calibrated. Expect a `WaitingList`/queue class; look for position numbers as primitive ints instead of an ordered association, queue entries not linked to users, or id attributes (`userId`, `bookId`) duplicating associations — the last one is the defect this setting produced most often across the calibration set. Critique against whatever appears.

If the make-it-fail also produces something clean, fall back to `03-fallback-make-it-fail.png` and walk the screenshot.

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

The demo doubles as the tooling preview. After the recap, the next segment ("Tooling preview") refers back to what students just saw — Claude Code in VS Code, running with the course settings (Sonnet 5, low effort). That segment is therefore a brief tour, not a standing introduction.

## 10. Fallback assets

Captured during the solo dry-run (see spec §5.4). Files live alongside this runbook:

- `01-intro-demo-fallback/01-fallback-cycle1-output.png`
- `01-intro-demo-fallback/02-fallback-cycle1-revised.png`
- `01-intro-demo-fallback/03-fallback-make-it-fail.png`

Recapture these with the course settings (Sonnet 5, low effort) whenever the pinned model changes; the September 2026 calibration output is a ready source for `01-fallback-cycle1-output.png`.
