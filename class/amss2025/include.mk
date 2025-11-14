OPTIONS=--embed-resources --standalone --lua-filter=../diagram/diagram.lua --metadata=plantumlPath:"/usr/share/plantuml/plantuml.jar"
#--metadata=javaPath:"c:\Program Files\Java\jre1.8.0_201\bin\java.exe"

all: $(TARGETS)
clean:
	rm -f $(TARGETS)

# Pattern rule to convert .md files to .html using pandoc
%.html: %.md
	pandoc $(OPTIONS) -t slidy -s -o $@ $<

# Pattern rule to convert .md files to .pdf using pandoc
%.pdf: %.md
	pandoc --pdf-engine=lualatex $(OPTIONS) -t beamer -o $@ $<

.PHONY: all clean
