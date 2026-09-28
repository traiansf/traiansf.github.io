BASE ?= ../amss2026
export BASE := $(abspath $(BASE))

AMSS_ROOT := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))

include $(AMSS_ROOT)/release.mk

.PHONY: all clean curs lab proiect exam static prune

all: curs lab proiect exam static prune

curs lab proiect exam:
	$(MAKE) -C $@

static:
	@mkdir -p $(BASE)
	cp -R $(AMSS_ROOT)/static/. $(BASE)/
ifndef PREVIEW_ALL
	awk -f $(AMSS_ROOT)/release-index.awk $(AMSS_ROOT)/RELEASED $(AMSS_ROOT)/static/index.html > $(BASE)/index.html
endif

# Remove published decks that are not (or no longer) listed in RELEASED.
PUBLISHED_DECKS = $(wildcard $(foreach d,curs lab,$(BASE)/$(d)/*.html $(BASE)/$(d)/*.pdf))
KEEP_DECKS = $(BASE)/curs/index.html $(BASE)/lab/index.html \
	$(foreach r,$(RELEASED),$(BASE)/$(r).html $(BASE)/$(r).pdf)

prune:
ifndef PREVIEW_ALL
	rm -f $(filter-out $(KEEP_DECKS),$(PUBLISHED_DECKS))
endif

clean:
	$(MAKE) -C curs clean
	$(MAKE) -C lab clean
	$(MAKE) -C proiect clean
	$(MAKE) -C exam clean
