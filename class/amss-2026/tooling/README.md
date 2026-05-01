# AMSS 2026 — Canonical Agentic Tooling

This directory holds the **single canonical setup** every student in the cohort runs:
one editor extension, one model endpoint, one config file. The setup is designed
to clone-and-run on any laptop with VS Code and ~30 minutes.

## What's here

- `.continue/config.yaml` — Continue.dev configuration, ready to plug into a model endpoint.
- `SETUP.md` — step-by-step student onboarding (~30 min).

## Why this setup

The course assumes **agentic** AI access (file-and-repo-aware tooling, not chat in
a browser). Continue.dev is used as the baseline because it is open-source, runs
inside VS Code, and supports any OpenAI-compatible endpoint — which means the
*same* config works whether the cohort points at `llm.fmi.unibuc.ro`, Google
Gemini's free tier, or a pooled paid endpoint via LiteLLM.

Students who BYO higher-end tooling (Claude Code, Copilot, Cursor) may use it on
their own accounts, but graded artifacts must reproduce on this canonical setup.

## Procurement options

See the design spec, §6 "Tooling stack", for the three procurement paths
(institutional self-hosted / per-student free-tier / pooled paid API) and the
recommended order. Pick one before W1 and update the endpoint URL in
`.continue/config.yaml`.

## Reference

Design spec: `../../amss/docs/superpowers/specs/2026-05-01-amss-ai-redesign-design.md`
