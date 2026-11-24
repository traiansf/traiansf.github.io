# AI lessons in lectures and diagram workshops in labs — decision of 19 November 2026

The instructor found the AI part of the lectures repetitive and predictable, and saw that students in the labs do not engage with the plenary AI analysis. Decisions, 19 November 2026:

1. **Lectures 2–13:** each lecture's AI segment teaches a **different aspect, pitfall or consideration** of using AI to write designs and specifications, in a **different format**. Lectures 2–8 are reworked now (released decks re-released); Lectures 9–13 are written with the lesson assigned below.
2. **Labs 1–5:** half of the lab stays a discussion of the lab's problem, as before; the other half is a **diagram workshop**: given the problem's enunț and a Markdown specification of a (UML) diagram type, students produce the diagram by hand, in a text notation, or by generating it with an AI assistant and reviewing it, aiming for a correct diagram by the end of the session. Labs 1–4 are reworked now (Lab 4 first), Lab 5 is written in this format.
3. The labs' instructor-led plenary AI analysis and review is **dropped**; AI use moves into the diagram workshop, where each student decides whether to use it.
4. Diagrams stay a **lab practice**: the project rubric (`proiect/README.md`) does not change; teams still choose their representations.

## Why the previous AI segments became predictable

Lectures 2–8 all used the same format (analyst prompt and excerpt → our decision → evaluator prompt and excerpt → our decision) and repeated lessons: unconfirmed additions (Lectures 3, 8), an evaluator that approves a flawed proposal (Lectures 3, 6, 7), a misused term or a self-contradiction (Lectures 7, 8). Students learned to expect "find the flaw in the excerpt".

## One lesson per lecture

Each lesson names one thing to consider when using AI for designs and specifications. The format column says what students do with the captures; it must differ from lecture to lecture. The analyst/evaluator pair is one possible format, not the default.

| Lecture | Topic | AI lesson | Format | Captures to produce |
|---|---|---|---|---|
| 2 | Understanding before delegating (library) | **The AI fills gaps you did not notice.** An underspecified request is answered confidently; the decisions it took for you (fines, expiry, priority, limits) are invisible unless you list them. | Two prompts side by side: the bare request versus the request with R1–R6; students list "what did it decide on our behalf?" | Bare request and full request, several runs each |
| 3 | Problem framing and requirements (campus reports) | **Invented precision.** Specific numbers, thresholds and quality targets look sourced but are not. Specific ≠ confirmed. | Source-tracing table: every number or measurable claim in the output is traced to a fact of the enunț, or marked unsupported. | Requests for quality/measurable requirements; select a run with invented figures next to correct ones |
| 4 | Domain modeling (photo archive) | **The requested form shapes the model.** Ask for "classes" (or tables) and implementation detail arrives: identifiers, timestamps, foreign keys, inheritance, storage; ask for concepts and relations and the model stays conceptual. | Same facts, two output forms, side by side; students sort elements into "concept of the domain" and "implementation decision". | "Give the classes" versus "describe concepts, relations, cardinalities" |
| 5 | Responsibilities, cohesion, coupling (parcels) | **Split delegation diverges.** Separate sessions asked to build each channel (site, counter) each re-implement the rules, slightly differently: no component is responsible for the rule. | Two independent outputs compared on boundary scenarios (1000 g, 1001 g); who owns the rule? | One prompt per channel, separate fresh contexts, several runs |
| 6 | Contracts and invariants (museum lockers) | **Circular verification.** A contract or tests derived from the code describe what the code does, bug included; they confirm, they do not check. | Who checked whom: contract derived from the faulty operation versus the contract from the enunț; the scenario that separates them. | AI asked to write the contract/tests from the supplied faulty pseudocode; and from the enunț |
| 7 | State and behavior (manuscripts) | **A rendered diagram is not a correct diagram.** Generated Mermaid renders cleanly and looks complete while it disagrees with the transition table (missing guard, missing or extra transition). | Compare the diagram with the table row by row; the render gives no warning. | AI asked for a Mermaid state diagram from the rules; select a run with a discrepancy (and keep a correct one) |
| 8 | Interactions and boundaries (registrations) | **Guarantees nobody gives.** At a boundary the AI writes "atomic", "exactly once", "transaction", "guaranteed delivery" about parts it does not control. | Claim audit: for each guarantee in the output, who provides it — our component, the external sender, nobody? | Interaction design requests across the external sender |
| 9 | Model validation | **Claimed check versus executed check.** "I verified there is no deadlock" without running anything; the explorer it wrote, actually run, finds one. | Compare the claim with the recorded run. | Request for a model and its verification; separate actual execution |
| 10 | Abstraction and design for change | **Giving in under pushback.** The user pushes for a pattern or against a sound choice with a weak argument; the assistant agrees and reverses its own reasoning. | A multi-turn conversation read turn by turn: which argument changed the answer? | Multi-turn captures with a scripted pushback |
| 11 | Evolving an existing system | **Ignoring what exists.** The AI rewrites from scratch, drops preserved behavior, or invents history that was never recorded. | Review a proposed diff against the existing system and the preserved-behavior checks. | Change requests with the existing design supplied |
| 12 | Consistency and oversight | **What the reviewer sees decides what it finds.** The same review in the same session, from a summary only, and from the sources gives three different verdicts. | Compare three reviews of the same package under different contexts. | Same-session self-review, summary-only review, sources review |
| 13 | Design synthesis | **Run-to-run variation as a signal.** Ten runs of one prompt, tabulated; where answers disagree, the enunț is ambiguous or the decision is genuinely open. | Table of answers across runs; locate the ambiguity in the enunț. | Ten runs of the same prompt, all shown in aggregate |

