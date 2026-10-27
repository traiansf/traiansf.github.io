SUBDIR = exam

# The sample paper and its key, published as documents (HTML and PDF). Static
# pattern rules, because the generic %.md rules of include.mk build slide decks.
DOCS = model-examen model-examen-barem

TARGETS = $(foreach d,$(DOCS),$(OUTDIR)/$(d).html $(OUTDIR)/$(d).pdf)

include ../include.mk

$(DOCS:%=$(OUTDIR)/%.html): $(OUTDIR)/%.html: %.md Makefile $(DOC_HTML_DEPS)
	@mkdir -p $(dir $@)
	pandoc $(DOC_HTML_OPTIONS) -V pdf-url=$*.pdf -o $@ $<

$(OUTDIR)/model-examen-barem.pdf: model-examen-barem.md Makefile $(DOC_PDF_DEPS)
	@mkdir -p $(dir $@)
	pandoc $(DOC_PDF_OPTIONS) -o $@ $<

# The bank for multiple_choice_exam (mcexam), built from the paper and the
# key's summary table; not published. Then: mcexam lint --input $(BANK)
BANK = model-examen-mcexam.md
PYTHON ?= python

.PHONY: bank
bank: $(BANK)

$(BANK): model-examen.md model-examen-barem.md mcexam-bank.py
	$(PYTHON) mcexam-bank.py

# The paper's PDF is mcexam's sample sheet for that bank, as at the exam: the
# answer sheet, the instructions, then one page per case (the script fails if
# a case no longer fits on a page). Needs mcexam (MCEXAM, default "mcexam")
# and, on Windows, MCEXAM_FONT_DIR; see BUILD.md.
$(OUTDIR)/model-examen.pdf: model-examen.md model-examen-barem.md mcexam-bank.py
	@mkdir -p $(dir $@)
	$(PYTHON) mcexam-bank.py --sample $@
