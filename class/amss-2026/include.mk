ifndef SUBDIR
$(error SUBDIR must be set by the including Makefile)
endif

AMSS_ROOT := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
BASE ?= $(abspath $(AMSS_ROOT)/../amss2026)
OUTDIR := $(BASE)/$(SUBDIR)

include $(AMSS_ROOT)/release.mk

OPTIONS = --embed-resources --standalone --lua-filter=$(AMSS_ROOT)/diagram/diagram.lua

# On Windows, pandoc can only launch the diagram tools through their .cmd
# wrappers (npm installs mmdc.cmd; see BUILD.md for plantuml.cmd).
# The Lua filter reads <ENGINE>_BIN from the environment; on Linux the plain
# executable names on PATH are used.
ifeq ($(OS),Windows_NT)
export PLANTUML_BIN ?= plantuml.cmd
export MERMAID_BIN ?= mmdc.cmd
endif

.PHONY: all clean
all: $(TARGETS)

clean::
	rm -f $(TARGETS)

$(OUTDIR)/%.html: %.md
	@mkdir -p $(dir $@)
	pandoc $(OPTIONS) -t slidy -s -o $@ $<

$(OUTDIR)/%.pdf: %.md
	@mkdir -p $(dir $@)
	pandoc --pdf-engine=lualatex $(OPTIONS) --include-in-header=$(AMSS_ROOT)/diagram/beamer-fit.tex -t beamer -o $@ $<
