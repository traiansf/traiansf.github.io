# CLAUDE.md — AMSS 2026

This file provides guidance to Claude Code when working in the **AMSS 2026 source tree**. AMSS 2025 sources live next door in `../amss/`; this tree is a parallel redesign and shares no build files with it.

## What this tree is

Source for **AMSS 2026 — Analiza și Modelarea Sistemelor Software (ediția AI-mediated)**, a complete redesign of the course around an architect-and-critic AI pedagogy. Students drive AI through the SDLC and critique its outputs; UML literacy remains central but as a reading-and-reviewing skill rather than a drawing skill.

**Authoritative design document:** `../amss/docs/superpowers/specs/2026-05-01-amss-ai-redesign-design.md`. Read it before substantively editing lecture/lab content — it contains the pedagogical contract, the literacy floor (F1+F3+F4), the project rubric, and the (now superseded — see "Tooling stack" below) procurement options for the agentic-AI tooling stack.

## Layout

- `curs/` — 14 lecture decks (`01-intro.md` through `14-final.md`) plus instructor demo runbooks (`*-demo.md`).
- `curs/fallback/` — instructor-only fallback decks (`NN-…-fallback.md`): captured runs of each demo's prompts with the course setting, to switch to when the live AI fails. Built in place with `make fallback` (HTML + PDF next to the sources, committed), never published. Re-capture when the pinned model changes.
- `lab/` — 7 lab decks (`Lab01.md` through `Lab07.md`). Currently stubs.
- `proiect/` — project description (`README.md` → `index.html`). Currently stubs.
- `exam/` — written resit-exam template (`examen-2026.tex`). R2 format per spec §5.
- `static/` — hand-maintained files that ship verbatim to `../amss2026/` (except `index.html`, whose unreleased entries are unlinked at build time). Currently: landing-page `index.html` plus empty `curs/index.html` and `lab/index.html` directory-listing blockers (parity with the 2025 tree). Add additional assets as needed.
- `tooling/` — course AI setup distributed to students unchanged. Contains: `README.md` (orientation + why this model), `SETUP.md` (student step-by-step ~20 min), `template/` (files copied into every lab/project repo root: `AGENTS.md`, `CLAUDE.md`, `.claude/settings.json`, `.codex/config.toml`).
- `diagram/` — pandoc Lua filter for plantuml/graphviz code blocks (duplicate of `../amss/diagram/`, kept independent).
- `include.mk`, `Makefile`, per-subdir Makefiles — same pipeline pattern as `../amss/`, but `BASE` defaults to `../amss2026`.

## Build system

Same as `../amss/`'s pipeline (pandoc → slidy HTML + beamer PDF; plantuml/mermaid fenced code blocks rendered via the Lua filter; lualatex for PDF). Builds on Linux and natively on Windows (from Git Bash) — dependencies and Windows specifics in `BUILD.md`. Keep build changes portable across both.

```
make           # builds everything: curs, lab, proiect, exam, static
make clean     # removes generated artifacts
make BASE=/tmp/preview   # override output location for local previews
```

Do NOT cross-include files from `../amss/`. The two trees are intentionally decoupled.

## Editing guidelines

- **Lecture and lab decks are written in English** (matching the 2025 course's actual practice and the spec's English lecture titles). The project README (`proiect/README.md`) is in Romanian to match the student-facing institutional context — when editing it, follow the diacritics style of `../amss/` (`ă`, `â`, `î`, `ș`, `ț`, with `â` inside words and `î` at boundaries).
- **100-min sizing.** Full classes that aim for ~100 min are the **Week 2–12 lectures and all 7 labs**. **Week 1 (intro), Week 13 (workshop), and Week 14 (finals) may run shorter by design** — do not pad them. Lectures carry **no visible minute-budget slides** (keep timing guidance in `:::notes:::` only); labs *do* carry explicit per-phase minute budgets on slides. See `../amss/CLAUDE.md` § "Course schedule" for the base constraint.
- **No internal abbreviations in student-facing materials** (lecture/lab slides *and* `:::notes:::`, the project page, the exam — i.e. everything except `*-demo.md`/`*-instructor.md` runbooks). The literacy floor is named by nouns, never F-codes (there is no F2): EN **Critique / Rationale / Traceability**, RO **Critică / Raționament / Trasabilitate**. Spell out week codes ("Week N" / RO "săptămâna N"), drop the architect/critic "(A)/(B)" tags and "A+B", and reword the spec "R2" format code. Domain acronyms (UML/SDLC/TDD/NFR/GoF) are allowed but expanded once on first use. KEEP requirement IDs `R1/R2/R3` inside exam/spec artifacts (domain notation).
- **On-slide engagement.** Every full lecture (Weeks 1–12) MUST have at least one explicit student-interaction beat **on a slide** — think-pair-share, show-of-hands, or a "Your Turn" mini-exercise — not just a closing "Questions?". Interaction that lives only in `:::notes:::` or the demo runbook does not count.
- Each new lecture/lab MUST have a corresponding entry in `static/index.html` (it is hand-maintained), carrying `data-release="<dir>/<basename>"`.
- **Week-by-week reveal.** Only decks listed in `RELEASED` are built and published; `make` prunes the rest from `../amss2026` and shows their landing-page entries unlinked. Do not add entries to `RELEASED` unless asked — releasing is the instructor's call. Use `make PREVIEW_ALL=1 BASE=<tmp>` to check unreleased decks. See `BUILD.md` § "Revealing a week".
- The "no auto-generated diagrams" rule from AMSS 2025's project README is **explicitly reversed** for 2026 — see spec §4.

## Tooling stack

**Decided (September 2026), superseding spec §6's procurement options:** students bring a **Claude Pro** or **ChatGPT Plus** subscription and use **Claude Code** or **Codex** through their official VS Code extensions. No course endpoint, no Continue.dev. Course settings are pinned per repository by `tooling/template/` (`AGENTS.md` + `CLAUDE.md` importing it, `.claude/settings.json` = Sonnet 5 at low effort, `.codex/config.toml` = GPT-6 Sol at low effort, calibrated as the closest Codex equivalent; the `AGENTS.md` line telling the assistant to answer directly when no matching files exist is needed for Codex, which otherwise refuses design prompts in an empty repository). Instructor demos run in Claude Code with the same settings.

Sonnet 5 / low was chosen by calibrating the runbooks' prompts across Haiku 4.5, Sonnet 5 and Opus 5.5 (see `tooling/README.md`): it gives workable first drafts that still leave defects to find. The demo runbooks' defect catalogues were rebuilt from that calibration — if the pinned model changes, re-calibrate and refresh them.

**Pre-W1 replacement checklist:**

- `tooling/SETUP.md` — `<course-repo-url>` placeholder in Step 1 (clone command).
- `static/index.html` — the Tooling section links to `tooling/` in the public `traiansf.github.io` repo; repoint it if the course moves to its own repo.

## Relationship to the 2025 tree

Existing AMSS 2025 lab scenarios (`../amss/lab/Lab03.md` parking lot, `Lab04.md` ATM, `Lab05.md` drone CAS) are **gold for the new critique labs (Lab 3 and Lab 4)** — they have well-understood "right answers" against which to seed plausible AI mistakes. When authoring the new critique labs, lift the scenarios; do not reinvent.

Java demos in `../amss/curs/code/` may serve as TDD-with-AI starter scenarios in Lab 1 onboarding or W3 lecture demos.
