.PHONY: all

all: index.html Roborock.pdf

index.html: Roborock.md
	pandoc $< -o $@

Roborock.pdf: Roborock.md
	pandoc $<  --pdf-engine=xelatex -o $@
