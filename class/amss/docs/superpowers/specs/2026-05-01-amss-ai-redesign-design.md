# AMSS 2026 — Redesign as an AI-Mediated Software Modelling Course

**Status:** Approved design (2026-05-01). Ready for implementation planning.
**Owner:** Traian-Florin Șerbănuță
**Course:** Analiza și Modelarea Sistemelor Software (AMSS), University of Bucharest, autumn 2026.

## Context

The AMSS 2025 edition runs as a UML / design-patterns course in which students hand-draw diagrams across a team project; auto-generated artifacts are explicitly forbidden by the project rules. For the 2026 edition, the course is being redesigned to make **AI-mediated software design** the central pedagogy. Students learn to direct AI through the SDLC and critique what it produces, rather than to draw UML by hand.

This document captures the approved design after the brainstorming session on 2026-05-01 and is intended as the source of truth for the implementation work that will follow.

## 1. Pedagogical contract

The student's role is the **architect-and-critic hybrid (A+B)**:

- **Architect/director (B).** Drive AI through the SDLC — gather requirements, generate models, select patterns, produce tests and code.
- **Critic/reviewer (A).** Read AI outputs critically — identify failures (fabrication, missing guards, wrong multiplicity, decorative-but-meaningless pattern application) and propose corrections.

Five commitments follow:

1. **AI is the default tool, not an exception.** Every artifact (requirements, models, code, tests) is normally generated *with* AI. The student's value-add is direction, judgment, and correction.
2. **Graded artifact = the trail, not the running system.** What gets graded: directed-design narrative + final reviewed artifact set + oral defense. What does *not* get graded: running code, raw test pass-rates, hand-drawn diagrams.
3. **Implementation is a forcing function, not a deliverable.** TDD-with-AI is required for the project — students must produce executable specs (tests) generated from their requirements and run AI-generated code against them — but the grade lives entirely in the *documentation* of that process and in what it revealed about the spec, not in whether the code ships. The parallel implementation course owns code grading.
4. **Defensible literacy floor.** In the oral defense, unaided, every student must demonstrate:
   - **F1 — Read & critique on the spot.** Given any AI-generated UML diagram, identify defects, missing elements, wrong relationships.
   - **F3 — Articulate rationale.** Explain why they directed AI a certain way and what they accepted or rejected.
   - **F4 — Defend traceability.** Navigate their own project end-to-end (requirement → use case → class → state/sequence → test).
5. **Tooling parity.** Every student uses the same **course-standardized agentic tooling**: a single canonical setup (one editor extension, one model endpoint, one config file) documented in the course repo. The baseline is **agentic open-source clients** (Continue.dev or Cline in VS Code) pointing at a **course-provided or free-tier model endpoint** — see §6 for procurement options. Chat-only access (web ChatGPT, Claude.ai) is *not* the design baseline; the project assumes file-and-repo-aware agentic tooling. Students who BYO stronger tooling (Claude Code, Copilot, Cursor on their own accounts) may use it on top of the baseline, but graded artifacts must reproduce on the canonical setup.

### Design rationale

- **Why A+B and not A alone or B alone.** A alone (pure critic) leaves students passive; they never feel ownership of design. B alone (pure architect) lets them coast on AI output without developing a critical filter. A+B forces both halves and produces a trail of decisions that is hard to fake.
- **Why required-but-ungraded TDD (not graded implementation).** Implementation is taught in a parallel course. Including code-grading here would duplicate or contradict that course. But entirely cutting implementation removes a strong forcing function on spec precision — writing a testable spec is harder than writing a vague one, and AI-generated tests against vague specs reveal gaps fast. Keeping TDD as required-but-ungraded captures the forcing function without competing.
- **Why SDLC-staged curriculum over preserving the AMSS 2025 topic catalogue.** The AI-mediated workflow *is* the curriculum. Teaching UML diagram-by-diagram and then bolting AI on top would leave AI integration feeling vestigial. An SDLC-staged structure makes UML literacy emerge where it is actually used, and dedicates whole weeks to the new skills (testable specs, critique, traceability) the redesign actually depends on.
- **Why F1+F3+F4 without F2 (hand-sketching).** F2 is the old course's literacy bar. In an A+B course, the student is not expected to produce in isolation — they are expected to direct and judge. F1+F3+F4 maps exactly to that competence; F2 would test a skill the redesign does not teach.

