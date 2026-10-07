BASE_ORIGIN := $(origin BASE)
BASE ?= ../amss2026
# An empty BASE (BASE=$UNSET on the command line, say) would stand for the
# root of the file system.
ifeq ($(strip $(BASE)),)
$(error BASE is empty: name the output directory, or leave BASE unset to build into ../amss2026)
endif
# A relative BASE given on the command line is resolved here, once: the
# sub-makes run in their own directories and are handed the absolute path.
override BASE := $(abspath $(BASE))

AMSS_ROOT := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))

include $(AMSS_ROOT)/release.mk

.PHONY: all clean curs lab proiect exam static prune fallback notes notes-curs notes-lab

all: curs lab proiect exam static prune

curs lab proiect exam:
	$(MAKE) -C $@ BASE=$(BASE)

# Instructor-only demo fallback decks, built in place (not part of `all`, never published).
fallback:
	$(MAKE) -C curs/fallback

# Instructor copies stay outside the published site. DECK selects one release.
ifneq ($(filter notes,$(MAKECMDGOALS)),)
ifneq ($(strip $(DECK)),)
ifeq ($(filter $(DECK),$(filter-out lab/00-pregatire,$(RELEASED))),)
$(error DECK must name a released slide deck, for example curs/02-intelegere)
endif
endif
endif

notes: notes-curs notes-lab

notes-curs notes-lab:
	"$(MAKE)" -C $(patsubst notes-%,%,$@) notes DECK="$(DECK)"

static:
	@mkdir -p $(BASE)
	cp -R $(AMSS_ROOT)/static/. $(BASE)/
ifndef PREVIEW_ALL
	awk -f $(AMSS_ROOT)/release-index.awk $(AMSS_ROOT)/RELEASED $(AMSS_ROOT)/static/index.html > $(BASE)/index.html
endif

# Remove published decks that are not (or no longer) listed in RELEASED.
PUBLISHED_DECKS = $(wildcard $(foreach d,curs lab,$(BASE)/$(d)/*.html $(BASE)/$(d)/*.pdf))
# Also kept: the redirect pages in static/curs and static/lab (old deck names).
KEEP_DECKS = $(BASE)/curs/index.html $(BASE)/lab/index.html \
	$(foreach r,$(RELEASED),$(BASE)/$(r).html $(BASE)/$(r).pdf) \
	$(patsubst $(AMSS_ROOT)/static/%,$(BASE)/%,$(wildcard $(AMSS_ROOT)/static/curs/*.html $(AMSS_ROOT)/static/lab/*.html))

prune:
ifndef PREVIEW_ALL
	rm -f $(filter-out $(KEEP_DECKS),$(PUBLISHED_DECKS))
endif

clean:
	$(MAKE) -C curs clean BASE=$(BASE)
	$(MAKE) -C lab clean BASE=$(BASE)
	$(MAKE) -C proiect clean BASE=$(BASE)
	$(MAKE) -C exam clean BASE=$(BASE)
	$(MAKE) -C curs/fallback clean
