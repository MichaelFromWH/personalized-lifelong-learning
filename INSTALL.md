# Install 终身成长OS / Lifelong Growth OS

终身成长OS is currently packaged for Agent platforms:

- As a Codex Skill via `skills/life-vision-board`.
- As a Generic Agent Pack by loading `AGENT.md` and related references into host platforms that support instructions, skills, workflow bots, or knowledge files.

## Install As A Codex Skill

### Option 1: Clone Then Install Locally

```powershell
git clone https://github.com/MichaelFromWH/lifelong-growth-os.git
cd lifelong-growth-os
powershell -ExecutionPolicy Bypass -File .\scripts\install-codex-skill.ps1
```

On macOS/Linux:

```bash
git clone https://github.com/MichaelFromWH/lifelong-growth-os.git
cd lifelong-growth-os
bash ./scripts/install-codex-skill.sh
```

Restart Codex after installation.

### Option 2: Install From GitHub With A Skill Installer

Use the skill path:

```text
skills/life-vision-board
```

Example:

```bash
install-skill-from-github --repo MichaelFromWH/lifelong-growth-os --path skills/life-vision-board
```

If your installer supports URLs:

```bash
install-skill-from-github --url https://github.com/MichaelFromWH/lifelong-growth-os/tree/main/skills/life-vision-board
```

## Install Into A Custom Skill Library

Copy this folder into your agent's skill library:

```text
skills/life-vision-board
```

The copied folder must contain:

- `SKILL.md`
- `agents/openai.yaml`
- `references/`
- `scripts/`

## Use As A Generic Agent Pack

For Agent platforms such as Claude Code, Coze, Dify-style workflows, or ChatGPT Projects:

1. Use `AGENT.md` as the main system/developer instruction.
2. Treat files in `skills/*.md` as workflow modules.
3. Use `schemas/*.schema.md` for persistent user and goal state.
4. Use `tests/evaluation-rubric.md` as the review rubric.
5. Optionally run `tests/run-transcript-harness.ps1` to generate sample transcripts.

## Verify Installation

From the repository root:

```powershell
powershell -ExecutionPolicy Bypass -File .\tests\validate-pack.ps1
powershell -ExecutionPolicy Bypass -File .\tests\test-transcript-harness.ps1
powershell -ExecutionPolicy Bypass -File .\skills\life-vision-board\scripts\validate-skill.ps1
```

Expected result:

```text
VALIDATION PASSED
TRANSCRIPT HARNESS TEST PASSED
LIFE VISION BOARD SKILL VALIDATION PASSED
```
