SUBDIR = exam

# The sample paper and its key, published as documents (HTML and PDF). Static
# pattern rules, because the generic %.md rules of include.mk build slide decks.
DOCS = model-examen model-examen-barem

TARGETS = $(foreach d,$(DOCS),$(OUTDIR)/$(d).html $(OUTDIR)/$(d).pdf)

include ../include.mk

$(DOCS:%=$(OUTDIR)/%.html): $(OUTDIR)/%.html: %.md Makefile $(DOC_HTML_DEPS)
	@mkdir -p $(dir $@)
	pandoc $(DOC_HTML_OPTIONS) -V pdf-url=$*.pdf -o $@ $<

$(DOCS:%=$(OUTDIR)/%.pdf): $(OUTDIR)/%.pdf: %.md Makefile $(DOC_PDF_DEPS)
	@mkdir -p $(dir $@)
	pandoc $(DOC_PDF_OPTIONS) -o $@ $<
