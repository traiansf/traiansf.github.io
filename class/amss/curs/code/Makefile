JAVAS = $(wildcard *.java)

TARGETS = $(patsubst %.java,%.class,$(JAVAS))

RUN_TARGETS = $(patsubst %.java,%.o,$(JAVAS))

all: $(TARGETS)

run: $(RUN_TARGETS)

%.o: %.class
	java $(basename $<)

clean:
	rm -f *.class

%.class: %.java
	javac $<

.PHONY: all run clean
