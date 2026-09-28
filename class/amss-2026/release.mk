# Week-by-week reveal: the lecture/lab decks listed in RELEASED are the only
# ones built and published. `make PREVIEW_ALL=1 BASE=/tmp/preview` ignores the
# list (builds everything, prunes nothing) for local review.
# Expects AMSS_ROOT to be set by the including Makefile.

RELEASED := $(shell sed 's/\#.*//' $(AMSS_ROOT)/RELEASED | tr -d '\r')

# $(call released,<dir>,<files.md>): the subset of <files.md> released under <dir>/.
ifdef PREVIEW_ALL
released = $(2)
else
released = $(filter $(patsubst $(1)/%,%.md,$(filter $(1)/%,$(RELEASED))),$(2))
endif
