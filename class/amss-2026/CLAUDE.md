# CLAUDE.md — AMSS 2026/2027

This is the AMSS course source tree. The published output lives in `../amss2026/`. The older course sources in `../amss/` remain available for reference; the build trees are independent.

## Current design authority

Read [docs/redesign-2026-2027.md](docs/redesign-2026-2027.md) for the instructor's confirmed decisions and [docs/semester-roadmap.md](docs/semester-roadmap.md) for the lecture/demo/lab implementation plan. The source brief is [curs/redesign-prompt.md](curs/redesign-prompt.md).

The earlier design at `../amss/docs/superpowers/specs/2026-05-01-amss-ai-redesign-design.md` is historical. Its UML-centered curriculum, pinned tooling, mandatory TDD, pattern quotas, and individual oral-defense requirements have been superseded.

[docs/open-questions.md](docs/open-questions.md) lists what is still open: checks nobody has done yet and what was left as found in the build. The instructor's decisions from the October 2026 review are applied in the materials. If a new point needs the instructor's decision, add it there with the files it touches; do not settle such points on your own, raise them with the instructor, and delete an item once it is decided and the materials are changed.

## Pedagogical contract

The course teaches analysis and design principles. Its highest priorities are:

1. Problem framing and requirements.
2. Domain modeling.
3. Contracts and invariants.
4. State and behavior.
5. Responsibility assignment, including cohesion and coupling.

Abstraction, architectural boundaries, design patterns, testing, refactoring, and tradeoffs develop through those foundations. A dedicated model-validation class uses practical scenarios and a small executable model, with one or two slides introducing formal modeling.

Students are master's students with a CS major and exposure to major programming paradigms, but limited design background. Assume programming fluency and explicitly teach design reasoning. Domain modeling is not synonymous with class design.

Students should be able, without AI, to analyze an unfamiliar (small) problem, propose a design, explain alternatives, and reason about a change using prose, sketches, or pseudocode. Teach and practice this competence without adding separately graded exercises or mandatory oral defenses for every student.

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
- 1 point: attendance, proportional to lectures and the student's own lab sessions actually held. Week 14 counts as a lecture; the optional Lab 0 counts for the groups in which it was held (denominator 22 instead of 21).
- 1 automatic point.

Teams have 3–5 students. Each project has a public GitHub or GitLab repository created and linked when the team announces its project on Teams. Track semester-long progress and identifiable member contributions. AI may assist development and commits; the team verifies and owns the published work. Commit counts are not grading criteria.

There is no scheduled checkpoint. Teams may request feedback at any time during the semester. Only Labs 6–7 are dedicated to projects: Lab 6 is an open session for finishing the project, instructor questions, and cross-team discussion; Lab 7 is a team interview about unclear dossier points, finalizing its five-point score on the published criteria. The deliverable (the public repository) must be final about one week before the interview, so that the dossier can be pre-read; require no presentation slides or separate per-student oral exam. Labs 1–5 each practice an important course topic using a distinct bounded problem. Classroom unaided exercises are formative. There is no separately graded individual decision note.

The project page contains the student-facing rubric; docs/assessment-blueprint.md specifies the proposed scenario-based exam design. Resits and grade-improvement attempts (restanță / mărire) use a multiple-choice exam worth nine points plus one automatic point; dossier and attendance marks do not carry over. The older UML-specific resit sample has not yet been redesigned and must not be presented as the new assessment specification.

## Authoring conventions

- Every course and lab has one topic-appropriate quotation, verified against a trustworthy source and linked on the slide titled „Citatul zilei”. See `docs/quotations.md`. The quotation shows the Romanian translation and, as a second paragraph of the same quotation, the original wording („Original: …”), which the theme sets smaller; the source line names the work, with the page where it is known. Keep the locator, verification limits, and pedagogical context in speaker notes and in `docs/quotations.md`. Mark omissions and keep joint authorship. Prefer original works or author/university archives; clearly identify secondary verification when primary text was not available. Preserve these epigraphs when rewriting pending decks.

