ifndef SUBDIR
$(error SUBDIR must be set by the including Makefile)
endif

AMSS_ROOT := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
BASE_ORIGIN := $(origin BASE)
BASE ?= $(abspath $(AMSS_ROOT)/../amss2026)
ifeq ($(strip $(BASE)),)
$(error BASE is empty: name the output directory, or leave BASE unset to build into ../amss2026)
endif
OUTDIR := $(BASE)/$(SUBDIR)
THEME := $(AMSS_ROOT)/theme
ASSETS := $(AMSS_ROOT)/static/assets

include $(AMSS_ROOT)/release.mk

# Published pages link back to the course page; decks built elsewhere
# (curs/fallback) clear HOME_URL.
HOME_URL ?= ../

FAVICON := $(ASSETS)/amss-2026-mark-64.png
LOGO_HTML := $(ASSETS)/amss-2026-logo-480.webp
LOGO_PDF := $(ASSETS)/amss-2026-logo-360.png

OPTIONS = --embed-resources --standalone \
	--lua-filter=$(AMSS_ROOT)/diagram/diagram.lua --lua-filter=$(THEME)/amss.lua \
	--metadata-file=$(THEME)/course.yaml --highlight-style=$(THEME)/code.theme
COMMON_DEPS = $(AMSS_ROOT)/diagram/diagram.lua $(THEME)/amss.lua $(THEME)/course.yaml \
	$(THEME)/code.theme $(AMSS_ROOT)/include.mk

# The course look lives in theme/ (and static/amss.css, which the course page
# also links). Decks: the slidy writer with our own template and runtime, and
# beamer. Documents (Lab 0, the project page): continuous HTML and article PDF.
HTML_OPTIONS = $(OPTIONS) --wrap=none -V favicon=$(FAVICON) \
	$(if $(HOME_URL),-V home-url=$(HOME_URL))
DECK_HTML_OPTIONS = $(HTML_OPTIONS) -t slidy --template=$(THEME)/deck.html \
	--css=$(THEME)/deck.css -V deck-js=$(THEME)/deck.js -V logo-path=$(LOGO_HTML)
DECK_HTML_DEPS = $(THEME)/deck.html $(THEME)/deck.css $(THEME)/deck.js \
	$(FAVICON) $(LOGO_HTML) $(COMMON_DEPS)
DOC_HTML_OPTIONS = $(HTML_OPTIONS) --template=$(THEME)/doc.html \
	--css=$(AMSS_ROOT)/static/amss.css --toc --toc-depth=2
DOC_HTML_DEPS = $(THEME)/doc.html $(AMSS_ROOT)/static/amss.css $(FAVICON) $(COMMON_DEPS)

# onlytextwidth keeps pandoc's columns inside the frame margins;
# usepdftitle=false lets the PDF keep the full title that pandoc sets.
PDF_OPTIONS = $(OPTIONS) --pdf-engine=lualatex \
	-V colorlinks=true -V linkcolor=amssnavy -V urlcolor=amssteal -V filecolor=amssteal
DECK_PDF_OPTIONS = $(PDF_OPTIONS) -t beamer -V aspectratio=169 -V fontsize=10pt \
	-V classoption=onlytextwidth -V classoption=usepdftitle=false \
	--include-in-header=$(AMSS_ROOT)/diagram/beamer-fit.tex \
	--include-in-header=$(THEME)/beamer.tex -V titlegraphic=$(LOGO_PDF)
DECK_PDF_DEPS = $(AMSS_ROOT)/diagram/beamer-fit.tex $(THEME)/beamer.tex $(LOGO_PDF) $(COMMON_DEPS)
DOC_PDF_OPTIONS = $(PDF_OPTIONS) -V papersize=a4 -V fontsize=11pt \
	-V geometry=left=30mm,right=30mm,top=26mm,bottom=28mm \
	--include-in-header=$(THEME)/article.tex
DOC_PDF_DEPS = $(THEME)/article.tex $(COMMON_DEPS)

# On Windows, pandoc can only launch the diagram tools through their .cmd
# wrappers (npm installs mmdc.cmd; see BUILD.md for plantuml.cmd).
# The Lua filter reads <ENGINE>_BIN from the environment; on Linux the plain
# executable names on PATH are used.
ifeq ($(OS),Windows_NT)
export PLANTUML_BIN ?= plantuml.cmd
export MERMAID_BIN ?= mmdc.cmd
endif

.PHONY: all clean
all: $(TARGETS)

clean::
	rm -f $(TARGETS)

$(OUTDIR)/%.html: %.md $(DECK_HTML_DEPS)
	@mkdir -p $(dir $@)
	pandoc $(DECK_HTML_OPTIONS) -V pdf-url=$(notdir $(basename $@)).pdf -o $@ $<

$(OUTDIR)/%.pdf: %.md $(DECK_PDF_DEPS)
	@mkdir -p $(dir $@)
	pandoc $(DECK_PDF_OPTIONS) -o $@ $<