## 2. Course structure (14 weeks)

The course runs 14 weeks; each week has one 100-min lecture; labs run biweekly (~7 labs of 100 min each). Lectures are organized by SDLC stage in the AI loop; UML literacy is embedded where it is actually used.

| Week | Lecture | Lab (biweekly) |
|---|---|---|
| **1** | **Intro + the AI-mediated SDLC.** Course logistics, tooling preview, the architect-critic loop, what changes when AI joins the SDLC. | — |
| **2** | **Requirements with AI.** Functional / non-functional / domain requirements; prompting for elicitation; AI failure modes (fabrication, over-specifying, vague NFRs); use cases as a structuring lens. | **Lab 1 — skill drill:** tooling onboarding (canonical agentic setup from course repo, model-endpoint verification) + first AI-driven requirements gathering on a toy domain. |
| **3** | **Testable specs & TDD-as-spec.** Why tests are the executable form of requirements; AI-generated tests as a spec-precision check; the "if AI cannot produce a passing test from your spec, your spec is too vague" loop; traceability use case → scenario → test. | — |
| **4** | **Class diagrams in the AI loop.** Class diagrams as the central structural artifact; driving AI to produce them; reading critically (wrong multiplicity, fake associations, missing aggregations); UML literacy targets. | **Lab 2 — skill drill:** drive AI to produce a class diagram for a given spec; iterate at least twice; log what changed and why. |
| **5** | **Other structural views.** Object / package / component / deployment diagrams and when each matters; AI's tendency to over- or under-decompose at the architecture level. | — |
| **6** | **Behavioral I — use cases + sequence.** Use case diagrams revisited; sequence diagrams as use-case realizations; AI-generated sequences and where they fabricate messages. | **Lab 3 — critique session:** teams receive instructor-prepared flawed structural artifacts (class, package, component) and compete to spot the most defects with severity ratings. |
| **7** | **Behavioral II — state + activity.** State machines for object lifecycles; activity diagrams for workflows; AI failure modes (orphan states, unreachable transitions, missed guards). | — |
| **8** | **Patterns I — selection.** Classic GoF vocabulary; "when to apply" decision questions; driving AI to suggest patterns; common failure: AI overuses patterns / decorates without solving anything. | **Lab 4 — critique session:** flawed behavioral artifacts (sequence, state, activity), same defect-hunt format as Lab 3. |
| **9** | **Patterns II — integration & critique.** Visitor / Mediator / Bridge / Adapter / Decorator / Proxy / Composite; pattern-level critique: was this applied or just labeled? | — |
| **10** | **Cross-layer traceability.** The full trace: requirement → use case → class → state/sequence → test; conventions for maintaining it; critique exercises (find broken links). *Anchors the "defend traceability" skill (F4) from the literacy floor in §1.* | **Lab 5 — project workshop + checkpoint defense.** Intermediate presentation gate (the 1-point checkpoint preserved from the current course); each student walks the team through their slice's traceability. |
| **11** | **Model evaluation & quality.** Quality criteria (consistency, completeness, correctness); static evaluation, conformance checking, simulation; where AI is a worse evaluator than the human; brief metamodel concepts. | — |
| **12** | **Presentation & defense skills.** How to present an AI-mediated design; the F1+F3+F4 rubric explained; what examiners look for; dry-run mechanics. | **Lab 6 — project workshop + dry-run.** Each student does a 5-min cold defense in front of the team; team gives critique. |
| **13** | **Project workshop / open Q&A.** Buffer week; in-class supervised work; final adjustments to documentation. | — |
| **14** | **Final presentations** (lecture slot — split with Lab 7). Reflection segment: what AI got right/wrong this semester. | **Lab 7 — final presentations** (back-to-back team presentations + per-student cold defense). |

