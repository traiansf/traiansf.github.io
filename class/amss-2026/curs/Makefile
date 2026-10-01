SUBDIR = curs

MDS = $(call released,$(SUBDIR),$(filter-out %-demo.md redesign-prompt.md 13-workshop.md,$(wildcard *.md)))
HTMLS = $(patsubst %.md,$(OUTDIR)/%.html,$(MDS))
PDFS = $(patsubst %.md,$(OUTDIR)/%.pdf,$(MDS))

TARGETS = $(HTMLS) $(PDFS)

include ../include.mk
