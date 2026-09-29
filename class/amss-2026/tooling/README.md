# AMSS 2026 — Course AI Tooling

Students drive an AI coding assistant inside VS Code and critique what it produces. The course supports two assistants, matching the two subscriptions students are expected to have:

- **Claude Code** (Claude Pro) — official VS Code extension by Anthropic.
- **Codex** (ChatGPT Plus) — official VS Code extension by OpenAI.

## What's here

- `SETUP.md` — student step-by-step onboarding (~20 min).
- `template/` — files every lab and project repository carries at its root:
  - `AGENTS.md` — course conventions for the assistant (Mermaid for UML, …); `CLAUDE.md` imports it, Codex reads it directly.
  - `.claude/settings.json` — pins Claude Code to **Sonnet 5, low effort**.
  - `.codex/config.toml` — pins Codex to **GPT-6 Sol, low effort**, the closest equivalent.

## Why this model and effort

The course needs output that is good enough to work with on the first try, yet still leaves students real defects to find and fix. A calibration in September 2026 ran the course's demo and lab prompts through Haiku 4.5, Sonnet 5 (low, medium) and Opus 5.5 (low, medium) and graded every answer against the runbooks' defect catalogues. Sonnet 5 at low effort never produced an unusable draft and left enough to critique in 10 of 14 prompts; the Opus settings were near the reference solutions on most modelling prompts.

The same prompts were run through Codex with GPT-6 Luna (low), Sol (low, medium) and Astra (low). Quality was close across the board (average 1.9–2.4 out of 3, against 2.2 for Sonnet 5 low); **Sol at low effort** is the closest match and is Codex's default model, so it is lighter on ChatGPT Plus usage limits than Astra. Two Codex habits to know:

- In a folder without matching code, Codex tends to refuse design requests ("no source files in the workspace"). The line in `AGENTS.md` telling it to answer directly fixes this for Sol (it did not for Luna) — keep that line.
- Codex answers are shorter than Claude's and it more often asks for missing rules instead of inventing them (for example, a fare rate), so Codex users see fewer invented numbers and more silent changes when revising.

## Keep it in sync

If the pinned model or effort changes, update `template/`, `SETUP.md`, the Lab 1 deck, and the Week 1 lecture's tooling slides together.
