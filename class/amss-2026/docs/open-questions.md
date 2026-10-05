# AMSS 2026/2027 — Open questions and follow-ups

These points came out of the presentation review of the public materials (October 2026). The review fixed wording, layout and the build, and left alone everything that changes what students are told or graded on. Those decisions are listed here, with the places they touch, so that they are looked at as the course is developed further.

When a point is settled, change the materials it names and delete it from this file. Line numbers are those of the sources at the time of writing; search for the quoted phrase if they have moved.

## Decisions for the instructor

### 1. Attendance: what counts in the denominator

- **Where:** `proiect/README.md` („Punctaj prezență = …”, „Pentru 14 cursuri și 7 laboratoare, numitorul este 21”, lines 112–116); `curs/01-intro.md`, slide „Prezența și pregătirea pentru examinare” (lines 116–118) and its notes (line 127); `static/index.html` („Prezență la cursuri și laboratoare”, line 165); the assessment section of `CLAUDE.md`.
- **Question:** two meetings are not covered by the formula.
  - *Lab 0* is optional and takes place only in some groups. It was held in the first week of October 2026. The slide counts „întâlniri de curs și laborator desfășurate pentru grupa voastră”, which read literally includes it; „7 laboratoare” excludes it.
  - *Week 14* is planned as exam and reflection (`docs/semester-roadmap.md`). Is it one of the 14 lectures for attendance?
- **To do once decided:** say it in one sentence on the project page and, if it changes the numbers, on the slide.

### 2. Project page: three phrases that can be read in two ways

All in `proiect/README.md`; the second also appears in `lab/Lab06.md` (line 15).

- **„versiunea relevantă a modelului”** (line 74). The sentence before it is about delegation and context, the next paragraph about „instrumentul și modelul folosite”, so „model” can be the AI model or the design model. If the design model is meant, „versiunea relevantă a modelului de proiectare” removes the doubt.
- **„întrebări de proiectare care ar fi fost discutate într-un atelier la curs”** (line 84). The workshop lecture was retired, so students have no such workshop to compare with. The clause can simply go.
- **„Studenții fără echipă sau temă la 1 noiembrie vor fi repartizați aleatoriu”** (line 16). It covers a student without a team. What happens to a complete team that has not announced a topic by the deadline?

### 3. The questionnaire is „voluntar” in the form and „facultativ” on the pages

- **Where:** the live Google Form and `questionnaires/README.md` (lines 9, 13, 17) say „Completarea este voluntară”; `curs/01-intro.md` (line 276), `lab/Lab00.md` (line 158) and `static/index.html` (line 196) say „facultativ(ă)”.
- **Question:** near-synonyms, so the difference may be acceptable. To align, edit the form by hand in Google Forms and the two descriptions in `questionnaires/README.md`; the unreleased `curs/14-final.md` (line 168) also says „voluntară”.

### 4. Terms used side by side

- **„evaluator”** (Lab 1 slides and worksheet; with the gloss „agent de revizuire” in Lecture 1 and on the project page) and **„agent de revizuire”** alone (`tooling/README.md`, `tooling/SETUP.md`).
- Pick one of „evaluator” and „agent de revizuire”, or keep the gloss wherever „evaluator” first appears in a document (Lecture 2 now glosses it on the demonstration slide).

## Before releasing Labs 6–7

`lab/Lab06.md` and `lab/Lab07.md` were not part of the review (only released material was). Before adding them to `RELEASED`:

- **Front matter:** `title: "AMSS 2026/2027 — Laboratorul N: …"` instead of `"AMSS 2026 — Lab N: …"`, and no `date:` (see the authoring conventions in `CLAUDE.md`).
- **First slide:** it repeats the title („# Lab 6: …”, „# Lab 7: …”), which the cover already shows; give it a title of its own.
- **Terms of the project page:** „Laboratorul 6/7” for „Lab 6/7”; in the Lab 7 table „Formularea problemei și cerințe” for „Încadrarea problemei și cerințe”, „Stare și comportament” for „Stări și comportamente”, „Total dosar de proiectare” for „Total dosar de echipă”; „aspectele neclare” for „punctele neclare”; „diapozitive” for „slide-uri”; „punctajul pentru dosar” for „nota pe dosar”.
- **Point 2 above** applies to these decks as well. Lab 7 is „Interviu de susținere a proiectului” (decided in October 2026).
- **Then:** build with `make PREVIEW_ALL=1 BASE=<dir>` and check that every slide fits in the HTML deck and in the PDF.

The other unreleased decks still carry their earlier content (see the roadmap); the same alignment applies when each is rewritten.

## Checks nobody has done yet

- **Real devices:** a phone, Safari on iOS or macOS, a screen reader, a projector. The review used headless Chrome and Firefox on Windows.
- **The Teams QR code** on the welcome slide was enlarged because of its density; whether it scans from the back rows was estimated, not tried.
- **A Linux build** of the theme: the locale-dependent parts of `theme/amss.lua` were tested by simulating the C locale on Windows.
- **External links** (Teams, forms.gle, the quotation sources) were not followed by the link check.

## Left as found in the build

- `make clean` also deletes the tracked HTML and PDF files in `curs/fallback/` (they come back with `make fallback`).
- The fallback decks in `curs/fallback/` keep the old look until `make fallback` is run.
- The exam sample is still the earlier UML-based one (see `CLAUDE.md`, “Assessment and capacity”).
- Printing the project page from a browser leaves the footer alone on a last sheet.