**What got dropped from the AMSS 2025 catalogue** (intentionally, in service of Z): timing diagrams, communication diagrams, interaction overview diagrams, composite structure diagrams, profile diagrams, the standalone metamodel session, the standalone "Other Diagrams" lecture. Some appear briefly within other weeks; none get a dedicated session.

**What is new** (entirely or radically reshaped): weeks 1, 3, 10, 11, 12. Patterns and structural/behavioral content are preserved in shape but redirected toward "drive AI + critique output."

## 3. Lab program (skill-drill → critique → workshop progression)

The 7 biweekly labs ladder skills: drill the basic loops on toy scenarios → critique flawed artifacts → integrate everything in supervised project work. All labs use the same course-provided agentic tooling; all lab work is committed to a course-managed git repo; every lab produces an auditable artifact.

| # | Wk | Mode | Format (100 min) | Deliverable |
|---|---|---|---|---|
| 1 | 2 | Skill-drill | 15 min instructor-led tooling walkthrough; 60 min pairs drive AI to produce a requirements doc for an assigned toy domain; 25 min share-out on AI failure modes observed. | Requirements doc + 5-line reflection on AI failure modes, committed to lab repo. |
| 2 | 4 | Skill-drill | 10 min brief; 70 min individual: drive AI to produce a class diagram from a 1-page spec, iterate ≥2 times, log what changed and why; 20 min share-out. | PlantUML class diagram + critique log (≤1 page). |
| 3 | 6 | Critique / red-team | 10 min brief + defect-hunt rubric; 60 min team defect hunt against 3 flawed structural artifacts (class, package, component) with severity ratings; 30 min defect-hunt-off + ground-truth reveal + scoring. | Defect log per team (severity-rated). |
| 4 | 8 | Critique / red-team | Same format as Lab 3, on flawed behavioral artifacts (sequence, state, activity). | Defect log per team. |
| 5 | 10 | Project workshop + **checkpoint** | 60 min team project work; 40 min each student does a 3-min checkpoint defense of their slice. | **Intermediate checkpoint** (1-point gate, preserved from current course). |
| 6 | 12 | Project workshop + dry-run | 50 min team project work; 50 min cold-defense dry run (instructor picks students at random; F1+F3+F4 rubric drilled). | Dry-run feedback (informal, but gaps must be addressed before W14). |
| 7 | 14 | Final presentations | 100 min back-to-back team presentations + per-student cold defense. | Final project grade (bulk of project points). |

### Cross-lab principles

- **Defect-hunt format trains F1.** Labs 3-4 explicitly drill the critic skill; the rubric students internalize there is the same rubric the examiner applies during oral defense.
- **Cold-defense rehearsal trains F3+F4.** Lab 6 picks students at random and asks them to defend a *teammate's* slice — impossible to fake without genuine team-wide traceability awareness. Strongest forcing function for end-to-end ownership.
- **Skill-drill scenarios stay separate from the project domain.** Toy domains in Labs 1-4 (vending machine, library kiosk, parking lot, etc.) keep skill-building decoupled from team politics. Project work happens in Labs 5-7.
- **Defect logs and prompts are public to the cohort.** A side-effect of shared course tooling + a course repo: every team learns from every other team's AI failures. This is intentional — it accelerates the critic-skill curve.

## 4. Project shape

The team project carries the same weight as in AMSS 2025 (8 of 10 final-grade points), but the artifact mix shifts so that the *trail of architect-and-critic decisions* is the central thing being graded.

### Team structure (preserved from current course)

- Teams of **3–5 students**.
- Domain announced by **31 October**; teams not formed by 1 November are randomized.
- Multiple teams may share a domain (their directed-design trails differ).
- December lab-5 checkpoint preserved as a 1-point gate.

### Per-team deliverables

