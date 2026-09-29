---
title: "Week 10 demo — fallback captures"
subtitle: "Trace a new feature: reserve a bike for 15 minutes"
author: "Captured with Claude Code, Sonnet 5 (low effort), September 2026"
---

# When to use this deck

Switch here if the live AI fails. These are real answers to the demo's own prompts; walk the same defect catalogue along the chain, requirement to test and back.

::: notes
Captured September 2026 with the course setting (Claude Code, Sonnet 5, low effort, fresh session, no tools, empty folder — so no course AGENTS.md). Prompt #1 and prompt #2 ran in one session; that chain took 2 attempts (attempt 1 had rich defects but drew the class changes and the sequence only as ASCII art, no Mermaid; attempt 2 met the bar). The make-it-fail reserve ran after a fresh prompt #1 in a separate session (first attempt). Runbook: `curs/10-traceability-demo.md`.
:::

# Prompt #1

> "For a new feature — a rider can reserve a bike for 15 minutes before pickup — give me the requirement, the use case, the class changes, the sequence, and a test."

# AI's answer — requirements and use case {.allowframebreaks}

```{=latex}
\small
```

| ID | Requirement |
|----|-------------|
| R1 | A rider can reserve one available bike at a station for 15 minutes. |
| R2 | While reserved, the bike can't be unlocked or reserved by anyone else. |
| R3 | A rider can hold at most one active reservation. |
| R4 | The reservation ends when the rider picks up the bike (converted to a trip), cancels it, or 15 minutes pass (expired). |
| R5 | On expiry or cancellation, the bike returns to Available. |
| R6 | The rider sees the remaining time and is notified shortly before expiry. |
| R7 | Only the reserving rider can unlock the reserved bike. |

*Use Case: Reserve a Bike* [...]

**Precondition:** The rider is logged in, has no active reservation or trip, and has a valid payment method. [...]

4. The system shows a confirmation with a countdown.
5. The rider arrives and unlocks the bike. The reservation becomes Converted and a trip starts.

- 5a. The rider cancels. The reservation becomes Cancelled and the bike becomes Available.
- 5b. 15 minutes pass. The reservation becomes Expired and the bike becomes Available.
- 5c. A different rider tries to unlock the bike. The system denies it.

::: notes
Catalogue #5 (gold-plating) starts here: R3 (one reservation per rider), R6 (countdown and notification) and the "valid payment method" precondition — nobody asked for them. Hold R4/R5's cancel clause in mind for the test slide (#2).
:::

# AI's answer — class changes {.allowframebreaks}

```{=latex}
\fontsize{6}{7.2}\selectfont
```

```
Bike
  + status: BikeStatus        // add RESERVED to AVAILABLE, IN_USE, MAINTENANCE
  + reserve(): void           // AVAILABLE -> RESERVED, else throws
  + release(): void           // RESERVED -> AVAILABLE

Reservation                    (NEW)
  - id, rider: Rider, bike: Bike
  - createdAt, expiresAt: Instant
  - state: ReservationState   // ACTIVE, CONVERTED, CANCELLED, EXPIRED
  + isExpired(now): boolean
  + convert(): Trip
  + cancel(): void
  + expire(): void

ReservationService             (NEW)
  - reservations: ReservationRepository
  - clock: Clock              // injected so tests control time
  - HOLD = Duration.ofMinutes(15)
  + reserve(riderId, bikeId): Reservation
  + cancel(reservationId): void
  + expireDue(): int          // called by scheduler
```

```
ReservationExpiryJob           (NEW)  // runs every ~30s, calls expireDue()

Rider
  + activeReservation(): Optional<Reservation>

TripService (changed)
  + startTrip(riderId, bikeId)
      // if the bike is RESERVED, allow it only for the holder,
      // then call reservation.convert()

ReservationRepository          (NEW)
  + findActiveByRider(riderId), findActiveByBike(bikeId), findDue(now)
```

