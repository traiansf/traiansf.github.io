objects := $(patsubst %.md,%.pdf,$(wildcard *.md)) $(patsubst %.md,%.html,$(wildcard *.md))

all: index.html

%.pdf: %.md Makefile
	pandoc $< -o $@ -s -t beamer --toc-depth 2 --citeproc

index.html: README.md Makefile
	pandoc $< -o $@ -s -t slidy --toc-depth 2 --citeproc

%.ipynb: %.md
	pandoc $< -o $@

clean:
	-rm $(objects)

.PHONY: all clean
