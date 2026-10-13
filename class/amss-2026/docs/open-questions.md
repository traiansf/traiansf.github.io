# AMSS 2026/2027 — Open questions and follow-ups

These points came out of the presentation review of the public materials (October 2026). The review fixed wording, layout and the build, and left alone everything that changes what students are told or graded on.

The instructor settled those decisions on 5 October 2026 and the materials were changed accordingly: attendance counts Week 14 as a lecture and the optional Lab 0 for the groups in which it was held (project page, Lecture 1, `CLAUDE.md`, `docs/redesign-2026-2027.md`); „versiunea relevantă a modelului de proiectare” on the project page; the retired workshop is no longer mentioned to students (project page, Lab 6); the team is announced together with its topic, so only students without an announced team are assigned at random; the questionnaires are „facultative” everywhere in the repository; the review role is „evaluator”, glossed „(agent de revizuire)” at its first appearance in each document; Lab 7 is „Interviu de susținere a proiectului”; Labs 6–7 carry the current front matter, first-slide and project-page terms and were checked for fit. See the terminology bullet of `CLAUDE.md`.

When a point below is settled, change the materials it names and delete it from this file. If a new point needs the instructor's decision, add it here with the files it touches.

## Decisions for the instructor

- **Working students and attendance.** One respondent to the initial questionnaire (12 October 2026 summary, `docs/semester-roadmap.md`) asks that working master's students not be disadvantaged, since attendance counts toward the grade, and suggests holding lectures and labs, online ones included, after 16:00 or at weekends. Session times follow the faculty timetable; what can change here is how attendance is counted or offered (for example, the online lab group as an alternative). Touches `docs/redesign-2026-2027.md` (attendance), `fisa_disciplinei.md` 9.4, Lecture 1 (`curs/01-organizare.md`, attendance slide) and the project page. Decide whether to change anything or answer the point on Teams.

## Checks nobody has done yet

- **A Linux build** of the theme: the locale-dependent parts of `theme/amss.lua` were tested by simulating the C locale on Windows.

External links (Teams, forms.gle, the quotation sources, the tooling documentation) were all followed on 5 October 2026 and resolved (HTTP 200; the forms.gle link redirects to the live form). The page anchors of the PDF links were not checked.

## Left as found in the build

- `make clean` also deletes the tracked HTML and PDF files in `curs/fallback/` (they come back with `make fallback`).
- The archived fallback decks in `archive/curs/fallback/` keep the look they were last built with; they are not rebuilt.
- The exam sample is still the earlier UML-based one (see `CLAUDE.md`, “Assessment and capacity”).
- Printing the project page from a browser leaves the footer alone on a last sheet.
