# AMSS 2026/2027 — Instructor implementation roadmap

This is a plan for developing the semester, grounded in the [confirmed redesign direction](redesign-2026-2027.md). Lecture 1 is administrative/motivational; Lecture 2 expands its former technical package. Lab 1 has an authored teaching package. Weeks 3–13 and Labs 2–5 below are **proposed outlines, not completed teaching materials**. Later lecture decks and Labs 2–4 retain earlier content until deliberately rewritten. Lab 5 has a replacement topic outline; Labs 6–7 describe the confirmed project-session formats.

## Teaching commitments

Assume master's students who program fluently but have little design experience. Introduce each design concept through a concrete decision before naming it. Students first analyze without AI, then use a chosen assistant to investigate a bounded question. A sound generated answer is useful evidence to explain, not a failed demonstration.

The five priorities are problem framing and requirements; domain modeling; contracts and invariants; state and behavior; and responsibility assignment with cohesion and coupling. Abstraction, boundaries, patterns, testing, tradeoffs, and change develop through these foundations. Establish a substantial specification and design before substantial implementation. Small executable models and prototypes may resolve design uncertainty; the project does not require a working application.

Use explicit analyst/designer and reviewer roles, handoffs, and evidence for human decisions. Review occurs in a fresh context with the original brief, current artifact version, criteria, and unresolved questions. Sessions may run sequentially using the same tool/model. [Tooling guidance](../tooling/README.md) supplies the common workflow. Representations remain optional and question-driven.

Every proposed demo needs an authored brief with confirmed rules and exclusions, initial states, scenario branches, a reference rationale, and a clearly labeled prepared alternative. Capture a real AI run only with its actual provenance. Never depend on the assistant making a particular mistake. Any model execution must retain the actual command/input and result; distinguish a proposed check from an executed one.

The approved ten-point assessment allocation is five points for the shared team design dossier, three for an individual multiple-choice exam, one for attendance, and one automatic point. A sole instructor teaches approximately 100 students in three lab groups. There is no scheduled checkpoint; teams may request feedback throughout the semester. Classroom exercises are formative. The final team interview clarifies unclear dossier points and finalizes its score, without a separate score or per-student oral exam.

The multiple-choice exam assesses reasoning about supplied problems, requirements, models, and changes. It does not directly demonstrate that each student can construct a complete design independently: individual design construction remains part of formative unaided exercises, while construction is assessed through the shared team dossier. Plan scenario-based choices that require interpreting evidence and consequences. Exam timing and item count remain proposals; no question bank is authored in this roadmap. The resit, also used for grade improvement (restanță / mărire), is a separate route: nine points for a multiple-choice exam plus one automatic point, without dossier or attendance marks carried over.

## Lectures

Durations below are instructor planning notes. Each full lecture in Weeks 3–13 totals **100 minutes**, including discussion and a short exit exercise. Keep these timings off student slides. New domains below are proposals; only the authored Week 2 library and Lab 1 dorm laundry-machine scenarios are established in the current package.

### Week 1 — Administration and motivation

**Question:** Why study analysis and design, and how will we work and be assessed?

**Outcomes:** understand schedule, grading, attendance, project responsibilities, repository requirements, feedback access, and tool choice; explain why understanding a problem and checking evidence matter even with AI assistance.

**Sequence, 70–80 minutes:** welcome and goals 10; organization and assessment 20; project and tools 20; motivation and student experiences 20; preparation for the next meeting 10. Keep the Teams QR code, URL, and code, and the course-page QR code on the schedule slide. Consultations are online, arranged through an individual Teams message. The slides announce Lab 1 as a concrete problem, without naming its domain, and say that the deliverable must be final about one week before the Lab 7 interview. No technical library demo in this session. Use [Lecture 1](../curs/01-intro.md) and its [guide](../curs/01-intro-demo.md).

### Week 2 — Understanding before delegating

**Question:** What must we understand before asking another person or agent to develop a solution?

