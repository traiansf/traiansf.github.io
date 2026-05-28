SUBDIR = lab

MDS = $(filter-out %-demo.md %-instructor.md,$(wildcard *.md))
HTMLS = $(patsubst %.md,$(OUTDIR)/%.html,$(MDS))
PDFS = $(patsubst %.md,$(OUTDIR)/%.pdf,$(MDS))

TARGETS = $(HTMLS) $(PDFS)

include ../include.mk
