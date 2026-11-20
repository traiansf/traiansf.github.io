# AMSS 2026/2027 — Open questions and follow-ups

These points came out of the presentation review of the public materials (October 2026). The review fixed wording, layout and the build, and left alone everything that changes what students are told or graded on.

The instructor settled those decisions on 5 October 2026 and the materials were changed accordingly: attendance counts Week 14 as a lecture and the optional Lab 0 for the groups in which it was held (project page, Lecture 1, `CLAUDE.md`, `docs/redesign-2026-2027.md`); „versiunea relevantă a modelului de proiectare” on the project page; the retired workshop is no longer mentioned to students (project page, Lab 6); the team is announced together with its topic, so only students without an announced team are assigned at random; the questionnaires are „facultative” everywhere in the repository; the review role is „evaluator”, glossed „(agent de revizuire)” at its first appearance in each document; Lab 7 is „Interviu de susținere a proiectului”; Labs 6–7 carry the current front matter, first-slide and project-page terms and were checked for fit. See the terminology bullet of `CLAUDE.md`.

When a point below is settled, change the materials it names and delete it from this file. If a new point needs the instructor's decision, add it here with the files it touches.

## Decisions for the instructor

- **New exam sample (27 October 2026).** `exam/model-examen.md` (24 scenario-based items in six cases, one per assessment area, following `docs/assessment-blueprint.md`) and `exam/model-examen-barem.md` (key with a reason for every option). GPT-6-Astra solved all items independently and matched every key; its ambiguity findings (items 6, 12, 17, 19, 23, option lengths, answer positions) are applied. Both are built and published (HTML and PDF) at `https://traiansf.github.io/class/amss2026/exam/model-examen.html` and `…/model-examen-barem.html`, but nothing links to them yet; the UML sample is retired to `archive/exam/`. Still open: verify the key yourself; decide where to link the sample (course landing page, `proiect/README.md`, or a Teams announcement) and whether the key is linked at the same time. Items on states were rechecked on 12 November 2026 when Lecture 7 was written: an event without a permitted transition is now „refuzat” in the paper and the key (Lectures 6–7 use `refuz`/„refuzat”; „respins” stays for the editorial decision), and the sample's bank and PDF were regenerated; recheck the validation items when Lecture 9 is written. Exam variants are generated with multiple_choice_exam; the sample's bank `exam/model-examen-mcexam.md` (built by `make -C exam bank`) lints and generates there with the shared-stems extension, merged into that repository's `main` on 28 October 2026 after two review rounds, together with `mcexam generate --lang ro` („Nume:”, „Varianta NNN”). Since 28 October 2026 the published PDF of the sample is mcexam's sample sheet for that bank (`--no-shuffle`: paper order, unshuffled options, no QR), one case per page, with the paper's instructions as the bank's preamble.
- **Working students and attendance.** One respondent to the initial questionnaire (12 October 2026 summary, `docs/semester-roadmap.md`) asks that working master's students not be disadvantaged, since attendance counts toward the grade, and suggests holding lectures and labs, online ones included, after 16:00 or at weekends. Session times follow the faculty timetable; what can change here is how attendance is counted or offered (for example, the online lab group as an alternative). Touches `docs/redesign-2026-2027.md` (attendance), `fisa_disciplinei.md` 9.4, Lecture 1 (`curs/01-organizare.md`, attendance slide) and the project page. Decide whether to change anything or answer the point on Teams.

- **Lab 4: result of an accepted `anulează` (18 November 2026).** R6 in `lab/scenarios/04-comportament/scenario.md` names `refuz` for a refused cancellation but no result for an accepted one (R3 has `ridicat`); the prediction slide asks for „Rezultat” in S6/S7 and the notes say „anularea acceptată”. Decide whether R6 should name a result (for example `anulat`); it would touch the enunț, the reference, both deck variants and the guide. The archived captures used the enunț as sent and stay unchanged.