**Observable outcomes:** distinguish a title from a physical copy; formulate an initial design before delegating; explain acceptance and rejection through before/after states; evaluate review findings using source evidence.

**Sequence, 100 minutes:** initial analysis and questions 15; clarifications and scope 10; concepts and responsibilities 20; contracts and scenarios 15; delegation and review 25; change and synthesis 10; exit exercise 5. The former Lecture 1 technical content is moved here and expanded with paired design and independent scenario exercises.

**Authored package:** [Lecture 2](../curs/02-understanding.md), [demo guide](../curs/02-understanding-demo.md), [library brief](../curs/scenarios/01-library-kiosk/brief.md), [reference design](../curs/scenarios/01-library-kiosk/reference-design.md), and [prepared fallback](../curs/fallback/01-intro-fallback.md). Preserve existing asset paths. Students first propose their own model (individually, then in pairs), before the worked model and before the agent; compare it against R1–R6 and S1–S5. Discuss correct as well as flawed output. These are introductory encounters with concepts taught in depth later.

### Week 3 — Problem framing and requirements

**Question:** What problem and observable outcomes are we agreeing to solve?

**Observable outcomes:** separate stakeholder facts from assumptions; define a bounded scope and a measurable quality constraint; write acceptance examples that expose an unresolved policy.

**Sequence, 100 minutes:** unaided brief analysis 10; goals, stakeholders, scope, and requirement types 20; elicitation demo 25; acceptance-example workshop 25; fresh review and human decisions 15; exit question 5.

**Proposed demo:** campus maintenance reporting, limited to creating a fault report and obtaining its status. Supply a stakeholder answer sheet for report identity, allowed status changes, and who may update a report; leave prioritization outside scope. Humans first identify why “urgent” and “quickly” are ambiguous. The agent organizes requirements and questions; only supplied stakeholder answers become facts. Check duplicate-report handling and one observable response-time criterion against the stated workload and measurement point.

**Good output / fallback:** challenge a correct specification with a different stakeholder interpretation and identify which decision needs agreement. Prepare an authored brief with an invented priority rule and an unmeasurable speed claim; students repair it using the answer sheet, not guesses.

### Week 4 — Domain modeling

**Question:** Which identities, relationships, and rules explain the problem independently of an implementation?

**Observable outcomes:** distinguish identity from descriptive attributes; state a relationship constraint with examples; explain why a conceptual distinction need not imply a class or table.

**Sequence, 100 minutes:** classify examples without AI 10; identity, relationships, and domain rules 20; model-comparison demo 25; construct and challenge a model 25; fresh review of assumptions 15; exit explanation 5.

**Proposed demo:** a small photographic archive, limited to cataloguing photographs and their edited versions. Supply rules: distinct photographs may share a caption; every version belongs to one photograph; editing creates a version without replacing the original. Students classify two equal captions and two versions before AI proposes a glossary and relationship table. Check that changing a caption preserves identity and that an edit retains the original version. Storage formats and rights management are excluded.

**Good output / fallback:** compare an object-oriented and a data-oriented expression of the same correct model. Prepare an authored caption-as-identifier proposal and concrete collisions; ask which rule fails before discussing representation.

### Week 5 — Responsibility assignment, cohesion, and coupling

**Question:** Where should a rule be enforced, and what does that decision make other parts depend on?

**Observable outcomes:** assign ownership of a behavior; explain cohesion and coupling through a concrete dependency; compare two allocations under a stated change.

**Sequence, 100 minutes:** allocate a rule unaided 10; responsibility, cohesion, and coupling 20; compare designs 25; trace a requirement change 25; fresh review and tradeoff decision 15; exit rationale 5.

**Proposed demo:** parcel quotation with supplied weight-band and packaging rules, limited to producing a quote. Compare rule checks duplicated in two user interfaces with a shared quotation operation. Humans first choose who should reject an unsupported package. AI proposes responsibilities and dependencies; check identical inputs through both interfaces, exact band boundaries, and a changed packaging limit. Payments and carrier integration are excluded.