- **Project repo** on a course-managed GitHub/GitLab org. Public to the cohort. Contains all artifacts, all logs, all transcripts.
- **System-level overview model** prepared together: a single high-level diagram showing the whole system and how each student's slice fits.
- **Joint requirements document** with each requirement traceable to one or more student slices.
- **Final presentation** delivered jointly during W14 lecture + Lab 7 (each student covers their slice; the team covers the overview).

### Per-student deliverables (inside the team repo)

Each student owns a coherent **slice** of the system and produces:

1. **Directed-design narrative for the slice.** AI conversation trail / agent transcript showing requirements gathered, models generated, decisions made, prompts that did not work, rejected outputs, iterations. The architect-half of A+B made visible. *Format: a markdown narrative with linked transcript excerpts; not raw chat dumps.*
2. **Defect log.** Issues caught during AI generation across the SDLC, with severity, what AI got wrong, and how it was corrected. The critic-half of A+B made visible. *Minimum: 5 substantive defects across structural and behavioral artifacts.*
3. **Two UML diagrams for the slice** — one structural (typically class), one behavioral (use case / sequence / state / activity). AI-generated, student-reviewed, student-corrected. **The "no auto-generated" rule from the AMSS 2025 README is reversed**: AI-generated is the default; the *review trail* is the new evidence of student work.
4. **TDD-with-AI reflection.** Each student runs the loop on at least one feature of their slice: spec → AI generates tests → AI generates code → tests pass/fail → what did the failures reveal about the spec. ≤2 pages. Code is a byproduct; the *reflection* is what is read.
5. **At least one design pattern** applied in the student's slice with motivation; team aggregate ≥ 2 patterns.

### Grading rubric (8 pts project)

| Component | Pts | Evaluated on |
|---|---|---|
| **Oral defense** (W14) | **3** | F1+F3+F4 demonstrated *cold*: read & critique any UML diagram from any team's repo, articulate rationale for slice decisions, defend traceability. *This is the integrity check.* |
| **Directed-design narrative + defect log** | **2** | The visible trail of architect/critic work. Replaces the old "diagrams" line item — the diagrams themselves are now lightweight AI outputs; what matters is what the student *did to them*. |
| **Documentation quality** | **1** | Overview model coherence, requirements traceability, presentation polish, repo hygiene. |
| **Design patterns** | **1** | Were patterns chosen deliberately or did AI just decorate code with them? Evaluated through the directed-design lens. |
| **December checkpoint** (Lab 5) | **1** | Preserved as a 1-point gate; format updated: each student does a 3-min cold defense of their slice progress. |

**TDD-with-AI is explicitly outside the rubric.** The loop is required, but its output (passing tests, working code) is *never* a grading line item. What is read is the reflection — credit lands under the directed-design narrative line, not as separate code-quality marks. This keeps the redesign from accidentally re-grading implementation through the back door.

### Final grade composition (10 pts)

- 8 pts — project (above)
- 1 pt — attendance
- 1 pt — *din oficiu* (mandatory; awarded to every student)

## 5. Written resit exam

The resit exam is for students who fail the regular evaluation path. The redesigned resit tests the same F1+F3+F4 floor as the oral defense, in writing, with no AI in the room, gradable by hand.

### Format (recommended: R2 — critique + rationale + traceability)

Single 90-min written paper. The paper hands out a system spec + an AI-generated artifact set (requirements + class diagram + one behavioral diagram). Three sections:

1. **Critique (F1).** Defect log: identify defects, classify (fabrication / vagueness / wrong multiplicity / missed guard / etc.), rate severity, propose corrections.
2. **Rationale (F3).** Short answer: *"Given requirement R3, how would you direct AI to produce a state diagram for it? What would you reject and why?"*
3. **Traceability (F4).** Short answer: *"Identify one inconsistency between requirement R3 and class element X. Walk through the trace that exposes it."*

This mirrors the oral-defense rubric exactly — the resit tests the same competence the regular path measures, not a different fallback skill set.

