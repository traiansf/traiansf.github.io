% Software System Modeling - Lab 2
% Andrian Babii
% 25/10/2022

---

# Agenda

- Class diagrams  
- Package diagrams  
- Component diagrams  

---

# Tools

- [Lucidchart](https://www.lucidchart.com/) — component, package diagrams  
- [Mermaid](https://mermaid-js.github.io/) — class diagrams  

---

# Parking Lot Exercise

## Scenario: Airport Parking Lot

- Contains multiple levels (3 levels)  
- Each slot has a **sensor** to detect if it’s free or not  
- **One entrance** and **one exit**  
- Entrance display shows:  
  - Total free spots  
  - Free spots per level  
- Exit has a **camera** that reads license plates  
  - Opens barrier automatically if the ticket is paid  
- Multiple **payment kiosks** on each level  
- Payment methods: **cash** and **credit card**

---

# Package Diagram

![Package Diagram Example](pptx_images_lab2/slideX_imgY.png)

**Definition:**  
A **package diagram** simplifies complex class diagrams by grouping related classes into packages.  
A *package* is a collection of logically related UML elements.

**Usage:**  

- Visual organization of layered architecture within a UML classifier (e.g., a software system).  

---

# Dependencies

There are two main types of dependencies:

- **Import dependency** — allows visibility of elements within another package.  
- **Access dependency** — allows usage of public elements from another package.  

---

# Exercise

**Task:**  
Create a **Package Diagram** based on the **Class Diagram** for the parking lot system.

---

# Component Diagram

![Component Diagram Example](pptx_images_lab2/slideX_imgY.png)

**Definition:**  
A **component diagram** focuses on a system’s **components** and models the **static implementation view**.  
They break the system into **high-level functional units** (components).

---

# Exercise
**Task:**  
Create a **Component Diagram** based on the **Class Diagram** for the parking lot system.

---