- **Rework of 19 November 2026: points for the instructor** (`docs/ai-lessons-and-lab-diagrams.md`). Lectures:
  - Lecture 2 keeps its 6-minute delegation introduction before the new exercise; shorten it?
  - Lecture 3 slide 10 has a shorter „Reamintim” line (R1 and the excluded notifications only).
  - Lecture 4's prompts leave out R6 and S5, so that only the requested form differs; its earlier, unchanged slides still ask for pair work.
  - Lecture 5's AI context rewords R1 so that it does not name the shared operation. Counting the site's „1000,5” → 10 lei as an R1 violation is arguable (`parseInt`).
  - Lecture 7's captured diagrams are tall and small in the PDF (HTML is readable). Should a theme or direction line be allowed on top of the captured code?
  - Lecture 7's notes read `Acceptat --> [*]` as UML end notation, not as a transition. The selected prompt asks for a „compactă” diagram, which may have nudged the omission; this is disclosed.
  - Lecture 7's slide-count convention (guide 37, build 36).
  - Lecture 8: the capture context includes decision B. The rewritten participant promise 2 deliberately omits „centrul o poate retrimite”.
- **Labs** (same rework):
  - UML terms: association = „relație”, link = „asociere”, multiplicity = „cardinalitate”; new terms „nume de rol”, „atribut derivat”.
  - Lab 3's reference uses the attribute `marcaj` (activă/ridicată/anulată), since „stare” names the whole register there. Should it be `stare` now?
  - Lab 3's reference diagram notes are small on a projector: move the contracts to a second slide?
  - Lab 2's reference diagram has invisible U+2800 padding to work around a Mermaid label bug.
  - Workshop names are not uniform: „Atelier: …” in Labs 3–4, „etapa diagramei” in Lab 2, which avoids the repair „atelier”.
  - Lab 1 keeps pairs in the workshop (individual drawing, then a check with the partner) and keeps the 90-minute change exercise.
  - PlantUML is rendered as PNG in Lab 1, because PlantUML's PDF output drops diacritics.
  - Lab 4:
    - Final states are drawn without the UML final pseudostate (R8 keeps the data).
    - The `ridicat`/`refuz` result returned to the desk is left off the diagram.
    - „Ghișeul nu a primit răspunsul” became worksheet self-study.
  - The plenary check needs internet on the instructor's computer for mermaid.live; a drawing on the board is the fallback.
- **Which pandoc to build with (20 November 2026).** The published HTML is what pandoc 3.5–3.6.3 writes; the presentation workflow builds the reveal.js decks with 3.6.4, and `BUILD.md` asks only for 3.5 or later. From 3.6.4 on, the last word of an epigraph's original wording is tied to the word before it and a prime in a formula (Lecture 6) becomes a superscript; 3.14 writes formulas as MathML. Decide whether to name one version for the site and the workflow, and when to move to a newer one (every deck changes a little, so rebuild and check all of them together). Touches `BUILD.md` and `.github/workflows/amss-presentation.yml`.

## Checks nobody has done yet

- **Meyer quotation link.** On 27 October 2026 the author's stable page `https://bertrandmeyer.com/OOSC2/` resolved, but both the earlier PDF URL and the current download returned 404. Courses 6 and Lab 3 preserve the quotation previously verified in indexed primary text (§25.3, p. 873), with that limit explicit in notes and `docs/quotations.md`; recheck the page when the PDF is available.

External links (Teams, forms.gle, the quotation sources, the tooling documentation) were all followed on 5 October 2026 and resolved (HTTP 200; the forms.gle link redirects to the live form). The page anchors of the PDF links were not checked.

## Left as found in the build

- `make clean` also deletes the tracked HTML and PDF files in `curs/fallback/` (they come back with `make fallback`).
- The archived fallback decks in `archive/curs/fallback/` keep the look they were last built with; they are not rebuilt.

- Printing the project page from a browser leaves the footer alone on a last sheet.

- The Linux build (checked on Ubuntu 24.04 on 20 November 2026, see `BUILD.md`) differs from the published Windows build only in the diagrams. Arial is missing there: Mermaid diagrams are set in Liberation Sans, with small layout shifts (in Lecture 5's dependency diagram „Canalul ghișeului” stays on one line; Lab 2's reference diagram is about a tenth wider), and Lab 1's PlantUML diagrams in another sans-serif font, about 3% wider. All of them remain legible. With Arial installed, the two builds should agree; this was not tried.
- Mermaid draws the boxes of a class diagram with random variation, so the HTML of Labs 2–3 changes at every rebuild even when nothing else did.
