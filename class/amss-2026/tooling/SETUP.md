# AMSS 2026 — Student Setup (~20 min)

## Prerequisites

- VS Code and Git installed.
- **One** AI subscription: **Claude Pro** (for Claude Code) or **ChatGPT Plus** (for Codex).

## Steps

1. **Clone the course repo.**

   ```bash
   git clone <course-repo-url> amss-2026
   ```

2. **Install your AI assistant in VS Code** — the one that matches your subscription.

   - *Claude Pro:* in the Extensions panel, search "Claude Code" and install the extension by Anthropic. Open it from the Claude icon in the sidebar and sign in with your Claude account.
   - *ChatGPT Plus:* in the Extensions panel, search "Codex" and install the extension by OpenAI. Open it from the sidebar and sign in with your ChatGPT account.

3. **Add the course settings to every repository you work in** (lab repo, team project repo). Copy the contents of `tooling/template/` into the repository's root:

   ```bash
   # Linux / macOS / Git Bash (run from the root of your lab or project repo)
   cp -r ../amss-2026/tooling/template/. .
   ```

   ```powershell
   # Windows PowerShell (run from the root of your lab or project repo)
   Copy-Item -Recurse -Force ..\amss-2026\tooling\template\* .
   ```

   This adds `AGENTS.md` and `CLAUDE.md` (the course conventions, e.g. Mermaid for UML), `.claude/settings.json` (Claude Code: Sonnet 5, low effort) and `.codex/config.toml` (Codex). Commit them.

4. **Install the diagram previews.**

   Diagrams in this course are written as Mermaid (they also render directly on GitHub). In the Extensions panel, install **Markdown Preview Mermaid Support** (by Matt Bierner); then any ` ```mermaid ` block in a Markdown file renders in VS Code's Markdown preview (Ctrl+Shift+V). The few component and package diagrams use PlantUML — for those, install the **PlantUML** extension (by jebbs) and set its render option to the PlantUML server, so no Java install is needed.

5. **Smoke test.** Open your repository in VS Code, open the assistant's panel and ask:

   > *Generate a UML class diagram (as Mermaid) for a parking lot with levels and spots.*

   You should get a Mermaid block that renders in the preview. Check the model: in Claude Code, type `/model` — it should show Sonnet 5 with low effort; in Codex, the model picker should show the model from `.codex/config.toml`.

## Troubleshooting

- *The assistant ignores the course model:* make sure you opened the repository folder itself (the one containing `.claude/` and `.codex/`), not its parent. Codex asks you to trust the folder before it reads `.codex/config.toml`.
- *Usage limit reached:* both subscriptions have rolling usage windows. Keep prompts focused; if you hit the limit during a lab, pair with a colleague.
- *No subscription yet:* pair with a colleague for the first lab and sort it out before Lab 2.

## Why the course pins a model

Everyone uses the same model and effort level so that AI output is comparable across the cohort and reproducible during the oral defense. Do not change the model or effort for graded work. You may use any other tool for exploration, but graded artifacts must reproduce with the course settings.
