# W3 Demo Runbook — Bike-Sharing Fare, Testable-Spec Loop

> Procedural script for the W3 lecture's live demo. **Not** a slidy deck — pandoc is configured to skip files matching `*-demo.md` (filter installed during W1). Read end-to-end before running. Estimated runtime: 12-14 minutes inside the lecture's "Demo" segment.
>
> Spec reference: `docs/superpowers/specs/2026-05-29-amss-2026-w3-design.md` §4.
>
> This demo **runs code**. The "aha" beat is *the test exposing a vague spec*, not classic red→green TDD.

## 0. Setup (pre-class, ~1 min)

- VS Code open, Continue.dev installed and configured against the canonical course endpoint (see `class/amss-2026/tooling/SETUP.md`).
- Continue.dev mode set to **agentic chat**.
- An **editor pane** showing the test file as AI writes it, and a **terminal pane visible** — students must watch pytest run; the run is the payoff.
- A scratch working directory with Python 3 and pytest installed and verified (`python3 -m pytest --version` returns a version).
- Browser tab pre-opened to `class/amss-2026/curs/03-testable-specs-demo-fallback/01-fallback-cycle1-test.png` in case the live AI fails.
- The deck's "Demo" trigger slide is on screen.

## 1. Architect prompt #1 — verbatim

Paste this into Continue.dev's chat (do **not** improvise — reproducibility outweighs naturalness):

> *"Here's a requirement from last week's bike-sharing app: 'Users are charged for renting a bike.' Write a pytest test for the fare calculation."*

The requirement is deliberately vague — no rate, no grace period, no cap. To write any concrete assertion, the AI must **invent** a pricing rule. That invention is the critique surface.

**Time:** ~0.5 min to type, ~1-2 min for AI to generate.

## 2. Critique catalogue — pick 2-3 from the menu

Read the AI-generated test aloud. The following failure modes are common; pick the **2-3 that actually appear** in the live output. Over-spec'ing this catalogue is intentional — it absorbs model variance. **#1 is near-certain given the vague prompt; anchor the walkthrough on it.**

| # | Test failure mode | What to point at | Critique question |
|---|---|---|---|
| 1 | Invented assumption | Test hard-codes a rate the spec never stated (`assert fare(60) == 6.0`) | *"Where in my spec is €0.10/min? It guessed — and a teammate's AI would guess differently."* |
| 2 | Trivially-passing test | Assertion that holds for almost any implementation (`assert fare(10) >= 0`) | *"Does this test fail for any wrong implementation? If not, it proves nothing."* |
| 3 | Tautological / circular | Expected value computed the same way the code computes it | *"If the code and the test share the same bug, the test still passes. Useless."* |
| 4 | Missing boundary | No test for 0 minutes, the grace cutoff, or a cap | *"What happens at exactly 30 minutes? The spec — and the test — are silent."* |
| 5 | Faithfully encodes a wrong spec | Test correctly encodes unbounded per-minute charging (no cap) | *"The test matches the spec exactly — and the spec is the thing that's wrong."* |
| 6 | Happy-path only | No negative-duration / invalid-input case | *"What should `fare(-5)` do? Neither the spec nor the test says."* |

If AI produces a suspiciously precise, reasonable test → jump to §7 "Make-it-fail reserve (inverted)".

## 3. Critique walkthrough (~5 min)

Walk the chosen 2-3 failures. For each, ask the room first ("does this test actually pin the price I want?") before delivering the critique. The pedagogical move gets named explicitly the first time, framed *on tests*:

> *"That's the **critic** half — reading the test AI wrote and asking 'does this pin the behaviour I want?' The answer is no, because my spec never said what the fare is. Next is the **architect** half — I tighten the spec and re-prompt."*

This is the moment students should remember from the lecture. Slow down here.

## 4. Architect prompt #2 — constructed live (tightened spec)

Type this into Continue.dev:

> *"Refine the requirement: renting is free for the first 30 minutes, then €0.10 per minute, capped at €5 per calendar day. Now write pytest tests covering: a 20-minute ride (free), a 90-minute ride, exactly 30 minutes (boundary), and a ride that hits the daily cap. Then write the `fare` function and run the tests."*

The tightened spec is *the* pedagogical pivot — the same AI now writes tests that pin the behaviour, because the requirement finally says what "charged" means. Wait for AI to produce tests + code, then run them.

**Time:** ~1 min to type, ~3-4 min for AI to generate tests + code + run pytest.

**Note for the speaker (residual ambiguity, optional aside):** the tightened spec says "capped at €5 per calendar day," but a single `fare(minutes)` function models one rental, not a day's aggregate. A 90-minute ride already reaches the cap (60 paid min × €0.10 = €6 → capped to €5). If the room is sharp, surface this: *"even my 'tightened' spec is ambiguous — is the cap per ride or per day? The test forced that question too."* This reinforces the whole lecture but is optional; skip if time is tight.

## 5. Reference solution (instructor's verified green target)

