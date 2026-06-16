# Personalized Learning

Personalized Learning is a platform-neutral Agent Pack for running a dynamic learning loop inside general-purpose AI agents.

It is built around the Loop Learning OS method:

```text
wish -> goal contract -> current position -> gap diagnosis -> learning map
-> stage path -> plan -> learning / practice / output -> feedback
-> review -> adjust or graduate
```

This project is not limited to Codex. It is designed to work with general Agent foundations such as Codex, Claude, ChatGPT, Coze, Dify-style workflows, custom open-source model agents, or a future Web/App shell.

## What It Does

Personalized Learning helps an agent guide learners through:

- clarifying vague learning goals
- assessing current level with evidence
- diagnosing the gap to the target
- creating a learning map
- planning a concrete 7-day path
- tutoring and coaching execution
- reviewing progress
- updating learner state memory

## Project Structure

```text
.
├── AGENT.md                         # Generic agent orchestrator
├── agent-pack.json                  # Platform-neutral manifest
├── INSTALL.md                       # Installation guide
├── skills/
│   ├── personalized-learning/       # Installable Codex Skill package
│   ├── goal-clarification.md        # Agent Pack phase docs
│   ├── level-assessment.md
│   ├── learning-map.md
│   ├── path-planning.md
│   ├── resource-curation.md
│   ├── tutoring-coach.md
│   ├── review-adjustment.md
│   └── visual-rendering.md
├── schemas/                         # Learner and plan state templates
├── scripts/                         # Local installation helpers
└── tests/                           # Validation and transcript harness
```

## Install As A Codex Skill

After cloning this GitHub project:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install-codex-skill.ps1
```

On macOS/Linux:

```bash
bash ./scripts/install-codex-skill.sh
```

Then restart Codex so the `personalized-learning` skill is picked up.

If installing directly from a GitHub repo with a Codex skill installer, use the skill path:

```text
skills/personalized-learning
```

Example:

```bash
install-skill-from-github --repo <owner>/personalized-learning --path skills/personalized-learning
```

See [INSTALL.md](INSTALL.md) for more options.

## Use With Generic Agents

For Claude, ChatGPT, Coze, or other Agent runtimes:

1. Load [AGENT.md](AGENT.md) as the system or developer instruction.
2. Expose the phase files in [skills](skills) as callable workflow references.
3. Store user state using the templates in [schemas](schemas).
4. Use [tests/evaluation-rubric.md](tests/evaluation-rubric.md) to review conversation quality.

## Test

Run structural validation:

```powershell
powershell -ExecutionPolicy Bypass -File .\tests\validate-pack.ps1
```

Run transcript harness:

```powershell
powershell -ExecutionPolicy Bypass -File .\tests\test-transcript-harness.ps1
```

Run standalone Codex Skill validation:

```powershell
powershell -ExecutionPolicy Bypass -File .\skills\personalized-learning\scripts\validate-skill.ps1
```

The transcript harness generates:

- `tests/transcripts/*.transcript.md`
- `tests/transcripts/manifest.json`
- `tests/transcript-harness-report.md`

## Status

Current version: `0.1.0`

This is an early Agent Pack. It already includes a complete workflow, schemas, tests, and a Codex-installable skill. The next major upgrade is a real model transcript runner that calls OpenAI / Claude / Coze adapters instead of deterministic local transcripts.

## License

MIT. See [LICENSE](LICENSE).

