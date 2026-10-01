# Building AMSS 2026

The pipeline is `make` → pandoc (+ `diagram/diagram.lua`) → slidy HTML and
beamer PDF (via `lualatex`). Diagrams are fenced `plantuml` / `mermaid` code
blocks rendered at build time: SVG in HTML, PDF in beamer.

## Dependencies

| Tool | Used for | Notes |
|---|---|---|
| GNU make + POSIX shell | driving the build | recipes use `mkdir -p`, `rm -f`, `cp -R`, `cd … &&` |
| pandoc ≥ 3.0 | md → HTML / beamer | |
| TeX Live (lualatex, beamer, fontspec, Latin Modern) | PDFs, exam | |
| `rsvg-convert` | SVG images in PDFs | ships with the Windows pandoc installer; `librsvg2-bin` on Linux |
| Java ≥ 11 + PlantUML + Graphviz (`dot`) | `plantuml` blocks | |
| Node.js + `@mermaid-js/mermaid-cli` (`mmdc`) + headless Chrome | `mermaid` blocks | |

## Linux (Debian/Ubuntu)

```bash
sudo apt install make pandoc texlive-luatex texlive-latex-extra texlive-lang-european \
  fonts-lmodern librsvg2-bin default-jre graphviz plantuml nodejs npm
npm install -g @mermaid-js/mermaid-cli
npx puppeteer browsers install chrome-headless-shell
```

Distribution pandoc/plantuml packages can be old; if `pandoc --version` is < 3.0
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

## Revealing a week

Lecture and lab decks are published week by week. `RELEASED` lists the decks
students can see (`curs/01-intro`, `lab/Lab01`, …). `make` builds only those,
deletes any other deck from the published tree, and renders the landing page
with unreleased entries as plain titles marked "(în curând)". The project page
and the sample exam are always published.

To reveal a week:

1. Add its lines to `RELEASED` (e.g. `curs/02-requirements`, `lab/Lab02`).
2. `make`
3. Commit and push the sources plus `../amss2026/`.

To take a deck down again, remove its line and repeat. Every landing-page
entry for a deck carries `data-release="<dir>/<basename>"`; new decks need it.

Only the published site is gated: the sources (including `*-instructor.md`)
live in this public repository.

## Optional orientation guide

`lab/Lab00` is released as a continuous HTML guide and printable PDF using explicit rules in `lab/Makefile`, rather than slide output. Questionnaire import tables live in `questionnaires/`; they are instructor resources, not automatically published forms.
