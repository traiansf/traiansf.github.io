# AMSS 2026 Scaffolding Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Stand up a complete-but-empty AMSS 2026 source tree at `class/amss-2026/` that builds end-to-end via the existing pandoc/plantuml/lualatex pipeline, publishes a stubbed site to `class/amss2026/`, and ships a canonical agentic-tooling config ready for student onboarding. Content authoring (filling in the lecture/lab/project prose) happens after this plan in separate work.

**Architecture:** Mirror the AMSS 2025 source-tree pattern (documented in `class/amss/CLAUDE.md`) at a new `class/amss-2026/` directory. Duplicate the build pipeline files (`include.mk`, `diagram/diagram.lua`, per-subdir Makefiles) rather than shared-source them — keeping 2025 and 2026 fully independent so neither year's work can break the other. Add a new `tooling/` subdir holding the canonical agentic-tooling config (Continue.dev / Cline workspace + sample model-endpoint config + student setup guide).

**Tech Stack:** pandoc (slidy for HTML, beamer for PDF), lualatex (TeX Live), plantuml + JDK, librsvg2-bin, GNU make, rsync (for static files), GitHub Pages. New for 2026: VS Code + Continue.dev or Cline as the agentic-AI client; pluggable model endpoint (institutional vLLM at `llm.fmi.unibuc.ro` / Gemini free-tier / pooled paid API via LiteLLM).

**Spec reference:** `class/amss/docs/superpowers/specs/2026-05-01-amss-ai-redesign-design.md`

**Naming convention.**
- Sources: `class/amss-2026/` (hyphen — sibling to existing `class/amss/` which holds 2025 sources).
- Published site: `class/amss2026/` (no hyphen — matches existing `class/amss2025/`).
- Build is invoked from `class/amss-2026/` via `make`; default `BASE` resolves to `../amss2026`.

**Done when:**
1. `make` (run from `class/amss-2026/`) produces a complete `class/amss2026/` tree with stub HTML+PDF for every lecture, lab, project, and resit-exam artifact, plus the static landing page.
2. Every link on `class/amss2026/index.html` resolves.
3. The `class/amss-2026/tooling/` directory contains a clone-and-run agentic-AI setup that a fresh student can install in <30 min.
4. `class/amss/CLAUDE.md` and `class/amss-2026/CLAUDE.md` together document the new layout for future sessions.

---

## Task 1: Build pipeline scaffolding

Stand up the makefile structure that mirrors `class/amss/`, with `BASE` defaulting to `../amss2026`. Duplicate the pipeline files rather than shared-sourcing.

**Files:**
- Create: `class/amss-2026/Makefile`
- Create: `class/amss-2026/include.mk`
- Create: `class/amss-2026/diagram/diagram.lua` (copy of `class/amss/diagram/diagram.lua`)
- Create: `class/amss-2026/curs/Makefile`
- Create: `class/amss-2026/lab/Makefile`
- Create: `class/amss-2026/proiect/Makefile`
- Create: `class/amss-2026/exam/Makefile`
- Reference: `class/amss/Makefile`, `class/amss/include.mk`, `class/amss/curs/Makefile`, `class/amss/lab/Makefile`, `class/amss/proiect/Makefile` (these are the templates)

- [ ] **Step 1: Create the source-tree directories**

```bash
mkdir -p class/amss-2026/{curs,lab,proiect,exam,diagram,tooling,static}
```

Verify:
```bash
find class/amss-2026 -type d | sort
```
Expected output:
```
class/amss-2026
class/amss-2026/curs
class/amss-2026/diagram
class/amss-2026/exam
class/amss-2026/lab
class/amss-2026/proiect
class/amss-2026/static
class/amss-2026/tooling
```

- [ ] **Step 2: Copy `diagram.lua` to the new tree**

```bash
cp class/amss/diagram/diagram.lua class/amss-2026/diagram/diagram.lua
```

Verify:
```bash
diff class/amss/diagram/diagram.lua class/amss-2026/diagram/diagram.lua
```
Expected: no output (files identical).

- [ ] **Step 3: Create `class/amss-2026/include.mk` with BASE defaulting to `../amss2026`**

Write to `class/amss-2026/include.mk`:

```makefile
ifndef SUBDIR
$(error SUBDIR must be set by the including Makefile)
endif

AMSS_ROOT := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
BASE ?= $(abspath $(AMSS_ROOT)/../amss2026)
OUTDIR := $(BASE)/$(SUBDIR)

OPTIONS = --embed-resources --standalone --lua-filter=$(AMSS_ROOT)/diagram/diagram.lua --metadata=plantumlPath:"/usr/share/plantuml/plantuml.jar"

.PHONY: all clean
all: $(TARGETS)

clean::
	rm -f $(TARGETS)

$(OUTDIR)/%.html: %.md
	@mkdir -p $(dir $@)
	pandoc $(OPTIONS) -t slidy -s -o $@ $<

$(OUTDIR)/%.pdf: %.md
	@mkdir -p $(dir $@)
	pandoc --pdf-engine=lualatex $(OPTIONS) -t beamer -o $@ $<
```

