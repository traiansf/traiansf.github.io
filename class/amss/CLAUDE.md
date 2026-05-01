# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

Course materials for **AMSS 2025** (Analiza și Modelarea Sistemelor Software / Software Systems Modelling), a UML/design-patterns course taught by Traian-Florin Șerbănuță at the University of Bucharest. The repository is published as a static site (GitHub Pages) under `traiansf.github.io/class/amss2025`.

The tree is split in two:

- `class/amss/` — sources: `.md` slides, image assets, Java demo code, Makefiles, the diagram Lua filter.
- `class/amss2025/` — published artifacts: `.html` / `.pdf` that GitHub Pages serves. Built from `class/amss/` and committed.

Content is written primarily in **Romanian**. When editing `.md` slide sources, match the existing language and diacritics style (`ă`, `â`, `î`, `ș`, `ț`, with `â` used inside words and `î` at word boundaries — see recent commits).

## Course schedule

The course runs for **14 weeks**. Each week has one teaching session (`curs/`); laboratory sessions (`lab/`) run **every other week** (≈7 lab sessions over the semester). Both a teaching session and a laboratory session are **100 minutes** long.

When authoring or revising a deck under `curs/` or `lab/`, size the content to fit within that 100-minute slot — including time for examples, questions, and (for labs) hands-on work. If a topic overflows, split it across sessions rather than rushing through.

## Build system

Top-level `make` (run from `class/amss/`) recursively builds four subdirectories:

```
make          # build everything (curs, lab, proiect, curs/code)
make clean    # remove generated artifacts
```

Output location is controlled by the `BASE` variable, which defaults to `../amss2025` (absolute path computed from the Makefile location). Override it to build into a different tree:

```
make BASE=/tmp/preview         # regenerates the full site under /tmp/preview
make -C curs BASE=/tmp/preview  # just one subdir
```

Per-subdirectory:

- `curs/` and `lab/`: pandoc converts every `*.md` into both `*.html` (slidy slides) and `*.pdf` (beamer via `lualatex`). Images are embedded as base64 via `--embed-resources`, so the outputs are self-contained — no image directories are copied into `$(BASE)`.
- `proiect/`: pandoc converts `README.md` → `index.html`.
- `curs/code/`: Java design-pattern demos. `make` compiles all `*.java`; `make run` compiles and runs each class. The `.class` files stay local (gitignored) and are not deployed.
- `static/`: files that ship to `$(BASE)/` verbatim (not built from Markdown) — the course landing page, hand-written lab pages, and empty directory-listing blockers. The tree mirrors the deployed layout; the top-level `static` target rsyncs `amss/static/` into `$(BASE)/`.

### Adding a new lecture or lab

When adding a new deck under `curs/` or `lab/`, also add the corresponding entry to `static/index.html` — it's the hand-maintained TOC that links to every built deck, and it won't update itself. Use the existing entries as the template (both `.html` and `.pdf` links).

`include.mk` defines the shared pandoc pipeline (pattern rules for `.md → $(BASE)/$(SUBDIR)/%.html` and `.md → $(BASE)/$(SUBDIR)/%.pdf`) and is included by every subdirectory Makefile. Each subdir Makefile sets `SUBDIR` before the include. Changing pandoc options (e.g. the plantuml jar path, currently hardcoded to `/usr/share/plantuml/plantuml.jar`) belongs in `include.mk`, not in the subdirectory Makefiles.

To rebuild a single slide deck:

```bash
make -C curs $(BASE)/curs/04-patterns.pdf   # or just: make -C curs
make -C lab  $(BASE)/lab/Lab03.html
```

## Diagram pipeline

`diagram/diagram.lua` is a pandoc Lua filter that transcodes fenced code blocks (plantuml, graphviz, etc.) into embedded images during the pandoc run. It's wired in via `include.mk`'s `--lua-filter=$(AMSS_ROOT)/diagram/diagram.lua`. Slide authors write UML as plantuml code blocks inside the `.md` source; the filter renders them at build time — there are no committed image artifacts for those diagrams.

## System dependencies

The pipeline requires a working Haskell toolchain (for pandoc built via `stack install pandoc-cli`), a TeX Live install with `lualatex`, `plantuml` + JDK, and `librsvg2-bin` (for `rsvg-convert`, used by the Lua filter). See `README.md` for the full apt install list.

## Generated files

`$(BASE)/curs/*.{html,pdf}`, `$(BASE)/lab/*.{html,pdf}`, and `$(BASE)/proiect/index.html` are build artifacts but **are committed** to the repo (this is a GitHub Pages site serving them directly). Rebuild them when editing the corresponding `.md` source under `class/amss/`, and include the regenerated outputs from `class/amss2025/` in the same commit. The static files staged by the `static` target (landing page, `lab/Lab06.html`, `lab/meet.html`, empty `index.html` placeholders) are also committed under `class/amss2025/`; edit their sources under `amss/static/` and re-run `make` to refresh them.

`examen_scris.{aux,fdb_latexmk,fls,log,pdf}` in this directory are LaTeX build leftovers from `examen_scris.tex`, untracked and safe to ignore.

## Sibling tree: AMSS 2026

Source for the **2026 edition** of the course lives in `../amss-2026/`, not in this directory. That edition is a complete redesign around AI-mediated software design (architect-and-critic pedagogy). See `class/amss-2026/CLAUDE.md` for the 2026 tree's specifics, and `docs/superpowers/specs/2026-05-01-amss-ai-redesign-design.md` for the full design spec.

The two trees are intentionally independent — they share no Makefiles or pipeline files, so changes to one cannot break the other. Build outputs go to sibling directories: `../amss2025/` from this tree, `../amss2026/` from `../amss-2026/`.
