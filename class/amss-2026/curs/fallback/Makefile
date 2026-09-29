# Instructor-only fallback decks: captured live-demo outputs to switch to when the
# live AI fails. Built next to their sources, never into the published site:
#   make -C curs/fallback        (or `make fallback` from the tree root)
override BASE := $(abspath ../..)
SUBDIR = curs/fallback

MDS = $(wildcard *.md)
HTMLS = $(patsubst %.md,$(OUTDIR)/%.html,$(MDS))
PDFS = $(patsubst %.md,$(OUTDIR)/%.pdf,$(MDS))

TARGETS = $(HTMLS) $(PDFS)

include ../../include.mk
