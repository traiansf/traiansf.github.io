# CLAUDE.md — AMSS 2026/2027

This is the AMSS course source tree. The published output lives in `../amss2026/`. The older course sources in `../amss/` remain available for reference; the build trees are independent.

## Current design authority

Read [docs/redesign-2026-2027.md](docs/redesign-2026-2027.md) for the instructor's confirmed decisions and [docs/semester-roadmap.md](docs/semester-roadmap.md) for the lecture/demo/lab implementation plan. The source brief is [curs/redesign-prompt.md](curs/redesign-prompt.md).

The earlier design at `../amss/docs/superpowers/specs/2026-05-01-amss-ai-redesign-design.md` is historical. Its UML-centered curriculum, pinned tooling, mandatory TDD, pattern quotas, and individual oral-defense requirements have been superseded.

## Pedagogical contract

The course teaches analysis and design principles. Its highest priorities are:

1. Problem framing and requirements.
2. Domain modeling.
3. Contracts and invariants.
4. State and behavior.
5. Responsibility assignment, including cohesion and coupling.

Abstraction, architectural boundaries, design patterns, testing, refactoring, and tradeoffs develop through those foundations. A dedicated model-validation class uses practical scenarios and a small executable model, with one or two slides introducing formal modeling.

Students are master's students with a CS major and exposure to major programming paradigms, but limited design background. Assume programming fluency and explicitly teach design reasoning. Domain modeling is not synonymous with class design.

Students should be able, without AI, to analyze an unfamiliar small problem, propose a design, explain alternatives, and reason about a change using prose, sketches, or pseudocode. Teach and practice this competence without adding separately graded exercises or mandatory oral defenses for every student.

Establish a substantial specification and design before implementation. Use explicit phases, review points, and handoffs; when later evidence exposes a problem, revise the originating decision and dependent work. Models and focused prototypes may help investigate a design. A working application and a TDD implementation loop are not required.

## AI and representations

- Students choose their assistant, model, editor, and representation. No fixed provider, paid subscription, model, effort level, or diagram syntax is required.
- Require explicit roles, bounded handoffs, a separate review context, evidence for findings, and human decisions about the review.
- Separate roles can run sequentially in fresh sessions with the same tool/model.
- Students may write or revise their own artifacts. Do not require every correction to pass through a new prompt.
- A good agent answer must still support a useful lesson. Do not require a minimum defect count, predictable model failure, or exact reproduction of generated wording.
- Summaries should retain a path to underlying facts, decisions, and checks.
- Use a different small domain for each topic. Avoid turning the semester into one long application implementation.

## Assessment and capacity

One instructor supervises approximately 100 students in three lab groups. Labs occupy a two-hour slot every other week; plan 100 minutes of core activity and allow operational buffer.

The agreed regular grading scheme is:

- 5 points: team design dossier.
- 3 points: individual scenario-based multiple-choice exam.
- 1 point: attendance, proportional to lectures and the student's own lab sessions actually held.
- 1 automatic point.

Teams have 3–5 students. Each project has a public GitHub or GitLab repository created and linked when the team announces its project on Teams. Track semester-long progress and identifiable member contributions. AI may assist development and commits; the team verifies and owns the published work. Commit counts are not grading criteria.

There is no scheduled checkpoint. Teams may request feedback at any time during the semester. Only Labs 6–7 are dedicated to projects: Lab 6 is open individual project work, instructor questions, and cross-team discussion; Lab 7 is a team interview about unclear dossier points, finalizing its five-point score on the published criteria. Pre-read the dossier; require no presentation slides or separate per-student oral exam. Labs 1–5 each practice an important course topic using a distinct bounded problem. Classroom unaided exercises are formative. There is no separately graded individual decision note.

The project page contains the student-facing rubric; docs/assessment-blueprint.md specifies the proposed scenario-based exam design. Resits use a multiple-choice exam worth nine points plus one automatic point; dossier and attendance marks do not carry over. The older UML-specific resit sample has not yet been redesigned and must not be presented as the new assessment specification.

## Authoring conventions

- Every course and lab has one topic-appropriate quotation, verified against a trustworthy source and linked on the slide. See `docs/quotations.md`. Display a Romanian translation marked as such; retain exact original wording, locator, verification limits, and pedagogical context in speaker notes. Mark omissions and keep joint authorship. Prefer original works or author/university archives; clearly identify secondary verification when primary text was not available. Preserve these epigraphs when rewriting pending decks.

