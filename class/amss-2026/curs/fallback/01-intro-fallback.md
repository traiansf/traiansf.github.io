---
title: "Week 1 demo — fallback captures"
subtitle: "Library kiosk: one architect-critic cycle on a class diagram"
author: "Captured with Claude Code, Sonnet 5 (low effort), September 2026"
---

# When to use this deck

The live AI is not answering, so here is what the same prompts produced in a real run. We read and critique these diagrams exactly as we would have done live.

::: notes
Instructor file, not published. Captured September 2026 with the course setting (Sonnet 5, low effort), no tools, fresh session per chain. Prompt #1 + prompt #2: one session (attempt 2 of the chain; attempt 1 had already split title and copy, so the scripted prompt #2 would have asked for a fix that was not on screen). Reserve: a separate session (attempt 1), prompt #1 then the reserve prompt; its own prompt #1 answer was similar to this one (conflated `Book` with `BookStatus`, but `Staff --|> User` instead of the `Member`/`Staff` split). Say: "the model is having a moment — here's what I captured during the dry run."
:::

# Prompt #1

> *"Generate a UML class diagram in Mermaid for a small library kiosk. Users can borrow and return books. Staff can register returns. A book can be reserved while it is out on loan."*

# AI's answer — the diagram

```{.mermaid height=86%}
classDiagram
    class Kiosk {
        +String kioskId
        +String location
        +authenticate(user: User) bool
        +borrowBook(user: User, book: Book) Loan
        +returnBook(loan: Loan) void
        +reserveBook(user: User, book: Book) Reservation
    }

    class User {
        +String userId
        +String name
        +String email
        +getActiveLoans() List~Loan~
    }

    class Member {
        +int maxLoans
        +canBorrow() bool
    }

    class Staff {
        +String staffId
        +registerReturn(loan: Loan) void
    }

    class Book {
        +String isbn
        +String title
        +String author
        +BookStatus status
        +isAvailable() bool
    }

    class BookStatus {
        <<enumeration>>
        AVAILABLE
        ON_LOAN
        RESERVED
    }

    class Loan {
        +Date borrowedOn
        +Date dueDate
        +Date returnedOn
        +isOverdue() bool
        +close(returnDate: Date) void
    }

    class Reservation {
        +Date reservedOn
        +ReservationStatus status
        +fulfill() void
        +cancel() void
    }

    class ReservationStatus {
        <<enumeration>>
        PENDING
        FULFILLED
        CANCELLED
    }

    User <|-- Member
    User <|-- Staff

    Kiosk ..> Member : serves
    Kiosk ..> Staff : serves
    Kiosk "1" --> "*" Loan : creates
    Kiosk "1" --> "*" Reservation : creates

    Member "1" --> "0..*" Loan : borrows
    Member "1" --> "0..*" Reservation : places
    Book "1" --> "0..*" Loan : loaned in
    Book "1" --> "0..*" Reservation : reserved via
    Staff ..> Loan : registers return

    Book --> BookStatus
    Reservation --> ReservationStatus
```

::: notes
Runbook catalogue, in walkthrough order:

- Row 1, conflated concepts: `Book` holds `isbn`/`title`/`author` and `status`. "Three copies of this title — how many Book objects, and which one is on loan?"
- Row 2, status enum contradicts the prompt: `BookStatus { AVAILABLE, ON_LOAN, RESERVED }`. Quote the design note on the next slide: when the book comes back it "becomes RESERVED" — so while it is on loan, what does it hold? And isn't the status derivable from `Loan`/`Reservation`?
- Row 3, anemic Staff: only a dashed `Staff ..> Loan : registers return` dependency. Lasting relationship or one-off use?
- Row 4 (variant), generalisation that forbids a real case: `User <|-- Member`, `User <|-- Staff`, and only `Member` borrows. "A librarian borrows a book on her lunch break — which class is she?"
- Spare: `Kiosk` has solid associations `"1" --> "*"` to `Loan` and `Reservation` ("creates") plus dependencies; and returns exist twice (`Kiosk.returnBook` and `Staff.registerReturn`) — the model itself flags this in its last note.
:::

# AI's answer — what it said

**Design notes**