**Good output / fallback:** ask what the shared operation costs and whether splitting every rule into its own component helps this scope. Prepare two defensible allocations and one inconsistent boundary check; require a reasoned choice rather than a preferred architecture vocabulary.

### Week 6 — Contracts and invariants

**Question:** What must an operation guarantee, including when it cannot succeed?

**Observable outcomes:** distinguish a precondition, a postcondition, and an invariant; specify rejection and unchanged state; derive examples that test a contract independently of a proposed implementation.

**Sequence, 100 minutes:** predict boundary cases 10; contracts, invariants, and failure outcomes 20; contract demo 25; examples and consistency checks 25; fresh review of guarantees 15; exit distinction 5.

**Proposed demo:** museum locker assignment with known visitor/locker identifiers and serial operations. Supply rules: at most one visitor per locker and one locker per visitor; assignment and release are explicit operations. Students state what an unsuccessful assignment must preserve before AI writes contracts. Check occupied lockers, already-assigned visitors, repeat release, and an unaffected second locker. Authentication and physical lock behavior are excluded.

**Good output / fallback:** turn a correct contract into independent assertions and explain what an assertion cannot establish. Prepare an authored operation that releases a visitor's old locker before discovering the new one is occupied; a before/after state exposes the broken rejection contract.

### Week 7 — State and behavior

**Question:** Which events are legal in each state, and what persists when the state changes?

**Observable outcomes:** distinguish state from an event and its guard; construct a lifecycle with success and exceptional paths; explain an invalid transition using a trace.

**Sequence, 100 minutes:** order event cards unaided 10; states, guards, effects, and history 20; lifecycle demo 25; exceptional-path workshop 25; fresh review of reachability 15; exit trace 5.

**Proposed demo:** editorial submission with draft, submitted, under-review, accepted, rejected, and withdrawn states. Supply the allowed events and withdrawal boundary explicitly; exclude resubmission and publication scheduling. Students decide which supplied events change state before AI proposes a transition table. Check withdrawal from each permitted state, an attempted decision after withdrawal, and reachability of acceptance from a fresh draft.

**Good output / fallback:** use a correct model to explain why two event orders differ. Prepare an authored missing guard plus a trace; require students to distinguish a prohibited transition from an intentionally terminal state.

### Week 8 — Interactions, workflows, and boundaries

**Question:** Who coordinates an operation that crosses a boundary, fails halfway, or is retried?

**Observable outcomes:** identify an external boundary and its assumptions; assign responsibility for coordination and repeated requests; explain failure behavior without claiming unsupported guarantees.

**Sequence, 100 minutes:** predict a failed interaction 10; interfaces, coordination, and repeated operations 20; workflow demo 25; compare recovery alternatives 25; fresh review against scenarios 15; exit boundary statement 5.

**Proposed demo:** event registration with a local seat register and an external confirmation sender. Provide capacity rules, request identifiers, and the policy that a failed notification does not cancel an accepted registration. Humans predict the result of retrying the same registration request after notification failure. AI proposes an interaction table and responsibilities; check one seat consumed, stable acceptance, and a recorded notification outcome. External delivery guarantees and concurrent registration are excluded.

**Good output / fallback:** compare immediate retry with a recorded pending notification, naming assumptions and costs. Prepare an authored flow that registers twice on retry and a local state trace; no external service is needed for the lesson.

### Week 9 — Model validation and analysis

**Question:** What can a model check establish, and what counterexample would overturn our claim?

**Observable outcomes:** state a checkable property and the model's bounds; interpret an invariant failure or deadlock trace; revise the model and explain the limits of the new result.

**Sequence, 100 minutes:** predict a short execution 10; scenarios, properties, and reachable states 20; executable-model demo 25; repair and recheck 25; two formal-modeling slides and review of claims 15; exit limitation 5.