The existing `examen_scris.tex` can be reshaped into this template. One fixed scenario per academic year, refreshed annually with a new AI-generated artifact set.

## 6. Operational reality

### Source-material reuse from AMSS 2025

Most of the existing UML content survives, with a reframed lens:

- Lecture 02 (class), 04 + 11 (patterns), 06 (state), 07 (activity), 10 (testing/evaluating) → carry forward into new W4, W8, W9, W7, W11. Framing changes from *"here is this diagram type"* to *"here is what AI tends to get wrong about this diagram type."*
- Lecture 03 (requirements) and 05 (structural) → feed into reshaped W2 and W5.
- **Dropped from catalogue:** Lecture 08 (other diagrams), Lecture 09 (metamodel as a standalone session — concepts moved to W11).
- **Existing lab scenarios are gold for the new critique labs.** Lab03 parking lot, Lab04 ATM, Lab05 drone CAS — these become the deliberately flawed AI-generated artifacts in new Labs 3-4. The existing scenarios already have well-understood "right answers" against which to seed plausible AI mistakes.
- **Java demos in `curs/code/`** can serve as TDD-with-AI starter scenarios in Lab 1 onboarding or W3 lecture demo.

### Tooling stack

The cohort runs ~100 students per year, so tooling decisions must scale to that concurrency (typically 15-30 students hitting a model endpoint at once during lab/work time, not 100). The design assumes a canonical setup — one editor extension + one model endpoint + one config file in the course repo — that every student runs identically. The original brainstorm assumed Claude Code as the default; that assumption is dropped because per-student frontier-API costs at this scale are not realistic without procurement that may not happen.

Three procurement paths for the model endpoint, in order of preference:

1. **Institutional self-hosted (preferred baseline).** Use the existing FMI LLM server at `https://llm.fmi.unibuc.ro/` if accessible to enrolled students, or stand up a department-provisioned vLLM instance serving a coding model (Qwen3-Coder 30B, GLM-4 Coder, or similar) on a single modern GPU (RTX 4090 / used A6000 48GB / cloud A100/H100). vLLM's continuous batching handles ~100-student concurrency on a single GPU (Ollama does not — its serial queuing fails around 40 concurrent requests). Predictable flat cost, total privacy, model parity. Requires admin time.
2. **Per-student free-tier API (documented fallback).** Each student creates a Google AI Studio free-tier account and uses the Gemini API (very generous daily limits, 1M-token context) plugged into Continue.dev or Cline. Groq and OpenRouter free tiers as backup. Zero infrastructure, no upfront cost, strong models. Per-student key management; rate limits are per-account (no shared accounts); third-party terms may shift mid-semester.
3. **Pooled paid API (last resort).** Department-funded DeepSeek or OpenRouter account routed through a LiteLLM proxy with per-student keys/quotas. Roughly €30-80/month total at this cohort size with moderate use. Strong models, central control, usage caps, audit logs. Proxy admin and key-leak risk.

**Recommendation.** Start with Option 1 if `llm.fmi.unibuc.ro` is accessible to FMI students; otherwise stand up a vLLM instance on department hardware. Document Option 2 as the fallback for offline / outage / off-campus work. Option 3 only if neither institutional path works.

**BYO is allowed.** Students may use Claude Code, Copilot, Cursor on their own accounts, but graded artifacts must reproduce on the canonical setup (the parity constraint from §1).

*GitHub Copilot Student note:* sign-ups for Copilot Pro/Pro+/Student were temporarily paused on 2026-04-20; existing verified students kept access but lost premium-model self-selection. If the pause has lifted by autumn 2026, Copilot Student becomes a viable BYO upgrade for already-verified students — not a baseline. The instructor (as a verified teacher) can still get Copilot Pro free, useful for course prep and TA workflows.

### Other operational commitments needed before W1

