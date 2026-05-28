---
title: "AMSS 2026 — Lab 1: Tooling Onboarding + Requirements with AI"
author: "Traian-Florin Șerbănuță"
date: "2026"
---

# Lab 1: Requirements with AI

Three phases, 100 minutes:

1. **Tooling onboarding** (~15 min) — activate your AI endpoint, confirm repo access.
2. **Requirements drill** (~60 min) — in pairs, drive AI to produce a requirements doc; critique it.
3. **Share-out** (~25 min) — compare failure modes across the room.

Deliverable: a requirements doc + a 5-line reflection, committed to the course lab repo.

::: notes
This is the hands-on follow-through of the W2 lecture. The demo you watched (architect prompts AI, critic finds failure modes, architect re-prompts with a scaffold) is exactly what you do here, in pairs, on a different domain.
:::

---

# Before You Start

- Continue.dev installed per `tooling/SETUP.md` — you did this *before* lab.
- You receive at lab start: your model-endpoint credentials, your **pair-id**, and the lab-repo URL.
- Find your partner. This is a pair lab.

::: notes
Anyone who didn't do SETUP.md at home will lose drill time installing now. Pair them with someone who did and have them catch up during onboarding.
:::

---

# Phase 1 — Onboarding (15 min)

1. Paste your three credentials (model, apiBase, apiKey) into `tooling/.continue/config.yaml`.
2. Smoke test: open any file, press `Ctrl+L`, ask *"summarize this file"*. A coherent answer means the endpoint is live.
3. Clone or pull the lab repo, create branch `lab01/<pair-id>`, and push a stub to confirm access.

Stuck? Endpoint fails → switch to the Gemini free-tier config (`tooling/SETUP.md`). Continue broken → work on your partner's laptop.

::: notes
Goal of this phase: every pair ends with a working AI completion AND a pushed branch, so the only thing left at the end of the drill is committing real content.
:::

---

# Phase 2 — The Drill (60 min)

**Domain: a vending machine.** Same for every pair.

You alternate two roles:

- **Architect** — drives the AI (writes the prompts).
- **Critic** — reads the AI's output and names what's wrong or missing.

Swap roles between the two rounds, so you both practice both.

::: notes
A single shared domain is deliberate: it makes the share-out a real side-by-side comparison of how the same prompt failed differently across pairs.
:::

---

# Round 1 — A drives, B critiques (~25 min)

**A** sends this starting prompt (deliberately bare):

> *"Generate a requirements document for a vending machine. Cover functional, non-functional, and domain requirements."*

**B** reads the output and names failure modes (see the next slides). Log each one.

**A** re-prompts using a prompting move to fix what B found. **This re-prompt is required — iterate at least once.**

::: notes
The bare prompt is on purpose — it reliably produces fabrication, vague NFRs, and omissions. If the draft looks suspiciously clean, the critic uses the edge-case card a few slides on.
:::

---

# Round 2 — swap: B drives, A critiques (~20 min)

Now **B** drives and **A** critiques.

Take a fresh angle: push for measurable acceptance criteria on each requirement, or negative-prompt away the fabricated technology A's round surfaced.

Keep a running log of *what you asked the AI and why* — that's your F3 evidence and the source of reflection line 3.

::: notes
Running short? Round 2 is optional. Round 1 (which contains the required re-prompt) plus the reflection is the minimum.
:::

---

# Finalize + Commit (last 10 min)

- Keep the best requirements doc you drove the AI to — your tightest iteration, not the first draft.
- Write the 5-line reflection (template a few slides on).
- Commit and push to your pair branch.

::: notes
Don't polish the AI output by hand. The lab assesses how you *drove and critiqued* the AI, not how well you hand-edited its text.
:::

---