**Proposed demo:** two jobs require two shared tools; each can acquire an available tool, begin work only with both, then finish and release them. Author a tiny finite-state explorer in a familiar language with two jobs, two tools, explicit transitions, and no hidden environment actions. Students predict what happens when jobs acquire different first tools before AI reviews the model. Check exclusive ownership, whether both-completed is reachable, and whether a reachable nonterminal state has no enabled action. Explain why reachable completion alone does not establish progress on every execution.

**Good output / fallback:** for a correct design, inspect the reachable states and explain what larger job counts or omitted failures could change. Prepare a runnable opposite-order acquisition variant, its actual counterexample, and a repaired variant. An ordered-acquisition repair must be rerun against the same safety and deadlock checks; label any pre-recorded result with the exact model version. If execution is unavailable, manually walk the supplied state/transition table and narrow the claim accordingly.

**Formal introduction, exactly two planned slides:** (1) states, transitions, assumptions, and properties as an explicit model; (2) selected scenarios versus exhaustive exploration of this finite model versus a claim about a real system. Distinguish a completed terminal state from deadlock. No dedicated formal-methods tool is required.

### Week 10 — Abstraction and design for change

**Question:** Which variation justifies an abstraction, and what does that abstraction cost?

**Observable outcomes:** separate a stable rule from a variable policy; compare a local change with a reusable design; explain when a named pattern helps and when a simpler function suffices.

**Sequence, 100 minutes:** select a change strategy unaided 10; variation, abstraction, and pattern costs 20; compare solutions 25; second-change exercise 25; fresh review of tradeoffs 15; exit justification 5.

**Proposed demo:** exporting a small activity report, initially plain text, with a new CSV export and a rule that redacted fields must stay absent in every format. Students locate which decisions vary before AI proposes a conditional, separate functions, and an interchangeable formatter design. Check two sample reports, escaping under the supplied CSV convention, and shared redaction. Third-party plugins and streaming are excluded.

**Good output / fallback:** introduce a third format and trace actual edits through each correct design; do not assume the most extensible design wins. Prepare three authored alternatives with explicit costs and one redaction inconsistency. Introduce a relevant pattern name after the variation is understood; require no pattern quota.

### Week 11 — Evolving an existing system

**Question:** Does a new requirement fit the current model, or must we change an earlier design decision?

**Observable outcomes:** reconstruct a small existing design from evidence; identify affected rules and representations; justify a patch or structural revision with preserved-behavior checks.

**Sequence, 100 minutes:** read a small existing system unaided 10; reconstruction and change-impact analysis 20; patch-versus-revision demo 25; propose a staged change plan 25; fresh review of preserved behavior 15; exit decision 5.

**Proposed demo:** equipment inspection records in a supplied tiny repository. Existing behavior stores a last inspection result; the new requirement retains repeated inspections while still showing the latest completed result. Students trace a two-inspection example before AI proposes a design revision. Compare adding more status fields with introducing inspection history; check latest-result selection, an unfinished inspection, and compatibility with a single existing result. Historical data unavailable in the source must not be fabricated.

**Good output / fallback:** ask a correct revision to justify migration assumptions and the smallest safe scope. Prepare an authored local patch that overwrites history and a reference change plan. A small patch may be demonstrated after the design review, but student application implementation is not required.

### Week 12 — Consistency and oversight across delegated work

**Question:** How do we inspect consequential details without losing the overall design?

**Observable outcomes:** trace a requirement through design and checks; detect a consequential omission in a summary; resolve a review finding using source evidence and record the human decision.

**Sequence, 100 minutes:** inspect a summary unaided 10; traceability and review criteria 20; delegated-work audit demo 25; targeted detail investigation 25; fresh review and finding dispositions 15; exit evidence request 5.

**Proposed demo:** volunteer rota changes, with a supplied rule that every staffed shift needs a qualified supervisor. Provide the specification, responsibility table, swap-operation pseudocode, acceptance examples, and a short summary. Students decide which claim most needs checking before AI traces it. Check a swap that preserves headcount but removes the qualified person; inspect whether the original rule, operation outcome, and examples agree. Broader staffing optimization is excluded.

