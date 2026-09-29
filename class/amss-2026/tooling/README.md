# AMSS 2026 — Course AI Tooling

Students drive an AI coding assistant inside VS Code and critique what it produces. The course supports two assistants, matching the two subscriptions students are expected to have:

- **Claude Code** (Claude Pro) — official VS Code extension by Anthropic.
- **Codex** (ChatGPT Plus) — official VS Code extension by OpenAI.

## What's here

- `SETUP.md` — student step-by-step onboarding (~20 min).
- `template/` — files every lab and project repository carries at its root:
  - `AGENTS.md` — course conventions for the assistant (Mermaid for UML, …); `CLAUDE.md` imports it, Codex reads it directly.
  - `.claude/settings.json` — pins Claude Code to **Sonnet 5, low effort**.
  - `.codex/config.toml` — pins Codex to the closest equivalent.

## Why this model and effort

The course needs output that is good enough to work with on the first try, yet still leaves students real defects to find and fix. A calibration in September 2026 ran the course's demo and lab prompts through Haiku 4.5, Sonnet 5 (low, medium) and Opus 5.5 (low, medium) and graded every answer against the runbooks' defect catalogues. Sonnet 5 at low effort never produced an unusable draft and left enough to critique in 10 of 14 prompts; the Opus settings were near the reference solutions on most modelling prompts. The Codex setting has not been calibrated yet.

## Keep it in sync

If the pinned model or effort changes, update `template/`, `SETUP.md`, the Lab 1 deck, and the Week 1 lecture's tooling slides together.
