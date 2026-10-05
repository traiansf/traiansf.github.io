---
title: "Week 2 demo — fallback captures"
subtitle: "City bike-sharing: one architect-critic cycle on a requirements document"
author: "Captured with Claude Code, Sonnet 5 (low effort), September 2026"
---

# When to use this deck

The live AI is not answering, so here is what the same prompts produced in a real run. We read and critique this requirements document exactly as we would have done live.

::: notes
Instructor file, not published. Captured September 2026 with the course setting (Sonnet 5, low effort), no tools, fresh session per chain; both chains passed on attempt 1. Prompt #1 + prompt #2: one session. Reserve: a separate session (prompt #1, then the reserve prompt); its prompt #1 answer was a similar long document (city authority, e-bikes, reservations). Both answers opened with a line about failing to create a document in a claude.ai connector — cut here; in class disable connectors (`/mcp`) as the runbook's setup says. Say: "the model is having a moment — here's what I captured during the dry run."
:::

# Prompt #1

> *"Generate a requirements document for a city bike-sharing app: users rent and return bicycles at stations across a city; payment is by app; staff rebalance bikes between stations. Cover functional, non-functional, and domain requirements."*

::: notes
The answer: 38 functional, 24 non-functional and 19 domain requirements — 81 in total — from a three-sentence prompt. The next slides are excerpts; the ids are the AI's own.
:::

# AI's answer — scope and features

```{=latex}
\footnotesize
```

**City Bike-Sharing App: Requirements Document**

**Stakeholders:** Riders (registered and occasional), rebalancing and maintenance staff, operations managers, finance, city authority, and payment providers.

[…]

- FR-2: Users can log in, log out, and reset their password. Optional social or biometric login.
- FR-9: Users can reserve a bike for up to 10 minutes.
- FR-14: Users can pause a rental by locking the bike temporarily, with the time billed.
- FR-15: Each user may have one active rental by default. Group rentals of several bikes under one account are a configurable option.
- FR-21: The system supports pay-per-ride, day passes, and monthly or annual memberships.
- FR-25: The system supports promo codes and discounts.
- FR-29: The system forecasts demand from history, time of day, weather, and events to prioritize tasks.
- FR-37: Administrators can export data to CSV and to an API for the city authority.
- FR-38: The system sends push, email, or SMS notifications for receipts, long rentals, payment failures, reservation expiry, and service alerts.

[…]

::: notes
Runbook catalogue, strongest openers first:

- Row 1, over-specification: 81 requirements; whole sections nobody asked for (administration and reporting, notifications, safety and legal). "Read the top five — does the system fail without each?"
- Row 2, invented features: reservations (FR-9), pause (FR-14), group rentals (FR-15), promo codes (FR-25), demand forecasting (FR-29), biometric login (FR-2). "Which sentence of my prompt asked for this?"
- Row 3, fabricated stakeholder: "city authority" in the stakeholder list and an export API for it (FR-37). "Walk it back."
- Row 6, conflated requirements: FR-21 (three pricing models in one line), FR-38 (five notification kinds). "Split this — success criterion for each?"
:::

# AI's answer — non-functional and domain

```{=latex}
\footnotesize
```

- NFR-4: The back end is available 99.9% of the time, excluding planned maintenance.
- NFR-8: The system supports at least 100,000 registered users, 10,000 concurrent rentals, and 1,000 stations, and can scale horizontally beyond that.
- NFR-9: All traffic uses TLS 1.2 or later. Data at rest is encrypted.
- NFR-10: The system never stores card data itself. It uses tokenization by the payment provider (PCI DSS).
- NFR-18: The app meets WCAG 2.2 AA. It supports screen readers and large text.
- NFR-19: The app is available in the city's main languages and supports localized currency and date formats.
- NFR-22: The system has automated tests with at least 80% coverage of core rental and payment logic.

[…]

::: notes
- Row 4, technology and standards as requirements: TLS 1.2 (NFR-9), PCI DSS (NFR-10), WCAG 2.2 AA (NFR-18), 80% test coverage (NFR-22). "User need or design decision?"
- Row 5, precise-looking invented numbers: 99.9% (NFR-4), 100,000 users / 10,000 concurrent rentals / 1,000 stations (NFR-8). "This is testable — but who signs off on 100,000?"
- Row 7, vague NFR: "the city's main languages" (NFR-19).
- Note for the room: the NFRs carry numbers now; the trap is that the numbers are invented, not missing.
:::

# AI's answer — are e-bikes in scope?

- FR-7: Users can search and filter stations, for example by e-bikes or by nearest.

[…]

- DR-13: Bikes carry GPS or telemetry to locate them. E-bikes report battery level, and low-battery bikes are not offered for rent.

[…]

**Open questions:**

1. Are e-bikes, dockless bikes, or scooters in scope?

[…]

::: notes
Row 9, open questions contradict the requirements: open question 1 asks whether e-bikes are in scope, while FR-7 already filters by e-bike and DR-13 specifies e-bike battery behaviour. The prompt said *bicycles*. "If it's still an open question, why is there already a requirement for it? Which one do I build?"
:::

# Prompt #2

> *"Rewrite the requirements organized by use case. Each use case is one user goal from my prompt — renting, returning, paying, rebalancing; nothing else. For each: who does it, what's the success criterion, and one realistic non-functional constraint. Use only the roles I named. Drop technology and standards choices — those are implementation, not requirements. Don't invent numbers: if a threshold needs a decision from me, write TBD."*

# AI's revised answer — by use case (1/2)

```{=latex}
\footnotesize
```

Roles: **user** and **staff**. Thresholds marked TBD need your decision.

