---
title: "Week 6 demo — fallback captures"
subtitle: "Bike-sharing \"rent a bike\" sequence diagram"
author: "Captured with Claude Code, Sonnet 5 (low effort), September 2026"
classoption: "aspectratio=169"
---

# When to use this deck

Switch here if the live AI fails. These are real answers to the demo's own prompts; walk the same defect catalogue against them.

::: notes
Present the HTML version in the browser: diagrams show at full width (scroll the tall ones); in the PDF they are vector images — zoom in. Captured September 2026 with the course setting (Claude Code, Sonnet 5, low effort, fresh session, no tools). Prompt #1 and prompt #2 ran in one session (first attempt, met the bar); the reserve ran after a fresh prompt #1 in a separate session (first attempt). Runbook: `curs/06-behavioral-i-demo.md`.
:::

# Prompt #1

> "Generate a UML sequence diagram (as Mermaid) for renting a bike in the city bike-sharing app: a rider unlocks a bike at a station and is charged by app."

# AI's answer — the sequence

```{=latex}
\renewcommand*\pandocbounded[1]{\sbox0{#1}\ifdim\dimexpr\ht0*\number\linewidth/\number\wd0\relax>0.84\textheight\resizebox{!}{0.84\textheight}{\usebox0}\else\resizebox{\linewidth}{!}{\usebox0}\fi}
```

```mermaid
sequenceDiagram
    autonumber
    actor Rider
    participant App as Mobile App
    participant Backend as Bike-Share Backend
    participant Station as Station Dock
    participant Bike
    participant Pay as Payment Service

    Rider->>App: Select station and bike (scan QR / pick bike)
    App->>Backend: requestUnlock(riderId, bikeId, stationId)
    Backend->>Backend: Verify account, no active rental, bike available

    alt Rider not eligible or bike unavailable
        Backend-->>App: Rejected (reason)
        App-->>Rider: Show error
    else Eligible
        Backend->>Pay: authorizeDeposit(riderId, amount)
        alt Authorization fails
            Pay-->>Backend: Declined
            Backend-->>App: Payment error
            App-->>Rider: Update payment method
        else Authorization succeeds
            Pay-->>Backend: Authorization OK (authId)
            Backend->>Station: unlock(bikeId)
            Station->>Bike: release lock
            Bike-->>Station: Unlocked
            Station-->>Backend: Unlock confirmed
            Backend->>Backend: Create rental (startTime, startStation)
            Backend-->>App: Rental started (rentalId)
            App-->>Rider: Bike unlocked, ride timer starts
        end
    end

    Note over Rider,Bike: Ride in progress

    Rider->>Station: Dock bike at destination
    Station->>Bike: Lock detected
    Station->>Backend: returnConfirmed(bikeId, endStation)
    Backend->>Backend: Close rental, compute fare (duration, distance)
    Backend->>Pay: charge(riderId, fare, authId)
    alt Charge succeeds
        Pay-->>Backend: Payment receipt
        Backend-->>App: Rental ended, receipt
        App-->>Rider: Show fare and receipt
    else Charge fails
        Pay-->>Backend: Failure
        Backend-->>App: Payment pending, retry
        App-->>Rider: Prompt to resolve payment
    end
```

