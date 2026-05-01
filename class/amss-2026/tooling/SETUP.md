# AMSS 2026 — Student Setup (~30 min)

## Prerequisites

- VS Code installed.
- Git installed.
- Course-issued model-endpoint credentials (handed out in Lab 1).

## Steps

1. **Clone the course repo.**

   ```bash
   git clone <course-repo-url> amss-2026
   cd amss-2026/tooling
   ```

2. **Install Continue.dev.**

   In VS Code, open the Extensions panel and search "Continue". Install the
   extension by Continue Dev, Inc.

3. **Point Continue.dev at the canonical config.**

   Copy `.continue/config.yaml` into your home directory's Continue config
   location:
   - Linux/macOS: `~/.continue/config.yaml`
   - Windows: `%USERPROFILE%\.continue\config.yaml`

4. **Fill in the three `REPLACE_BEFORE_W1` placeholders** in your local copy
   with the credentials handed out in Lab 1 (model name, apiBase, apiKey).

5. **Smoke test.**

   Open any file in VS Code, hit the Continue keybinding (default: Ctrl+L),
   and ask: "summarize this file in one sentence." If you get a response,
   you're set.

## Troubleshooting

- *Network error / 401:* check the apiKey was pasted without leading/trailing
  whitespace.
- *Model not found:* check the `model` field matches what the endpoint actually
  serves (the Lab 1 handout names this).
- *Off-campus / VPN issues with the institutional endpoint:* fall back to the
  Gemini free-tier configuration in `config.yaml`'s comment header.

## What is NOT this setup

You may *also* use Claude Code, Copilot, Cursor on your own account — but
graded artifacts (the directed-design narrative, defect log, TDD reflection)
must reproduce on this canonical setup. In practice: do your work in either,
but verify your final artifacts work when run through Continue.dev pointed
at the course endpoint.
