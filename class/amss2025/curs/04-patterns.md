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

# Iterator Pattern Exercise

## Exercise

Modify 3 lines in the example above to make the iterator a reverse iterator.

## Question

> How does this custom Iterator differ from Java’s built-in `java.util.Iterator`, and when might you still implement your own?

::: notes
Learning outcome: the iterator decouples traversal from storage.

Learning outcome:
One collection can have multiple iterator strategies
:::

---

# Builder Pattern

## Type

Creational pattern

## Intent

Separate the construction of a complex object from its representation, so the same construction process can create different representations.

## Problem Solved

How can we construct complex objects step by step while keeping the construction logic separate from the representation?

## Solution

Use a *Builder* class to encapsulate object creation in multiple steps.

# Builder Pattern (concrete example)

## Task

Design a Computer class that represents a configurable computer system.
The goal is to let users “build” a computer step-by-step, choosing which components to include.

A valid computer may include:

- CPU (e.g., “Intel i9”, “AMD Ryzen 7”)

- GPU (e.g., “NVIDIA RTX 4090”, “AMD Radeon RX 7800”)

- RAM (in GB)

- Storage (in GB)

You should be able to build objects fluently, like this:

```java
Computer gamingPC = new Computer.Builder()
        .setCPU("Intel i9")
        .setGPU("NVIDIA RTX 4090")
        .setRAM(32)
        .setStorage(2000)
        .build();

System.out.println(gamingPC);
```

# Builder Pattern (concrete example solution)

[Source file](https://github.com/traiansf/traiansf.github.io/blob/main/class/amss2025/curs/code/IteratorPatternDemo.java)

```java
// Product class
class Computer {
    private String CPU;
    private String GPU;
    private int RAM;
    private int storage;

    // Private constructor — use Builder instead
    private Computer(Builder builder) {
        this.CPU = builder.CPU;
        this.GPU = builder.GPU;
        this.RAM = builder.RAM;
        this.storage = builder.storage;
    }

    @Override
    public String toString() {
        return "Computer [CPU=" + CPU + ", GPU=" + GPU + ", RAM=" + RAM + "GB, Storage=" + storage + "GB]";
    }

    // Static nested Builder class
    public static class Builder {
        private String CPU;
        private String GPU;
        private int RAM;
        private int storage;

        public Builder setCPU(String CPU) {
            this.CPU = CPU;
            return this;
        }

        public Builder setGPU(String GPU) {
            this.GPU = GPU;
            return this;
        }

        public Builder setRAM(int RAM) {
            this.RAM = RAM;
            return this;
        }

        public Builder setStorage(int storage) {
            this.storage = storage;
            return this;
        }

        public Computer build() {
            return new Computer(this);
        }
    }
}

// Demo class
public class BuilderPatternDemo {
    public static void main(String[] args) {
        Computer gamingPC = new Computer.Builder()
                .setCPU("Intel i9")
                .setGPU("NVIDIA RTX 4090")
                .setRAM(32)
                .setStorage(2000)
                .build();

        System.out.println(gamingPC);
    }
}
```



# Bulder Pattern exercise

Design a Pizza class that represents a customizable pizza order, using the Builder Pattern.

Your pizza should have:

- A size (e.g., Small, Medium, Large)

- A crust type (e.g., Thin, Thick, Stuffed)

- A list of toppings (e.g., Cheese, Pepperoni, Mushrooms)

- A flag for extra cheese

The goal is to make object creation flexible and readable, like this:

```java
Pizza pizza = new Pizza.Builder()
        .setSize("Large")
        .setCrust("Stuffed")
        .addTopping("Pepperoni")
        .addTopping("Mushrooms")
        .setExtraCheese(true)
        .build();

System.out.println(pizza);
```