**UC-1: Rent a bicycle**

- **Actor:** User.
- **Goal:** Take a bicycle from a station for a ride.
- **Success criterion:** The user picks up a bicycle at a station and it is released to them. The system records the rental as started at that moment and associates it with the user.
- **Non-functional constraint (performance):** The time from the user's request to bicycle release is at most TBD seconds under normal conditions.

**UC-2: Return a bicycle**

- **Actor:** User.
- **Goal:** End a rental by leaving the bicycle at a station.
- **Success criterion:** The user leaves the bicycle at a station with a free space. The system records the rental as ended, makes the bicycle available at that station, and shows the user a confirmation.
- **Non-functional constraint (reliability):** A return is never lost or double-counted if the connection drops or the user retries. The rental ends exactly once.

# AI's revised answer — by use case (2/2)

```{=latex}
\footnotesize
```

**UC-3: Pay for a rental**

- **Actor:** User.
- **Goal:** Pay for a completed rental through the app.
- **Success criterion:** The user is charged the correct amount for the rental, and the payment is recorded against that rental. The user can see a receipt in the app.
- **Non-functional constraint (security and privacy):** Only the user's own payment details are used, and they are protected from disclosure to other users and to staff.

**UC-4: Rebalance bicycles between stations**

- **Actor:** Staff.
- **Goal:** Move bicycles from stations with too many to stations with too few.
- **Success criterion:** After a move, the source and destination stations show the correct bicycle counts. Moved bicycles are available for rent at the destination, and no station exceeds its capacity.
- **Non-functional constraint (data accuracy):** Station bicycle counts shown to users and staff are no more than TBD seconds out of date.

::: notes
Complete answer, verbatim, apart from its title line. The shrink (81 requirements to four use cases, only user and staff, no standards, TBDs) is the lesson — let the room see it. Then re-check:

- Happy path only: UC-2 needs "a station with a free space" — what if the station is full? The first draft had that (FR-17), and failed payments (FR-26). "We asked for one success criterion; what did we lose?"
- UC-3 "charged the correct amount" — correct according to what? No pricing rule exists anywhere now (bridge to Week 3).
- UC-4 "too many / too few" — who decides? The first draft's invented target fill levels (DR-14) are hiding behind these words.
- The domain requirements disappeared entirely (e.g. "each dock holds one bike") because the prompt didn't ask to keep them.
:::

# Reserve prompt — if the first document is too clean

> *"Now redo this assuming the city has 50,000 daily riders and 2,000 bikes across 200 stations."*

::: notes
Captured in a separate session: prompt #1, then this prompt (attempt 1). The answer is a revision 2 of a first document similar to the one above.
:::

# Reserve answer — it did the arithmetic

```{=latex}
\footnotesize
```

**The fleet size doesn't fit the ridership.** 50,000 riders a day on 2,000 bikes means about 25 trips per bike per day. Busy systems usually see 4 to 10. Average stations hold only 10 bikes (2,000 ÷ 200). I've written the requirements to fit that load. Please confirm whether "50,000 daily riders" means 50,000 trips or unique users, and whether the fleet is really 2,000 bikes.

**Sizing assumptions** […]

| Item | Value | Basis |
|------------------|------------------------------------------|------------------------------|
| Peak hour | ~10 to 12% of daily rides, or 5,000 to 9,000 rides/hour | Commute peaks |
| Peak unlock rate | ~2.5 per second average, ~10 per second burst | Bunching at station clusters |
| Docks | ~3,600 (200 stations × ~18 docks) | ~1.8 docks per bike |
| Registered users | ~300,000 to 500,000 | Assumed, for capacity planning |

::: notes
Credit where due: it did the arithmetic (about 25 trips per bike per day versus a typical 4 to 10) and asked whether 50,000 means riders or trips. Critique is not only fault-finding. Then: every row of the sizing table is its own guess ("Commute peaks", "Assumed, for capacity planning") — and "I've written the requirements to fit that load" anyway. Next slide shows the guesses turned into hard requirements.
:::

# Reserve answer — guesses become requirements

```{=latex}
\footnotesize
```

- FR-D2: Show availability trends and a short-term prediction ("likely empty in 10 min"), since stations hold only about 10 bikes.
- FR-D5: Reserve a bike for up to 10 minutes, one reservation at a time. Reservations may not hold more than 20% of a station's bikes, so they can't starve walk-up riders.

[…]

| ID | Category | Requirement |
|--------|------------|----------------------------------------------------------------|
| NFR-2 | Throughput | Sustain 10 unlocks/s and 10 returns/s. Handle ~15,000 telemetry messages/minute. Design for 3x headroom for growth or events. |
| NFR-3 | Capacity | 500,000 registered users, 30,000 concurrent app sessions at peak, and 3,600 connected docks and 2,000 bikes. |

[…]

- DR-14: Comply with the city's operating permit, including sharing anonymized trip data (for example, in GBFS format).
- DR-19: Target service levels are stations empty less than 5% of peak time and full less than 5% of peak time. These need confirmation with the city.

::: notes
- Trace the numbers: "10 unlocks/s" (NFR-2) is the table's assumed burst; "500,000 registered users" (NFR-3) is the table's "Assumed, for capacity planning" upper bound; "3,600 connected docks" is its own ~18-docks-per-station guess. "Which of these came from me?"
- More invented features: availability prediction (FR-D2), reservations capped at 20% (FR-D5).
- The city authority is still a stakeholder, now with a permit and a data feed (DR-14); DR-19 invents service levels and then says they "need confirmation with the city".
- This capture has no false "what changed" claim (the runbook's dry run did); skip that point.
:::