(Note: `clean::` is a Make double-colon target. It lets subdir Makefiles — like `exam/Makefile` — define their *own* `clean::` rules that compose with this one rather than overriding it. This is how `exam/` cleans the lualatex auxiliary files.)

Verify:
```bash
diff <(sed 's|amss2025|amss2026|' class/amss/include.mk) class/amss-2026/include.mk
```
Expected: no output (the only difference between the two `include.mk` files is the BASE default).

- [ ] **Step 4: Create `class/amss-2026/Makefile` (top-level recursive)**

Write to `class/amss-2026/Makefile`:

```makefile
BASE ?= ../amss2026
export BASE := $(abspath $(BASE))

AMSS_ROOT := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))

.PHONY: all clean curs lab proiect exam static

all: curs lab proiect exam static

curs lab proiect exam:
	$(MAKE) -C $@

static:
	@mkdir -p $(BASE)
	rsync -a $(AMSS_ROOT)/static/ $(BASE)/

clean:
	$(MAKE) -C curs clean
	$(MAKE) -C lab clean
	$(MAKE) -C proiect clean
	$(MAKE) -C exam clean
```

Differences from `class/amss/Makefile`: BASE defaults to `../amss2026`; `code` target dropped (Java demos not part of 2026 scaffolding); `exam` target added (resit-exam tex sources).

- [ ] **Step 5: Create per-subdir Makefiles**

Write to `class/amss-2026/curs/Makefile`:

```makefile
SUBDIR = curs

MDS = $(wildcard *.md)
HTMLS = $(patsubst %.md,$(OUTDIR)/%.html,$(MDS))
PDFS = $(patsubst %.md,$(OUTDIR)/%.pdf,$(MDS))

TARGETS = $(HTMLS) $(PDFS)

include ../include.mk
```

Write to `class/amss-2026/lab/Makefile` (same content, with `SUBDIR = lab`):

```makefile
SUBDIR = lab

MDS = $(wildcard *.md)
HTMLS = $(patsubst %.md,$(OUTDIR)/%.html,$(MDS))
PDFS = $(patsubst %.md,$(OUTDIR)/%.pdf,$(MDS))

TARGETS = $(HTMLS) $(PDFS)

include ../include.mk
```

Write to `class/amss-2026/proiect/Makefile`:

```makefile
SUBDIR = proiect

TARGETS = $(if $(wildcard README.md),$(OUTDIR)/index.html)

include ../include.mk

$(OUTDIR)/index.html: README.md Makefile
	@mkdir -p $(dir $@)
	pandoc $(OPTIONS) -s -o $@ $<
```

(The conditional `TARGETS` deviates from the 2025 `proiect/Makefile`. Reason: the 2025 Makefile assumes `README.md` exists; in this scaffolding plan, `proiect/Makefile` is created in Task 1 but `README.md` does not exist until Task 4. Without the conditional, `make` between Task 1 and Task 4 fails with "No rule to make target 'README.md'". The wildcard makes TARGETS empty when `README.md` is absent, mirroring how `curs/` and `lab/` Makefiles handle no-source-files via `$(wildcard *.md)`.)

Write to `class/amss-2026/exam/Makefile`:

```makefile
SUBDIR = exam

TEXS = $(wildcard *.tex)
PDFS = $(patsubst %.tex,$(OUTDIR)/%.pdf,$(TEXS))
AUX_EXTS = aux log toc fls fdb_latexmk out
AUX_FILES = $(foreach ext,$(AUX_EXTS),$(patsubst %.tex,$(OUTDIR)/%.$(ext),$(TEXS)))

TARGETS = $(PDFS)

include ../include.mk

clean::
	rm -f $(AUX_FILES)

$(OUTDIR)/%.pdf: %.tex
	@mkdir -p $(dir $@)
	cd $(dir $<) && lualatex -interaction=nonstopmode -output-directory=$(OUTDIR) $(notdir $<)
```

(The `clean::` rule here composes with `include.mk`'s `clean::` to remove lualatex's auxiliary files — `.aux`, `.log`, `.toc`, `.fls`, `.fdb_latexmk`, `.out` — that lualatex writes alongside the `.pdf` when `-output-directory` is used.)

- [ ] **Step 6: Verify the empty-tree build succeeds**

Run from `class/amss-2026/`:
```bash
make BASE=/tmp/amss2026-test 2>&1
```
Expected: each subdir Makefile is invoked, no `.md` or `.tex` files exist yet so no targets get built, exit code 0. The `static` target rsyncs the (currently empty) `static/` tree.

Then verify the test output dir:
```bash
find /tmp/amss2026-test -type f
ls -la /tmp/amss2026-test
```
Expected: `find` prints nothing (no files yet); `ls -la` shows only `.` and `..` entries. The static rsync from an empty source produces an empty target.

Clean up:
```bash
rm -rf /tmp/amss2026-test
```

- [ ] **Step 7: Commit**

```bash
git add class/amss-2026/Makefile class/amss-2026/include.mk class/amss-2026/diagram/diagram.lua class/amss-2026/curs/Makefile class/amss-2026/lab/Makefile class/amss-2026/proiect/Makefile class/amss-2026/exam/Makefile
git commit -m "Scaffold AMSS 2026 build pipeline (Makefiles + include.mk + diagram filter)"
```