::: notes
Runbook catalogue, in walkthrough order (anchor on #2/#3, add #5, #1 in its partial form):

- #2 opaque self-calls: `Backend->>Backend` for "Verify account, no active rental, bike available", "Create rental (startTime, startStation)", "Close rental, compute fare".
- #3 lifelines don't trace to the class diagram: `Bike-Share Backend`, `Station Dock`, `Payment Service` — no `Rental` lifeline; the rental is created inside the Backend's self-call.
- #5 scope drift: the ride and the return (steps after "Ride in progress") were not asked for; the charge is put there.
- #1 partial: alts for ineligible rider and declined authorisation, and even a failed final charge — but no branch for the bike failing to unlock. "Which failures did it pick, and which did it leave out?"
- #4 is handled in this capture (failed final charge has a branch) — don't promise it.
:::

# AI's answer — what it said

> The diagram covers the full flow: eligibility check, deposit authorization, unlock via the station, then fare calculation and charging when the bike is docked. It also includes failure paths for ineligible riders, declined authorization, and failed final charges.

::: notes
"Covers the full flow" — the prompt asked for renting. And the list of failure paths is exactly the one to check against: unlock failure is missing.
:::

# Prompt #2 (same session)

> "Revise the sequence. Model only renting — stop once the ride has started. Replace the Backend's self-calls with the domain objects from our class diagram: show which object creates the Rental and which one handles the Payment. Authorise payment before the unlock, and add alt fragments for payment declined and for the bike failing to unlock. Every call that returns a result must show its dashed return."

# AI's answer — the revised sequence

```{=latex}
\renewcommand*\pandocbounded[1]{\sbox0{#1}\ifdim\dimexpr\ht0*\number\linewidth/\number\wd0\relax>0.84\textheight\resizebox{!}{0.84\textheight}{\usebox0}\else\resizebox{\linewidth}{!}{\usebox0}\fi}
```

```mermaid
sequenceDiagram
    autonumber
    actor Rider
    participant App as Mobile App
    participant Station
    participant Bike
    participant Rental
    participant Payment

    Rider->>App: selectBike(bikeId)
    App->>Station: requestRental(riderId, bikeId)
    Station->>Bike: isAvailable()
    Bike-->>Station: available

    Station->>Rental: create(riderId, bikeId, stationId)
    Rental-->>Station: rental (status = Pending)

    Station->>Rental: start()
    Rental->>Payment: authorize(riderId, depositAmount)
    Payment-->>Rental: authorizationResult

    alt Payment declined
        Rental->>Rental: markFailed(PAYMENT_DECLINED)
        Rental-->>Station: rejected (payment declined)
        Station-->>App: rentalRejected (payment declined)
        App-->>Rider: Show payment error
    else Payment authorized
        Rental->>Bike: unlock()
        Bike-->>Rental: unlockResult

        alt Bike fails to unlock
            Rental->>Payment: release(authorizationId)
            Payment-->>Rental: released
            Rental->>Rental: markFailed(UNLOCK_FAILED)
            Rental-->>Station: rejected (unlock failed)
            Station-->>App: rentalRejected (unlock failed)
            App-->>Rider: Show error, choose another bike
        else Bike unlocked
            Rental->>Rental: markActive(startTime)
            Rental-->>Station: rentalStarted
            Station-->>App: rentalStarted (rentalId)
            App-->>Rider: Bike unlocked, ride started
        end
    end
```

::: notes
Requested fixes applied: stops at "ride started"; Backend gone; `Station` creates the `Rental`, `Rental` calls `Payment`; authorise before unlock; nested alts for payment declined and unlock failed (with an unrequested but sensible `release` of the hold); dashed returns present.

Re-check beat:

- Regression: the ineligible-rider branch from the first draft vanished — `isAvailable()` always answers `available` and the rider's account is never checked (no User/Member lifeline at all).
- `Rental` is created (status Pending) *before* the payment is authorised, so declined payments and failed unlocks leave failed Rental records — was that the domain? And `Rental` is drawn from the top although it comes into existence mid-way (Mermaid's `create participant`).
- Claim to verify: "the only self-calls left are `Rental` updating its own status" — true; is `markFailed` a message worth drawing?
- Opener: "I couldn't see your class diagram, so I assumed…" — a fresh session has no "our class diagram" (the Week 5 missing-context point again).
:::

# AI's answer — its change list

> I couldn't see your class diagram, so I assumed these domain objects: `Station`, `Bike`, `Rental` and `Payment`. `Station` creates the `Rental`, and the `Rental` owns and calls its `Payment`. Rename them if your diagram differs.
>
> [...]
>
> - **Creation:** `Station` creates the `Rental`. `Rental` then runs the payment and unlock steps in order.
> - **Payment:** the `Rental` calls `Payment.authorize` before `Bike.unlock`. If the bike then fails to unlock, the `Rental` calls `Payment.release` to void the hold.
> - **Returns:** every call that yields a result has a dashed return, including `create`, `authorize`, `unlock` and `release`.
> - **Self-calls:** the only ones left are `Rental` updating its own status (`markFailed`, `markActive`), which is the object's own behaviour, not the Backend's.
> - **Scope:** the diagram ends once the ride has started, so docking and the final charge are out.

::: notes
"It says it did X — show me where. What did it drop that it didn't mention?" (the eligibility check).
:::

# Reserve prompt (fresh session, after prompt #1)

> "Make this enterprise-grade with full observability, fraud checks, and audit logging."

# AI's answer — the enterprise sequence

```{=latex}
\renewcommand*\pandocbounded[1]{\sbox0{#1}\ifdim\dimexpr\ht0*\number\linewidth/\number\wd0\relax>0.84\textheight\resizebox{!}{0.84\textheight}{\usebox0}\else\resizebox{\linewidth}{!}{\usebox0}\fi}
```

```mermaid
sequenceDiagram
    autonumber
    actor Rider
    participant App as Mobile App
    participant GW as API Gateway
    participant Auth as Identity / Auth Service
    participant Rental as Rental Service
    participant Fraud as Fraud Detection Service
    participant Pay as Payment Service
    participant PSP as Payment Provider (PSP)
    participant IoT as IoT Station Gateway
    participant Station as Station / Dock
    participant Bike
    participant Bus as Event Bus
    participant Audit as Audit Log (append-only)
    participant Obs as Observability (Traces / Metrics / Logs)

    Note over App,Obs: Every request carries a W3C traceparent header and correlation ID.<br/>All services emit spans, metrics, and structured logs to Obs.

    %% ---------- Unlock request ----------
    Rider->>App: Scan QR code / select bike
    App->>GW: POST /rentals (bikeId, stationId, deviceId, idempotencyKey, JWT)
    GW->>Obs: Start trace, record request metric
    GW->>Auth: Validate token, rate limit, device attestation
    alt Invalid token or rate limit exceeded
        Auth-->>GW: 401 / 429
        GW->>Audit: Log AUTH_REJECTED (actor, IP, deviceId)
        GW-->>App: Error
        App-->>Rider: Show authentication error
    else Authenticated
        Auth-->>GW: Identity and scopes
        GW->>Rental: createRental(riderId, bikeId, stationId, idempotencyKey)
        Rental->>Rental: Check idempotency key (return existing result on retry)
        Rental->>Rental: Verify account status and bike availability
        Rental->>Rental: Reserve bike (state = RESERVED, TTL 60s)
        Rental->>Audit: Log RENTAL_REQUESTED

        %% ---------- Fraud checks ----------
        Rental->>Fraud: assessRisk(riderId, deviceId, geoLocation, paymentMethod, history)
        Fraud->>Fraud: Velocity, geofence, device reputation, and account-sharing checks
        Fraud-->>Rental: riskDecision (ALLOW / STEP_UP / DENY), riskScore
        Rental->>Audit: Log FRAUD_DECISION (score, rules triggered)
        Rental->>Obs: Metric fraud_decision_total{decision}

        alt DENY
            Rental->>Rental: Release reservation
            Rental->>Bus: Publish RentalDenied
            Rental-->>GW: 403 Denied
            GW-->>App: Unlock denied
            App-->>Rider: Show denial and support contact
        else STEP_UP
            Rental-->>App: Challenge required (3DS / OTP / biometric)
            App-->>Rider: Prompt for verification
            Rider->>App: Complete challenge
            App->>Rental: Submit challenge result
            Rental->>Audit: Log STEP_UP_RESULT
        end

        %% ---------- Payment pre-authorization ----------
        Rental->>Pay: authorize(riderId, depositAmount, idempotencyKey)
        Pay->>PSP: Pre-authorize hold (tokenized payment method)
        alt Authorization fails or PSP times out
            PSP-->>Pay: Declined / timeout
            Pay->>Pay: Retry with backoff, circuit breaker check
            Pay->>Audit: Log PAYMENT_AUTH_FAILED
            Pay-->>Rental: authFailed(reason)
            Rental->>Rental: Release reservation
            Rental->>Bus: Publish RentalFailed
            Rental-->>App: Payment error
            App-->>Rider: Show payment error, offer another method
        else Authorized
            PSP-->>Pay: authorized(authId)
            Pay->>Audit: Log PAYMENT_AUTHORIZED (authId, amount)
            Pay-->>Rental: authorized(authId)

            %% ---------- Unlock ----------
            Rental->>IoT: unlock(bikeId, signedToken, nonce, expiry)
            IoT->>Station: Signed unlock command over mTLS
            Station->>Station: Verify signature, nonce, and expiry
            Station->>Bike: Release lock
            alt Unlock fails or times out
                Bike-->>Station: fault
                Station-->>IoT: unlockFailed
                IoT-->>Rental: unlockFailed
                Rental->>Pay: voidAuthorization(authId)
                Pay->>PSP: Void hold
                Rental->>Audit: Log UNLOCK_FAILED and AUTH_VOIDED
                Rental->>Bus: Publish RentalFailed
                Rental-->>App: Unlock failed
                App-->>Rider: Show error, suggest another bike
            else Unlocked
                Bike-->>Station: unlocked
                Station-->>IoT: unlockConfirmed(bikeId, telemetry)
                IoT-->>Rental: unlockConfirmed
                Rental->>Rental: State = ACTIVE, record startTime
                Rental->>Audit: Log RENTAL_STARTED (rentalId, bikeId, authId)
                Rental->>Bus: Publish RentalStarted
                Rental-->>GW: 201 rentalId
                GW-->>App: rentalStarted
                App-->>Rider: Bike unlocked, ride started
            end
        end
    end

    %% ---------- Ride ----------
    Note over Rider,Bike: Ride in progress. Bike sends GPS and telemetry.<br/>Fraud service monitors for anomalies (out-of-zone, theft patterns).
    Bike-)Bus: Telemetry stream
    Bus-)Fraud: Stream analysis
    Bus-)Obs: Metrics and alerts

    %% ---------- Return and charge ----------
    Rider->>Station: Return bike to dock
    Station->>Bike: Lock
    Bike-->>Station: locked
    Station->>IoT: returnConfirmed(bikeId, stationId, telemetry)
    IoT->>Rental: returnConfirmed
    Rental->>Rental: Close rental, compute fare (time, distance, fees, promos)
    Rental->>Audit: Log RENTAL_ENDED (fare breakdown)
    Rental->>Fraud: postRideReview(rentalId)
    Fraud-->>Rental: reviewResult
    Rental->>Pay: capture(authId, fare, idempotencyKey)
    Pay->>PSP: Capture funds
    alt Capture fails
        PSP-->>Pay: Failed
        Pay->>Audit: Log PAYMENT_CAPTURE_FAILED
        Pay->>Bus: Publish PaymentFailed (triggers dunning and retry)
        Pay-->>Rental: captureFailed
        Rental-->>App: Payment pending, action needed
    else Captured
        PSP-->>Pay: captured(receiptId)
        Pay->>Audit: Log PAYMENT_CAPTURED (receiptId, amount)
        Pay-->>Rental: paid(receiptId)
        Rental->>Bus: Publish RentalCompleted
        Rental-->>App: rentalEnded(fare, receipt)
        App-->>Rider: Show receipt and charge
    end

    Bus-)Obs: Emit SLIs (unlock latency, payment success rate, fraud rate)
    Obs->>Obs: Evaluate SLO and alert rules
```

::: notes
The fresh prompt #1 of this session was similar to the one above (Backend self-calls, declined-payment alt only, ride and return drawn). The reserve reply: 13 participants, about 150 lines, renders. Vector image: zoom in the PDF viewer or browser; the next two slides quote the tells.

- Messages no rental requirement justifies: audit writes at every step, bike telemetry streamed to fraud detection, `Obs->>Obs: Evaluate SLO and alert rules`, a post-ride fraud review.
- Notation misuse: `GW->>Obs: Start trace, record request metric` is a synchronous call that never returns (should be asynchronous, like the later `Bike-)Bus`).
- Broken alternative: `alt DENY … else STEP_UP … end` has no ALLOW branch, and after the DENY branch returns "403 Denied" the flow still falls through to the payment pre-authorisation; the challenge result is logged but never evaluated.
- Messages that bypass the gateway: `Rental-->>App: Challenge required`, `App->>Rental: Submit challenge result`, `Rental-->>App: Payment error` although every other call goes through `GW`.
- Scope drift again: the ride and the return are back.
:::

# Zoom — the fraud decision

```text
        alt DENY
            Rental->>Rental: Release reservation
            Rental->>Bus: Publish RentalDenied
            Rental-->>GW: 403 Denied
            GW-->>App: Unlock denied
            App-->>Rider: Show denial and support contact
        else STEP_UP
            Rental-->>App: Challenge required (3DS / OTP / biometric)
            App-->>Rider: Prompt for verification
            Rider->>App: Complete challenge
            App->>Rental: Submit challenge result
            Rental->>Audit: Log STEP_UP_RESULT
        end

        %% ---------- Payment pre-authorization ----------
        Rental->>Pay: authorize(riderId, depositAmount, idempotencyKey)
```

::: notes
Verbatim lines from the reserve diagram. Ask: what happens after "403 Denied"? Read the next line after `end`. Where is the ALLOW branch, and who evaluates the challenge result?
:::

# Zoom — messages no requirement asked for

```text
    GW->>Obs: Start trace, record request metric
[...]
        Rental->>Audit: Log FRAUD_DECISION (score, rules triggered)
        Rental->>Obs: Metric fraud_decision_total{decision}
[...]
    Bike-)Bus: Telemetry stream
    Bus-)Fraud: Stream analysis
[...]
    Obs->>Obs: Evaluate SLO and alert rules
```

::: notes
Verbatim lines from the reserve diagram. A synchronous call to observability that never returns; telemetry streamed to fraud detection; the observability stack talking to itself. Which of these does any rental requirement justify?
:::

# AI's answer — what it said (reserve)

> **What was added:**
>
> - **Observability:** trace and correlation IDs on every hop, metrics (fraud decisions, latency, success rates), structured logs, telemetry streaming, and SLO alerting.
> - **Fraud checks:** a pre-rental risk assessment with allow, step-up, or deny outcomes. It also covers in-ride anomaly monitoring and a post-ride review.
> - **Audit logging:** an append-only audit log records each security and financial event, [...]
> - **Resilience and security:** [...]
>
> The diagram is large. I can split it into separate diagrams for unlock, ride monitoring, and return and payment if you'd like.

::: notes
"Allow, step-up, or deny outcomes" — the diagram draws only two of the three.
:::
