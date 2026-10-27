SUBDIR = exam

# The sample paper and its key, published as documents (HTML and PDF). Static
# pattern rules, because the generic %.md rules of include.mk build slide decks.
DOCS = model-examen model-examen-barem

TARGETS = $(foreach d,$(DOCS),$(OUTDIR)/$(d).html $(OUTDIR)/$(d).pdf)

include ../include.mk

# The paper's PDF is laid out like a printed exam: a cover with the answer
# sheet, then one page per case.
$(OUTDIR)/model-examen.pdf: EXAM_PDF_OPTIONS = --lua-filter=exam.lua \
	--include-in-header=exam.tex -V geometry=left=22mm,right=22mm,top=24mm,bottom=22mm
$(OUTDIR)/model-examen.pdf: exam.lua exam.tex

$(DOCS:%=$(OUTDIR)/%.html): $(OUTDIR)/%.html: %.md Makefile $(DOC_HTML_DEPS)
	@mkdir -p $(dir $@)
	pandoc $(DOC_HTML_OPTIONS) -V pdf-url=$*.pdf -o $@ $<

$(DOCS:%=$(OUTDIR)/%.pdf): $(OUTDIR)/%.pdf: %.md Makefile $(DOC_PDF_DEPS)
	@mkdir -p $(dir $@)
	pandoc $(DOC_PDF_OPTIONS) $(EXAM_PDF_OPTIONS) -o $@ $<

# The bank for multiple_choice_exam (mcexam), built from the paper and the
# key's summary table; not published. Then: mcexam lint --input $(BANK)
BANK = model-examen-mcexam.md
PYTHON ?= python

.PHONY: bank
bank: $(BANK)

$(BANK): model-examen.md model-examen-barem.md mcexam-bank.py
	$(PYTHON) mcexam-bank.py