---

## Task 2: Stub 14 lecture decks

Create one stub markdown file per lecture, with frontmatter and a single placeholder section. Lecture titles match the spec's 14-week table verbatim.

**Files:**
- Create: `class/amss-2026/curs/01-intro.md`
- Create: `class/amss-2026/curs/02-requirements.md`
- Create: `class/amss-2026/curs/03-testable-specs.md`
- Create: `class/amss-2026/curs/04-class-diagrams.md`
- Create: `class/amss-2026/curs/05-other-structural.md`
- Create: `class/amss-2026/curs/06-behavioral-i.md`
- Create: `class/amss-2026/curs/07-behavioral-ii.md`
- Create: `class/amss-2026/curs/08-patterns-i.md`
- Create: `class/amss-2026/curs/09-patterns-ii.md`
- Create: `class/amss-2026/curs/10-traceability.md`
- Create: `class/amss-2026/curs/11-evaluation.md`
- Create: `class/amss-2026/curs/12-presentation-skills.md`
- Create: `class/amss-2026/curs/13-workshop.md`
- Create: `class/amss-2026/curs/14-final.md`

- [ ] **Step 1: Stub `01-intro.md`**

Write to `class/amss-2026/curs/01-intro.md`:

```markdown
---
title: "AMSS 2026 — Lecture 1: Intro + the AI-Mediated SDLC"
author: "Traian-Florin Șerbănuță"
date: "2026"
---

# Welcome

- Course: AMSS 2026 — Analiza și Modelarea Sistemelor Software (ediția AI-mediated)
- Instructor: Traian-Florin Șerbănuță
- Semester: Fall 2026

::: notes
Stub — content to be authored. Reference: docs/superpowers/specs/2026-05-01-amss-ai-redesign-design.md §2 (W1 row).
:::
```

- [ ] **Step 2: Stub the remaining 13 lectures using the same template**

Use this template, substituting the title per the table below. Body for every stub is identical: a single `# Stub` heading and a `::: notes` block pointing to the spec section.

```markdown
---
title: "AMSS 2026 — Lecture {N}: {Title}"
author: "Traian-Florin Șerbănuță"
date: "2026"
---

# Stub

::: notes
Stub — content to be authored. Reference: docs/superpowers/specs/2026-05-01-amss-ai-redesign-design.md §2 (W{N} row).
:::
```

| File | N | Title |
|---|---|---|
| `02-requirements.md` | 2 | Requirements with AI |
| `03-testable-specs.md` | 3 | Testable Specs & TDD-as-Spec |
| `04-class-diagrams.md` | 4 | Class Diagrams in the AI Loop |
| `05-other-structural.md` | 5 | Other Structural Views |
| `06-behavioral-i.md` | 6 | Behavioral I — Use Cases + Sequence |
| `07-behavioral-ii.md` | 7 | Behavioral II — State + Activity |
| `08-patterns-i.md` | 8 | Patterns I — Selection |
| `09-patterns-ii.md` | 9 | Patterns II — Integration & Critique |
| `10-traceability.md` | 10 | Cross-Layer Traceability |
| `11-evaluation.md` | 11 | Model Evaluation & Quality |
| `12-presentation-skills.md` | 12 | Presentation & Defense Skills |
| `13-workshop.md` | 13 | Project Workshop / Open Q&A |
| `14-final.md` | 14 | Final Presentations |

- [ ] **Step 3: Build the lecture stubs and confirm output**

Run from `class/amss-2026/`:
```bash
make -C curs BASE=/tmp/amss2026-test
```
Expected: 28 build invocations succeed (14 HTML + 14 PDF); each output ends up at `/tmp/amss2026-test/curs/{N}-{slug}.{html,pdf}`.

Verify:
```bash
ls /tmp/amss2026-test/curs/ | wc -l
```
Expected: `28`.

Clean up:
```bash
rm -rf /tmp/amss2026-test
```

- [ ] **Step 4: Commit**

```bash
git add class/amss-2026/curs/*.md
git commit -m "Stub 14 AMSS 2026 lecture decks"
```

---

## Task 3: Stub 7 lab decks

Same approach as Task 2. Lab titles match the spec's lab table.

**Files:**
- Create: `class/amss-2026/lab/Lab01.md`
- Create: `class/amss-2026/lab/Lab02.md`
- Create: `class/amss-2026/lab/Lab03.md`
- Create: `class/amss-2026/lab/Lab04.md`
- Create: `class/amss-2026/lab/Lab05.md`
- Create: `class/amss-2026/lab/Lab06.md`
- Create: `class/amss-2026/lab/Lab07.md`

- [ ] **Step 1: Stub each lab using a single template**

Template (per-file substitution: lab number, title, mode, deliverable):

```markdown
---
title: "AMSS 2026 — Lab {N}: {Title}"
author: "Traian-Florin Șerbănuță"
date: "2026"
---

# Stub

**Mode:** {Mode} · **Deliverable:** {Deliverable}

::: notes
Stub — content to be authored. Reference: docs/superpowers/specs/2026-05-01-amss-ai-redesign-design.md §3 (Lab {N} row).
:::
```