The live AI output will vary. This is the **dry-run-verified** reference the instructor confirms runs green before delivery (verification gate §6.4). Model a single rental; the cap holds that rental's charge at €5.00.

`fare.py`:

```python
def fare(minutes: int) -> float:
    """Fare in euros for a single bike rental of `minutes` minutes.

    Free for the first 30 minutes, then EUR 0.10/min, capped at EUR 5.00.
    """
    if minutes <= 30:
        return 0.0
    charge = (minutes - 30) * 0.10
    return round(min(charge, 5.00), 2)
```

`test_fare.py`:

```python
from fare import fare


def test_short_ride_is_free():
    assert fare(20) == 0.0


def test_exactly_30_minutes_is_free():
    assert fare(30) == 0.0


def test_paid_ride_charges_per_minute():
    # 60 min = 30 free + 30 paid * EUR 0.10 = EUR 3.00
    assert fare(60) == 3.00


def test_long_ride_is_capped_at_5():
    # 120 min would be EUR 9.00 uncapped; the cap holds it at EUR 5.00
    assert fare(120) == 5.00
```

Run and expected output:

```bash
python3 -m pytest -q
```

```
....                                                                     [100%]
4 passed in 0.0Ns
```

**Float-money aside (optional critique point):** `(60 - 30) * 0.10` is `3.0000000000000004` in floating point, so a naive `assert fare(60) == 3.00` against an un-rounded implementation would *fail*. The reference rounds to 2 decimals. AI-generated money code routinely ships this bug — a good live aside if it appears.

## 6. Recap (~1 min)

Verbatim closer:

> *"One architect-critic cycle on a testable spec. The first pass produced a test that looked fine but secretly invented the price — the critic half caught that the spec was too vague to test. The architect half tightened the requirement, and the second pass produced tests that actually pin the behaviour, then code that passes them. That loop — if AI can't write a passing test from your spec, your spec is too vague — is the method your project's TDD-with-AI reflection asks you to run."*

Point back at the loop diagram slide from the deck.

## 7. Make-it-fail reserve (inverted) — AI guesses a reasonable rule

For this demo the *desired* outcome is the vague-spec exposure, not a green test. The reserve handles the opposite risk: AI's first test guesses a *reasonable* pricing rule and looks correct.

> *"Notice it picked €0.10 per minute with a free first half-hour. Reasonable — but my spec never said that. Three teammates' AIs would pick three different rules, and all their tests would pass. That's exactly the problem: the test is only as precise as the spec behind it."*

The spec-precision lesson lands even without a red test — the guess *is* the evidence. If you want a visible red→green anyway, prompt #2's boundary/cap tests reliably fail against the first guess's implementation.

## 8. Fallback path — live AI fails

If the live AI fails (no response after 20s, network down, model produces unrelated garbage), don't freeze. Switch to:

- `03-testable-specs-demo-fallback/01-fallback-cycle1-test.png` — pre-recorded cycle-1 test with the invented-assumption defect.
- (walk the critique catalogue against the screenshot)
- `03-testable-specs-demo-fallback/02-fallback-cycle2-tests.png` — pre-recorded tightened tests + `fare` function.
- `03-testable-specs-demo-fallback/03-fallback-pytest-green.png` — the passing run.

The pedagogical content is identical; only the live-typing is lost. Acknowledge it briefly ("the model is having a moment — here's what I captured during dry-run") and continue.

## 9. Time budget reconciliation

| Beat | Duration |
|---|---|
| Prompt #1 typed | ~0.5 min |
| AI generates test | ~1-2 min |
| Critique walkthrough | ~5 min |
| Prompt #2 typed | ~1 min |
| AI generates tests + code + runs pytest | ~3-4 min |
| Recap | ~1 min |
| **Total** | **~12-14 min** |

If the demo runs ahead, do not pad — use the AI-generation pauses to predict aloud what the test *should* assert before it appears, then take 1-2 questions before the next segment.

## 10. Project synergy & fallback assets

This demo is the in-lecture instance of the loop each student runs for the project's required TDD-with-AI reflection (parent spec §4, per-student deliverable #4). The prompt-#2 pattern (tighten the spec with measurable rules → re-prompt for boundary-covering tests → run) is the method the reflection documents. W3 is a lecture-only week, so the synergy is to the project deliverable, not a same-week lab.

Fallback assets captured during the solo dry-run (see spec §6.4). Files live alongside this runbook in `03-testable-specs-demo-fallback/`:

- `01-fallback-cycle1-test.png` — AI's cycle-1 test from the vague prompt (invented-assumption defect visible).
- `02-fallback-cycle2-tests.png` — AI's cycle-2 tests + `fare` function from the tightened spec.
- `03-fallback-pytest-green.png` — terminal showing pytest passing.
- `04-fallback-pytest-red.png` *(optional)* — boundary/cap tests failing against the cycle-1 guess, if the speaker plans to show an explicit red state.

When the procurement decision changes the canonical endpoint, the dry-run reruns and the PNGs refresh.
