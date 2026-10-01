# Instructor-only fallback decks: prepared teaching examples or labeled captures
# to use when live AI is unavailable. Built next to their sources, never published:
#   make -C curs/fallback        (or `make fallback` from the tree root)
override BASE := $(abspath ../..)
SUBDIR = curs/fallback

MDS = $(wildcard *.md)
HTMLS = $(patsubst %.md,$(OUTDIR)/%.html,$(MDS))
PDFS = $(patsubst %.md,$(OUTDIR)/%.pdf,$(MDS))

TARGETS = $(HTMLS) $(PDFS)

include ../../include.mk
