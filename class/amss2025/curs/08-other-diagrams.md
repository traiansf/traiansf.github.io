---
title: "AMSS Lecture 9: UML Design – Additional Diagram Types"
author: "Traian-Florin Șerbănuță"
date: "2025"
---

## Agenda

### Interaction Diagrams

- Communication Diagrams
- Interaction Overview Diagrams
- Timing Diagrams

### Structure Diagrams

- Composite Structure Diagrams
- Profile Diagrams

<!-- ### Running Example: Smart Home Automation System  

- Devices: TemperatureSensor, DoorSensor  
- Controllers: HeatingController, SecurityController  
- Hub orchestrates all devices  
- User interacts via MobileApp -->

# Interaction Diagrams

---

## 1. Communication Diagrams

Emphasize data links between participants in the interaction.

- free placement of participants
- draw links to show how participant connect
- use numbering to show message sequence

![](images/communication-2.png)

## 1. Communication Diagrams (nested numbering)

![](images/communication-1.png)

- Can use letters to indicate different threads
  - e.g., 1a1 and 1b1 indicate two threads within message 1

- Nested numbers can get hard to follow (e.g., 1.1.1.2.1.1.)
  - Some people prefer using flat numbers as on previous slide

- Don't have precise notation for control logic

<!-- ### Example

<!-- ```plantuml
@startuml
object MobileApp
object Hub
object TemperatureSensor
object HeatingController

MobileApp - Hub : requestStatus()
Hub - TemperatureSensor : readTemp()
TemperatureSensor - -> Hub : temp
Hub - HeatingController : adjustHeating(temp)
@enduml
```
-->

## 1. Communication Diagrams (example)

![](images/communication-3.png){height=100%}

## 1. Communication Diagrams vs. Sequence Diagrams

- __Sequence diagrams__ highlight temporal sequencing.

- __Communication diagrams__ highlight structural organization

------------------------------------------------------------------------------------------------
Aspect            Sequence Diagram                      Communication Diagram
----------------- ------------------------------------- ----------------------------------------
Focus             Flow of messages                      Structural relationships among objects

Emphasis          *When* messages occur                 *Which* objects interact

Layout            Vertical lifelines;                   Graph layout;
                  message flow top-to-bottom            objects linked by message paths

Best For          message order, concurrency, timing    Collaboration structure and object roles

Mesage Order      Vertical position                     Explicit sequence numbers (1, 1.1, 2…)

Use Case          Complex logic, workflows,             High-level interaction patterns
                  time-dependent behavior               object relationships

---

## Interactive Exercise (5 minutes)

### Task

Model the basic interactions within an online ordering system when a customer
places a food order online.

### Guidelines

- Use at least 4 objects (CustomerApp, OrderService, RestaurantSystem, PaymentService).  
- Number your messages.
- model possible failures.

---

## 2. Interaction Overview Diagrams

:::::::::::::: {.columns}
::: {.column width="60%"}
![](images/overview-1.png)
:::
::: {.column width="40%"}

- Activity diagrams where
  actions are Interaction Diagrams (or references).

- High-level control flow
  combining multiple interactions.
:::
::::::::::::::

<!-- ### Example

```plantuml
@startuml
start
:MorningRoutine;
partition "Heating" {
  :Read temperature;
  :Adjust heating;
}
partition "Security" {
  :Check door sensors;
  :Enable alarms;
}
stop
@enduml
``` -->

---

## 2. Interaction Overview example (all references)

![](images/overview-3.png){width=100%}

---

## 2. Interaction Overview example

![](images/overview-2.png){height=90%}

---

## 2. Interaction Overview exercise (Library Book Borrowing)

### Task

Create an Interaction Overview Diagram (IOD) that shows the control flow of a user borrowing a book through an online library portal.

### Guidelines

The diagram must include at least one interaction sub-diagram, such as a short sequence diagram or communication diagram.

The system consists of:

- UserPortal

- SearchService

- CatalogService

- LoanService

- NotificationService

---

## 3. Timing Diagrams (15 minutes)

Show the *change of state over time*.

### Example

```plantuml
@startuml
robust "DoorSensor" as DS
concise "SecurityController" as SC

@0
DS is closed

@10
DS is open

@20
SC is checking

@30
SC is alert
@enduml
```

---

## Interactive Exercise (5 minutes)

### Task

Create a timing diagram showing:

- TemperatureSensor reading changes from 18°C → 20°C → 19°C  
- HeatingController turns *on* only when below 19°C

# Session 2 (50 minutes): Structure Diagrams

## 4. Composite Structure Diagrams (20 minutes)

### Purpose
Show the *internal structure* of a class or component.

### Example

```plantuml
@startuml
package "Hub" {
  class Hub {
    + processRequests()
  }

  class HeatingPort
  class SecurityPort

  Hub o-- HeatingPort
  Hub o-- SecurityPort
}
@enduml
```
 
```plantuml
@startuml
 boundary b1
 control c1
 b1 -(0)- c1

 component comp1
 interface interf1
 comp1 #~~( interf1

 :mode1actor: -0)- fooa1
 :mode1actorl: -le0)- foo1l

 [component1] 0)-(0-(0 [componentC]
 () component3 )-0-(0 "foo" [componentC]

 [aze1] #-->> [aze2]
@enduml
```

## Interactive Exercise (10 minutes)

### Task

Model the *HeatingController* internal structure.  

Include:  

- A sensor input port  
- An actuator output port  
- A processing unit

---

## 5. Profile Diagrams (20 minutes)

### Purpose
Define UML extensions for domain-specific modeling.

### Example

```
@startuml
profile SmartHomeProfile {
  stereotype Sensor
  stereotype Actuator
}

class TemperatureSensor <<Sensor>>
class HeatingController <<Actuator>>
@enduml
```

## Interactive Exercise (10 minutes)

### Task

Create a simple **SmartLightingProfile** with:  

- Stereotype `LightDevice`  
- Stereotype `Dimmable`  

Apply your stereotypes to:

- LightSensor  
- LightController

---

## Wrap-Up

### Summary Table

| Diagram Type | Purpose | Example |
|--------------|---------|---------|
| Communication | Object message exchange | Heating activation |
| Interaction Overview | High-level flow | Morning routine |
| Timing | Time-based behavior | Door sensor alert |
| Composite Structure | Internal architecture | Hub subsystem |
| Profile | Domain extensions | SmartHome stereotypes |

### Closing Task

Pick one Smart Home subsystem (Heating, Security, Lighting) and:

- Create *one* interaction diagram
- Create *one* structure diagram
- Apply at least *one* stereotype from a custom profile
