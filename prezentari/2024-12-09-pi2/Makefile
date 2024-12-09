objects := $(patsubst %.md,%.pdf,$(wildcard *.md)) $(patsubst %.md,%.html,$(wildcard *.md)) index.html

all: README.pdf

%.pdf: %.md Makefile
	pandoc $< -o $@ -s -t beamer --toc-depth 2 --citeproc

index.html: README.md Makefile
	pandoc $< -o $@ -s -t slidy --toc-depth 2 --citeproc --mathjax

%.ipynb: %.md
	pandoc $< -o $@

clean:
	-rm $(objects)

.PHONY: all clean
