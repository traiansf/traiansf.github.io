---
title: Specifying and verifying concurrent programs using the K framework
subtitle: current status and open problems
author: Traian Florin Șerbănuță
institute: Runtime Verification
abstract: The first part of this presentation will show (through toy examples) that K seems like an ideal framework to describe concurrency and memory models. The second part will present the current status of verifying concurrent programs in K, identify limitations, and discuss possible ways of addressing them.|
bibliography: k.bib
---

# A history of K

## A way to teach programming language design

### CS322 Fall 2003: Programming Language Design -Lecture Notes- [@k-tr]

- Specifying program executions using rewriting

- Using the idea of continuations

- Using the Maude language and rewrite engine

  - interpreters and reachability analysis for free

- using configurations to compartimentalize the complexity 

  - relying on Maude's A/C rewriting to reduce rule size

## Learning from existing formalisms

###  A rewriting logic approach to operational semantics [@k-os]

- A good survey of operational-semantics-based tools

- Also a good opportunity to learn from existing formalisms

  - heating/cooling from the Chemical Abstract Machine
  - configuration abstraction from the Modular SOS

## The K Framework 1.0

### An Overview of the K Semantic Framework [@k-jlap]
### A rewriting approach to concurrent programming language design and semantics [@k-serbanuta]

- Notation optimizations to make specifications
  - more modular
  - mode concise (less error prone, easier to read)
  - less tedious to write

- A compilation process into Maude

# Semantics-based interpreters

## A recipe for success

- Find a language not yet formally specified

  - with a good informal specification (standard/reference manual)
  - hopefully with a comprehensive test suite

- Follow a test-driven development process

  - attempt to define the whole standard and check for coverage
  - cover all tests (abiding to the standard)
  - develop tests to cover previously uncovered rules
    - find bugs in compilers using those tests

## An executable formal semantics of C with applications

- Presented at POPL'12 [@c-def]

- The (positive) semantics of the C programming language

  - closely following ISO/IEC 9899:2011 (C11 standard)

  - focusing on corectly defined programs

- Quantitative data

  - Definition size: ~6k lines

  - configuration containing ~80 cells

  - 1200 semantics rules (500 rules for declarations and types!)


## Defining the undefinedness of C

- Presented at PLDI'15 [@c-undef-2]
  - based on earlier work [by @c-undef-1]

- The (negative) semantics of the C language

  - reporting undefined behavior by pointing to the relevant section in the standard

- Quantitative data
  
  - Separate translation semantics and execution semantics
  - execution configuration containing ~100 cells
  - 2155 semantics rules

## Other research surrounding the C semantics

- Test-case reduction for C compiler bugs [@c-testing]

- All of the above, and some more in Chucky Ellison's PhD thesis [@c-ellison]


# Program verification via reachability logic


# Conclusions

## References