| File | N | Title | Mode | Deliverable |
|---|---|---|---|---|
| `Lab01.md` | 1 | Tooling Onboarding + Requirements with AI | Skill drill | Requirements doc + AI-failure-mode reflection |
| `Lab02.md` | 2 | Class Diagrams from Spec | Skill drill | PlantUML class diagram + critique log |
| `Lab03.md` | 3 | Critique Session — Structural Artifacts | Critique / red-team | Defect log per team |
| `Lab04.md` | 4 | Critique Session — Behavioral Artifacts | Critique / red-team | Defect log per team |
| `Lab05.md` | 5 | Project Workshop + Checkpoint Defense | Project workshop | Intermediate checkpoint (1 pt) |
| `Lab06.md` | 6 | Project Workshop + Cold-Defense Dry Run | Project workshop | Dry-run feedback |
| `Lab07.md` | 7 | Final Presentations | Final | Final project grade |

- [ ] **Step 2: Build the lab stubs and confirm output**

Run from `class/amss-2026/`:
```bash
make -C lab BASE=/tmp/amss2026-test
```
Expected: 14 build invocations succeed (7 HTML + 7 PDF).

Verify:
```bash
ls /tmp/amss2026-test/lab/ | wc -l
```
Expected: `14`.

Clean up:
```bash
rm -rf /tmp/amss2026-test
```

- [ ] **Step 3: Commit**

```bash
git add class/amss-2026/lab/*.md
git commit -m "Stub 7 AMSS 2026 lab decks"
```

---

## Task 4: Stub the project README

Create the project description that students will read. Stub matches the spec's Section 4 structure (team shape, deliverables, rubric) so the placeholder is informative rather than empty.

**Files:**
- Create: `class/amss-2026/proiect/README.md`

- [ ] **Step 1: Write the README stub**

Write to `class/amss-2026/proiect/README.md`:

```markdown
---
title: "Proiect AMSS 2026"
author: "Traian-Florin Șerbănuță"
date: "2026"
---

# Proiect AMSS 2026

> **Stub.** Conținut detaliat de redactat. Referință completă: `docs/superpowers/specs/2026-05-01-amss-ai-redesign-design.md` §4.

## Echipă și temă

- Echipe de **3–5 studenți**.
- Tema aleasă până pe **31 octombrie 2026**.
- Mai multe echipe pot alege aceeași temă.

## Livrabile per echipă

- Repository de proiect (GitHub/GitLab) — public în cohortă.
- Diagramă generală a sistemului.
- Document comun de cerințe (cu trasabilitate către sliceurile individuale).
- Prezentare finală (W14 + Lab 7).

## Livrabile per student

Fiecare student deține un **slice** coerent al sistemului și produce:

1. Narativ de design dirijat (transcript AI + decizii).
2. Defect log (≥ 5 defecte substanțiale).
3. Două diagrame UML (una structurală + una comportamentală) — generate AI, revizuite și corectate de student.
4. Reflecție TDD-cu-AI (≤ 2 pagini).
5. Cel puțin un design pattern aplicat.

## Barem (8 puncte)

| Componentă | Puncte |
|---|---|
| Apărare orală (W14) | 3 |
| Narativ design + defect log | 2 |
| Calitatea documentației | 1 |
| Design patterns | 1 |
| Checkpoint decembrie (Lab 5) | 1 |

## TDD-cu-AI

Buclă obligatorie pentru cel puțin o caracteristică din slice-ul fiecărui student. **Nu se notează** codul rezultat — doar reflecția asupra a ceea ce a dezvăluit bucla despre precizia specificației.

## Notă finală

8 (proiect) + 1 (prezență) + 1 (din oficiu) = 10.

## Examen scris (restanță)

Pentru sesiunea de restanțe, vezi `../exam/examen-2026.pdf` (format R2: critică F1 + raționament F3 + trasabilitate F4).
```

- [ ] **Step 2: Build the project page and confirm output**

Run from `class/amss-2026/`:
```bash
make -C proiect BASE=/tmp/amss2026-test
```
Expected: 1 file produced, `/tmp/amss2026-test/proiect/index.html`.

Verify:
```bash
test -f /tmp/amss2026-test/proiect/index.html && echo "ok"
```
Expected: `ok`.

Clean up:
```bash
rm -rf /tmp/amss2026-test
```

- [ ] **Step 3: Commit**

```bash
git add class/amss-2026/proiect/README.md
git commit -m "Stub AMSS 2026 project README"
```

---

## Task 5: Stub the resit exam template

Reshape the existing `examen_scris.tex` (currently in the working directory at the repo root, untracked) into the R2 format described in the spec's Section 5. The new file lives under `class/amss-2026/exam/`.

**Files:**
- Create: `class/amss-2026/exam/examen-2026.tex`
- Reference: `examen_scris.tex` (existing untracked file at repo root, structure may inform the new template)

- [ ] **Step 1: Write the resit-exam template**

Write to `class/amss-2026/exam/examen-2026.tex`:

