# AMSS 2026/2027 — Assessment blueprint

Instructor working document. The confirmed allocation is **5 points for the team design dossier + 3 points for an individual scenario-based multiple-choice examination + 1 point for attendance + 1 automatic point**. There is no scheduled checkpoint, separately graded individual decision note, or mandatory per-student oral defense. Teams may request feedback throughout the semester. The instructor pre-reads each dossier and finalizes its five-point team score in a Lab 7 interview about unclear points, using the published dossier criteria; the interview carries no separate score.

The confirmed resit allocation is **9 points for a scenario-based multiple-choice examination + 1 automatic point**. Dossier and attendance scores do not carry over. The resit must sample the breadth of the course individually, including reasoning about design alternatives, validation, and change.

The question count, duration, scoring details, and rubric anchors below are proposals to rehearse and finalize before announcing them to students. The examination tests reasoning about supplied problems and artifacts. Constructing a design remains the team dossier's central task; unaided constructive design and change reasoning continue as formative classroom practice. Multiple-choice performance alone does not establish that a student can independently construct a complete design.

## Proposed examination structure

For the regular examination, propose **24 single-best-answer questions in approximately 60 minutes**, with four options per question. For the broader resit, propose **36 questions in approximately 90 minutes**, adding two questions in each area below. Counts and durations require a run-through before adoption.

Short case packets can each support several questions, but each question must be answerable without relying on another answer. State clearly whether scenarios reset or continue a previous state. Use more cases or additional perspectives in the resit to broaden the evidence without making each case excessively long.

| Main assessment area | Regular | Resit | Reasoning to sample |
|---|---:|---:|---|
| Problem framing and requirements | 4 | 6 | Distinguish supplied facts from assumptions, identify a necessary clarification, judge an acceptance example, and recognize a scope change. |
| Domain modeling | 4 | 6 | Distinguish identity from description, separate related concepts, apply relationship rules, and identify a concrete scenario a model cannot represent. |
| Contracts and invariants | 4 | 6 | Select a rule-preserving outcome, find an invariant violation, distinguish preconditions from guaranteed outcomes, and reason about rejection behavior. |
| State and behavior | 4 | 6 | Follow a trace, apply a guard, recognize a legal/illegal transition, and reason about an exceptional path. |
| Responsibilities, cohesion, and coupling | 4 | 6 | Identify responsibility for a stated rule, compare change propagation, inspect a dependency, and evaluate a decomposition against explicit constraints. |
| Model validation and change | 4 | 6 | Interpret a counterexample, distinguish intended termination from deadlock, identify what a check establishes, and trace the impact of a changed requirement. |
| **Total** | **24** | **36** | Tag each item with one main area; secondary tags may capture connections. |

Distribute these areas across the cases; a case need not correspond to exactly one area. Keep scenarios short enough to leave time for reasoning. Rehearse both forms, including reading the case packets, before fixing their question counts and durations. Adjust these if the reading burden is excessive; preserve balanced coverage. The additional resit items should vary the decisions tested rather than repeat equivalent recall questions.

Use prose, small tables, sketches, or familiar pseudocode. Supply any representation conventions needed to interpret an item. Do not test diagram-language trivia, provider/model knowledge, or unstated domain conventions.

### Item-writing and review rules

- Supply the facts, scope, relevant starting state, and assumptions that determine the answer. Specify serial/concurrent execution where it matters.
- Ask for an outcome, violated rule, missing decision, supported conclusion, or comparison against a stated objective. Avoid asking for the universally “best architecture.”
- Make one option correct under the supplied facts. Plausible alternatives should fail for a specific reason, not because the instructor prefers another style.
- For every option, record the supporting rule or a counterexample. Check boundary cases and whether an unstated assumption could make a distractor correct.
- Keep options comparable in length and specificity. Avoid “all/none of the above,” accidental grammatical clues, and needless negative stems.
- Mix direct scenario interpretation with multi-step reasoning; do not make every item a definition recall or a long code puzzle.
- A second review can challenge ambiguity, but the instructor must verify the key. A generated explanation is not answer-key evidence on its own.

### Scoring proposal

Let C be correct answers and N the number of scored questions. With the proposed equal-weight, correct-count scoring:

- **Regular exam component = 3 × C / N.** The regular final grade combines this component with the dossier (up to 5), attendance (up to 1), and the automatic point.
- **Resit exam component = 9 × C / N; resit final grade = 9 × C / N + 1.** Add neither the dossier nor attendance.

An incorrect or unanswered item would earn no credit; **no negative marking is proposed**. The point allocations above are confirmed, while equal weighting, treatment of wrong answers, and rounding are scoring proposals to finalize. Do not round each item separately; announce the final rounding rule with the examination instructions.

Keep attendance and the automatic point separate. Do not introduce an examination pass threshold or a project eligibility condition without an explicit course decision.

The question-count denominator is the number of scored items on the student's form, not the examination's point allocation. With the proposed counts, it is 24 for the regular examination and 36 for the resit.

## Team dossier alignment — proposed five-point rubric

Assess the shared dossier once per team. Give **one point to each of the five priorities**. Validation, alternatives, and change reasoning supply evidence within the relevant criterion rather than creating a sixth point.