- `Member` and `Staff` specialize `User`. Members borrow and reserve. Staff register returns through `registerReturn`.
- `Loan` links a `Member` to a `Book`. It stays open until `returnedOn` is set.
- A `Reservation` is only valid while its `Book` is `ON_LOAN`. The kiosk should enforce this in `reserveBook`. When the book is returned, the oldest `PENDING` reservation is fulfilled and the book becomes `RESERVED`.
- The returns operation is on both `Kiosk.returnBook` (self-service) and `Staff.registerReturn` (staff-registered). If only staff should handle returns, remove `returnBook` from `Kiosk`.

::: notes
Verbatim. The third bullet is the row 2 quote: a reserved book on loan must be `ON_LOAN`, and after the return it stops being on loan to become `RESERVED`. The "only valid while ON_LOAN" rule lives in prose, not in the diagram.
:::

# Prompt #2

> *"Update the diagram: separate a book title from its physical copies — loans are of copies, reservations are of titles; remove the BookStatus enum and derive availability from loans and reservations; make Staff a real participant — link it to the loans whose return it registers."*

# AI's revised answer — the diagram

```{.mermaid height=86%}
classDiagram
    class Kiosk {
        +String kioskId
        +String location
        +authenticate(user: User) bool
        +borrowCopy(member: Member, copy: BookCopy) Loan
        +returnCopy(loan: Loan) void
        +reserveTitle(member: Member, title: BookTitle) Reservation
    }

    class User {
        +String userId
        +String name
        +String email
        +getActiveLoans() List~Loan~
    }

    class Member {
        +int maxLoans
        +canBorrow() bool
    }

    class Staff {
        +String staffId
        +registerReturn(loan: Loan) void
    }

    class BookTitle {
        +String isbn
        +String title
        +String author
        +availableCopies() List~BookCopy~
        +hasAvailableCopy() bool
        +pendingReservations() List~Reservation~
    }

    class BookCopy {
        +String copyId
        +String barcode
        +isOnLoan() bool
        +isAvailable() bool
        +currentLoan() Loan
    }

    class Loan {
        +Date borrowedOn
        +Date dueDate
        +Date returnedOn
        +isActive() bool
        +isOverdue() bool
        +close(returnDate: Date, registeredBy: Staff) void
    }

    class Reservation {
        +Date reservedOn
        +Date fulfilledOn
        +Date cancelledOn
        +isPending() bool
        +fulfill() void
        +cancel() void
    }

    User <|-- Member
    User <|-- Staff

    Kiosk ..> User : authenticates
    Kiosk "1" --> "*" Loan : creates
    Kiosk "1" --> "*" Reservation : creates

    BookTitle "1" *-- "1..*" BookCopy : has copies
    BookCopy "1" --> "0..*" Loan : loaned in
    BookTitle "1" --> "0..*" Reservation : reserved via

    Member "1" --> "0..*" Loan : borrows
    Member "1" --> "0..*" Reservation : places

    Staff "0..1" <-- "0..*" Loan : returnRegisteredBy
```

::: notes
All three requested fixes landed: `BookTitle`/`BookCopy` (loans on copies, reservations on titles), `BookStatus` gone, `Staff "0..1" <-- "0..*" Loan : returnRegisteredBy`. Re-check beat:

- Unasked removal: `ReservationStatus` replaced by `fulfilledOn`/`cancelledOn` — nothing stops both being set. "Did I ask for that?"
- New commitment: `BookTitle "1" *-- "1..*" BookCopy` — a title on order with no copy yet? Drop the title, do the copies vanish?
- Leftover inconsistency: `Loan.close(returnDate, registeredBy: Staff)` takes a staff member, but the notes say self-service returns have no staff member (`0..1`).
- Untouched: `User <|-- Member / Staff` (row 4) — we did not ask, so it stayed. The loop only fixes what the critic names.
:::

# AI's revised answer — what it said

**Design notes** […]

- **No status enum:** state is derived.
  - A copy is on loan if it has a `Loan` with `returnedOn == null`, and available otherwise.
  - A copy is held for a reservation if the title has a pending `Reservation` (no `fulfilledOn` or `cancelledOn`) and the copy is not on loan.
  - `ReservationStatus` is removed for the same reason. `isPending()` checks the dates.
- **Staff link:** the `Staff` to `Loan` association is `returnRegisteredBy`, optional (`0..1`) because a self-service return at the kiosk has no staff member. `Loan.close` records who registered the return, and `Staff.registerReturn` calls it.
- **Open question:** `Kiosk.returnCopy` still allows self-service returns. If only staff should handle returns, remove it and make `registeredBy` mandatory (`1`).

