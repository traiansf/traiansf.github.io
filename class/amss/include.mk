ifndef SUBDIR
$(error SUBDIR must be set by the including Makefile)
endif

AMSS_ROOT := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
BASE ?= $(abspath $(AMSS_ROOT)/../amss2025)
OUTDIR := $(BASE)/$(SUBDIR)

OPTIONS = --embed-resources --standalone --lua-filter=$(AMSS_ROOT)/diagram/diagram.lua --metadata=plantumlPath:"/usr/share/plantuml/plantuml.jar"

.PHONY: all clean
all: $(TARGETS)

clean:
	rm -f $(TARGETS)

$(OUTDIR)/%.html: %.md
	@mkdir -p $(dir $@)
	pandoc $(OPTIONS) -t slidy -s -o $@ $<

$(OUTDIR)/%.pdf: %.md
	@mkdir -p $(dir $@)
	pandoc --pdf-engine=lualatex $(OPTIONS) -t beamer -o $@ $<
