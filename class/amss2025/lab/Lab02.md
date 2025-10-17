---
title: "Analiza și Modelarea Sistemelor Software - Lab 2"
author: "Traian Șerbănuță"
date: "2025"
thanks: "Thanking Andrian Babii @ Endava for slide content"
---

## Agenda

UML behavioral diagrams

Use case diagrams

Sequence diagrams

---

## Behavior diagrams

### Purpose

- individual aspects of a system and their changes are displayed at runtime.
- provide clarity about internal processes, business processes or the interaction of different systems.

### Elements and relationships

- Diagram elements resemble verbs in a natural language
- relationships that connect them typically convey passage of time.

### Example

Elements of a behavioral diagram of a vehicle reservation system

- Make a Reservation
- Rent a Car
- Provide Credit Card Details.

# Types of behavioral diagrams

## Activity diagrams

:::::::::::::: {.columns}
::: {.column width="40%"}
Model

- behaviors of a system

- how these are related

  (in the overall flow of the system).

Activities can be:

  - sequential,
  - branched
  - concurrent.
:::
::: {.column width="60%"}
![](img/Software%20System%20Modeling-Lab3_0.png)
:::
::::::::::::::


---

## Use case diagrams

Model users interacting with the system

- Users: stick figures called "actors"
- high-level overview  of relationships between actors and systems
- explain system to non-technical audience

![](img/Software%20System%20Modeling-Lab3_1.png)

---

## Timing diagrams

Powerful tools for making a system as efficient as possible.

- define the behavior of different objects within a time-scale
- represent objects changing state and interacting over time.


![](img/Software%20System%20Modeling-Lab3_2.jpg)

---

## Communication diagrams

Model how components communicate and interact

:::::::::::::: {.columns}
::: {.column width="45%"}

- like sequence diagrams
- but focus on interaction
- program communication

Useful for

- businesses
- organization
- engineers
:::
::: {.column width="55%"}
![](img/Software%20System%20Modeling-Lab3_3.png)
:::
::::::::::::::

---

## Interaction Overview diagrams

Activity diagram where nodes are interaction diagrams

:::::::::::::: {.columns}
::: {.column width="45%"}
Diagrams used as nodes

- sequence
- communication
- interaction overview
- timing
:::
::: {.column width="55%"}
![](img/Software%20System%20Modeling-Lab3_4.png){height=80%}
:::
::::::::::::::


## State Diagram

A state machine is any device that stores the status of an object at a given time and can change status or cause other actions based on the input it receives\. States refer to the different combinations of information that an object can hold\, not how the object behaves\. In order to understand the different states of an object\, you might want to visualize all the possible states and show how an object gets to each state\, and you can do so with a UML state diagram\.

![](img/Software%20System%20Modeling-Lab3_5.png)

__State diagram applications__

Like most UML diagrams\, state diagrams have several uses\.

The main applications are as follows:

Depicting event\-driven objects in a reactive system\.

Illustrating use case scenarios in a business context\.

Describing how an object moves through various states within its lifetime\.

Showing the overall behavior of a state machine or the behavior of a related set of state machines\.



  * __State diagram symbols and components__


![](img/Software%20System%20Modeling-Lab3_6.png)

![](img/Software%20System%20Modeling-Lab3_7.png)

Choice pseudostate

![](img/Software%20System%20Modeling-Lab3_8.jpg)

![](img/Software%20System%20Modeling-Lab3_9.png)

Transition Arrow

![](img/Software%20System%20Modeling-Lab3_10.png)

![](img/Software%20System%20Modeling-Lab3_11.png)

![](img/Software%20System%20Modeling-Lab3_12.jpg)

![](img/Software%20System%20Modeling-Lab3_13.png)

## Create a state diagram for an online shopping website

## Sequence Diagrams

A sequence diagram is a type of interaction diagram because it describes how—and in what order—a group of objects works together\. These diagrams are used by software developers and business professionals to understand requirements for a new system or to document an existing process\. Sequence diagrams are sometimes known as event diagrams or event scenarios\.

![](img/Software%20System%20Modeling-Lab3_14.png)

__Use cases for sequence diagrams__

The following scenarios are ideal for using a sequence diagram:

Usage scenario: A usage scenario is a diagram of how your system could potentially be used\. It's a great way to make sure that you have worked through the logic of every usage scenario for the system\.

Method logic: Just as you might use a UML sequence diagram to explore the logic of a use case\, you can use it to explore the logic of any function\, procedure\, or complex process\.

Service logic: If you consider a service to be a high\-level method used by different clients\, a sequence diagram is an ideal way to map that out\.



  * __Sequence diagram symbols and components__


![](img/Software%20System%20Modeling-Lab3_15.png)

![](img/Software%20System%20Modeling-Lab3_16.png)

![](img/Software%20System%20Modeling-Lab3_17.png)

![](img/Software%20System%20Modeling-Lab3_18.png)

![](img/Software%20System%20Modeling-Lab3_19.png)

Alternative loop symbol

![](img/Software%20System%20Modeling-Lab3_20.png)

Option loop symbol



  * __Common message symbols__


| Symbol | Name | Description |
| :-: | :-: | :-: |
|  | Synchronous message | __This symbol is used when a sender must wait for a response to a message before it continues\. __ |
|  | Asynchronous message | __Asynchronous messages don't require a response before the sender continues\. Only the call should be included in the diagram\.__ |
|  | Asynchronous return message | __Represented by a dashed line with a lined arrowhead\.__ |
|  | Asynchronous create message | __Represented by a dashed line with a lined arrowhead\. This message creates a new object\.__ |
|  | Replay message | __Represented by a dashed line with a lined arrowhead\, these messages are replies to calls\.__ |
|  | Delete message | __Represented by a solid line with a solid arrowhead\, followed by an X\. This message destroys an object\.__ |

![](img/Software%20System%20Modeling-Lab3_21.png)

![](img/Software%20System%20Modeling-Lab3_22.png)

![](img/Software%20System%20Modeling-Lab3_23.png)

![](img/Software%20System%20Modeling-Lab3_24.png)

![](img/Software%20System%20Modeling-Lab3_25.png)

![](img/Software%20System%20Modeling-Lab3_26.png)

![](img/Software%20System%20Modeling-Lab3_27.png)

__sequenceDiagram__

participant ct as Customer

participant catalog as Catalog

participant cart as Cart

participant lg as Login

participant checkout as Checkout

ct __\->>\+__ catalog __:__  Search Products

catalog __\-\->\-__ ct __:__  Return Products

ct __\->>\+__ catalog __:__  Select Product

catalog __\-\->\-__ ct __:__  Return Product

ct __\-\)\+__ cart __:__  Add product to cart

cart __\-\-\)__ catalog __:__  Decrease available stock

cart __\-\-\)\-__ ct __:__  Product added

ct __\->>\+__ cart __:__  Go to cart

cart __\->>\+__ lg __:__  Check customer logged

__alt__  is not logged in

cart __\->>__ lg __:__  Redirect customer to login

lg __\->>__ lg __:__  login

__else__  is logged in

lg __\-\->>__ cart __:__  return customer info

__end__

cart __\-\->>\-__ ct __:__  return information in cart

ct __\->>\+__ checkout __:__  Select payment and shipping \- order

checkout __\-\->>\-__ ct __:__  Return a order number

![](img/Software%20System%20Modeling-Lab3_28.png)