- **Limba materialelor publice:** toate materialele destinate studenților sau publicului (public-facing) se redactează în limba română, cu diacritice: prezentări, fișe de lucru, enunțuri, cerințe de proiect, evaluări, ghiduri de utilizare și pagini publice. Folosiți terminologia românească consacrată. Pentru termenii fără o traducere împământenită, puteți adăuga originalul englezesc în paranteze sau îl puteți păstra ca atare, dacă este mai firesc. Nu traduceți mecanic identificatori, comenzi, căi de fișiere ori denumiri de produse. Păstrați aceeași terminologie în prezentări, note, demonstrații și materialele suport.
- Migrarea materialelor existente în română începe cu pachetul primei săptămâni, inclusiv laboratorul 1; aplicați aceeași regulă tuturor materialelor publice noi sau revizuite ulterior.
- Lectures in Weeks 2–13 and Labs 1–7 target 100 minutes. Week 1 is administrative and motivational and may be shorter; Week 14 is the proposed exam/reflection slot. Remove the dedicated project-workshop lecture. Each lab follows its pair of already taught courses (1–2, 3–4, etc.); never require later-course theory. The dossier interview takes place in Lab 7.
- Keep lecture timing guidance in speaker notes. Labs show phase timings.
- Include an explicit student interaction in substantive lectures; notes alone do not count.
- Prefer concrete problems, source facts, alternatives, and counterexamples to slogans or mandatory vocabulary.
- Establish scenario initial states and independent branches explicitly. Ground expected defects in supplied requirements.
- Label prepared teaching fixtures as prepared. Label actual captured agent output with its provenance; do not present an authored example as a recorded run.
- Preserve the Teams QR code, URL, and team code `fswo4rl` on Lecture 1's welcome slide.
- Lecture 1 focuses on administration and motivation. Its former technical library content is expanded into Lecture 2; do not run that technical exercise in Lecture 1. Useful project-workshop questions may be discussed on request in the open Lab 6.
- Avoid internal instructor abbreviations in student-facing material.

## Layout and implementation state

- `docs/`: confirmed design decisions and the semester implementation roadmap.
- `curs/`: lecture sources and `*-demo.md` instructor runbooks. Lecture 1 covers administration and motivation; Lecture 2 expands its former technical content. Other later decks retain earlier content pending rewrite. See the roadmap for the new course order and retained filenames; `13-workshop.md` is retired from deck discovery.
- `curs/scenarios/01-library-kiosk/`: Lecture 2 source brief and instructor reference (original path retained).
- `curs/fallback/`: instructor-only prepared examples or historical captures, each with explicit provenance. The library fallback is prepared material for Lecture 2 (original path retained).
- `lab/`: lab decks and `*-instructor.md` guides. Lab 1 is fully redesigned; Labs 2–4 retain earlier source content pending rewrite. Lab 5 has a validation/abstraction outline awaiting its teaching package; Labs 6–7 describe the open project session and dossier interview.
- `lab/scenarios/lab01/`: student facts, worksheet, and prepared alternatives.
- `proiect/`: Romanian project requirements and assessment.
- `tooling/`: portable setup and workflow; optional templates preserve student tool/model choices.
- `static/`: landing page and assets copied into published output.
- `exam/`: earlier resit material, awaiting alignment with the new course.
- `../amss2026/`: generated site, built directly from the course sources; do not maintain a separate `output/redesign-preview/` copy.

Later lecture filenames currently retain their earlier names to avoid unnecessary link churn. The roadmap maps old sources to new topics. Do not assume an unrevised deck already implements its new landing-page title.

## Build and release

Pandoc builds Slidy HTML and Beamer PDF (LuaLaTeX). The diagram filter supports optional PlantUML/Mermaid diagrams. Keep build changes portable across Linux and Windows; see `BUILD.md`.

```
make
make PREVIEW_ALL=1 BASE=<local-preview-directory>
make fallback
```

Only entries in `RELEASED` are published as lecture/lab decks. Do not add releases unless the instructor asks. Preserve `data-release` keys on landing-page entries. Handouts currently link to the source repository and can also be distributed as local files or printouts.

`curs/redesign-prompt.md` is an instructor brief, not a lecture, and is excluded from preview-all deck discovery. The retired `curs/13-workshop.md` is also excluded; do not reinstate it as a lecture. Fallback decks are built alongside their sources and are not published by `make all`.

Do not cross-include build files from the old `../amss/` tree. Reuse useful ideas and scenarios deliberately, while checking their assumptions against the new objectives.

Optional Lab 0 is a 90-minute preparation and orientation guide, available to all groups for self-study. Its HTML and PDF use continuous document layout, unlike the lecture/lab slides. Labs 1–7 follow their two associated courses; announce group dates on Teams instead of fixing even-numbered weeks.

Course questionnaires: maintain the initial and final Form Builder import tables in `questionnaires/`. Use baseline results to guide unreleased content and final results to plan the next edition.
