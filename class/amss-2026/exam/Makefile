SUBDIR = exam

TEXS = $(wildcard *.tex)
PDFS = $(patsubst %.tex,$(OUTDIR)/%.pdf,$(TEXS))
AUX_EXTS = aux log toc fls fdb_latexmk out
AUX_FILES = $(foreach ext,$(AUX_EXTS),$(patsubst %.tex,$(OUTDIR)/%.$(ext),$(TEXS)))

TARGETS = $(PDFS)

include ../include.mk

clean::
	rm -f $(AUX_FILES)

$(OUTDIR)/%.pdf: %.tex
	@mkdir -p $(dir $@)
	cd $(dir $<) && lualatex -interaction=nonstopmode -output-directory=$(OUTDIR) $(notdir $<)
