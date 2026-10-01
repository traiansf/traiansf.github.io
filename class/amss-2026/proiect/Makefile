SUBDIR = proiect

TARGETS = $(if $(wildcard README.md),$(OUTDIR)/index.html)

include ../include.mk

$(OUTDIR)/index.html: README.md Makefile $(DOC_HTML_DEPS)
	@mkdir -p $(dir $@)
	pandoc $(DOC_HTML_OPTIONS) -o $@ $<
