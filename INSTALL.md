# Install Personalized Learning

Personalized Learning can be used in two ways:

- As a Codex Skill via `skills/personalized-learning`.
- As a Generic Agent Pack by loading `AGENT.md` and related references into any agent runtime.

## Install As A Codex Skill

### Option 1: Clone Then Install Locally

```powershell
git clone https://github.com/<owner>/personalized-learning.git
cd personalized-learning
powershell -ExecutionPolicy Bypass -File .\scripts\install-codex-skill.ps1
```

On macOS/Linux:

```bash
git clone https://github.com/<owner>/personalized-learning.git
cd personalized-learning
bash ./scripts/install-codex-skill.sh
```

Restart Codex after installation.

### Option 2: Install From GitHub With A Skill Installer

Use the skill path:

```text
skills/personalized-learning
```

Example:

```bash
install-skill-from-github --repo <owner>/personalized-learning --path skills/personalized-learning
```

If your installer supports URLs:

```bash
install-skill-from-github --url https://github.com/<owner>/personalized-learning/tree/main/skills/personalized-learning
```

## Install Into A Custom Skill Library

Copy this folder into your agent's skill library:

```text
skills/personalized-learning
```

The copied folder must contain:

- `SKILL.md`
- `agents/openai.yaml`
- `references/`
- `scripts/`

## Use As A Generic Agent Pack

For Claude, ChatGPT, Coze, Dify-style workflows, custom agents, or open-source model wrappers:

1. Use `AGENT.md` as the main system/developer instruction.
2. Treat files in `skills/*.md` as workflow modules.
3. Use `schemas/*.schema.md` for persistent learner state.
4. Use `tests/evaluation-rubric.md` as the review rubric.
5. Optionally run `tests/run-transcript-harness.ps1` to generate sample transcripts.

## Verify Installation

From the repository root:

```powershell
powershell -ExecutionPolicy Bypass -File .\tests\validate-pack.ps1
powershell -ExecutionPolicy Bypass -File .\tests\test-transcript-harness.ps1
powershell -ExecutionPolicy Bypass -File .\skills\personalized-learning\scripts\validate-skill.ps1
```

Expected result:

```text
VALIDATION PASSED
TRANSCRIPT HARNESS TEST PASSED
PERSONALIZED LEARNING SKILL VALIDATION PASSED
```