Lectures still keep their discussion of the AI output tied to the lecture's topic: the lesson is illustrated with the lecture's own case and contributes to it. All other lecture rules in `CLAUDE.md` stay: no live AI in class, all inputs and results on slides, faithful excerpts with provenance, our decision kept separate, rules visible on every slide that applies them.

### Captures

Genuine captures, produced before class with the course's `capture.py` (Claude Code, `claude-haiku-4-5`, fresh context, no tools), in a new dated folder under the lecture's `captures/`. To produce the output a lesson needs, the same input may be run several times; keep every attempt, the exact prompts and the selection rationale, and say on the slide or in its notes that the run was selected (for the variation lesson, show all runs). Earlier captures remain archived unchanged. A selected run does not describe the model's typical behavior.

## Diagram workshops in labs

**100 minutes:** opening 10; the lab's problem, individual work and plenary explanations, about 40; diagram workshop about 45; closing 5. Labs show phase timings on slides.

**Workshop materials:** the problem's enunț (`lab/scenarios/NN-*/scenario.md`) and a diagram specification `lab/diagrame/<tip>.md` (Romanian): what questions the diagram answers; the UML subset used, each element with its meaning; the text notation (Mermaid where it renders the UML type faithfully, PlantUML otherwise); a correctness checklist whose items can each be checked against the enunț; common errors; a worked example from a different domain; a suggested AI prompt and how to review its output (check each checklist item against the enunț; a clean render proves nothing).

**Workshop flow:** each student chooses: by hand, written in the notation, or generated with an AI assistant and reviewed. Midway, one or two volunteers show their diagram; the class checks it item by item against the checklist and the enunț. The workshop ends with the corrected diagram agreed in plenary, compared with the reference diagram, which the slides show at the end. No submission, upload or grade.

| Lab | Courses | Diagram type | Specification |
|---|---|---|---|
| 1 | 1–2 | UML activity diagram (or use case diagram, as the problem suits) | `lab/diagrame/activitate.md` |
| 2 | 3–4 | Conceptual class diagram: concepts, attributes, associations, multiplicities; no operations, no implementation identifiers | `lab/diagrame/clase-conceptuale.md` |
| 3 | 5–6 | Class diagram with operations and constraints (preconditions, postconditions, invariants as notes) | `lab/diagrame/clase-operatii.md` |
| 4 | 7–8 | UML state machine diagram; sequence diagram as an extension | `lab/diagrame/stari.md`, `lab/diagrame/secventa.md` |
| 5 | 9–10 | UML class diagram with an interface (chosen by the instructor on 24 November 2026) | `lab/diagrame/clase-interfata.md` |

The labs' plenary AI analysis slides are removed; their prompts and captures stay archived under `lab/scenarios/NN-*/`. The online variants follow the same plan: diagrams shared on screen or as Mermaid text in chat, volunteers present, the class checks in plenary.