- **Limba materialelor publice:** toate materialele destinate studenților sau publicului (public-facing) se redactează în limba română, cu diacritice: prezentări, fișe de lucru, enunțuri, cerințe de proiect, evaluări, ghiduri de utilizare și pagini publice. Folosiți terminologia românească consacrată. Pentru termenii fără o traducere împământenită, puteți adăuga originalul englezesc în paranteze sau îl puteți păstra ca atare, dacă este mai firesc. Nu traduceți mecanic identificatori, comenzi, căi de fișiere ori denumiri de produse. Păstrați aceeași terminologie în prezentări, note, demonstrații și materialele suport.
- **Termeni stabiliți de titular:** pentru “evidence” nu folosiți „dovadă/dovezi”; alegeți după sens „justificare”, „verificare”, „rezultatele validării”, „rezultatele revizuirii”, „sursă” ori „susținut de enunț”, sau reformulați propoziția. „Invariant” este masculin la singular („un invariant”, „invariantul”), cu pluralul „invariante”. Sesiunea din Laboratorul 7 se numește „Interviu de susținere a proiectului”. Rolul de revizuire se numește „evaluator”, cu glosa „(agent de revizuire)” la prima apariție din fiecare document. Chestionarele sunt „facultative”, nu „voluntare”.
- Migrarea materialelor existente în română începe cu pachetul primei săptămâni, inclusiv laboratorul 1; aplicați aceeași regulă tuturor materialelor publice noi sau revizuite ulterior.
- Lectures in Weeks 2–13 and Labs 1–7 target 100 minutes. Week 1 is administrative and motivational and may be shorter; Week 14 is the proposed exam/reflection slot. Remove the dedicated project-workshop lecture. Each lab follows its pair of already taught courses (1–2, 3–4, etc.); never require later-course theory. The project interview („Interviu de susținere a proiectului”), about the team's dossier, takes place in Lab 7.
- Keep lecture timing guidance in speaker notes. Labs show phase timings.
- Include an explicit student interaction in substantive lectures; notes alone do not count.
- Prefer concrete problems, source facts, alternatives, and counterexamples to slogans or mandatory vocabulary.
- Establish scenario initial states and independent branches explicitly. Ground expected defects in supplied requirements.
- Label prepared teaching fixtures as prepared. Label actual captured agent output with its provenance; do not present an authored example as a recorded run.
- Preserve the Teams QR code, URL, and team code `fswo4rl` on Lecture 1's welcome slide, and the course-page QR code on its „Program și comunicare” slide. Consultations are online, arranged through an individual Teams message, not by e-mail.
- Lecture 1 focuses on administration and motivation. Its former technical library content is expanded into Lecture 2; do not run that technical exercise in Lecture 1. Useful project-workshop questions may be discussed on request in the open Lab 6.
- Avoid internal instructor abbreviations in student-facing material.
- Leave `date:` out of the front matter. GitHub Pages runs Jekyll over the whole repository, sources included, and a value that is not a real date (such as `2026/2027`) fails the Pages build, so nothing gets deployed; the templates do not display the date.
- Presentation conventions the theme relies on: titles follow `AMSS 2026/2027 — Cursul N: Titlu` (the cover shows session and title separately, so the first slide should not repeat them); the epigraph slide is titled „Citatul zilei”; a QR code shares its slide with the text through pandoc `columns`; links between published pages are absolute, so they also work from the PDFs. After changing a deck or the theme, check that every slide still fits in both the HTML and the PDF.
- Lab 5 has not been brought to these conventions yet. Before adding a deck to `RELEASED`, align its title, first slide, front matter and terminology with the released materials. Labs 6–7 restate the project rubric and must use the criterion names and terms of `proiect/README.md` (already aligned, October 2026).

## Layout and implementation state

- `docs/`: confirmed design decisions and the semester implementation roadmap.
- `curs/`: lecture sources and `*-demo.md` instructor runbooks, only for the current course: Lecture 1 (administration and motivation) and Lecture 2 (its former technical content, expanded). Later lectures do not exist yet; write each under the file name the roadmap and the landing page give it.
- `curs/scenarios/02-biblioteca/`: Lecture 2 source brief and instructor reference.
- `curs/fallback/`: instructor-only prepared examples, each with explicit provenance; currently the Lecture 2 library fallback (`02-intelegere-fallback.md`).
- `archive/`: the superseded 2026 draft (English Lectures 2–14 with demos and fallbacks, Labs 2–4 with guides), moved there on 5 October 2026. Not built, not published; reuse material only, see `archive/README.md`.
- `lab/`: lab decks and `*-instructor.md` guides. Lab 1 is fully redesigned; Labs 2–4 do not exist yet (their old drafts are archived). Lab 5 has a validation/abstraction outline awaiting its teaching package; Labs 6–7 describe the open project session and dossier interview.
- `lab/scenarios/01-specificare/`: student facts, worksheet, and prepared alternatives.
- `proiect/`: Romanian project requirements and assessment.
- `tooling/`: portable setup and workflow; optional templates preserve student tool/model choices.
- `static/`: landing page, shared stylesheet (`amss.css`), and assets copied into published output.
- `theme/`: the course look — pandoc templates, styles, and script for HTML decks and documents, LaTeX headers for the PDFs, and the Lua filter that prepares titles and epigraphs. See `BUILD.md`, “Course look”.
- `exam/`: earlier resit material, awaiting alignment with the new course.
- `../amss2026/`: generated site, built directly from the course sources; do not maintain a separate `output/redesign-preview/` copy.

Pending lectures keep the file names the landing page already links, to avoid link churn; the roadmap maps those names to the new topics and to the archived drafts that may be reused. Do not assume an archived deck implements its landing-page title.

## Build and release

Pandoc builds self-contained HTML decks (the `slidy` writer with the course template and script in `theme/`, not the Slidy runtime) and Beamer PDF (LuaLaTeX, 16:9). The diagram filter supports optional PlantUML/Mermaid diagrams. Keep build changes portable across Linux and Windows; see `BUILD.md`.

```
make
make PREVIEW_ALL=1 BASE=<local-preview-directory>
make fallback
```

Only entries in `RELEASED` are published as lecture/lab decks. Do not add releases unless the instructor asks. Preserve `data-release` keys on landing-page entries. Handouts currently link to the source repository and can also be distributed as local files or printouts.

`curs/redesign-prompt.md` is an instructor brief, not a lecture, and is excluded from preview-all deck discovery. The retired workshop lecture is archived; do not reinstate it. Fallback decks are built alongside their sources and are not published by `make all`; `archive/` is never built.

Do not cross-include build files from the old `../amss/` tree. Reuse useful ideas and scenarios deliberately, while checking their assumptions against the new objectives.

Optional Lab 0 is a 90-minute preparation and orientation guide, available to all groups for self-study. Its HTML and PDF use continuous document layout, unlike the lecture/lab slides. Labs 1–7 follow their two associated courses; announce group dates on Teams instead of fixing even-numbered weeks.

Course questionnaires: maintain the initial and final Form Builder import tables in `questionnaires/`. Use baseline results to guide unreleased content and final results to plan the next edition.
