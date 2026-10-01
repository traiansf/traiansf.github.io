SUBDIR = lab

MDS = $(call released,$(SUBDIR),$(filter-out %-demo.md %-instructor.md,$(wildcard *.md)))
HTMLS = $(patsubst %.md,$(OUTDIR)/%.html,$(MDS))
PDFS = $(patsubst %.md,$(OUTDIR)/%.pdf,$(MDS))

TARGETS = $(HTMLS) $(PDFS)

include ../include.mk

# Lab 0 is a self-study guide: continuous HTML and printable PDF, from one source.
$(OUTDIR)/Lab00.html: Lab00.md Makefile $(DOC_HTML_DEPS)
	@mkdir -p $(dir $@)
	pandoc $(DOC_HTML_OPTIONS) -V pdf-url=Lab00.pdf -o $@ $<

$(OUTDIR)/Lab00.pdf: Lab00.md Makefile $(DOC_PDF_DEPS)
	@mkdir -p $(dir $@)
	pandoc $(DOC_PDF_OPTIONS) -o $@ $<
