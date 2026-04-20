# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

Course materials for **AMSS 2025** (Analiza și Modelarea Sistemelor Software / Software Systems Modelling), a UML/design-patterns course taught by Traian-Florin Șerbănuță at the University of Bucharest. The repository is published as a static site (GitHub Pages) under `traiansf.github.io/class/amss2025`.

Content is written primarily in **Romanian**. When editing `.md` slide sources, match the existing language and diacritics style (`ă`, `â`, `î`, `ș`, `ț`, with `â` used inside words and `î` at word boundaries — see recent commits).

## Build system

Top-level `make` recursively builds four subdirectories:

```
make          # build everything (curs, lab, proiect, curs/code)
make clean    # remove generated artifacts
```

Per-subdirectory:

- `curs/` and `lab/`: pandoc converts every `*.md` into both `*.html` (slidy slides, self-contained) and `*.pdf` (beamer via `lualatex`).
- `proiect/`: pandoc converts `README.md` → `index.html`.
- `curs/code/`: Java design-pattern demos. `make` compiles all `*.java`; `make run` compiles and runs each class.

`include.mk` at the root defines the shared pandoc pipeline (pattern rules for `.md → .html` and `.md → .pdf`) and is included by every subdirectory Makefile. Changing pandoc options (e.g. the plantuml jar path, currently hardcoded to `/usr/share/plantuml/plantuml.jar`) belongs there, not in the subdirectory Makefiles.

To rebuild a single slide deck, run make in its subdirectory:

```bash
make -C curs 04-patterns.pdf
make -C lab  Lab03.html
```

## Diagram pipeline

`diagram/diagram.lua` is a pandoc Lua filter that transcodes fenced code blocks (plantuml, graphviz, etc.) into embedded images during the pandoc run. It's wired in via `include.mk`'s `--lua-filter=../diagram/diagram.lua`. Slide authors write UML as plantuml code blocks inside the `.md` source; the filter renders them at build time — there are no committed image artifacts for those diagrams.

## System dependencies

The pipeline requires a working Haskell toolchain (for pandoc built via `stack install pandoc-cli`), a TeX Live install with `lualatex`, `plantuml` + JDK, and `librsvg2-bin` (for `rsvg-convert`, used by the Lua filter). See `README.md` for the full apt install list.

## Generated files

`*.html` and `*.pdf` alongside every `*.md` in `curs/` and `lab/` are build artifacts but **are committed** to the repo (this is a GitHub Pages site serving them directly). Rebuild them when editing the corresponding `.md`, and include the regenerated outputs in the same commit.

Same applies to `curs/code/*.class` (also committed) and `proiect/index.html`.

`examen_scris.{aux,fdb_latexmk,fls,log,pdf}` in the root are LaTeX build leftovers from `examen_scris.tex`, untracked and safe to ignore.
