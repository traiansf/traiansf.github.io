SUBDIR = exam

TEXS = $(wildcard *.tex)
PDFS = $(patsubst %.tex,$(OUTDIR)/%.pdf,$(TEXS))

TARGETS = $(PDFS)

include ../include.mk

$(OUTDIR)/%.pdf: %.tex
	@mkdir -p $(dir $@)
	cd $(dir $<) && lualatex -interaction=nonstopmode -output-directory=$(OUTDIR) $(notdir $<)
