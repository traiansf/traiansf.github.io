# Building AMSS 2026

The pipeline is `make` → pandoc (+ `diagram/diagram.lua`, `theme/amss.lua`) →
HTML decks and beamer PDF (via `lualatex`). Diagrams are fenced `plantuml` /
`mermaid` code blocks rendered at build time: SVG in HTML, PDF in beamer.

Every output is a single self-contained file. The HTML decks use pandoc's
`slidy` writer for the slide structure, with the course's own template, styles
and script from `theme/` instead of the Slidy runtime, so the build needs no
network access. See [Course look](#course-look).

## Dependencies

| Tool | Used for | Notes |
|---|---|---|
| GNU make + POSIX shell | driving the build | recipes use `mkdir -p`, `rm -f`, `cp -R`, `cd … &&` |
| pandoc ≥ 3.5 | md → HTML / beamer | tested with 3.6; older releases lack template fields the PDF cover and footer use |
| TeX Live (lualatex, beamer, fontspec, Latin Modern) | PDFs, exam | also `tikz`, `etoolbox`, `framed`, `fancyhdr` (in the packages listed below) |
| Noto Sans, Noto Sans Mono (optional) | PDF text | used when installed (TeX Live `noto`, or system fonts); otherwise the PDFs keep Latin Modern |
| `rsvg-convert` | SVG images in PDFs | ships with the Windows pandoc installer; `librsvg2-bin` on Linux |
| Java ≥ 11 + PlantUML + Graphviz (`dot`) | `plantuml` blocks | |
| Node.js + `@mermaid-js/mermaid-cli` (`mmdc`) + headless Chrome | `mermaid` blocks | |

## Linux (Debian/Ubuntu)

```bash
sudo apt install make pandoc texlive-luatex texlive-latex-extra texlive-lang-european \
  fonts-lmodern fonts-noto-core fonts-noto-mono librsvg2-bin default-jre graphviz plantuml nodejs npm
npm install -g @mermaid-js/mermaid-cli
npx puppeteer browsers install chrome-headless-shell
```

Distribution pandoc/plantuml packages can be old; if `pandoc --version` is < 3.5
or `plantuml -tpdf` fails, install the upstream release (pandoc `.deb`,
`plantuml.jar` + a `plantuml` shell wrapper on `PATH`).

## Windows (native, no WSL)

Build from **Git Bash** (it provides the POSIX shell the recipes need).

```powershell
winget install JohnMacFarlane.Pandoc          # includes rsvg-convert
winget install Graphviz.Graphviz               # then add C:\Program Files\Graphviz\bin to PATH
winget install EclipseAdoptium.Temurin.21.JDK
winget install OpenJS.NodeJS.LTS
npm install -g @mermaid-js/mermaid-cli
npx puppeteer browsers install chrome-headless-shell   # run inside %APPDATA%\npm\node_modules\@mermaid-js\mermaid-cli
```

TeX Live: install from <https://tug.org/texlive/windows.html>. GNU make: e.g.
`winget install ezwinports.make`, or any make on the Git Bash `PATH`.

PlantUML: download `plantuml.jar` from
<https://github.com/plantuml/plantuml/releases> into a folder on `PATH`
(e.g. `%LOCALAPPDATA%\Programs\plantuml`) next to a `plantuml.cmd`:

```bat
@java -Djava.awt.headless=true -jar "C:\Users\<you>\AppData\Local\Programs\plantuml\plantuml.jar" %*
```

Use the **absolute** jar path — pandoc launches the wrapper by name, so `%~dp0`
does not resolve to the wrapper's folder.

Pandoc on Windows can launch `.cmd` wrappers only by their full name, so
`include.mk` sets `PLANTUML_BIN=plantuml.cmd` and `MERMAID_BIN=mmdc.cmd` when
`OS=Windows_NT`. Override either variable to point elsewhere.

## Build

```bash
make                       # everything, into ../amss2026
make BASE=/tmp/preview     # local preview elsewhere
make -j4                   # diagrams are slow (JVM / headless Chrome per block)
make PREVIEW_ALL=1 BASE=/tmp/preview   # every deck, ignoring RELEASED
make fallback              # instructor-only prepared examples/captures in curs/fallback/ (never published)
```

`PREVIEW_ALL` refuses to run without `BASE`, so that unreleased decks cannot
land in the published tree by accident. `BASE` may be relative to this
directory; an empty `BASE` (an unset shell variable, say) is refused.

## Revealing a week

Lecture and lab decks are published week by week. `RELEASED` lists the decks
students can see (`curs/01-organizare`, `lab/01-specificare`, …). `make` builds only those,
deletes any other deck from the published tree, and renders the landing page
with unreleased entries as plain titles without links (the page says that
these are not available yet). The project page and the sample exam are always
published.

To reveal a week:

1. Add its lines to `RELEASED` (e.g. `curs/03-cerinte`, `lab/02-modelare`).
2. `make`
3. Commit and push the sources plus `../amss2026/`.

To take a deck down again, remove its line and repeat. Every landing-page
entry for a deck is a single `<li>` line carrying
`data-release="<dir>/<basename>"`; new decks need it.

Only the published site is gated: the sources (including `*-instructor.md`)
live in this public repository.

After a push, check that the site was deployed: the repository's Actions tab
shows the “pages build and deployment” run. GitHub Pages runs Jekyll over the
whole repository, these sources included, so a Markdown file can break the
deployment of the entire site. Known trap: a front-matter `date:` that is not a
real date (for example `2026/2027`) makes the build fail. The templates do not
show `date`, so leave it out.

## Optional orientation guide

`lab/00-pregatire` is released as a continuous HTML guide and printable PDF using explicit rules in `lab/Makefile`, rather than slide output. Questionnaire import tables live in `questionnaires/`; they are instructor resources, not automatically published forms.

## Course look

The palette (navy and teal, from the course logo) and the type are defined once
per medium; `include.mk` wires the files below into the pandoc calls and lists
them as prerequisites, so editing one rebuilds what depends on it.

| File | Role |
|---|---|
| `theme/course.yaml` | course label and name shown on covers, page headers and footers |
| `theme/amss.lua` | splits `AMSS 2026/2027 — Cursul 1: Titlu` into session and headline; marks the „Citatul zilei” epigraph and, under a translated quotation, its original wording; in documents drops a repeated first heading and any `notes` blocks; wraps tables, keeps ranges such as `10–12` and short hyphenated forms such as „te-ai” unbroken and avoids one-word last lines in decks; sets table headers in bold in the PDFs and rules off table rows in PDF decks; marks pauses for the HTML decks |
| `theme/code.theme` | syntax colours with enough contrast on the code panel, for HTML and PDF |
| `theme/deck.html`, `theme/deck.css`, `theme/deck.js` | HTML decks: template, styles, and the one-slide-at-a-time view |
| `theme/beamer.tex` | PDF decks (16:9, 10 pt) |
| `theme/doc.html`, `static/amss.css` | continuous documents (Lab 0, project page); the stylesheet is also linked by the course page |
| `theme/article.tex` | Lab 0 PDF (A4) |
| `static/assets/amss-2026-logo-480.webp`, `…-logo-360.png`, `…-mark-64.png` | logo sizes derived from `amss-2026-logo.png` for HTML covers, PDF covers and the favicon |

An HTML deck opens one slide at a time on a wide, landscape window: arrow
keys, Page Up/Down, Space, Home/End or a swipe move between slides; the bar at
the bottom has the outline, a switch to the all-slides view and the PDF. Text
scales with the window, and the body of a slide that is still too tall shrinks
until it fits. Pauses (`. . .`) and incremental lists are revealed step by
step, as in the PDF: a pause holds back everything after it on the slide, also
from inside a column, a quotation or a list item, and the first item of an
incremental list shows at once unless a pause comes before it. Going back to a
slide shows it complete. On a phone or a portrait window, without JavaScript,
and in print, the slides flow as a column of cards. The view chosen with the
switch lasts for the browser tab. `deck.html#5` (or the older `#(5)`) opens
slide 5.

A table in a document can be given a class for styling with an HTML comment
on the line before it, as the project rubric does:
`<!-- table-class: rubric -->`. Inside a list item, leave an empty line
between the comment and the table.

In a PDF deck the rows of a table are separated by hairlines, as in the HTML
deck, when every row starts with a cell of plain text. A table with merged
cells, or with a line break or a list in a first cell, keeps pandoc's plain
look (rules above and below, and under the header).

To check a change, build into a scratch directory and open the files:
`make BASE=/tmp/preview` (released material) or
`make PREVIEW_ALL=1 BASE=/tmp/preview` (every deck).