::: notes
Pseudo-code, not a UML class diagram — worth one line ("is this a class diagram?"). Keep this slide open next to the next two: every link check goes back here. Note `reserve(riderId, bikeId)` takes ids; `ReservationRepository` has no `save`; `ReservationExpiryJob` is gold-plating (#5).
:::

# AI's answer — the sequence

```{.mermaid height=80%}
sequenceDiagram
    actor Rider
    participant App
    participant RS as ReservationService
    participant Bike
    participant Repo as ReservationRepository
    participant Job as ExpiryJob
    participant TS as TripService

    Rider->>App: Reserve bike B
    App->>RS: reserve(riderId, B)
    RS->>Repo: findActiveByRider(riderId)
    Repo-->>RS: none
    RS->>Bike: reserve()
    Bike-->>RS: status = RESERVED
    RS->>Repo: save(Reservation ACTIVE, expiresAt = now+15m)
    RS-->>App: Reservation
    App-->>Rider: Confirmed, 15:00 countdown

    alt Rider picks up in time
        Rider->>App: Unlock bike B
        App->>TS: startTrip(riderId, B)
        TS->>Repo: findActiveByBike(B)
        TS->>RS: convert reservation
        TS-->>App: Trip started
    else No pickup
        Job->>RS: expireDue()
        RS->>Repo: findDue(now)
        RS->>Bike: release()
        RS->>Repo: mark EXPIRED
    end
```

::: notes
#1 dangling links: `Repo: save(...)` and `Repo: mark EXPIRED` — no such repository operations in the class changes. #7 wrong lifeline: "convert reservation" goes to `ReservationService`, but `convert()` is declared on `Reservation` (and it is not an operation name at all). Holder check (R7): nothing in the pickup branch compares the rider — only a comment in `TripService` promises it (#3, mild).
:::

# AI's answer — the tests

```{=latex}
\fontsize{6}{7.2}\selectfont
```

```java
class ReservationServiceTest {
    MutableClock clock = new MutableClock(Instant.parse("2026-09-29T10:00:00Z"));
    InMemoryReservationRepository repo = new InMemoryReservationRepository();
    ReservationService service = new ReservationService(repo, clock);

    @Test
    void reservationExpiresAfter15MinutesAndFreesBike() {
        Rider rider = new Rider("r1");
        Bike bike = new Bike("b1");                       // AVAILABLE

        Reservation res = service.reserve(rider, bike);

        assertEquals(BikeStatus.RESERVED, bike.getStatus());
        assertEquals(clock.instant().plus(Duration.ofMinutes(15)), res.getExpiresAt());

        clock.advance(Duration.ofMinutes(14).plusSeconds(59));
        assertEquals(0, service.expireDue());             // not yet
        assertEquals(BikeStatus.RESERVED, bike.getStatus());

        clock.advance(Duration.ofSeconds(1));             // exactly 15:00
        assertEquals(1, service.expireDue());
        assertEquals(ReservationState.EXPIRED, res.getState());
        assertEquals(BikeStatus.AVAILABLE, bike.getStatus());
    }
```

::: notes
#1 dangling links: `service.reserve(rider, bike)` passes objects, the class declares `reserve(riderId, bikeId)`; `new Rider("r1")`, `new Bike("b1")`, `getStatus()`, `getExpiresAt()`, `getState()`, `MutableClock`, `InMemoryReservationRepository` — none declared. Credit: the boundary is tested at 14:59 and exactly 15:00 (#6 does not appear in this capture).
:::

# AI's answer — the tests (continued)

```{=latex}
\fontsize{6}{7.2}\selectfont
```

```java
    @Test
    void cannotReserveAlreadyReservedBike() {
        Bike bike = new Bike("b1");
        service.reserve(new Rider("r1"), bike);
        assertThrows(BikeUnavailableException.class,
            () -> service.reserve(new Rider("r2"), bike));
    }

    @Test
    void riderCannotHoldTwoReservations() {
        Rider rider = new Rider("r1");
        service.reserve(rider, new Bike("b1"));
        assertThrows(ActiveReservationExistsException.class,
            () -> service.reserve(rider, new Bike("b2")));
    }

    @Test
    void onlyHolderCanUnlockReservedBike() {
        Bike bike = new Bike("b1");
        service.reserve(new Rider("r1"), bike);
        assertThrows(NotReservationHolderException.class,
            () -> tripService.startTrip(new Rider("r2"), bike));
    }
}
```

The first test is the acceptance test for R1, R4 and R5. It checks the 14:59 and 15:00 boundary. The other three cover R2, R3 and R7.

::: notes
#2 orphan clause: cancel (R4, R5, use case 5a) has no test — yet the AI claims the first test covers R4 and R5; it only exercises expiry. R6 (notification) has no test. #1: `tripService` is never declared or constructed; the three exceptions appear nowhere in the class changes. The test for R3 checks gold-plating (#5).
:::

# Prompt #2 (same session)

> "Make the layers consistent: every operation the sequence or the test calls must be declared in the class changes, including Rider; every clause of the requirement — expiry, 'unavailable to other riders', cancel — must have a test; only the rider who reserved may unlock; drop anything no requirement asked for. Then list the trace links: requirement -> use case -> class -> sequence -> test."

# Revised — requirements and class changes {.allowframebreaks}

```{=latex}
\fontsize{6}{7.2}\selectfont
```

Dropped because no requirement asked for them: the one-reservation-per-rider rule, the countdown and notification, the payment and eligibility checks, the "nearby bikes" suggestion, `Rider.activeReservation()`, `ReservationExpiryJob`, and `findActiveByRider`. [...]

| ID | Requirement |
|----|-------------|
| R1 | A rider can reserve an available bike; the reservation lasts 15 minutes. |
| R2 | While reserved, the bike is unavailable to other riders (they can't reserve it). |
| R3 | After 15 minutes without pickup the reservation expires and the bike is available again. |
| R4 | The rider can cancel the reservation; the bike is available again. |
| R5 | Only the rider who reserved the bike may unlock it. Unlocking is the pickup and ends the reservation. |

```
Rider
  + getId(): String
  + equals(Object)               // by id, used for the holder check

Bike
  + getStatus(): BikeStatus      // add RESERVED to AVAILABLE, IN_USE, ...
  + reserve(): void              // AVAILABLE -> RESERVED, else BikeUnavailableException
  + release(): void              // RESERVED -> AVAILABLE
  + startUse(): void             // AVAILABLE or RESERVED -> IN_USE

Reservation                       (new)
  + getRider(): Rider
  + getBike(): Bike
  + getExpiresAt(): Instant
  + getState(): ReservationState // ACTIVE, PICKED_UP, CANCELLED, EXPIRED
  + isDue(now: Instant): boolean // ACTIVE and now >= expiresAt
  + pickUp(): void               // ACTIVE -> PICKED_UP
  + cancel(): void               // ACTIVE -> CANCELLED
  + expire(): void               // ACTIVE -> EXPIRED
```

```{=latex}
\fontsize{5.2}{6.2}\selectfont
```

```
ReservationService                (new; holds a Clock and a ReservationRepository)
  HOLD = 15 minutes
  + reserve(rider, bike): Reservation
  + cancel(reservation): void
  + expireDue(): int             // number expired
  + pickUp(rider, bike): void    // NotReservationHolderException if rider != holder

TripService                       (changed)
  + startTrip(rider, bike): Trip // if bike is RESERVED, call ReservationService.pickUp first;
                                 // then bike.startUse()
```

```
ReservationRepository             (new)
  + save(Reservation): void
  + findActiveByBike(bike): Optional<Reservation>
  + findDue(now: Instant): List<Reservation>

BikeUnavailableException, NotReservationHolderException   (new)
```

Test support: `MutableClock` (with `advance(Duration)`) and `InMemoryReservationRepository`.

::: notes
Requested fixes applied: `Rider` declared, `save` added, gold-plating dropped, holder check declared on `pickUp`, the exceptions declared. Re-check: no constructors are declared — yet the tests call `new Rider("alice")`, `new Bike("b1")`, `new ReservationService(repo, clock)`, `new TripService(service)`; its claim "every operation called in the tests or sequences appears in section 3" is therefore not quite true. The requirements were rewritten: R2 narrowed to "they can't reserve it" and the unlock half moved into R5 — who approved that?
:::

# Revised — the sequence

```{.mermaid height=80%}
sequenceDiagram
    actor Rider
    participant RS as ReservationService
    participant Bike
    participant Repo as ReservationRepository
    participant TS as TripService

    Rider->>RS: reserve(rider, bike)
    RS->>Bike: reserve()
    RS->>Repo: save(Reservation ACTIVE, expiresAt=now+15m)
    RS-->>Rider: Reservation

    alt Cancel (A2)
        Rider->>RS: cancel(reservation)
        RS->>Repo: save(reservation.cancel())
        RS->>Bike: release()
    else Expiry (A3)
        RS->>Repo: findDue(now)
        RS->>Repo: save(reservation.expire())
        RS->>Bike: release()
    else Pickup (main step 3 and A4)
        Rider->>TS: startTrip(rider, bike)
        TS->>RS: pickUp(rider, bike)
        RS->>Repo: findActiveByBike(bike)
        Note over RS: getRider() != rider, so throw NotReservationHolderException
        RS->>Repo: save(reservation.pickUp())
        TS->>Bike: startUse()
    end
```

::: notes
Re-check points: the Expiry branch has no triggering message — who calls `expireDue()`? (It dropped the job and left it "an implementation detail".) The holder check is a note, not a guarded branch: the throw and the `save(... pickUp())` sit in the same flow. `reservation.cancel()` / `expire()` / `pickUp()` are hidden inside `save(...)` arguments instead of being messages to `Reservation`. Cancel has no check of who cancels.
:::

# Revised — the trace links {.allowframebreaks}

```{=latex}
\tiny
```

| Req | Use case | Classes and operations | Sequence | Tests |
|--|----|--------------|----|---------------|
| R1 | UC1 steps 1–2 | `ReservationService.reserve`, `Bike.reserve`, `Reservation.getExpiresAt`, `ReservationRepository.save` | Reserve | `reserveHoldsBikeFor15Minutes` |
| R2 | UC1 A1 | `Bike.reserve` (throws `BikeUnavailableException`), `ReservationService.reserve` | Reserve (throw before save) | `otherRiderCannotReserveHeldBike` |
| R3 | UC1 A3 | `ReservationService.expireDue`, `Reservation.isDue` and `expire`, `Bike.release`, `ReservationRepository.findDue` | Expiry | `expiresAtExactly15MinutesAndFreesBike`, and the last assertion of `holderUnlockEndsReservation` |
| R4 | UC1 A2 | `ReservationService.cancel`, `Reservation.cancel`, `Bike.release` | Cancel | `cancelFreesBike` |
| R5 | UC1 steps 3–4 and A4 | `TripService.startTrip`, `ReservationService.pickUp`, `Reservation.getRider`, `Rider.equals`, `Reservation.pickUp`, `Bike.startUse`, `ReservationRepository.findActiveByBike`, `NotReservationHolderException` | Pickup | `otherRiderCannotUnlock`, `holderUnlockEndsReservation` |

```{=latex}
\small
```

**Coverage check**

- Every requirement has at least one test.
- Every operation called in the tests or sequences appears in section 3. [...]
- **Open question:** what happens if the holder unlocks after 15:00 but before `expireDue()` has run. The requirements don't say. As written, the pickup would succeed. If that's wrong, add an R3 clause and a test.

::: notes
Do not read it all — spot-check two rows. R3 lists `Reservation.isDue`, which no message in the sequence calls. R2 no longer covers "can't be unlocked by anyone else" — that moved to R5. Credit the honest open question (late unlock before `expireDue()` runs succeeds), then ask: is a flow whose correctness depends on when a timer runs a realisation of R3? The tests (not shown; six, one per clause, boundary at 14:59 and 15:00) use the undeclared constructors noted earlier.
:::

# Make-it-fail reserve (fresh session, after prompt #1)

> "Now add loyalty points, surge pricing, and fraud detection to this feature."

This changes one earlier assumption. Surge pricing needs something to price, so reservations now carry a fee. I've also assumed the following, and you should correct any that are wrong:

- The fee is a flat base fee times a surge multiplier. [...]
- Loyalty points can be redeemed against the fee.

::: notes
That session's prompt #1 answer (not shown) was itself broken in the usual ways: a Mermaid sequence, repository and exception names never declared, a scheduler job and one-per-rider rule nobody asked for, and the holder-only unlock left untested. Orphan concept: the fee — no requirement ever said reservations cost anything; the AI announces it as an "assumption" and builds three requirement groups on it.
:::

# Reserve — the new requirements (excerpt) {.allowframebreaks}

```{=latex}
\small
```

**Surge pricing**

- **REQ-SUR-2:** The multiplier is capped (default 3.0×) and is never below 1.0×.
- **REQ-SUR-3:** The rider sees the price and must confirm it. The confirmed price is locked for that reservation, even if surge changes during the 15 minutes.

**Loyalty points**

- **REQ-LOY-2:** Cancelled and expired reservations earn nothing. Expiry may carry a penalty (configurable, default none).

**Fraud detection**

- **REQ-FRD-2:** Rules include:
    - reserve/cancel churn (more than N in an hour);
    - many accounts on one device or payment method;
    - hoarding (repeated expiry without unlocking);
    - reservations made from a location far from the station.
- **REQ-FRD-3:** `BLOCK` rejects the request. `REVIEW` allows it but flags it, and it earns no points until cleared.

[...]

**Fraud tuning.** The thresholds (N churn events, shared-device count) are placeholders. They should come from config and, ideally, be shadow-tested (log-only) before they start blocking real riders.

::: notes
Orphan requirement clauses: the hoarding and geo-mismatch rules and the expiry penalty have no test at all. Assumptions baked in: "N" is a placeholder here, but the churn test hard-codes 6 cancels -> BLOCK (next slides).
:::

# Reserve — the sequence

```{.mermaid height=80%}
sequenceDiagram
    actor Rider
    participant App
    participant RS as ReservationService
    participant FS as FraudService
    participant PS as PricingService
    participant LS as LoyaltyService
    participant Pay as PaymentService
    participant BR as BikeRepository
    participant Bus as EventBus

    Rider->>App: Reserve(bikeId, pointsToRedeem)
    App->>RS: requestQuote(riderId, bikeId, points)
    RS->>FS: assess(context)
    FS-->>RS: ALLOW / REVIEW / BLOCK
    alt BLOCK
        RS-->>App: FraudBlocked
    else ALLOW or REVIEW
        RS->>PS: quote(station, rider, points)
        PS-->>RS: Quote(total, validUntil)
        RS-->>App: Quote
        App-->>Rider: Price with surge, confirm?
        Rider->>App: Confirm(quoteId)
        App->>RS: reserve(riderId, bikeId, quoteId)
        RS->>RS: validate quote not expired
        RS->>BR: lock bike, bike.reserve()
        RS->>LS: redeem(riderId, points)
        RS->>Pay: charge(riderId, total)
        alt charge fails
            RS->>BR: bike.release()
            RS->>LS: restore(riderId, points)
            RS-->>App: PaymentFailed
        else charged
            RS-->>App: Reservation(locked price, expiresAt)
        end
    end

    Rider->>App: Unlock(bikeId)
    App->>RS: complete(reservationId)
    RS->>Bus: ReservationCompleted
    Bus->>LS: award (idempotent, hold if flagged)
```

::: notes
Layers disagree: `requestQuote` is called here but appears nowhere in its class-change table; the unlock now goes straight to `ReservationService.complete` — the earlier `TripService.unlock` holder check has vanished, so "only the reserving rider can unlock" is silently lost. `bike.reserve()` / `bike.release()` are sent to the repository lifeline (wrong receiver). REVIEW has no branch of its own.
:::

# Reserve — the tests (excerpt)

```{=latex}
\fontsize{6}{7.2}\selectfont
```

```java
    @Test
    void surgeMultiplierIsCappedAtThree() {
        surge.setDemandSupply("S1", 10, 1);            // raw ratio 10.0
        Quote q = pricing.quote("S1", "rider1", 0);

        assertEquals(3.0, q.multiplier());
        assertEquals(baseFee.times(3), q.total());
    }
[...]
    @Test
    void expiredAndCancelledReservationsEarnNothing() {
        Reservation r = service.reserve("rider1", "B1", quoteId);
        clock.advance(Duration.ofMinutes(16));
        service.expireDue();

        assertEquals(0, loyalty.balance("rider1"));
    }
[...]
    @Test
    void excessiveReserveCancelChurnIsBlocked() {
        for (int i = 0; i < 6; i++) history.recordCancel("rider1", clock.instant());

        FraudDecision d = fraud.assess(ctx("rider1"));

        assertEquals(FraudOutcome.BLOCK, d.outcome());
        assertTrue(d.reasons().contains("ChurnRule"));
    }
```

::: notes
Test checks something else: `expiredAndCancelledReservationsEarnNothing` never cancels anything — the name claims two clauses, the body checks one. Assumptions baked into tests: the "default 3.0×" cap and the "N" churn threshold (here 6) are hard-coded. Dangling links: `surge.setDemandSupply`, `history.recordCancel`, `loyalty.balance`, `ctx(...)`, `quoteId` — none declared. The original 15-minute tests are not repeated, and `reserve` now takes a `quoteId`, so they no longer compile. Pick two: the fee and the missing unlock check are the quickest.
:::