```latex
\documentclass[12pt,a4paper]{article}
\usepackage[romanian]{babel}
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage{geometry}
\geometry{margin=2.5cm}

\title{AMSS 2026 — Examen restanță}
\author{Traian-Florin Șerbănuță}
\date{2026}

\begin{document}
\maketitle

\textbf{Durată:} 90 de minute. \textbf{Format:} test scris, fără AI.

\noindent Acest test verifică nivelul minim de competență
(F1 + F3 + F4 din specificația cursului): citirea critică a
diagramelor UML generate de AI, articularea raționamentului de design,
și apărarea trasabilității.

\section*{Specificația sistemului}

\textit{Stub — de înlocuit anual cu o specificație nouă (1--2 pagini).}

\section*{Artefacte furnizate}

\textit{Stub — de înlocuit anual cu un set de artefacte generate de AI:
documentul de cerințe, o diagramă de clase, o diagramă comportamentală.}

\section*{Partea I — Critică (F1)}

Identificați defectele din artefactele furnizate.
Pentru fiecare defect specificați:
\begin{enumerate}
    \item Locul defectului (ce artefact, ce element).
    \item Categoria (fabricație, vagitate, multiplicitate greșită,
          guard lipsă, etc.).
    \item Severitatea (critică / majoră / minoră).
    \item Corecția propusă.
\end{enumerate}

\textit{Spațiu pentru răspuns.}

\section*{Partea II — Raționament (F3)}

\textit{Dată cerința Rx:} \dots

Cum ați dirija un AI pentru a produce o diagramă de stare pentru
această cerință? Ce ați respinge din output-ul tipic și de ce?

\textit{Spațiu pentru răspuns.}

\section*{Partea III — Trasabilitate (F4)}

Identificați o inconsistență între cerința Rx și elementul X
din diagrama de clase. Parcurgeți lanțul de trasabilitate care
expune problema.

\textit{Spațiu pentru răspuns.}

\end{document}
```

- [ ] **Step 2: Build the exam PDF and confirm output**

Run from `class/amss-2026/`:
```bash
make -C exam BASE=/tmp/amss2026-test
```
Expected: 1 file produced, `/tmp/amss2026-test/exam/examen-2026.pdf`.

Verify:
```bash
test -f /tmp/amss2026-test/exam/examen-2026.pdf && echo "ok"
```
Expected: `ok`.

Clean up:
```bash
rm -rf /tmp/amss2026-test
```

- [ ] **Step 3: Commit**

```bash
git add class/amss-2026/exam/examen-2026.tex
git commit -m "Stub AMSS 2026 resit-exam template (R2 format)"
```

---

## Task 6: Stub the landing page

The static landing page at `static/index.html` is the hand-maintained TOC linking to every built artifact. It rsyncs into the published tree verbatim. Mirror the AMSS 2025 layout.

**Files:**
- Create: `class/amss-2026/static/index.html`
- Reference: `class/amss/static/index.html` (existing 2025 landing page — template)

- [ ] **Step 1: Write the landing page**

Write to `class/amss-2026/static/index.html`:

```html
<html>
  <head>
    <meta charset="utf-8" />
    <title>AMSS 2026 — Analiza și Modelarea Sistemelor Software (ediția AI-mediated)</title>
  </head>
  <body>
    <h1>AMSS 2026</h1>
    <p><i>Analiza și Modelarea Sistemelor Software — ediția AI-mediated</i></p>

    <h2>Curs</h2>
    <ol>
      <li><a href="curs/01-intro.html">Intro + AI-mediated SDLC</a> [<a href="curs/01-intro.pdf">PDF</a>]</li>
      <li><a href="curs/02-requirements.html">Requirements with AI</a> [<a href="curs/02-requirements.pdf">PDF</a>]</li>
      <li><a href="curs/03-testable-specs.html">Testable Specs &amp; TDD-as-Spec</a> [<a href="curs/03-testable-specs.pdf">PDF</a>]</li>
      <li><a href="curs/04-class-diagrams.html">Class Diagrams in the AI Loop</a> [<a href="curs/04-class-diagrams.pdf">PDF</a>]</li>
      <li><a href="curs/05-other-structural.html">Other Structural Views</a> [<a href="curs/05-other-structural.pdf">PDF</a>]</li>
      <li><a href="curs/06-behavioral-i.html">Behavioral I — Use Cases + Sequence</a> [<a href="curs/06-behavioral-i.pdf">PDF</a>]</li>
      <li><a href="curs/07-behavioral-ii.html">Behavioral II — State + Activity</a> [<a href="curs/07-behavioral-ii.pdf">PDF</a>]</li>
      <li><a href="curs/08-patterns-i.html">Patterns I — Selection</a> [<a href="curs/08-patterns-i.pdf">PDF</a>]</li>
      <li><a href="curs/09-patterns-ii.html">Patterns II — Integration &amp; Critique</a> [<a href="curs/09-patterns-ii.pdf">PDF</a>]</li>
      <li><a href="curs/10-traceability.html">Cross-Layer Traceability</a> [<a href="curs/10-traceability.pdf">PDF</a>]</li>
      <li><a href="curs/11-evaluation.html">Model Evaluation &amp; Quality</a> [<a href="curs/11-evaluation.pdf">PDF</a>]</li>
      <li><a href="curs/12-presentation-skills.html">Presentation &amp; Defense Skills</a> [<a href="curs/12-presentation-skills.pdf">PDF</a>]</li>
      <li><a href="curs/13-workshop.html">Project Workshop / Open Q&amp;A</a> [<a href="curs/13-workshop.pdf">PDF</a>]</li>
      <li><a href="curs/14-final.html">Final Presentations</a> [<a href="curs/14-final.pdf">PDF</a>]</li>
    </ol>

    <h2>Laborator</h2>
    <ol>
      <li><a href="lab/Lab01.html">Tooling Onboarding + Requirements with AI</a> [<a href="lab/Lab01.pdf">PDF</a>]</li>
      <li><a href="lab/Lab02.html">Class Diagrams from Spec</a> [<a href="lab/Lab02.pdf">PDF</a>]</li>
      <li><a href="lab/Lab03.html">Critique Session — Structural Artifacts</a> [<a href="lab/Lab03.pdf">PDF</a>]</li>
      <li><a href="lab/Lab04.html">Critique Session — Behavioral Artifacts</a> [<a href="lab/Lab04.pdf">PDF</a>]</li>
      <li><a href="lab/Lab05.html">Project Workshop + Checkpoint Defense</a> [<a href="lab/Lab05.pdf">PDF</a>]</li>
      <li><a href="lab/Lab06.html">Project Workshop + Cold-Defense Dry Run</a> [<a href="lab/Lab06.pdf">PDF</a>]</li>
      <li><a href="lab/Lab07.html">Final Presentations</a> [<a href="lab/Lab07.pdf">PDF</a>]</li>
    </ol>

    <h2>Proiect</h2>
    <ul>
      <li><a href="proiect/">Pagina dedicată</a></li>
    </ul>

    <h2>Examen restanță</h2>
    <ul>
      <li><a href="exam/examen-2026.pdf">Template (PDF)</a></li>
    </ul>

    <h2>Tooling</h2>
    <ul>
      <li><a href="https://github.com/traiansf/amss-2026-tooling">Setup canonic agentic (Continue.dev / Cline)</a> — <i>placeholder URL — de înlocuit cu repo-ul real</i></li>
    </ul>

    <h2>Comunicare</h2>
    <ul>
      <li><i>Stub — Teams link de adăugat înainte de începutul semestrului.</i></li>
    </ul>
  </body>
</html>
```

- [ ] **Step 2: Run the static target and verify**

Run from `class/amss-2026/`:
```bash
make static BASE=/tmp/amss2026-test
```
Expected: rsync copies `static/` into `/tmp/amss2026-test/`.

Verify:
```bash
test -f /tmp/amss2026-test/index.html && echo "ok"
```
Expected: `ok`.

Clean up:
```bash
rm -rf /tmp/amss2026-test
```

- [ ] **Step 3: Commit**

```bash
git add class/amss-2026/static/index.html
git commit -m "Stub AMSS 2026 landing page"
```

---

## Task 7: Canonical agentic-tooling config

Drop in the clone-and-run setup that every student will use. The model endpoint is parameterized via a single config value so the procurement decision can be deferred. Defaults to `llm.fmi.unibuc.ro` with comments showing how to switch to Gemini free-tier or pooled paid API.

**Files:**
- Create: `class/amss-2026/tooling/README.md`
- Create: `class/amss-2026/tooling/.continue/config.yaml`
- Create: `class/amss-2026/tooling/SETUP.md`

- [ ] **Step 1: Write the tooling README**

Write to `class/amss-2026/tooling/README.md`:

```markdown
# AMSS 2026 — Canonical Agentic Tooling

This directory holds the **single canonical setup** every student in the cohort runs:
one editor extension, one model endpoint, one config file. The setup is designed
to clone-and-run on any laptop with VS Code and ~30 minutes.

## What's here

- `.continue/config.yaml` — Continue.dev configuration, ready to plug into a model endpoint.
- `SETUP.md` — step-by-step student onboarding (~30 min).

## Why this setup

The course assumes **agentic** AI access (file-and-repo-aware tooling, not chat in
a browser). Continue.dev is used as the baseline because it is open-source, runs
inside VS Code, and supports any OpenAI-compatible endpoint — which means the
*same* config works whether the cohort points at `llm.fmi.unibuc.ro`, Google
Gemini's free tier, or a pooled paid endpoint via LiteLLM.

Students who BYO higher-end tooling (Claude Code, Copilot, Cursor) may use it on
their own accounts, but graded artifacts must reproduce on this canonical setup.

## Procurement options

See the design spec, §6 "Tooling stack", for the three procurement paths
(institutional self-hosted / per-student free-tier / pooled paid API) and the
recommended order. Pick one before W1 and update the endpoint URL in
`.continue/config.yaml`.

## Reference

Design spec: `../../amss/docs/superpowers/specs/2026-05-01-amss-ai-redesign-design.md`
```

- [ ] **Step 2: Write the Continue.dev config**

Write to `class/amss-2026/tooling/.continue/config.yaml`:

