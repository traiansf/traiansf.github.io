---
title: "AMSS Lecture 3: Design Patterns (I)"
author: "Virgil-Nicolae Șerbănuță"
date: "2025"
---

# Agenda

#. What are Design Patterns?
#. Classification of Patterns
#. **Iterator Pattern**
#. **Builder Pattern**
#. **Singleton Pattern**
#. Wrap-up


::: notes
Introduce the topic as a bridge between object-oriented modeling and practical software design. Emphasize how patterns capture reusable solutions to recurring design problems.
Walk through the plan and highlight that future lectures will explore many more patterns in detail.
:::

---

:::::::::::::: {.columns}
::: {.column width="50%"}
[![](images/lswe-left.PNG)](https://goomics.net/img/2011-11-15_life_of_a_swe.png)
:::
::: {.column width="50%"}
:::
::::::::::::::


---

:::::::::::::: {.columns}
::: {.column width="50%"}
[![](images/lswe-left.PNG)](https://goomics.net/img/2011-11-15_life_of_a_swe.png)
:::
::: {.column width="50%"}
[![](images/lswe-right.PNG)](https://goomics.net/img/2011-11-15_life_of_a_swe.png)
:::
::::::::::::::

---


# What Are Design Patterns?

## Definition

Reusable solutions to common software design problems.

## Origin

Popularized by the “Gang of Four” (Gamma, Helm, Johnson, Vlissides, 1994).

## Purpose

- Provide shared vocabulary
- Improve code maintainability
- Promote reusability and clarity

## Example

Instead of reinventing how to traverse a collection, we apply the **Iterator** pattern.

::: notes
Stress that patterns aren’t code snippets — they’re design blueprints that can be adapted to many situations.
:::

---

# Pattern Classification

Design patterns are typically grouped into three main categories:

| Category | Description | Example Patterns |
|-----------|--------------|------------------|
| **Creational** | How objects are created | Singleton, Builder, Factory Method |
| **Structural** | How classes and objects are composed | Adapter, Bridge, Decorator |
| **Behavioral** | How objects interact and communicate | Iterator, Observer, State |

::: notes
Briefly define each group. Mention that this lecture mixes examples from creational and behavioral patterns.
:::

---

[![](images/oopw.png){width=100%}](https://goomics.net/78)

---

# Iterator Pattern

## Type

Behavioral pattern

## Intent

Provide a way to access elements of a collection sequentially without exposing its internal structure.

## Problem Solved

How to traverse a collection (e.g., list, tree, array) without knowing its implementation?

## Solution

Define an `Iterator` interface with methods like `hasNext()` and `next()`.

---

# Iterator Pattern code example

[Source file](https://github.com/traiansf/traiansf.github.io/blob/main/class/amss2025/curs/code/IteratorPatternDemo.java)

```java
// Step 1: Create the Iterator interface
interface Iterator {
    boolean hasNext();
    Object next();
}

// Step 2: Create the Container interface
interface Container {
    Iterator getIterator();
}

// Step 3: Create a concrete class implementing Container
class NameRepository implements Container {
    private String[] names = {"Alice", "Bob", "Charlie", "Diana"};

    @Override
    public Iterator getIterator() {
        return new NameIterator();
    }

    // Inner class implementing the Iterator interface
    private class NameIterator implements Iterator {
        int index;

        @Override
        public boolean hasNext() {
            return index < names.length;
        }

        @Override
        public Object next() {
            if (this.hasNext()) {
                return names[index++];
            }
            return null;
        }
    }
}

// Step 4: Use the iterator
public class IteratorPatternDemo {
    public static void main(String[] args) {
        NameRepository namesRepo = new NameRepository();

        for (Iterator iter = namesRepo.getIterator(); iter.hasNext();) {
            String name = (String) iter.next();
            System.out.println("Name: " + name);
        }
    }
}
```