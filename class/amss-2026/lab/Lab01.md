---
title: "AMSS 2026 — Lab 1: Tooling Onboarding + Requirements with AI"
author: "Traian-Florin Șerbănuță"
date: "2026"
---

# Lab 1: Tooling Onboarding + Requirements with AI

Three phases, 100 minutes:

1. **Tooling onboarding** (~15 min) — activate your AI endpoint, confirm repo access.
2. **Requirements drill** (~60 min) — in pairs, drive AI to produce a requirements doc; critique it.
3. **Share-out** (~25 min) — compare failure modes across the room.

Deliverable: a requirements doc + a 5-line reflection, committed to the course lab repo.

::: notes
This is the hands-on follow-through of the Week 2 lecture. The demo you watched (architect prompts AI, critic finds failure modes, architect re-prompts with a scaffold) is exactly what you do here, in pairs, on a different domain.
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

# Round 2 — swap: B drives, A critiques (~25 min)

Now **B** drives and **A** critiques.

Take a fresh angle: push for measurable acceptance criteria on each requirement, or negative-prompt away the fabricated technology A's round surfaced.

Keep a running log of *what you asked the AI and why* — that's your Rationale evidence and the source of reflection line 3.

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

# Three Prompting Moves (from Week 2)

- **Scaffolded** — *"organized by use case; each use case is one user goal; list FR / NFR / domain per case."*
- **Role priming** — *"act as a requirements engineer for vending hardware."*
- **Negative prompting** — *"no technology choices; no invented payment methods or hardware."*

Use at least one when you re-prompt.

::: notes
These are the three moves from the Week 2 "This Is What Lab 1 Drills" slide. The scaffolded move is the one the lecture demo pivoted on.
:::

---

# Failure Modes to Catch (from Week 2)

Five named modes — what AI wrongly **includes** or mis-states:

- **Fabrication** — invented stakeholders, features, or regulations.
- **Over-specification** — dozens of requirements where a handful suffice.
- **Vague NFRs** (non-functional requirements) — "fast", "reliable" with no measurable threshold.
- **Conflated requirements** — one requirement bundling several concerns.
- **Fabricated technology** — implementation choices posing as requirements.

Plus the flip side — **omission** — what AI silently **leaves out**.

::: notes
The five named modes are from the Week 2 catalogue. Omission is the complement the catalogue doesn't name and the one a vending machine surfaces most. Your reflection may cite any of these six.
:::

---

# Critic's Card — Vending Machine

If the draft looks complete, stress these. Most are omissions:

- Exact change unavailable / making change
- Item sold out after selection
- Two buyers grab the last item at once
- Power loss mid-vend (paid, not dispensed)
- Refund / cancel before dispense
- Restock & cash audit (operator role)
- *"Shall be fast / reliable"* — vague NFR
- *"Use an SQL database / a specific coin mechanism"* — fabricated technology

A draft that omits these *is* failing — silently.

::: notes
Hand this to the critic in each round. A "too-clean" draft that skips these is the most common and most dangerous result: the AI under-covers confidently.
:::

---

# Deliverable

On branch `lab01/<pair-id>`, commit:

- `lab01/<pair-id>/requirements.md` — your best AI-driven requirements doc.
- `lab01/<pair-id>/reflection.md` — exactly 5 lines (next slide).
- `lab01/<pair-id>/log.md` — optional but recommended: your prompt/critique log.

::: notes
The log is your raw Rationale evidence. It's optional for the gate but it's what we look at if a reflection is borderline.
:::

---

# The 5-Line Reflection

One line each:

1. Worst failure mode you saw (name it) + where it appeared.
2. A second failure mode + why it was easy or hard to catch.
3. What you changed in the re-prompt — and **why** (this is Rationale).
4. What improved (or didn't) after iterating.
5. One requirement the AI never got right — the residual risk.

::: notes
Five lines, not five paragraphs. Naming the mode and giving the reason matters more than length.
:::

---

# How to Submit

```bash
git checkout lab01/<pair-id>      # the branch you created in onboarding
mkdir -p lab01/<pair-id>
# write requirements.md and reflection.md inside lab01/<pair-id>/
git add lab01/<pair-id>
git commit -m "Lab 1: <pair-id> vending machine requirements + reflection"
git push -u origin lab01/<pair-id>
```

Push fails? Paste both files into the shared doc / email the instructor, then fix git after class.

::: notes
Substitute your real pair-id everywhere `<pair-id>` appears. The clone was done in onboarding; this is the branch + commit + push.
:::

---

# Grading — Pass / Redo

Pass needs both:

1. Both files committed by the deadline.
2. Your reflection names **at least 2 failure modes** correctly **and** line 3 gives a real reason for your re-prompt (not just what you typed).

A vacuous reflection ("AI was wrong, we fixed it") is a redo, not a fail. We grade your critique and reasoning — not the AI's output quality.

::: notes
Low-stakes onboarding gate. The bar is on the literacy floor (Critique — naming the failure modes; Rationale — the why), not on how polished the requirements doc is.
:::

---

# Phase 3 — Share-out (25 min)

- A few pairs present their worst failure mode + the move that fixed it.
- We tally, live, which failure modes hit the most pairs.
- Same domain, same starting prompt, every pair in the room → a real failure-mode map.

The modes you tally are exactly what you'll critique every week.

::: notes
Instructor pre-selects presenting pairs by scanning pushed reflections during the drill. The live tally is the payoff of everyone sharing one domain.
:::

---

# Why This Matters

If requirements are fabricated, every downstream artifact inherits it — class diagrams (Lab 2), tests (Week 3), all of it.

Today you drilled **Critique** (read & critique AI output) and **Rationale** (say *why* you directed the AI). Next: Lab 2 turns requirements into class diagrams.

::: notes
Closer. Tie back to the literacy floor and forward to Lab 2. Traceability is seeded here — fabrication propagating downstream is the traceability argument.
:::
