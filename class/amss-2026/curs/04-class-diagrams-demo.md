# W4 Demo Runbook — Bike-Sharing Class Diagram

Calibrated September 2026 with Claude Sonnet 5 (low effort), one run per prompt — live output varies; walk the defects that actually appear.

> Procedural script for the W4 lecture's live demo. **Not** a slidy deck — pandoc skips `*-demo.md` (filter installed during W1). Read end-to-end before running. Estimated runtime: 12-14 minutes inside the lecture's "Demo" segment.
>
> Spec reference: `docs/superpowers/specs/2026-05-29-amss-2026-w4-design.md` §4.
>
> This demo's artifact is a **rendered diagram**. The "aha" beat is *reading the structure against the domain* — classes that aren't domain concepts, meaningless associations, ids standing in for associations, missing whole-part.

## 0. Setup (pre-class, ~1 min)

- VS Code open on a repository containing the course settings from `tooling/template/` (see `class/amss-2026/tooling/SETUP.md`); demo runs in the **Claude Code panel** with those settings (Sonnet 5, low effort). Check with `/model` before class.
- A **Mermaid preview** open in VS Code (the built-in Markdown preview with the "Markdown Preview Mermaid Support" extension) — students must SEE the rendered diagram to critique multiplicity and associations; raw Mermaid text is not enough.
- Browser tab pre-opened to `class/amss-2026/curs/04-class-diagrams-demo-fallback/01-fallback-cycle1-diagram.png` in case the live AI fails.
- The deck's "Demo" trigger slide is on screen.

## 1. Architect prompt #1 — verbatim

Paste this into the Claude Code panel (do **not** improvise):

> *"Generate a UML class diagram (as Mermaid) for the city bike-sharing app: users rent and return bicycles at stations across a city; payment is by app; staff rebalance bikes between stations."*

Render the result in the preview pane. **Time:** ~1 min to type, ~2-3 min for AI to generate + render.

## 2. Defect catalogue — pick 2-3 from the menu