| Criterion | Points | Inspectable evidence |
|---|---:|---|
| Problem framing and requirements | 1 | Clear goal and boundary; agreed rules distinguished from assumptions/questions; acceptance examples that test the intended outcomes; a changed requirement identified explicitly. |
| Domain modeling | 1 | Concepts, identities, relationships, and rules fit the problem; examples justify important distinctions; the model can represent the claimed scenarios. |
| Contracts and invariants | 1 | Important operations have precise obligations and success/rejection outcomes; persistent rules are stated; checks or counterexamples support the claimed guarantees and expose their limits. |
| State and behavior | 1 | Legal transitions, guards, interactions, and relevant exceptional behavior agree with the requirements; traces or model analysis support the interpretation; intended terminal states are distinguished from blocked progress. |
| Responsibilities, cohesion, and coupling | 1 | Rule enforcement and behavior have clear owners; dependencies and boundaries are justified; an alternative and a change-impact analysis explain the selected allocation. |
| **Total** | **5** | Evidence may support several criteria, but each criterion scores its own learning outcome. |

Suggested marking anchors within a criterion: **1** for a coherent, justified account supported by relevant evidence; **0.5** for a useful account with a material gap or inconsistency; **0** when the required understanding is absent or contradicted. Intermediate scores may distinguish partial achievement; calibrate anchors on a few dossiers before marking the cohort.

A concise team synthesis should link to the supporting artifacts and review evidence. Evaluate substantive reasoning, not document volume, diagram counts, discovered-defect quotas, or use of named patterns. A working application is not required; scenarios, models, and focused prototypes can support validation. Handoffs and separately contextualized review should show which claims humans checked and why they accepted, rejected, or deferred them.

## Illustrative items and keys

These original examples illustrate the item style. They are teaching samples, not a complete bank or a committed examination form.

### Item 1 — Requirements and domain distinctions

**Supplied facts:** A title may have several identified physical copies. Borrowing a known, available copy by a known member succeeds and creates an active loan for that copy. A title request records interest; it neither allocates a copy nor blocks borrowing, and borrowing does not delete requests. Operations run one at a time. There are no other borrowing restrictions in this slice.

Title T has copies C1 and C2. C1 is on loan; C2 is available. Member M2 has a recorded request for T. Known member M3 now borrows C2.

**Which outcome follows from the supplied requirements?**

A. Reject the borrow because title T already has an active loan.

B. Create M3's loan for C2 and retain M2's request.

C. Create M3's loan for C2 and delete M2's request.

D. Allocate C2 to M2 and reject M3's borrow.

**Key: B.** Availability belongs to the particular copy, so C1's loan does not block C2. The request neither allocates C2 nor disappears on borrowing. A conflates title and copy; C contradicts request persistence; D invents an allocation rule.

### Item 2 — An invariant expressed precisely

**Supplied facts:** Confirmed reservations for the same laboratory bench may not overlap in time. One reservation may start exactly when another ends. Each interval has `start < end`, all times share one day/time basis, and both reservations below are already known to concern the same bench. An overlap therefore violates the invariant.

**Which condition identifies exactly when the intervals `a` and `b` overlap?**

A. `a.start <= b.end AND b.start <= a.end`

B. `a.start < b.start AND a.end > b.end`

C. `a.start < b.end AND b.start < a.end`

D. `a.start >= b.start AND a.end <= b.end`

**Key: C.** Non-overlap means `a.end <= b.start` or `b.end <= a.start`; negating it gives C. A incorrectly includes touching endpoints, such as 10:00–11:00 and 11:00–12:00. B only detects strict containment of b by a. D only detects containment of a by b. B and D both miss partial overlap, such as 10:00–12:00 and 11:00–13:00. The question assesses the domain rule, not a particular programming-language syntax.

### Item 3 — State trace and rejected behavior

**Supplied facts:** A request begins in `Open`. Its entire transition table is below. Events with no listed transition in the current state are **rejected and leave the state unchanged**. Events are processed sequentially. `Resolved` and `Withdrawn` are intended terminal states.

| Current state | Event | Next state |
|---|---|---|
| Open | submit | UnderReview |
| Open | withdraw | Withdrawn |
| UnderReview | resolve | Resolved |
| UnderReview | withdraw | Withdrawn |

Starting from `Open`, the events are `submit`, `withdraw`, then `resolve`.

**What are the final state and the outcome of the last event?**

A. `Resolved`; the last event succeeds.

B. `UnderReview`; the last event is rejected.

C. `Withdrawn`; the last event succeeds.

D. `Withdrawn`; the last event is rejected.

**Key: D.** The first two events take the request to `UnderReview` and then `Withdrawn`. There is no `resolve` transition from `Withdrawn`, so the final event is rejected without changing state. A ignores the withdrawal, B fails to apply it, and C contradicts the rejection rule. The intended terminal state is not an unexpected deadlock.

## Bank, regular forms, and resit forms

Maintain one bank tagged by main area, secondary skill, scenario, supplied assumptions, expected reasoning difficulty, correct option, and the rationale for every option. Regular and resit forms draw from the same blueprint but use **fresh equivalent items**, not the identical questions. Changing names alone does not create a fresh reasoning task.

Match topic proportions and item difficulty across the regular and resit pools; match reading load and reasoning steps between parallel forms of the same examination. The proposed resit is longer because it supplies the full nine-point assessment. Recheck any variant after changing a rule, boundary value, or initial state; a previously correct key may no longer apply. Spread correct-option positions without creating a predictable pattern. Keep these teaching samples distinct from the fresh items selected for an assessment.

An answer sheet or quiz export can support one batch of marking for roughly 100 students. The instructor's effort should concentrate on a sound key, ambiguity review, and examining unexpectedly difficult or non-discriminating items after the sitting. Use cohort results to improve later forms, alongside checking whether the relevant concept was actually taught. No individual oral marking round is added.