```yaml
# AMSS 2026 — canonical Continue.dev configuration
#
# To switch model endpoints, change ONLY the `apiBase` and `apiKey` fields below.
# The rest of the cohort runs the exact same config — that is the parity rule.
#
# Procurement options (see spec §6):
#
# 1. Institutional self-hosted (preferred):
#      apiBase: "https://llm.fmi.unibuc.ro/v1"
#      apiKey: "<student-issued token from FMI>"
#      model: "qwen3-coder-30b"   # or whatever the server serves
#
# 2. Per-student Gemini free-tier (fallback):
#      apiBase: "https://generativelanguage.googleapis.com/v1beta/openai"
#      apiKey: "<student's own Google AI Studio key>"
#      model: "gemini-2.5-flash"
#
# 3. Pooled paid API via LiteLLM proxy (last resort):
#      apiBase: "https://litellm.<course-domain>/v1"
#      apiKey: "<per-student key issued by instructor>"
#      model: "deepseek-coder"

name: amss-2026
version: 0.0.1
schema: v1

models:
  - name: amss-default
    provider: openai
    model: REPLACE_BEFORE_W1
    apiBase: REPLACE_BEFORE_W1
    apiKey: REPLACE_BEFORE_W1
    roles:
      - chat
      - edit
      - apply

context:
  - provider: file
  - provider: code
  - provider: docs
  - provider: diff
  - provider: terminal
```

- [ ] **Step 3: Write the student onboarding guide**

Write to `class/amss-2026/tooling/SETUP.md`:

```markdown
# AMSS 2026 — Student Setup (~30 min)

## Prerequisites

- VS Code installed.
- Git installed.
- Course-issued model-endpoint credentials (handed out in Lab 1).

## Steps

1. **Clone the course repo.**

   ```bash
   git clone <course-repo-url> amss-2026
   cd amss-2026/tooling
   ```

2. **Install Continue.dev.**

   In VS Code, open the Extensions panel and search "Continue". Install the
   extension by Continue Dev, Inc.

3. **Point Continue.dev at the canonical config.**

   Copy `.continue/config.yaml` into your home directory's Continue config
   location:
   - Linux/macOS: `~/.continue/config.yaml`
   - Windows: `%USERPROFILE%\.continue\config.yaml`

4. **Fill in the three `REPLACE_BEFORE_W1` placeholders** in your local copy
   with the credentials handed out in Lab 1 (model name, apiBase, apiKey).

5. **Smoke test.**

   Open any file in VS Code, hit the Continue keybinding (default: Ctrl+L),
   and ask: "summarize this file in one sentence." If you get a response,
   you're set.

## Troubleshooting

- *Network error / 401:* check the apiKey was pasted without leading/trailing
  whitespace.
- *Model not found:* check the `model` field matches what the endpoint actually
  serves (the Lab 1 handout names this).
- *Off-campus / VPN issues with the institutional endpoint:* fall back to the
  Gemini free-tier configuration in `config.yaml`'s comment header.

## What is NOT this setup

You may *also* use Claude Code, Copilot, Cursor on your own account — but
graded artifacts (the directed-design narrative, defect log, TDD reflection)
must reproduce on this canonical setup. In practice: do your work in either,
but verify your final artifacts work when run through Continue.dev pointed
at the course endpoint.
```

- [ ] **Step 4: Commit**

```bash
git add class/amss-2026/tooling/README.md class/amss-2026/tooling/.continue/config.yaml class/amss-2026/tooling/SETUP.md
git commit -m "Add AMSS 2026 canonical agentic-tooling config (Continue.dev)"
```

---

## Task 8: Update CLAUDE.md files

Document the new layout so future Claude Code sessions working in either tree have correct context.

**Files:**
- Modify: `class/amss/CLAUDE.md` (add a section pointing at the 2026 tree)
- Create: `class/amss-2026/CLAUDE.md` (2026-specific guidance)

- [ ] **Step 1: Append a "Sibling tree: AMSS 2026" section to `class/amss/CLAUDE.md`**

Append the following to the end of `class/amss/CLAUDE.md`:

```markdown

## Sibling tree: AMSS 2026

Source for the **2026 edition** of the course lives in `../amss-2026/`, not in this directory. That edition is a complete redesign around AI-mediated software design (architect-and-critic pedagogy). See `class/amss-2026/CLAUDE.md` for the 2026 tree's specifics, and `docs/superpowers/specs/2026-05-01-amss-ai-redesign-design.md` for the full design spec.

The two trees are intentionally independent — they share no Makefiles or pipeline files, so changes to one cannot break the other. Build outputs go to sibling directories: `../amss2025/` from this tree, `../amss2026/` from `../amss-2026/`.
```

- [ ] **Step 2: Write `class/amss-2026/CLAUDE.md`**

Write to `class/amss-2026/CLAUDE.md`:

