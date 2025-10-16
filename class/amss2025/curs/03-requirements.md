---
title: "AMSS Lecture 3: Requirements Analysis & UML Package/Component Diagrams"
author: "[Your Name]"
date: "2025"
---

# Welcome Back

- Course: Analiza și Modelarea Sistemelor Software (AMSS)
- Lecture 3: Requirements Analysis + Package & Component Diagrams
- Duration: 100 minutes (50 + 50 with break)

::: notes
Welcome the class back. Mention the roadmap: we’re transitioning from modeling fundamentals to applying them in system analysis and architecture.
:::

---

# Agenda

1. Requirements Analysis (50 min)
   - What requirements are & why they matter
   - Types of requirements
   - Requirements elicitation & documentation
   - Exercise: Elicit and structure requirements
2. Break (10 min)
3. UML Package & Component Diagrams (50 min)
   - Purpose and syntax
   - Packages for organization
   - Components for architecture
   - Exercise: Model a system architecture

::: notes
Emphasize that requirements analysis connects stakeholder needs to system modeling.
:::

---

# Part 1: Requirements Analysis

## What Are Requirements?

- **Definition:** Statements that describe what a system should do or how it should perform.
- **Purpose:** Capture the intended functionality and constraints before design.
- **Stakeholders:** Users, clients, developers, maintainers.

::: notes
Discuss importance of clear, verifiable requirements and how they drive design models.
:::

---

# Types of Requirements

| Type | Description | Example |
|------|--------------|----------|
| **Functional** | What the system should do | "User can reset password" |
| **Non-functional** | Quality attributes | "Response time < 2 seconds" |
| **Domain** | Environment constraints | "System complies with ISO 27001" |

::: notes
Ask students for examples from their own experiences.
:::

---

# Elicitation Techniques

- Interviews and questionnaires
- Observation and shadowing
- Document analysis
- Brainstorming sessions
- Use cases and scenarios

::: notes
Discuss pros and cons of each. Mention stakeholder involvement and communication.
:::

---

# Documenting Requirements

- Use clear, testable statements
- Follow consistent templates (e.g., IEEE 830)
- Include:
  - Identifier (REQ-001)
  - Description
  - Rationale
  - Priority / status
  - Source

::: notes
Show a small template or example requirement specification.
:::

---

# Interactive Exercise 1: Elicit & Structure Requirements

**Scenario:** Design a *university course registration system*.

In small groups:
1. Identify 5–6 functional and non-functional requirements.
2. Classify them.
3. Present one requirement clearly written and structured.

::: notes
Let groups discuss for ~10 minutes, then share examples on board.
:::

---

# Break

Take 10 minutes.

::: notes
Transition to the modeling aspect—now that we know what the system needs, how do we organize and implement it?
:::

---

# Part 2: UML Package & Component Diagrams

## Why These Diagrams?

- Help organize large models into manageable sections
- Represent physical or logical decomposition
- Show dependencies and interfaces between subsystems

::: notes
Explain difference between packages (logical grouping) and components (physical/implementation view).
:::

---

# UML Package Diagrams

- **Purpose:** Group related classes, use cases, or components.
- **Notation:** Folder icon; dependencies shown as arrows.
- **Usage:** Reflect modular organization.

**Example:**
- `ui`, `core`, `data` packages for a software system

::: notes
Show an example diagram linking 3–4 packages. Mention how dependencies reduce coupling.
:::

---

# UML Component Diagrams

- **Purpose:** Describe the physical architecture of a system.
- **Elements:** Components, interfaces, ports, connectors.
- **Component symbol:** Rectangle with small tabs.

**Example:**
- `WebApp` component provides interface `UserAPI`.
- `Database` component required by `WebApp`.

::: notes
Discuss how components correspond to deployable modules or services.
:::

---

# Relationships Between Components

- **Provides interface:** defines what the component offers
- **Requires interface:** defines what it needs from others
- **Connectors:** show communication pathways

**Example:**
`AuthenticationService` provides `AuthAPI` → `FrontendApp` requires `AuthAPI`

::: notes
Show how components collaborate in a distributed system.
:::

---

# Interactive Exercise 2: Model System Architecture

**Scenario:** Online bookstore system.

- Packages: `catalog`, `orders`, `users`, `payment`
- Components: `WebUI`, `CatalogService`, `OrderService`, `PaymentGateway`

**Tasks:**
1. Draw package diagram showing dependencies.
2. Draw component diagram showing provided/required interfaces.
3. Discuss: how do changes in one component affect others?

::: notes
Groups of 3–4; allow 15–20 minutes. Then review diagrams together.
:::

---

# Wrap-Up

**Key Points:**
- Requirements capture *what* needs to be built.
- Package diagrams organize logical model structure.
- Component diagrams model physical architecture.

**Next:** UML Behavioral Diagrams (Use Case, Activity, Sequence)

::: notes
Encourage students to explore related examples in the GitHub repo. Suggest preparing a few requirements for a mini-project idea.
:::
