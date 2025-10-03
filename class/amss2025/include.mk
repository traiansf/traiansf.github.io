
all: $(TARGETS)
clean:
	rm -f $(TARGETS)

# Pattern rule to convert .md files to .html using pandoc
%.html: %.md
	pandoc -t slidy -s -o $@ $<

# Pattern rule to convert .md files to .pdf using pandoc
%.pdf: %.md
	pandoc -t beamer -o $@ $<
