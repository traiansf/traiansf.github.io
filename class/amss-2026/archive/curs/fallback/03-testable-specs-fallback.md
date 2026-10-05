---
title: "Week 3 demo — fallback captures"
subtitle: "Bike-sharing fare: one architect-critic cycle on a testable specification"
author: "Captured with Claude Code, Sonnet 5 (low effort), September 2026"
aspectratio: 169
---

# When to use this deck

The live AI is not answering, so here is what the same prompts produced in a real run. We read and critique these tests exactly as we would have done live, and the test run at the end is real.

::: notes
Instructor file, not published. Captured September 2026 with the course setting (Sonnet 5, low effort), prompt #1 then prompt #2 in one session, attempt 1 (met the bar, no redo). The capture session had no file or shell tools, so the AI pasted the files instead of writing them and did not run pytest; the two files were then saved as it named them (plus the empty `bikeshare/__init__.py` it asked for) and run with pytest — last slide, verbatim terminal output. Both answers opened with a remark about the tools it had; cut here. No separate reserve capture: the Week 3 reserve is a framing line over the first answer (see the notes on the first test slide). No red run was captured (the first answer wrote no implementation to run the new tests against). Say: "the model is having a moment — here's what I captured during the dry run."
:::

# Prompt #1

> *"Here's a requirement from last week's bike-sharing app: 'Users are charged for renting a bike.' Write a pytest test for the fare calculation."*

# AI's answer — the test (1/3)

```{=latex}
\scriptsize
```

```python
# test_fare.py
from decimal import Decimal

import pytest

from bikeshare.fare import calculate_fare  # assumed: calculate_fare(duration_seconds) -> Decimal

UNLOCK_FEE = Decimal("1.00")
PER_MINUTE = Decimal("0.15")
FREE_MINUTES = 5
DAILY_CAP = Decimal("20.00")


def test_user_is_charged_for_any_rental():
    # The core requirement: every rental costs something.
    assert calculate_fare(60) > 0
```

::: notes
Runbook catalogue, in walkthrough order:

