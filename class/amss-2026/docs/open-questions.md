# AMSS 2026/2027 — Open questions and follow-ups

These points came out of the presentation review of the public materials (October 2026). The review fixed wording, layout and the build, and left alone everything that changes what students are told or graded on.

The instructor settled those decisions on 5 October 2026 and the materials were changed accordingly: attendance counts Week 14 as a lecture and the optional Lab 0 for the groups in which it was held (project page, Lecture 1, `CLAUDE.md`, `docs/redesign-2026-2027.md`); „versiunea relevantă a modelului de proiectare” on the project page; the retired workshop is no longer mentioned to students (project page, Lab 6); the team is announced together with its topic, so only students without an announced team are assigned at random; the questionnaires are „facultative” everywhere in the repository; the review role is „evaluator”, glossed „(agent de revizuire)” at its first appearance in each document; Lab 7 is „Interviu de susținere a proiectului”; Labs 6–7 carry the current front matter, first-slide and project-page terms and were checked for fit. See the terminology bullet of `CLAUDE.md`.

When a point below is settled, change the materials it names and delete it from this file. If a new point needs the instructor's decision, add it here with the files it touches.

## Decisions for the instructor

- **Working students and attendance.** One respondent to the initial questionnaire (12 October 2026 summary, `docs/semester-roadmap.md`) asks that working master's students not be disadvantaged, since attendance counts toward the grade, and suggests holding lectures and labs, online ones included, after 16:00 or at weekends. Session times follow the faculty timetable; what can change here is how attendance is counted or offered (for example, the online lab group as an alternative). Touches `docs/redesign-2026-2027.md` (attendance), `fisa_disciplinei.md` 9.4, Lecture 1 (`curs/01-organizare.md`, attendance slide) and the project page. Decide whether to change anything or answer the point on Teams.

## Checks nobody has done yet

- **Requested Claude Fable editorial review of Courses 5–6 and Lab 3 (27 October 2026).** Claude Code recognizes `claude-fable-5-1`, but both review attempts ended with `ECONNREFUSED` before inference (zero input/output tokens); the requested retry finished at 12:13 UTC on 27 October 2026 with the same error. No Fable findings were received. A local editorial pass clarified the examples, Romanian wording, rule summaries and continuity with earlier lessons; the independent Fable review and its recheck remain pending. Local diagnostic artifacts are under the ignored `notes/review-2026-10-27/` directory. Retry through Claude Code when connectivity is available; the separate Codex agent tool does not offer this model. An independent review by GPT-6-Astra (Codex CLI 0.162.1, read-only, fresh context; focus on continuity with earlier lessons, relevance of the examples and natural Romanian) ran on 27 October 2026: four findings (the Course 6 final decision did not move the over-restrictive precondition to the success condition; an ambiguous "cele două variante" in Course 5; calques "deține modificarea/regula" in Lab 3 and its prompt; "scenariu trecut", "apelul ocupat" in Course 6 notes), all applied and rechecked by a second Astra pass.
- **Genuine AI examples for Courses 5–6 and Lab 3 (27 October 2026).** The teaching packages and prompts are authored, with explicitly labeled constructed examples as fallbacks. Two Course 5 capture attempts timed out without responses; exact inputs and metadata are retained in `curs/scenarios/05-colete/captures/2026-10-27/`. Obtain and archive real analysis/review outputs before replacing the constructed examples. Lab 3 may instead use one live instructor-led analysis and fresh-context review in plenary. Do not relabel constructed text as model output. Touches the three decks, the online lab variant, their guides and scenario folders.
- **Meyer quotation link.** On 27 October 2026 the author's stable page `https://bertrandmeyer.com/OOSC2/` resolved, but both the earlier PDF URL and the current download returned 404. Courses 6 and Lab 3 preserve the quotation previously verified in indexed primary text (§25.3, p. 873), with that limit explicit in notes and `docs/quotations.md`; recheck the page when the PDF is available.

- **A Linux build** of the theme: the locale-dependent parts of `theme/amss.lua` were tested by simulating the C locale on Windows.

External links (Teams, forms.gle, the quotation sources, the tooling documentation) were all followed on 5 October 2026 and resolved (HTTP 200; the forms.gle link redirects to the live form). The page anchors of the PDF links were not checked.

## Left as found in the build

- `make clean` also deletes the tracked HTML and PDF files in `curs/fallback/` (they come back with `make fallback`).
- The archived fallback decks in `archive/curs/fallback/` keep the look they were last built with; they are not rebuilt.
- The exam sample is still the earlier UML-based one (see `CLAUDE.md`, “Assessment and capacity”).
- Printing the project page from a browser leaves the footer alone on a last sheet.
