---
title: "AMSS 2026 — Lab 2: Class Diagrams from Spec"
author: "Traian-Florin Șerbănuță"
date: "2026"
---

# Lab 2: Class Diagrams from AI

Three phases, 100 minutes — **you work solo this time.**

1. **Brief + spec** (~10 min) — read the 1-page spec; recall the read-order.
2. **Drive-and-critique drill** (~70 min) — drive AI to a class diagram, critique it, re-prompt twice.
3. **Share-out** (~20 min) — compare which defects the AI produced across the room.

Deliverable: a Mermaid class diagram + a critique log (1 page max), committed to the course lab repo.

::: notes
The hands-on follow-through of the Week 4 lecture. In Week 4 you watched the architect-and-critic loop on a bike-sharing class diagram; today you run it yourself, alone, on a different domain. Solo — because the oral defense is individual and cold.
:::

---

# Citatul zilei

> „Un sistem de abstractizări care descrie aspecte selectate ale unui domeniu […]”

— **Eric Evans**

[Sursa: Domain-Driven Design Reference — definiția modelului](https://www.domainlanguage.com/wp-content/uploads/2016/05/DDD_Reference_2015-03.pdf#page=6) · traducere din engleză

::: notes
Original: “A system of abstractions that describes selected aspects of a domain”

Publicația autorului, Definitions, intrarea model, pagina PDF 6. Fragmentul se oprește după domain; omisiunea finalului este marcată.

Legătura cu tema: Un model selectează aspectele relevante ale domeniului, fără a copia totul sau a prescrie clase.
:::

---

# Before You Start

- Your assistant (Claude Code or Codex) already working from Lab 1 — same course settings: copy `tooling/template/` into the root of your lab repo if it is not there yet.
- You receive at lab start: your **student-id**, the lab-repo URL, and the **1-page spec** (also in `lab02/README.md` on clone).
- This is an **individual** lab. You play both roles — architect *and* critic — yourself.

::: notes
No tooling onboarding this week; you set up your assistant in Lab 1. Quick check before you start: in Claude Code, `/model` should show Sonnet 5, low effort (in Codex, the model picker should show the model from `.codex/config.toml`). No subscription yet, or usage limit hit → pair with a colleague on their laptop, but keep your own critique log.
:::

---

# The Domain: Library Kiosk

A neighbourhood library runs a self-service kiosk. This spec is **honest — no planted tricks.** The defects you will catch come from the AI, not the spec.

- The library owns a **catalogue of titles**. A *title* (book) has an ISBN, a title, and one or more authors.
- A popular title may have **several physical copies**. A *copy* has its own barcode and a condition. A copy belongs to the library and stays in the catalogue even when nobody has borrowed it.
- A **member** has a membership number, a name, and an email. Members come in two kinds: **standard** (up to 3 open loans) and **staff** (up to 10).
- To borrow, a member scans a **copy**. That opens a **loan**: one member, one copy, a start date, a due date (14 days on). A copy on loan cannot be borrowed by anyone else until returned.
- A member may have many loans over time, and several open at once (up to their limit). A loan always refers to **exactly one copy and one member**.
- On return, the member scans the copy; the loan closes with a return date, and records a **fine** if late.
- The kiosk shows a member their open loans and any fines owed.

::: notes
The full spec is also seeded in lab02/README.md. The traps are natural: title-vs-copy (multiplicity), the library *holds* copies that outlive loans (aggregation), loan = one copy + one member (M:N trap), standard-vs-staff (is-a). Read it once and start driving.
:::

---

# Your Job — the Loop

The same architect-and-critic loop from Week 4, run solo:

**drive AI → read with the 4-step order → name the defects → re-prompt with domain rules → re-read.**

- Bare first prompt, then **two required re-prompts** — iterate at least twice.
- Keep the **best** diagram, not the first draft.
- Log what you caught and why you re-prompted as you go — that log is the deliverable.

::: notes
Two iterations is the Week 4 mandate ("iterate at least twice"). The student is both architect and critic — no partner to swap with. The running log is the Critique/Rationale evidence; don't reconstruct it afterward.
:::

---

# Round 1 — Bare Prompt + First Read

Send a deliberately bare prompt, pasting the spec:

> *"Generate a UML class diagram (as Mermaid) for this library system. [paste the 1-page spec]"*

Render it (VS Code's Markdown preview with the "Markdown Preview Mermaid Support" extension), then run the **4-step read-order** (next slide) against it. Log every defect: its name, where it is, how bad it is.

::: notes
The bare prompt is on purpose. Expect a good-looking first draft: current assistants usually get the obvious structure right (title vs copy, member subclasses, one-copy-one-member loans). The defects that remain are subtler — a whole-part relationship on the wrong pair of classes, a missing class the spec does mention, a controller class that is not a domain concept, prose that says one thing while the diagram draws another. Read every line; if it still looks clean, use the defect card.
:::

---

# The Read-Order (from Week 4)

A fixed order, every time:

1. Are the classes real **domain** concepts? (or invented infrastructure)
2. Are the **multiplicities** right? (read each one aloud)
3. Does each **association** name a real relationship? (a verb)
4. Are **whole-part** relationships captured? (aggregation / composition)

This is your critique-log rubric.

::: notes
Identical to Week 4's "How to Read an AI Class Diagram" slide. A repeatable read-order beats ad-hoc staring — it is also exactly what the oral defense drills.
:::

---

# The Five Defects (from Week 4)

Name them with this vocabulary:

- **Wrong multiplicity** — `*--*` where it should be one (read it aloud).
- **Fake / decorative association** — a line with no nameable verb.
- **Missing aggregation** — a whole-part relationship drawn as a plain line.
- **Invented class / infrastructure** — `DatabaseManager`, `CacheController` — implementation, not domain.
- **God class** — one class that holds everything and does everything.

::: notes
The Week 4 catalogue, verbatim. The critique log must use these names; the grading gate checks for at least two of them, correctly applied. The defect card later in this lab is just these five made concrete for this domain (a misplaced whole-part is a *missing aggregation* on the right pair; a controller class is an *invented class*; title-vs-copy and is-a-as-attribute are instances of *wrong multiplicity* / *invented class*).
:::

---

# Re-prompt #1 — Name the Domain Rules

Fix the worst defects by stating the rules the AI got wrong — **the ones you actually logged**, quoted from the spec. For example, if the whole-part is on the wrong pair:

> *"The library holds its copies — model Library, with aggregation from Library to Copy. A Title groups copies but does not own them. A title may have zero copies on the shelf."*

Or, if your draft collapsed title and copy: *"A Book is a title; a Copy is a physical item — model both. A loan is exactly one copy to one member."*

Regenerate, re-read with the 4-step order, log what changed. **This is iteration 1.**

::: notes
Naming the domain rules is the scaffold move from Week 4's demo prompt #2. Don't paste a fix for a defect your draft doesn't have — the re-prompt must follow from your log. Then re-read the revision line by line: an assistant that says "fixed" has not necessarily fixed it, and fixes often introduce a small new defect.
:::

---

# Re-prompt #2 — Kill the Residue

Second pass targets what the first leaves — typically classes that are not domain concepts, and rules that live only in prose:

> *"Drop any class that isn't a library-domain concept (a Kiosk controller, a DatabaseManager, a 'LibrarySystem'). Is Loan an association class? Say why or why not — but draw it with plain Mermaid class syntax (Mermaid has no association-class notation). Model member kinds as subclasses (standard / staff), not a type field."*

Regenerate, re-read, log. **This is iteration 2.** Then keep your best diagram.

::: notes
Residual catalogue entries: invented class (here usually a controller or service class rather than a database), is-a-as-attribute, and claims in the assistant's notes that the diagram does not back up. Asked to draw an association class in Mermaid, an assistant may invent syntax that does not render (Mermaid has none) — if your diagram fails to render, that is a defect to log, not a reason to trust the prose. Re-check the multiplicities after this pass too: removing a class can quietly change them. Two iterations is the floor, not the ceiling — but the gate wants both logged.
:::

---

# Defect Card — Library Kiosk

If the draft looks complete, stress these — name the closest Week 4 defect. **Expect subtle ones:** the obvious structure is often right.

- No `Library` class at all, yet the spec says the library *holds* copies — **missing aggregation**.
- Aggregation drawn on `Title o-- Copy` instead of `Library o-- Copy` — **whole-part on the wrong pair**.
- `Title "1" -- "1..*" Copy` — **wrong multiplicity**: must every title have a copy?
- A `Kiosk` / `LibraryService` class full of operations — **invented class** (controller, not domain).
- Notes say "Loan is an association class" / "composition" but the diagram draws something else — claim vs diagram.
- `Member "*" -- "*" Book`, or Book and Copy as one class — **wrong multiplicity** / collapsed title vs copy.
- `DatabaseManager`, a god `LibrarySystem`, member kind as `type: String` — rarer now, still check.

::: notes
The signature catch now is the misplaced whole-part: the assistant puts the aggregation between Title and Copy and never models the Library that actually holds the copies. Collapsing title and copy into one Book class (and the bogus many-to-many it forces) is the classic defect of weaker models — check for it, but don't expect it. Read the assistant's notes against the diagram, too: its prose often claims more than it draws.
:::

---

# Deliverable

On branch `lab02/<student-id>`, commit:

- `lab02/<student-id>/diagram.mmd` — your best AI-driven Mermaid class diagram (must render).
- `lab02/<student-id>/critique-log.md` — 1 page max (next slide).
- `lab02/<student-id>/transcript.md` — optional but recommended: your raw prompt/output trail.

::: notes
The transcript is your raw Rationale evidence; optional for the gate, but it is what we look at if a log is borderline. Keep the best diagram, not the first.
:::

---

# The Critique Log (1 page max)

Structured by the read-order. One short block per iteration (Round 1, re-prompt 1, re-prompt 2):

- **Defects found** — each: Week 4 name, where, severity (high / med / low).
- **Re-prompt move and why** — which domain rule you named and the reason. *(Rationale — graded.)*
- **What changed** after regenerating.

Close with **one residual risk** — a defect the AI never got right.

::: notes
The "why" line is the graded one. "The diagram was wrong, I asked again" is not a rationale. The residual-risk line seeds Traceability: a wrong structure propagates to the tests and the code.
:::

---

# How to Submit

```bash
git clone <lab-repo-url>          # skip if you still have the Lab 1 clone
git checkout -b lab02/<student-id>
mkdir -p lab02/<student-id>
# write diagram.mmd and critique-log.md inside lab02/<student-id>/
git add lab02/<student-id>
git commit -m "Lab 2: <student-id> library kiosk class diagram + critique log"
git push -u origin lab02/<student-id>
```

Push fails? Paste both files into the shared doc / email the instructor, then fix git after class.

::: notes
Substitute your real student-id everywhere `<student-id>` appears. You likely already have the clone from Lab 1; this is branch + commit + push.
:::

---

# Grading — Pass / Redo

Pass needs both:

1. `diagram.mmd` (renders) and `critique-log.md` both committed by the deadline.
2. Your log names **at least two** distinct Week 4 defects correctly **and** gives a real reason for at least one re-prompt (not just what you typed).

A vacuous log ("the diagram was wrong, I fixed it") is a redo, not a fail. We grade your critique and reasoning — not the diagram's polish.

::: notes
Low-stakes literacy gate. The bar is on Critique (naming defects) and Rationale (the why), not on diagram quality. Grading the diagram would reward the AI's output over the student's critique.
:::

---

# Share-out (20 min)

- A few students present the defect they caught that mattered most + the re-prompt move that fixed it.
- We tally, live, which defects the AI produced across the room.
- Same spec, same domain, the whole room → a real structural-defect map.

The defects you tally are exactly what you critique every week — and in the oral defense.

::: notes
Instructor pre-selects presenters by scanning pushed logs during the drill, aiming for variety across the five defects. The misplaced aggregation (Title–Copy instead of Library–Copy) is worth surfacing if anyone found it — it is the catch that separates reading from skimming.
:::

---

# Why This Matters

A wrong class structure does not stay contained — it propagates to the sequence diagrams (Week 6), the tests, and the code.

Today you drilled **Critique** (read & critique a diagram) and **Rationale** (say *why* you re-prompted). Next: **Week 5** widens to the other structural views; **Lab 3** flips you to red-team — hunting *planted* defects in artifacts we prepare.

::: notes
Closer. Tie back to the literacy floor and forward to Week 5 (other structural views) and Lab 3 (the critique/red-team lab). Traceability is seeded by the residual-risk line: a wrong structure propagates downstream.
:::