::: notes
Verbatim excerpt (the title-vs-copy and reservation-rule bullets are cut). Point at "ReservationStatus is removed for the same reason" — an unasked change justified after the fact. Credit: it surfaces the self-service question honestly.
:::

# Reserve prompt — if the first diagram is too clean

> *"Now redo this for a system where books can be reserved by multiple users in a queue."*

::: notes
Captured in a separate session: prompt #1 then this prompt (attempt 1). That session's prompt #1 diagram had `Book` with `BookStatus` and `Staff --|> User`; the reserve answer below builds on it.
:::

# Reserve answer — the diagram

```{.mermaid height=86%}
classDiagram
    class User {
        +String userId
        +String name
        +borrowBook(book: Book) Loan
        +returnBook(loan: Loan) void
        +reserveBook(book: Book) Reservation
    }

    class Staff {
        +String staffId
        +registerReturn(loan: Loan) void
    }

    class Book {
        +String isbn
        +String title
        +String author
        +BookStatus status
        +isAvailable() boolean
        +getQueueLength() int
    }

    class Loan {
        +Date loanDate
        +Date dueDate
        +Date returnDate
        +isOverdue() boolean
        +close() void
    }

    class ReservationQueue {
        +enqueue(reservation: Reservation) void
        +peekNext() Reservation
        +dequeueNext() Reservation
        +remove(reservation: Reservation) void
        +size() int
        +isEmpty() boolean
    }

    class Reservation {
        +Date reservedAt
        +int position
        +ReservationStatus status
        +Date holdExpiresAt
        +cancel() void
        +markReady() void
        +fulfill() void
        +expire() void
    }

    class Kiosk {
        +String kioskId
        +checkout(user: User, book: Book) Loan
        +processReturn(loan: Loan) void
        +placeReservation(user: User, book: Book) Reservation
    }

    class BookStatus {
        <<enumeration>>
        AVAILABLE
        ON_LOAN
        ON_HOLD
    }

    class ReservationStatus {
        <<enumeration>>
        WAITING
        READY
        FULFILLED
        CANCELLED
        EXPIRED
    }

    Staff --|> User
    User "1" --> "0..*" Loan : borrows
    Book "1" --> "0..*" Loan : loaned in
    Book "1" *-- "1" ReservationQueue : has
    ReservationQueue "1" o-- "0..*" Reservation : orders (FIFO)
    User "1" --> "0..*" Reservation : places
    Reservation "0..*" --> "1" Book : for
    Kiosk ..> Loan : creates
    Kiosk ..> Reservation : creates
    Kiosk ..> User : serves
    Staff ..> Loan : registers return
    Book --> BookStatus
    Reservation --> ReservationStatus
```

::: notes
What to point at (runbook reserve section):

- `int position` stored on `Reservation` while `ReservationQueue` also "orders (FIFO)" — two sources of truth; the model admits `position` "must be updated when a reservation is cancelled or expires".
- `ReservationQueue "1" o-- "0..*" Reservation` — aggregation for a plain association, ordering hidden in a label instead of `{ordered}`. Plus `Book *-- ReservationQueue` and a direct `Reservation --> Book` — two paths from a reservation to its book.
- The queue is per `Book`, and `Book` still conflates title and copy: three copies — one queue or three?
- Scope creep: hold expiry (`holdExpiresAt`, `READY`/`EXPIRED`, `expire()`) nobody asked for; `BookStatus` kept, with `RESERVED` renamed `ON_HOLD`.
:::

# Reserve answer — what it said

**What changed**

- **`ReservationQueue`** is new. Each `Book` owns exactly one, and it holds many `Reservation`s in first-in-first-out order.
- **`Reservation`** gains `position`, plus a `READY` state and `holdExpiresAt`. […]
- **`BookStatus`** now has `ON_HOLD`, replacing `RESERVED`. A book can have a queue while `ON_LOAN`, so the queue length carries the reservation information and the status doesn't have to.

**Business rules the diagram doesn't enforce**

- A user may have only one active reservation per book.
- Only the user at the head of the queue may borrow an `ON_HOLD` book.
- `position` is derived from queue order and must be updated when a reservation is cancelled or expires.

::: notes
Verbatim excerpt. "position is derived … must be updated" is the quote for the two-sources-of-truth question: if it is derived, why store it?
:::