- **Course-managed git org.** All team repos live there. Public-within-cohort visibility is a deliberate design choice (cross-team learning from defect logs).
- **Canonical agentic-tooling setup in the course repo.** A single VS Code workspace with Continue.dev or Cline preconfigured, model endpoint pointing at the chosen procurement option, ready to clone-and-run. Every additional configuration choice multiplies by 100 in support requests.
- **Publishing pipeline unchanged.** Same pandoc + plantuml + lualatex flow described in `class/amss/CLAUDE.md`; new sources land in `class/amss/`, publish to `traiansf.github.io/class/amss2026/`.
- **Curricular approval.** Confirm the redesign maps to AMSS's existing approved learning outcomes. UML literacy + design rationale are preserved (taught differently), so this should be administrative-only — but worth checking with the department before locking the syllabus.
- **Academic-integrity statement.** A one-page student-facing statement attached to the syllabus, framing what AI use is expected vs. what crosses the line. The directed-design narrative + cold defense are the integrity check; that needs to be made explicit so students do not accidentally over- or under-disclose AI use.

### Risks and mitigations

- **Model capability volatility.** If frontier models become dramatically better at modeling mid-semester, the critic-skill drill becomes harder to scaffold (fewer seeded defects). *Mitigation:* keep the meta-skill of critique central, not the specific defect catalogue. The skill ages better than the examples.
- **Open-source model quality below frontier.** Self-hosted coding models (Qwen3-Coder 30B class) are weaker than Claude Sonnet / GPT-5 on hard tasks; they may make *different* defects than the ones the curriculum is built around. *Mitigation:* in Labs 3-4, source the deliberately flawed artifacts from the same model students will use, so seeded defects match observed failure modes. Refresh the defect catalogue annually.
- **Equity within canonical setup.** Some students may run into tool/account/network friction. *Mitigation:* lab rooms with shared workstations backstop personal-device issues; the per-student Gemini fallback (Option 2) handles network outages and off-campus work.
- **Tooling-stack timing.** The canonical setup must be live and tested before W1. *Mitigation:* start procurement decisions well ahead of the semester (latest: by end of summer 2026); pre-semester dry-run of Lab 1 mechanics validates the stack on real-cohort scale.

### Naming / publishing

- Course tag: **AMSS 2026 — AI-Mediated Software Modelling**.
- Formal Romanian title (*Analiza și Modelarea Sistemelor Software*) preserved for institutional continuity; "ediția AI-mediated" added as subtitle on the landing page.
- Published artifacts at `traiansf.github.io/class/amss2026/` (new tree, parallel to existing `amss2025/`).

## 7. Migration path

Rough sequence (each step blocks the next):

1. Implementation plan (next task, via `superpowers:writing-plans`).
2. Confirm tooling stack per §6: verify student access to `llm.fmi.unibuc.ro` or budget department GPU for vLLM; document the canonical setup (extension + endpoint + config) in the course repo.
3. Confirm curricular approval / academic-integrity framing with the department.
4. Rewrite lecture catalogue: new W1, W3, W10, W11, W12 from scratch; reshape W2, W4, W5, W6, W7, W8, W9; archive AMSS 2025 lectures 08, 09.
5. Rewrite project README (`class/amss/proiect/README.md`) per Section 4.
6. Rewrite lab program (`class/amss/lab/Lab*.md`) per Section 3.
7. Reshape `examen_scris.tex` per Section 5.
8. Pre-semester dry-run of Lab 1 mechanics with a small group to validate tooling + workflow.
9. Update landing page (`class/amss/static/index.html`) for the new course tree.

## 8. Open assumptions to verify

- That the 14-week structure documented in `class/amss/CLAUDE.md` matches the actual semester calendar for autumn 2026 (no exam-week eating into the schedule).
- That a parallel implementation course exists and overlaps with this cohort, so the "implementation is not graded here" boundary is real.
- That at least one procurement path in §6 is achievable for autumn 2026 (institutional `llm.fmi.unibuc.ro` access, department GPU for vLLM, or per-student Gemini free-tier as fallback).
- That curricular approval permits the topic-catalogue changes (drops to lectures 08, 09 of AMSS 2025).
