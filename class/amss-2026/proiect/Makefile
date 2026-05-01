SUBDIR = proiect

TARGETS = $(if $(wildcard README.md),$(OUTDIR)/index.html)

include ../include.mk

$(OUTDIR)/index.html: README.md Makefile
	@mkdir -p $(dir $@)
	pandoc $(OPTIONS) -s -o $@ $<