- Row 1, invented assumption (anchor): `UNLOCK_FEE = 1.00`, `PER_MINUTE = 0.15`, `FREE_MINUTES = 5`, `DAILY_CAP = 20.00` — none of it is in the spec. It even picked dollars (next slide: "$1.00"). Previous runs guessed €1 + €0.15/min and €1 + €0.20/min: three runs, three rules, all with green-looking tests.
- Row 6, trivially-passing assertion: `assert calculate_fare(60) > 0` — "the core requirement" — passes for any positive price.
- Reserve framing (the runbook's inverted reserve) fits here verbatim: "Notice it picked a €1 unlock fee plus €0.15 per minute… my spec never said that."
:::

# AI's answer — the test (2/3)

```{=latex}
\scriptsize
```

```python
@pytest.mark.parametrize(
    "seconds, expected",
    [
        (0, UNLOCK_FEE),                                   # instant return: unlock fee only
        (5 * 60, UNLOCK_FEE),                              # exactly at the free threshold
        (5 * 60 + 1, UNLOCK_FEE + PER_MINUTE),             # partial minute rounds up
        (6 * 60, UNLOCK_FEE + PER_MINUTE),                 # 1 billable minute
        (15 * 60, UNLOCK_FEE + 10 * PER_MINUTE),           # 10 billable minutes
        (24 * 60 * 60, DAILY_CAP),                         # capped
    ],
)
def test_fare_amounts(seconds, expected):
    assert calculate_fare(seconds) == expected
```

::: notes
- Row 7, expected values are formulas: `(15 * 60, UNLOCK_FEE + 10 * PER_MINUTE)` restates the guessed rule with its own constants. What number do I actually expect?
- Row 4 with a twist: there *are* boundary cases (5:00, 5:01, the cap) — but they are boundaries of a rule nobody asked for.
:::

# AI's answer — the test (3/3)

```{=latex}
\scriptsize
```

```python
def test_fare_never_exceeds_cap():
    assert calculate_fare(10**7) == DAILY_CAP


def test_fare_is_monotonic_non_decreasing():
    fares = [calculate_fare(s) for s in range(0, 3 * 3600, 30)]
    assert fares == sorted(fares)


def test_negative_duration_rejected():
    with pytest.raises(ValueError):
        calculate_fare(-1)
```

::: notes
- `test_fare_never_exceeds_cap` pins the invented $20 cap — a test that will pass forever against a number from nowhere.
- Credit where due: negative duration raises `ValueError`, `Decimal` for money, a monotonicity check.
- Row 2 did not appear: no implementation; it imports a non-existent `bikeshare.fare` and says so ("assumed").
:::

# AI's answer — what it said

The requirement ("Users are charged for renting a bike") gives no pricing rules. I assumed the following, and you should replace them with the real values:

- There is an unlock fee of $1.00.
- The rate is $0.15 per minute.
- The first 5 minutes are free of the per-minute charge.
- Partial minutes are rounded up.
- The fare is capped at $20.00 per rental.
- A negative duration raises `ValueError`.

[…]

- Send me the real pricing rules, or the fare function if it exists, and I'll fix the constants and the import path.

::: notes
Verbatim excerpt. The disclaimer lives in the chat; the guess lives in the test file. It told us it was guessing — and wrote the test anyway. "Partial minutes are rounded up" is a second invented rule; watch for it surviving into the second answer.
:::

# Prompt #2

> *"Refine the requirement: renting is free for the first 30 minutes, then €0.10 per minute, capped at €5 per calendar day. Now write pytest tests covering: a 20-minute ride (free), a 90-minute ride, exactly 30 minutes (boundary), and a ride that hits the daily cap. Then write the `fare` function and run the tests."*

# AI's revised answer — the `fare` function

```{=latex}
\scriptsize
```

```python
# bikeshare/fare.py
from decimal import Decimal

FREE_SECONDS = 30 * 60
PER_MINUTE = Decimal("0.10")
DAILY_CAP = Decimal("5.00")


def fare(duration_seconds: int, already_charged_today: Decimal = Decimal("0")) -> Decimal:
    """Fare in euros for one ride.

    Free for the first 30 minutes, then €0.10 per started minute.
    Total charges per calendar day never exceed €5.00, so the cap
    is applied against what the user has already paid today.
    """
    if duration_seconds < 0:
        raise ValueError("duration_seconds must be non-negative")

    billable_seconds = max(0, duration_seconds - FREE_SECONDS)
    billable_minutes = -(-billable_seconds // 60)  # ceil without floats
    raw = billable_minutes * PER_MINUTE

    remaining_cap = max(Decimal("0"), DAILY_CAP - already_charged_today)
    return min(raw, remaining_cap)
```

::: notes
Re-check before celebrating green:

- No unlock fee survived; the old constants are gone. Good.
- The "per started minute" rounding survived from the first answer (docstring, `ceil without floats`) — stated in the prose, not in the spec.
- The per-day cap became a new `already_charged_today` parameter the caller must supply — a product decision the spec owner should make. "Who decided that?"
- The calendar day is still not modelled: a ten-hour ride crossing midnight, or a three-day ride, costs €5.00.
:::

# AI's revised answer — the tests (1/2)

```{=latex}
\scriptsize
```

```python
# tests/test_fare.py
from decimal import Decimal

import pytest

from bikeshare.fare import fare


def test_20_minute_ride_is_free():
    assert fare(20 * 60) == Decimal("0.00")


def test_exactly_30_minutes_is_free():
    assert fare(30 * 60) == Decimal("0.00")


def test_one_second_over_30_minutes_charges_one_minute():
    assert fare(30 * 60 + 1) == Decimal("0.10")


def test_90_minute_ride_is_capped_at_5_euros():
    # 60 billable minutes * 0.10 = 6.00, capped to 5.00
    assert fare(90 * 60) == Decimal("5.00")
```

::: notes
All four requested cases are there: 20 minutes, exactly 30 (plus 30:01), 90 minutes, and the daily cap. Hand-written `Decimal` numbers, not formulas. It noticed that 90 minutes already hits the cap (€6.00 capped to €5.00) and added an uncapped 60-minute ride on the next slide.
:::

# AI's revised answer — the tests (2/2)

```{=latex}
\scriptsize
```

```python
def test_60_minute_ride_is_uncapped():
    # 30 billable minutes * 0.10 = 3.00
    assert fare(60 * 60) == Decimal("3.00")


def test_ride_hitting_daily_cap_after_earlier_rides():
    # 4.50 already paid; a 60-minute ride would cost 3.00, only 0.50 remains
    assert fare(60 * 60, already_charged_today=Decimal("4.50")) == Decimal("0.50")


def test_nothing_charged_once_cap_reached():
    assert fare(120 * 60, already_charged_today=Decimal("5.00")) == Decimal("0.00")


def test_negative_duration_rejected():
    with pytest.raises(ValueError):
        fare(-1)
```

::: notes
"A ride that hits the daily cap" became "€4.50 already paid today" — the test pins the AI's own parameter design, not anything in the spec. Check the comment arithmetic with the room: 60 minutes = 30 billable × €0.10 = €3.00; €5.00 − €4.50 = €0.50. Correct this time (the runbook's dry run had a wrong comment).
:::

# AI's revised answer — what it said

[…] Under the refined rule, a 90-minute ride costs 60 billable minutes × €0.10 = €6.00, which is already over the €5 cap. So that ride is charged €5.00. To test a ride that hits the cap because of earlier rides, I added an `already_charged_today` parameter. It's my design choice, so change it if your app tracks daily totals differently.

[…]

I checked each expected value by hand against the function:

- 20 minutes and exactly 30 minutes give €0.00.
- 30 minutes 1 second gives €0.10.
- 60 minutes gives €3.00.
- 90 minutes gives €6.00 capped to €5.00.
- 60 minutes with €4.50 already paid gives €0.50.
- Any ride once €5.00 is already paid gives €0.00.

::: notes
Verbatim excerpt. Honest about its design choice — good — but it is still a choice the spec owner should make. "I checked each expected value by hand" is a claim to verify: the run on the next slide does. Note it says "against the function": the tests agree with its own code; they agree with the spec only where the spec is precise.
:::

# The test run

```{=latex}
\footnotesize
```

```
$ python -m pytest -q tests/test_fare.py
........                                                                 [100%]
8 passed in 0.11s
```

::: notes
Verbatim terminal output. The AI's two files saved as it named them (`bikeshare/fare.py`, `tests/test_fare.py`) plus the empty `bikeshare/__init__.py` it asked for; run with Python's pytest from the project root (`python -m` so the package is importable). Green — and now ask what green proves: the per-started-minute rounding and the `already_charged_today` design are pinned by tests even though the spec never said them.
:::