**Good output / fallback:** for a consistent package, ask how a newly allowed supervisor qualification changes the trace. Prepare an authored summary that drops “qualified,” an independently checkable mismatch, and an unsupported reviewer objection. The reviewer gets original sources as well as the summary; students may reject its conclusion.

### Week 13 — Design synthesis and explanation

**Question:** Can I independently explain a design and adapt it to an unfamiliar change?

**Observable outcomes:** frame a new problem and surface a consequential uncertainty; propose a coherent design with contracts and behavior; defend an alternative and reason about a change without AI.

**Sequence, 100 minutes:** unaided small design 15; compare problem interpretations 15; structured design discussion 20; change scenario and paired explanations 25; bounded AI investigation and fresh review 20; exit reflection 5.

**Proposed demo:** a board-game tournament roster. Supply team membership rules and match eligibility fixed when a match starts. The change permits substitute players for future matches while preserving past lineups. Humans first propose concepts, a change operation, and an invariant before AI investigates one stated uncertainty. Check substitution before/after a match starts, preserved historical eligibility, and rejection of a player on both sides of the same match. Match strategy and scoring are excluded.

**Good output / fallback:** compare two coherent designs by tracing the change through both; ask students to explain the chosen tradeoff unaided. Prepare an authored compact dossier and two change cards. This is formative practice in constructing and explaining a design; connect it to the exam's narrower task of reasoning about supplied designs and alternatives.

### Week 14 — Exam and course reflection

**Week 14, proposed 100-minute lecture allocation:** exam instructions 10; scenario-based individual multiple-choice assessment 60; reflection on design reasoning and course learning 30. Confirm the exam duration, number of questions, and institutional scheduling before publication; these timings are a working plan, not a settled exam specification. No question bank is included here.

Dossier interviews take place in Lab 7 in each group. The instructor pre-reads each dossier and asks the team about unclear points to finalize its score on the five published criteria. No prepared presentation or slides are required. The multiple-choice exam provides the individually graded component; the team dossier assesses construction of a coherent design. Students do not repeat a presentation in the lecture.

## Labs

Schedule seven thematic labs after their associated lectures, planning 100 teaching minutes within each two-hour slot. Schedule each lab after both lectures in its pair: Lab 1 after Courses 1–2, Lab 2 after 3–4, and so on. Prerequisites must already have been taught; introductory exposure in Course 2 does not replace later in-depth teaching. Labs 1–5 each practice an important course topic using distinct supplied problems. Use pairs for bounded exercises, rotating analyst and reviewer responsibilities; retain short initial reasoning and final explanations for learning feedback, not as new graded submissions. Only Labs 6–7 are dedicated to projects. The team dossier score is shared; the multiple-choice exam score is individual. Teams may request feedback at any time; no checkpoint is scheduled. No exercise requires a prescribed number of defects or an application implementation.

Each project has a public GitHub or GitLab repository, created and linked when announced on Teams, tracking progress and member contributions throughout the semester. AI may assist development and commits; the team verifies and owns the published work. Commit counts are not grading criteria.

### Lab 0 — Optional preparation and orientation

Use the [self-study guide](../lab/Lab00.md) and [instructor guide](../lab/Lab00-instructor.md). This optional 90-minute meeting can take place immediately after Course 1; all groups can follow the same material independently. Lab 1 follows Courses 1–2 and may take place in Week 3. Announce group dates on Teams.

### Lab 1, after Courses 1–2 — Understanding, specification, and review

Use the dorm laundry-machine [student lab](../lab/Lab01.md), [instructor guide](../lab/Lab01-instructor.md), [scenario](../lab/scenarios/lab01/scenario.md), [worksheet](../lab/scenarios/lab01/worksheet.md), and [prepared fixture](../lab/scenarios/lab01/prepared-fixture.md). These contain the full timing and activities. Foundations: Courses 1–2, especially source facts, scope, acceptance examples, role handoffs, and human review decisions.

### Lab 2, after Courses 3–4 — Requirements and domain modeling

