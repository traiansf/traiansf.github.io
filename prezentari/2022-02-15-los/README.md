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

### A rewriting logic approach to operational semantics [@k-os]

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

## Demo 1

### [imp.md](k)

- [sum.imp](k/sum.imp)

### [imp-symbolic.k](k/imp-symbolic.k)

- [max-symbolic.imp](k/max-symbolic.imp)

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

- RV-Match [@c-rv]

  - added possibility to link against native libraries
  - Error recovery and implementation-defined behavior.
  - Also detecting some security and best practice violations.

## K-Java: A complete semantics of Java

- Presented at POPL'15 [@java]

- formalized Java 1.4 (without the Java Memory Model)

- developed a comprehensive test-suite for Java

## KJS: A complete formal semantics of JavaScript

- presented at PLDI'15 [@js]

- formalized ECMAScript 5.1

- passed entire conformance suite

- wrote tests for uncovered rules

  - and found bugs in all major browsers  (Chrome V8, Safari WebKit, Firefox SpiderMonkey)

## A Complete Formal Semantics of X86-64 User-Level Instruction Set Architecture

- presented at PLDI'19 [@x86]

- formalized all non-deprecated, sequential user-level instruction of x86-64

- extensively tested

- found bugs in the reference manual and other semantics

# Program verification via reachability logic

## A language-independent logic for reasoning about program executions

- Initially called matching logic [@rl-tr; @rl-icse]
- Then matching logic reachability [@rl-icalp; @rl-fm; @rl-oopsla]
- Finally settled to reachability logic [@rl-lics; @rl-rta; @rl-oopsla-2]
- A set of proof rules which allow to prove things like
  - given a set of axiom comprising the K definition of a language
  - starting from a given symbolic configuation
  - all execution paths lead to a final symbolic state
- A detailed account of all these in Andrei Ștefănescu's PhD thesis [@rl-stefanescu]

## Demo 2

### Proofs using [imp-symbolic.k](k/imp-symbolic.k)

- [max-spec.k](k/max-spec.k)

- [sum-spec.k](k/sum-spec.k)

- [sum-odds-spec.k](k/sum-odds-spec.k)

## EVM semantics and smart-contract verification

- KEVM: A Complete Semantics of the Ethereum Virtual Machine [@kevm]

- Smart contract verification based using KEVM

# Specifying concurrent features

## Demo 3

### [imp-threaded.md](k/imp-threaded.html)

### [imp-relaxed.md](k/imp-relaxed.html)

## Conclusions

### Working pretty well

- K is quite good for specifying execution behaviors for most languages in-use

- Can be used as an interpretor

- Can be used for symbolic execution reachability analysis, and verification

  - provided the amount of non-determinism is reduced

- All of the above are language-independent

### To be improved

- Symbolic execution and verification are not optimized for nondeterminism/cooncurrency

  - Research is needed to adapt/reuse existing space-reduction techniques

  - Hopefully in a language-idependent way

## References
