# Files for the AMSS 2025 class

## Building

### Install system dependencies

```bash
sudo apt install  build-essential curl libffi-dev libffi8 libgmp-dev libgmp10 libncurses-dev pkg-config zlib1g-dev plantuml default-jdk-headless librsvg2-bin rsync texlive-lang-european
```

- The first 8 are needed by haskell
- zlib is needed by pandoc
- plantuml is needed for transcoding md diagrams
- JDK is needed for compiling the Java examples
- `librsvg2-bin` is for `rsvg-convert` is for the lua script for plantuml
- `rsync` is needed by the `static` make target (deploys the landing page and hand-written pages into the published tree)
- `texlive-lang-european` provides babel's `romanian` option, needed to build the written exam PDF (`examen_scris.tex` / `examen-2026.tex`)


### Install Haskell

Follow the instructions from the [haskell.org](https://www.haskell.org/ghcup/) website.

For an Ubuntu-like system

```bash
sudo apt install  build-essential curl libffi-dev libffi8 libgmp-dev libgmp10 libncurses-dev pkg-config zlib1g-dev
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
```

Restart shell (or reload `.bashrc`)

### Install Pandoc

```bash
stack install pandoc-cli
```

### Install LaTeX

Follow instructions from the [texlive](https://www.tug.org/texlive/quickinstall.html) website

### Build

```
make
```