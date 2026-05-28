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