**Foundations:** Courses 3–4, with introductory practice from Courses 1–2. Do not assume Course 5 responsibility-assignment theory.
**Proposed domain/input:** repair-café work orders; distinguish an identified device from its visits, reported faults, and volunteers. Supply stakeholder policies and clarification answers; exclude inventory and payment.
**Outcomes:** define scope and acceptance examples; distinguish device identity from a visit; build and challenge a domain model without committing to classes.
**100 minutes:** individual brief analysis 10; requirements and clarifications 20; domain model 25; bounded AI comparison 20; separate review using scenarios 15; explanation and evidence 10.
**Evidence:** scoped requirements, glossary and relationship model, explicit assumptions, acceptance examples, and review decisions.

### Lab 3, after Courses 5–6 — Responsibilities, contracts, and invariants

**Foundations:** Courses 5–6, using requirements and domain concepts already taught. Do not assume Course 7 lifecycle theory.
**Proposed domain/input:** warehouse quantity reservations with serial operations and fixed stock. Supply rules for reserve, pick, and cancel-before-picking; exclude replenishment and shipment.
**Outcomes:** assign ownership of stock-changing operations; state preconditions, postconditions, invariants, and rejection guarantees; compare two responsibility allocations.
**100 minutes:** boundary examples 10; responsibilities and dependencies 20; contracts and invariants 25; AI comparison 20; independent review and before/after scenarios 15; explanation 10.
**Evidence:** responsibility table, operation contracts, success/rejection quantity examples, compared alternative, and justified revisions. A lifecycle table is not a prerequisite or required artifact.

### Lab 4, after Courses 7–8 — State, behavior, and interactions

**Foundations:** Courses 7–8. Do not require the finite-state explorer or formal-model analysis taught in Course 9.
**Proposed domain/input:** equipment collection from a staffed desk with a local reservation register and an external notification sender. Supply states, permitted collection/cancellation events, request identifiers, and a policy that notification failure does not undo accepted collection; exclude concurrent requests and physical-device control.
**Outcomes:** describe legal transitions and guards; trace a normal interaction, a rejection, and a retried request after notification failure; assign coordination and preserve agreed state.
**100 minutes:** predict event sequences 10; state model 20; interactions and boundary assumptions 25; bounded AI comparison 20; separate review and manual scenario traces 15; explanation 10.
**Evidence:** transition table or equivalent, interaction trace, rejection/retry examples, responsibilities, review decisions, and limits. No new executable-model theory is needed.

### Lab 5, after Courses 9–10 — Validation and abstraction

**Foundations:** Courses 9–10. Do not require Course 11 reconstruction or migration of an existing system.
**Proposed domain/input:** export of an activity report in text and CSV, with a shared rule that redacted fields remain absent. Supply fields, redaction policy, format rules, representative records, and a possible third format; exclude streaming and external plugins.
**Outcomes:** formulate validation properties and bounds, use scenarios or a small model to check them, compare a conditional with separate functions or a formatter abstraction, and justify costs under the stated variation.
**100 minutes:** predict checks unaided 10; properties and bounds 20; inspect and run supplied checks or explicit manual traces 25; compare abstractions under a third format 20; fresh review 15; explanation and limits 10.
**Evidence:** properties, actual check results or explicitly manual traces, compared designs, a justified choice, review decisions, and limits. Do not claim exhaustive validation from selected examples. No application implementation or new graded submission is required.

### Lab 6, after Courses 11–12 — Open project lab

**Input:** each project's public repository, current dossier and evidence, and questions selected by students. **Purpose:** finishing the project, questions to the instructor, and discussion between teams. Students choose activities according to their project's needs; there is no required rehearsal, presentation, or review rotation.
**100 minutes:** opening and questions 5; open work and discussions 85; save progress and next steps 10. These intervals organize room time, not mandatory deliverables. The instructor circulates and answers requests; unresolved questions may continue on Teams.
**Evidence:** progress, decisions, and revisions recorded in the public repository with identifiable contributions. This session adds no separately graded submission.

