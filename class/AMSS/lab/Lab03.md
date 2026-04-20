---
title: "Analiza și Modelarea Sistemelor Software - Lab 3"
author: "Traian Șerbănuță"
date: "2025"
thanks: "Thanking Andrian Babii @ Endava for slide content"
---


# Agenda

- Class diagrams  
- Package diagrams  
- Component diagrams  

---

# Tools

- [Lucidchart](https://www.lucidchart.com/) — component and package diagrams  
- [Mermaid.js](https://mermaid-js.github.io/) — class diagrams  

---

# Parking Lot Exercise

**Scenario:** Airport parking lot  

- Contains multiple levels
- Sensors at each parking slot to detect if a slot is free or not  
- Multiple entrances and exits
- By the entrances there are displays showing:
  - Total free spots  
  - Free spots per level
- Both entrance and exit have cameras that reads license plates  
- Entrance generates a ticket
- Exit Opens the barrier if the ticket was paid
- Multiple payment kiosks on each level  
- Payment can be made with **cash** or **credit card**  

---

```plantuml
@startuml
hide empty members
class AutomatedBarrierSystem {
  open() : boolean
}

AutomatedBarrierSystem --> PlateReadingCamera

class ExitBarrier {
  wasTickerPayed() : boolean
}

class PlateReadingCamera {
  getLicensePlate() : String
}

class EntryBarrier {
  printTicket() : Ticket
}

class Ticket {
  licensePlate: String
  creationDate: Date
  paymentDate: Date
  paymentAmmount: double
  pay(p: Payment): bool
}

class ParkingLot {
  getFreeSpotsPerLevel(idx: int) : int
  getFreeSpots() : int
}

class ParkingLevel {
  getFreeSpots() : int
}

class ParkingSpot {
  isFree: boolean
  number: String
  assignVechicle()
}

class Vehicle {
  licensePlate: String
}

ParkingSpot o--> "0..1" Vehicle
Vehicle o--> "0..1" Ticket


Ticket --> TicketStatus : status
Ticket ..> Payment : <<call>>

enum TicketStatus {
  Assigned
  Payed
  Closed
}

AutomatedBarrierSystem <|-- ExitBarrier
AutomatedBarrierSystem <|-- EntryBarrier
ParkingLot *--> "1..*" ParkingLevel
ParkingLevel *--> "1..*" ParkingSpot
ParkingLevel *--> "1..*" Payment


EntryBarrier ..> Ticket : <<creates>>
ExitBarrier ..> Ticket : <<uses>>

Vehicle <|-- Motorcycle
Vehicle <|-- Car
Vehicle <|-- Van

class DisplayBoard {
  displayFreeSpots()
  displayFreeSpotsPerLevel()
}

DisplayBoard --> ParkingLot

class Payment {
  amount: double
  bool pay()
}

class CashPayment {
  payedAmount: double
  change: double  
}

class CardPayment {
  cardHolderName: String
}

enum CardType {
  Visa
  MasterCard
}

CashPayment --|> Payment
CardPayment --|> Payment
CardPayment --> CardType
ParkingLot --> "1..*" EntryBarrier
ParkingLot --> "1..*" ExitBarrier

@enduml
```

---

# Package Diagram

- A **package** is a collection of logically related UML elements.  

  - Simplify complex class diagrams by grouping classes into *packages*.  

Package diagrams are commonly used to:

- Provide a visual organization of layered architecture  
- Represent logical structure within UML classifiers (like software systems)  

--------------------------------------------------------------------------------------------------------------------------------------------------------
Symbol                     Name                                   Description
-------------------------- ------------------------------------   --------------------------------------------------------------------------------------
![](images/package.png)    Package                                Groups common elements based on data, behavior, or user interaction

![](images/dependency.png) Dependency                             Depicts the relationship between one element (package, named element, etc) and another
--------------------------------------------------------------------------------------------------------------------------------------------------------

---

# Dependencies in Package Diagrams

There are two main types of dependencies between packages:

1. **Import dependency** — allows access to all public elements of another package
   ![](images/import_dependency.png)

2. **Access dependency** — limits access to specific elements only
   ![](images/access_dependency.png)

---

![](images/package_diagram.png)

---

# Exercise

Create a **package diagram** based on the **class diagram for the parking lot**.

---

# Component Diagrams

- Specialized class diagrams that focus on a system’s **components**.  

- Used to model the **static implementation view** of a system.  

-------------------------------------------------------------------------------------------------------------------------------------------------
Symbol                    Name                                   Description
------------------------- -----------------------------------    --------------------------------------------------------------------------------
![](images/component.png) Component                              Modular part of a system that encapsulates its contents and whose manifestation
                                                                 is replaceable within its environment

![](images/required.png)  Required interface                     Represents the services needed/used by the component

![](images/provided.png)  Provided interface                     Represents the services delivered by the component
-------------------------------------------------------------------------------------------------------------------------------------------------


---

# Exercise

Create a **component diagram** based on the **class diagram for the parking lot**.
