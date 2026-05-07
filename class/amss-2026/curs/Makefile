SUBDIR = curs

MDS = $(filter-out %-demo.md,$(wildcard *.md))
HTMLS = $(patsubst %.md,$(OUTDIR)/%.html,$(MDS))
PDFS = $(patsubst %.md,$(OUTDIR)/%.pdf,$(MDS))

TARGETS = $(HTMLS) $(PDFS)

include ../include.mk