### Lab 7, after Courses 13–14 — Project interview („Interviu de susținere a proiectului”)

**Input:** team dossiers and supporting evidence, pre-read by the instructor, with questions about unclear points. The deliverable (the public repository) must be final about one week before the interview; announce the exact deadline and interview slots on Teams. **Purpose:** the team answers clarification questions and the instructor finalizes its five-point dossier score on the published criteria. **Foundations:** the complete course.
**100-minute allocation:** group introduction 5; scheduled team reviews and feedback 88; wrap-up 7. At eight minutes per team, 7–11 teams use 56–88 minutes; any unallocated review time supports common feedback and questions. The remaining time in the two-hour slot provides transition buffer.
**Interview format:** start directly with instructor questions about unclear dossier points; let the team answer and navigate supporting evidence, then give closing feedback. No prepared presentation or slides are required. Pre-reading keeps this feasible for a sole instructor. Check actual enrolment and team count before publishing slots; eleven interviews leave little in-session slack.
**Evidence:** shared design version, validation and review evidence, and concise assessor notes tied to the dossier rubric. The interview has no separate score. Team scores do not depend on hearing every member orally, and no live regeneration of AI artifacts is required. The separate individual multiple-choice exam is not administered again during this discussion.

## Source reuse and development order

These are reuse targets, not a claim that the old decks already teach the new sessions. The old decks live in `archive/` since 5 October 2026; write each new deck from scratch under the file name listed in the next section (the landing page already uses it) and update navigation deliberately when the new session structure is ready. Remove inherited UML, named-pattern, defect-count, fixed-model, and application/TDD mandates from each reused source. Verify the revised requirements rather than importing earlier rubric text.

| Existing sources | Reuse in the proposed semester | Required adaptation |
|---|---|---|
| [Requirements](../archive/curs/02-requirements.md) and its demo/fallback | Week 3 | Keep scope, elicitation, and vague-quality examples; replace the repeated bike-sharing domain and unsupported generalizations. |
| [Testable specifications](../archive/curs/03-testable-specs.md) and its demo/fallback | Weeks 3 and 6 | Keep independent acceptance examples and boundary cases; remove mandatory implementation/TDD reflection. |
| [Class diagrams](../archive/curs/04-class-diagrams.md) and its demo/fallback | Weeks 4–5 | Extract identity, relationships, and responsibilities; teach concepts before optional notation. |
| [Other structural views](../archive/curs/05-other-structural.md) and its demo/fallback | Weeks 5 and 8 | Reuse decomposition costs and dependencies; replace the diagram catalogue with decisions and scenarios. |
| [Behavioral I](../archive/curs/06-behavioral-i.md) and [Behavioral II](../archive/curs/07-behavioral-ii.md), with demos/fallbacks | Weeks 7–9 | Reuse interactions, guards, exceptional paths, and reachability; author concrete lifecycle rules and finite-model bounds. |
| [Patterns I](../archive/curs/08-patterns-i.md) and [Patterns II](../archive/curs/09-patterns-ii.md), with demos/fallbacks | Weeks 10–11 | Reuse variation, indirection costs, and unjustified abstraction; assess the decision rather than a pattern label. |
| [Traceability](../archive/curs/10-traceability.md) and [Evaluation](../archive/curs/11-evaluation.md), with demos/fallbacks | Weeks 9 and 12 | Reuse consistency and review criteria; add executable-model evidence and source-grounded review of summaries. |
| [Presentation skills](../archive/curs/12-presentation-skills.md), [Final](../archive/curs/14-final.md) | Weeks 13–14 | Reuse rationale and unfamiliar questions for learning; replace mandatory individual oral defenses with feasible team reviews and an individual scenario-based multiple-choice exam. |
| [Lab 2](../archive/lab/Lab02.md), [Lab 3](../archive/lab/Lab03.md), [Lab 4](../archive/lab/Lab04.md), with instructor guides | Labs 2–4 | Reuse comparisons and prepared examples; replace notation-based defect hunts with explicit source rules and evidence. |
| [Lab 5](../lab/Lab05.md), [Lab 6](../lab/Lab06.md), [Lab 7](../lab/Lab07.md), with instructor guides | Labs 5–7 | Lab 5 practices validation and abstraction on a supplied problem; Lab 6 is an open session for finishing the project and discussion; Lab 7 is the clarification interview finalizing the five-point dossier score. |

