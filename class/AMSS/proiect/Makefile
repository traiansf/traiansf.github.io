SUBDIR = proiect

TARGETS = $(OUTDIR)/index.html

include ../include.mk

$(OUTDIR)/index.html: README.md Makefile
	@mkdir -p $(dir $@)
	pandoc $(OPTIONS) -s -o $@ $<
