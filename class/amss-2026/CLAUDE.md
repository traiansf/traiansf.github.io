# CLAUDE.md — AMSS 2026

This file provides guidance to Claude Code when working in the **AMSS 2026 source tree**. AMSS 2025 sources live next door in `../amss/`; this tree is a parallel redesign and shares no build files with it.

## What this tree is

Source for **AMSS 2026 — Analiza și Modelarea Sistemelor Software (ediția AI-mediated)**, a complete redesign of the course around an architect-and-critic AI pedagogy. Students drive AI through the SDLC and critique its outputs; UML literacy remains central but as a reading-and-reviewing skill rather than a drawing skill.

**Authoritative design document:** `../amss/docs/superpowers/specs/2026-05-01-amss-ai-redesign-design.md`. Read it before substantively editing lecture/lab content — it contains the pedagogical contract, the literacy floor (F1+F3+F4), the project rubric, and the procurement options for the agentic-AI tooling stack.

## Layout

- `curs/` — 14 lecture decks (`01-intro.md` through `14-final.md`). Currently stubs.
- `lab/` — 7 lab decks (`Lab01.md` through `Lab07.md`). Currently stubs.
- `proiect/` — project description (`README.md` → `index.html`). Currently stubs.
- `exam/` — written resit-exam template (`examen-2026.tex`). R2 format per spec §5.
- `static/` — hand-maintained files that ship verbatim to `../amss2026/`. Currently: landing-page `index.html` plus empty `curs/index.html` and `lab/index.html` directory-listing blockers (parity with the 2025 tree). Add additional assets as needed.
- `tooling/` — canonical agentic-AI setup distributed to students unchanged. Contains: `README.md` (orientation + procurement pointers), `SETUP.md` (student step-by-step ~30 min), `.continue/config.yaml` (Continue.dev config with three `REPLACE_BEFORE_W1` markers).
- `diagram/` — pandoc Lua filter for plantuml/graphviz code blocks (duplicate of `../amss/diagram/`, kept independent).
- `include.mk`, `Makefile`, per-subdir Makefiles — same pipeline pattern as `../amss/`, but `BASE` defaults to `../amss2026`.

## Build system

Same as `../amss/`'s pipeline (pandoc → slidy HTML + beamer PDF; plantuml fenced code blocks rendered via the Lua filter; lualatex for PDF).

```
make           # builds everything: curs, lab, proiect, exam, static
make clean     # removes generated artifacts
make BASE=/tmp/preview   # override output location for local previews
```

Do NOT cross-include files from `../amss/`. The two trees are intentionally decoupled.

## Editing guidelines

- Romanian where the existing course is in Romanian; English where the spec uses English (e.g., lecture/lab titles per the spec's tables). Match the diacritics style of `../amss/` (`ă`, `â`, `î`, `ș`, `ț`, with `â` inside words and `î` at boundaries).
- Lecture/lab content must conform to the 100-min session sizing constraint documented in `../amss/CLAUDE.md` § "Course schedule".
- Each new lecture/lab MUST have a corresponding entry in `static/index.html` (it is hand-maintained).
- The "no auto-generated diagrams" rule from AMSS 2025's project README is **explicitly reversed** for 2026 — see spec §4.

## Tooling stack

Procurement decision (institutional `llm.fmi.unibuc.ro` / per-student Gemini free-tier / pooled paid API) is open. See spec §6 for the option matrix.

**Pre-W1 replacement checklist** for the canonical setup at `tooling/`:

- `tooling/.continue/config.yaml` — three `REPLACE_BEFORE_W1` markers (model, apiBase, apiKey).
- `tooling/SETUP.md` — `<course-repo-url>` placeholder in Step 1 (clone command).
- `static/index.html` — placeholder GitHub URL `https://github.com/traiansf/amss-2026-tooling` in the Tooling section.

## Relationship to the 2025 tree

Existing AMSS 2025 lab scenarios (`../amss/lab/Lab03.md` parking lot, `Lab04.md` ATM, `Lab05.md` drone CAS) are **gold for the new critique labs (Lab 3 and Lab 4)** — they have well-understood "right answers" against which to seed plausible AI mistakes. When authoring the new critique labs, lift the scenarios; do not reinvent.

Java demos in `../amss/curs/code/` may serve as TDD-with-AI starter scenarios in Lab 1 onboarding or W3 lecture demos.