Develop the next package in teaching order: Course 3, then Course 4 with Lab 2, then Courses 5–6 with Lab 3. Prototype Course 9's small explorer early enough to validate its bounds and repair before writing its slides. For each session, finish the source brief and reference reasoning first, then the demo and labeled fallback, student exercise, deck with notes, and delivery checks. Keep unfinished sessions unpublished under the existing `RELEASED` mechanism; this roadmap does not change release state.

## Current course order and source identifiers

The identifiers of pending decks are the ones the landing page already links (`data-release` keys), kept for link continuity; their numerical prefixes do not determine their new teaching week, and the archived draft of the same name is only reuse material. `13-workshop.md` is retired from the lecture plan and archived. Its useful project questions may be used on request in the open Lab 6, without a mandatory clinic or rehearsal.

| Course | Source | Topic |
|---|---|---|
| 1 | `01-intro.md` | Administration and motivation |
| 2 | `02-understanding.md` | Understanding before delegating |
| 3 | `02-requirements.md` | Problem framing and requirements |
| 4 | `03-testable-specs.md` | Domain modeling |
| 5 | `04-class-diagrams.md` | Responsibilities, cohesion, coupling |
| 6 | `05-other-structural.md` | Contracts and invariants |
| 7 | `06-behavioral-i.md` | State and behavior |
| 8 | `07-behavioral-ii.md` | Interactions, workflows, boundaries |
| 9 | `08-patterns-i.md` | Model validation and analysis |
| 10 | `09-patterns-ii.md` | Abstraction and design for change |
| 11 | `10-traceability.md` | Evolving an existing system |
| 12 | `11-evaluation.md` | Consistency and oversight |
| 13 | `12-presentation-skills.md` | Design synthesis and explanation |
| 14 | `14-final.md` | Multiple-choice exam and reflection |

Lab 6 follows Courses 11–12 and uses their ideas when useful for open project work. Lab 7 follows Courses 13–14 and finalizes the dossier score. The exact examination timetable remains subject to announcement. Do not change `RELEASED` merely to reflect the new schedule.

## Initial and final questionnaires

Use the [Form Builder import package](../questionnaires/README.md). Collect the initial questionnaire from all groups in the opening weeks, summarize experience, diagnostic responses and priorities before Lab 1, and adjust unreleased material. Reserve 10–12 minutes within the final course reflection for the final questionnaire. Compare common items at cohort level and record improvements for the next edition; questionnaires are voluntary and ungraded.

**Provisional baseline, 4 October 2026** (16 responses of roughly 100, collected after Lecture 1 and Lab 0; aggregate only, to be re-summarized when the form closes before Lab 1 with `questionnaires/sumar.py`). Students rate themselves lowest on domain concepts and rules (K2: 3 of 15 at the "independent" level or above), conditions and guarantees of an operation (K4: 7 of 16) and states (K5: 7 of 15), and highest on clarifying requirements and dividing responsibilities (K1, K3: 12 each). The three short scenarios D1–D3 reached the ceiling (15 of 16 each), so they show recognition rather than progress. Most respondents use AI almost daily (11 of 16) and verify its output by reading it, asking another agent or running tests. Requested topics run opposite to the weakest areas: delegating and verifying AI work 10, understanding an existing system 8, domain modeling 2, contracts and invariants 1. Preferred modes are worked examples (11), counterexamples (10) and comparing solutions (9); pair discussion was chosen by 2. Consequences for unreleased material: motivate domain modeling and contracts through verifiable delegation; give Weeks 4 and 6 more worked examples and counterexamples; keep individual work before pair work in exercises; do not present results on slides while the form is open.