```markdown
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
- `static/` — hand-maintained landing page and assets that ship verbatim to `../amss2026/`.
- `tooling/` — canonical agentic-AI setup (Continue.dev workspace + setup guide). Distributed to students unchanged.
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

Procurement decision (institutional `llm.fmi.unibuc.ro` / per-student Gemini free-tier / pooled paid API) is open. The canonical config in `tooling/.continue/config.yaml` has `REPLACE_BEFORE_W1` placeholders for the three endpoint fields; fill in once the procurement choice is made. See spec §6 for the option matrix.

## Relationship to the 2025 tree

Existing AMSS 2025 lab scenarios (`../amss/lab/Lab03.md` parking lot, `Lab04.md` ATM, `Lab05.md` drone CAS) are **gold for the new critique labs (Lab 3 and Lab 4)** — they have well-understood "right answers" against which to seed plausible AI mistakes. When authoring the new critique labs, lift the scenarios; do not reinvent.

Java demos in `../amss/curs/code/` may serve as TDD-with-AI starter scenarios in Lab 1 onboarding or W3 lecture demos.
```

- [ ] **Step 3: Commit**

```bash
git add class/amss/CLAUDE.md class/amss-2026/CLAUDE.md
git commit -m "Document AMSS 2026 tree in CLAUDE.md (both 2025 and 2026 trees)"
```

---

## Task 9: End-to-end build verification + commit published site

Run a full clean build and confirm the published site is complete, then commit the generated artifacts (the repo serves them via GitHub Pages).

**Files:**
- Generates: `class/amss2026/curs/*.html`, `class/amss2026/curs/*.pdf` (28 files)
- Generates: `class/amss2026/lab/*.html`, `class/amss2026/lab/*.pdf` (14 files)
- Generates: `class/amss2026/proiect/index.html`
- Generates: `class/amss2026/exam/examen-2026.pdf`
- Generates: `class/amss2026/index.html` (rsynced from `static/`)
- Generates: `class/amss2026/curs/`, `class/amss2026/lab/`, `class/amss2026/exam/`, `class/amss2026/proiect/` (rsynced placeholder dirs)

- [ ] **Step 1: Clean build from scratch**

```bash
rm -rf class/amss2026
make -C class/amss-2026 clean
make -C class/amss-2026
```

Expected: build completes with exit code 0; no errors from pandoc, lualatex, plantuml, or rsync.

- [ ] **Step 2: Verify all expected artifacts exist**

```bash
test -f class/amss2026/index.html && echo "landing: ok"
ls class/amss2026/curs/*.html | wc -l   # expect 14
ls class/amss2026/curs/*.pdf | wc -l    # expect 14
ls class/amss2026/lab/*.html | wc -l    # expect 7
ls class/amss2026/lab/*.pdf | wc -l     # expect 7
test -f class/amss2026/proiect/index.html && echo "proiect: ok"
test -f class/amss2026/exam/examen-2026.pdf && echo "exam: ok"
```
Expected: all `ok` lines printed; the four counts read `14`, `14`, `7`, `7`.

- [ ] **Step 3: Verify every link on the landing page resolves**

```bash
cd class/amss2026
python3 -c "
import re, os
html = open('index.html').read()
hrefs = re.findall(r'href=\"([^\"]+)\"', html)
local = [h for h in hrefs if not h.startswith(('http://', 'https://', '#'))]
broken = [h for h in local if not os.path.exists(h.split('#')[0].rstrip('/') or 'index.html')]
print('total local:', len(local), 'broken:', len(broken))
for h in broken: print('  MISSING:', h)
"
cd -
```
Expected: `total local: 44 broken: 0` (or whatever the exact link count is — but `broken: 0` is the requirement).

If any links are broken, fix the typo in `class/amss-2026/static/index.html` and rebuild.

- [ ] **Step 4: Idempotency check**

```bash
make -C class/amss-2026 clean
make -C class/amss-2026
```

Expected: same artifact set as before, no errors. (Confirms the build is reproducible.)

- [ ] **Step 5: Commit the published site**

The published `class/amss2026/` artifacts are GitHub Pages content and are committed to the repo (matching the convention for `class/amss2025/`). Stage and commit:

```bash
git add class/amss2026
git commit -m "Publish initial AMSS 2026 stub site"
```

- [ ] **Step 6: Final sanity check**

```bash
git status
git log --oneline -10
```

Expected: working tree clean except for untracked LaTeX leftovers from the resit-exam build (`*.aux`, `*.log`, etc. — these are tracked-as-ignored noise and not part of this plan); recent commits reflect the 9-task progression.

---

## Plan complete

After Task 9, the milestone declared in **Done when** above is met:

1. ✅ `make` produces a complete `class/amss2026/` tree with stubs for every artifact.
2. ✅ Every link on the landing page resolves.
3. ✅ The `tooling/` directory is clone-and-run.
4. ✅ Both CLAUDE.md files document the new layout.

**What's next (out of scope for this plan):**

- Author actual lecture content for the 14 stubs (creative writing work, done lecture-by-lecture).
- Author actual lab exercises for the 7 stubs (similar).
- Flesh out the project README prose.
- Replace the resit-exam stub scenario with a real one.
- Resolve the procurement decision and replace the three `REPLACE_BEFORE_W1` placeholders in `.continue/config.yaml`.
- Pre-semester dry-run of Lab 1 mechanics with a small group.
- Curricular approval / academic-integrity statement (administrative).

These are tracked in the design spec's Section 7 migration path.
