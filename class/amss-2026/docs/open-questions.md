# AMSS 2026/2027 — Open questions and follow-ups

These points came out of the presentation review of the public materials (October 2026). The review fixed wording, layout and the build, and left alone everything that changes what students are told or graded on. Those decisions are listed here, with the places they touch, so that they are looked at as the course is developed further.

When a point is settled, change the materials it names and delete it from this file. Line numbers are those of the sources at the time of writing; search for the quoted phrase if they have moved.

## Decisions for the instructor

### 1. Attendance: what counts in the denominator

- **Where:** `proiect/README.md` („Punctaj prezență = …”, „Pentru 14 cursuri și 7 laboratoare, numitorul este 21”, lines 112–116); `curs/01-intro.md`, slide „Prezența și pregătirea pentru examinare” (lines 115–117) and its notes (line 126); `static/index.html` („Prezență la cursuri și laboratoare”, line 165); the assessment section of `CLAUDE.md`.
- **Question:** two meetings are not covered by the formula.
  - *Lab 0* is optional and takes place only in some groups. The slide counts „întâlniri de curs și laborator desfășurate pentru grupa voastră”, which read literally includes it; „7 laboratoare” excludes it.
  - *Week 14* is planned as exam and reflection (`docs/semester-roadmap.md`). Is it one of the 14 lectures for attendance?
- **To do once decided:** say it in one sentence on the project page and, if it changes the numbers, on the slide.

### 2. Lab 7: „susținere a proiectului” or „a dosarului”

- **Where:** `static/index.html` line 147 says „Interviu de susținere a proiectului”; `lab/Lab07.md` says „… a dosarului” in its front-matter title, while its first slide now says „… a proiectului” (the instructor's edit of October 2026); `proiect/README.md` has the section „Interviul de susținere — ultimul laborator” and speaks of „dosar” throughout; `docs/semester-roadmap.md` calls it “Dossier interview”.
- **Question:** which noun names the session. Use it in all of these places.

### 3. Lab 1: the kinds of statements differ between the slide and the worksheet

- **Where:** `lab/Lab01.md`, slide „Patru tipuri de afirmații” (lines 110–119): cerință convenită, consecință dedusă, alegere de proiectare, regulă încă neclarificată. `lab/scenarios/lab01/worksheet.md` line 39: „Informație convenită / consecință / ipoteză / întrebare / propunere de proiectare”. `lab/scenarios/lab01/scenario.md` line 48: „informații/ipoteze/întrebări”.
- **Question:** four categories or five, and under which names. „Ipoteză” is on the worksheet and in the slide's notes (line 122) but not on the slide; „alegere de proiectare” and „propunere de proiectare” name the same thing.

### 4. Project page: three phrases that can be read in two ways

All in `proiect/README.md`; the second also appears in `lab/Lab06.md` (line 15).

- **„versiunea relevantă a modelului”** (line 74). The sentence before it is about delegation and context, the next paragraph about „instrumentul și modelul folosite”, so „model” can be the AI model or the design model. If the design model is meant, „versiunea relevantă a modelului de proiectare” removes the doubt.
- **„întrebări de proiectare care ar fi fost discutate într-un atelier la curs”** (line 84). The workshop lecture was retired, so students have no such workshop to compare with. The clause can simply go.
- **„Studenții fără echipă sau temă la 1 noiembrie vor fi repartizați aleatoriu”** (line 16). It covers a student without a team. What happens to a complete team that has not announced a topic by the deadline?

### 5. Lab 1: who is addressed on „Ce sarcină putem preda în continuare?”

- **Where:** `lab/Lab01.md`, lines 249–259.
- **Question:** the bullets („clarificați limita anulării…”, „opriți-vă pentru revizuire umană înainte de implementare”) are imperatives to the students, but they describe what the delegated design task should do; the prepared example (`prepared-fixture.md`, A8) words them as the task. A lead-in such as „Propuneți o sarcină de proiectare care:” with the bullets in the third person („clarifică…”, „se oprește…”) would make the slide say that.

### 6. The setup guide's warm-up uses Lab 1's domain

- **Where:** `tooling/SETUP.md`, section 3 (lines 26–42): „Un departament dorește ca studenții să poată rezerva săli de studiu…”, with a prepared proposal that includes „fiecare rezervare durează o oră”.
- **Question:** Lab 1 is the study-room reservation scenario, and its change request is a 60-minute limit. Lecture 1 asks students to read this guide before Lab 1, `lab/Lab00.md` (line 152) says the room scenario is kept for Lab 1, and `CLAUDE.md` asks for a different small domain for each topic. Either move the warm-up to another domain or accept the overlap on purpose.

### 7. The questionnaire is „voluntar” in the form and „facultativ” on the pages

- **Where:** the live Google Form and `questionnaires/README.md` (lines 9, 13, 17) say „Completarea este voluntară”; `curs/01-intro.md` (line 275), `lab/Lab00.md` (line 156) and `static/index.html` (line 196) say „facultativ(ă)”.
- **Question:** near-synonyms, so the difference may be acceptable. To align, edit the form by hand in Google Forms and the two descriptions in `questionnaires/README.md`; the unreleased `curs/14-final.md` (line 168) also says „voluntară”.

### 8. Terms used side by side

- **„profesorul”** (`lab/Lab00.md`, `proiect/README.md`) and **„cadrul didactic”** (Lab 1 slides and handouts, `tooling/SETUP.md`).
- **„evaluator”** (Lab 1 slides and worksheet; with the gloss „agent de revizuire” in Lecture 1 and on the project page) and **„agent de revizuire”** alone (`tooling/README.md`, `tooling/SETUP.md`).
- The review kept both pairs as it found them. Pick one of each, or keep the gloss wherever „evaluator” first appears in a document.

## Before releasing Labs 6–7

`lab/Lab06.md` and `lab/Lab07.md` were not part of the review (only released material was). Before adding them to `RELEASED`:

- **Front matter:** `title: "AMSS 2026/2027 — Laboratorul N: …"` instead of `"AMSS 2026 — Lab N: …"`, and no `date:` (see the authoring conventions in `CLAUDE.md`).
- **First slide:** it repeats the title („# Lab 6: …”, „# Lab 7: …”), which the cover already shows; give it a title of its own.
- **Terms of the project page:** „Laboratorul 6/7” for „Lab 6/7”; in the Lab 7 table „Formularea problemei și cerințe” for „Încadrarea problemei și cerințe”, „Stare și comportament” for „Stări și comportamente”, „Total dosar de proiectare” for „Total dosar de echipă”; „aspectele neclare” for „punctele neclare”; „diapozitive” for „slide-uri”; „punctajul pentru dosar” for „nota pe dosar”.
- **Points 2 and 4 above** apply to these decks as well.
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
