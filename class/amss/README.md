# Files for the AMSS 2025 class

## Building

### Install system dependencies

```bash
sudo apt install  build-essential curl libffi-dev libffi8 libgmp-dev libgmp10 libncurses-dev pkg-config zlib1g-dev plantuml default-jdk-headless librsvg2-bin
```

- The first 8 are needed by haskell
- zlib is needed by pandoc
- plantuml is needed for transcoding md diagrams
- JDK is needed for compiling the Java examples
- `librsvg2-bin` is for `rsvg-convert` is for the lua script for plantuml


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