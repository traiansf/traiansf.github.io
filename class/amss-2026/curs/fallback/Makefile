# Instructor-only fallback decks: prepared teaching examples or labeled captures
# to use when live AI is unavailable. Built next to their sources, never published:
#   make -C curs/fallback        (or `make fallback` from the tree root)
override BASE := $(abspath ../..)
SUBDIR = curs/fallback
# Built in place, so there is no course page one level up to link to.
HOME_URL :=

MDS = $(wildcard *.md)
HTMLS = $(patsubst %.md,$(OUTDIR)/%.html,$(MDS))
PDFS = $(patsubst %.md,$(OUTDIR)/%.pdf,$(MDS))

TARGETS = $(HTMLS) $(PDFS)

include ../../include.mk