Walk the rendered diagram aloud. Pick the **2-3 defects that actually appear**. The calibration draft was large (12 classes) and over-modelled: invented/implementation classes (#1) and ids standing in for associations (#3) are the most visible — anchor on whichever shows. Rental–Bike and User–Rental multiplicities came out *correct*; don't promise a many-to-many.

| # | Defect | What to point at | Critique question |
|---|---|---|---|
| 1 | Implementation / invented class | `App` (the client software, not a domain concept), `GeoLocation` (a value type), `Dock` holding bikes *alongside* `Station` hosting them (two paths to the same fact) | *"Is this a domain concept or an implementation detail? Walk it back to the prompt. Where does a bike 'live' — in a Dock or a Station?"* |
| 2 | Fake / decorative association | `User "1" --> "1" App : uses`, `App --> Station : displays` | *"What domain fact does this line record? Does the business care that a user 'uses' an app?"* |
| 3 | Id attribute duplicating an association | `Bicycle.currentStationId` next to the Station–Bicycle line; `Rental.startStationId` next to "starts at"; `Rental.endStationId` with no line at all; `RebalancingTask.sourceStationId` / `destinationStationId` next to "between" | *"The diagram already says which station — why is the id stored again? Which one is true if they disagree?"* |
| 4 | Missing aggregation | `Station "1" --> "0..*" Bicycle : hosts` as a plain association | *"A station holds bikes — is that a plain link, or a whole-part? Why isn't it an aggregation?"* |
| 5 | Subtle multiplicity / role slip | Station end of Station–Bicycle is `"1"` — but a bike being ridden is at no station (should be `0..1`); `RebalancingTask --> "2" Station` loses which is source and which is destination | *"Read it aloud: 'every bike is at exactly one station.' Is that true mid-ride? Which of the two stations is the source?"* |
| 6 | Unrequested scope / weak types | `Account` with `balance` and `topUp()` (prompt says only "payment is by app"), `MaintenanceRecord`, `batteryLevel`; every `status`/`type` a `String` | *"Which requirement asked for this? And what values can `status` take — why isn't it an enum?"* |

Older/weaker models classically drew `Rental "*" -- "*" Bike` or a god class with a `DatabaseManager`; the deck keeps those as teaching examples, but this setting did not produce them.

If the diagram is suspiciously clean → jump to §7 "Make-it-fail reserve".

## 3. Critique walkthrough (~5 min)

Walk the chosen 2-3 defects against the rendered diagram. Ask the room first ("does anything look wrong with this structure?") before delivering the critique. Name the move explicitly the first time:

> *"That's the **critic** half — reading the diagram AI drew and asking 'does this structure match the domain?' Next is the **architect** half — I re-prompt with the domain constraints it missed."*

Slow down here — this is the F1 skill in action.

## 4. Architect prompt #2 — constructed live (constraint scaffold)

Type this into the Claude Code panel:

> *"Revise the class diagram. Drop any class that's an implementation detail rather than a domain concept — keep only domain classes. Make the Station–Bike relationship an aggregation (a station holds bikes); a bike being ridden is at no station, so fix that multiplicity. Replace every attribute that stores another object's id with an association."*

Naming the domain rules is the pivot. Re-render. **Time:** ~1 min to type, ~2-3 min for AI to revise + render.

**Critique beat — re-check the revision, don't trust the summary.** Read the model's "Changes made" list against the new render, item by item. In calibration (an earlier wording of this prompt that also asked to "fix the multiplicities" of Rental) the follow-up: dropped `App`/`GeoLocation`/`Dock` and added the aggregation, but **claimed a multiplicity fix it never made** (Rental–Bike was already 1–1; nothing changed), drew the station end as `"1"` instead of `0..1`, **kept `Station.availableDocks` after deleting `Dock`**, and left `sourceStationId`/`destinationStationId` on `RebalancingTask`. It also added a good unrequested `Rental --> Station : ends at`. Ask the room: *"It says it fixed X — show me where."* Use the leftovers as the lead-in to §5. (Keep it inside the revise + render window — it does not extend the demo.)

## 5. Reference solution (instructor's verified render target)

The live AI output varies. This is the **dry-run-verified** reference the instructor confirms renders before delivery (spec gate §6.5) — the tightened domain model the critique converges toward:

```mermaid
classDiagram
    direction LR
    class User
    class Rental
    class Bike
    class Station
    class Payment
    User "1" -- "*" Rental
    Rental "1" -- "1" Bike
    Rental "1" -- "1" Payment
    Station "0..1" o-- "*" Bike
```

Correct multiplicities (a rental is one bike, one user, one payment; a bike is at most at one station, none while ridden), Station–Bike as an aggregation, only domain classes, no id attributes. If the live output reaches something like this after prompt #2, the loop worked.

## 6. Recap (~1 min)

> *"One architect-critic cycle on a class diagram. The first pass drew everything plausible-looking; the critic half read the structure against the domain and found classes that aren't domain concepts, ids duplicating associations and a missing aggregation; the architect half re-prompted with the domain constraints — the second pass tightened, and we re-checked it instead of believing its change list. Reading a diagram against its domain is exactly the F1 skill the oral defense checks, and the loop is what Lab 2 asks you to do this week."*

Point back to the F1 anchor slide.

## 7. Make-it-fail reserve — AI produces a clean diagram

If AI's first diagram is suspiciously clean (low probability — in calibration the first draft over-modelled at 12 classes), restore the critique surface:

> *"Now expand this into a complete enterprise architecture with all supporting subsystems."*

Expect more invented infrastructure (services, controllers, gateways) and over-modelling; a god class is less likely with current models, so don't promise one. If even that is clean, fall back to `03-fallback-make-it-fail.png` and walk the screenshot.

## 8. Fallback path — live AI fails

If the live AI fails (no response after 20s, network down, garbage output), switch to the pre-recorded renders:

- `04-class-diagrams-demo-fallback/01-fallback-cycle1-diagram.png` — seed diagram with ≥2 visible defects.
- (walk the same defect catalogue against the screenshot)
- `04-class-diagrams-demo-fallback/02-fallback-cycle2-revised.png` — post-critique revised diagram.

Acknowledge briefly ("the model is having a moment — here's the dry-run capture") and continue. The pedagogical content is identical.

## 9. Time budget reconciliation

| Beat | Duration |
|---|---|
| Prompt #1 typed | ~1 min |
| AI generates + render | ~2-3 min |
| Critique walkthrough | ~5 min |
| Prompt #2 typed | ~1 min |
| AI revises + render | ~2-3 min |
| Recap | ~1 min |
| **Total** | **12-14 min** |

If ahead of schedule, do not pad — use generation/render pauses to predict aloud what the diagram should show before it appears, then take 1-2 questions.

## 10. Lab 2 synergy & fallback assets

This demo is the forerunner of Lab 2's drill (this week's lab): drive AI to a class diagram from a 1-page spec, iterate at least twice, keep a critique log (1 page max). The runbook's prompt #2 (domain-constraint scaffold) is the move Lab 2's critique log documents, and §2's defect catalogue is the vocabulary it uses.

Fallback assets captured during the solo dry-run (spec §6.5), in `04-class-diagrams-demo-fallback/`:

- `01-fallback-cycle1-diagram.png` — rendered cycle-1 diagram with ≥2 defects.
- `02-fallback-cycle2-revised.png` — rendered revised diagram.
- `03-fallback-make-it-fail.png` — rendered over-modeled "enterprise architecture" output.

When the course settings pinned in `tooling/template/` (model, effort) change, the dry-run reruns and the PNGs refresh.
