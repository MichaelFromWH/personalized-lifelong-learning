# Life Vision Board

Life Vision Board is a platform-neutral Agent Pack for turning vague goals, ambitions, learning targets, projects, habits, career moves, creative work, research directions, and life changes into a staged execution loop.

It replaces the earlier Personalized Lifelong Learning skill with a broader goal-support workflow:

```text
vision or idea -> clarify the real goal -> locate current position
-> draw target milestones -> break down the current stage
-> coach execution -> review and adjust -> confirm achievement or next version
```

The core upgrade is simple but important: the agent should locate the user's current position, not always ask for a current level. Current level is only one useful lens for games, exams, and skill training. Projects, habits, life decisions, research directions, and product bets need different position diagnostics.

## What It Does

Life Vision Board helps an agent guide users through:

- clarifying vague visions or goals
- assessing the current position with a method that matches the goal type
- identifying the distance to the target
- drawing target milestones before detailed planning
- turning the current milestone into executable actions
- coaching execution through feedback, critique, decisions, or practice
- reviewing progress and adjusting the route
- updating user state memory

## Product Forms

Life Vision Board has two product forms that share the same OS:

- Agent platform plugin: package the workflow into Codex, Claude Code, Coze, Dify-style workflows, and custom agent runtimes.
- Standalone Web/App product: turn the same workflow into a persistent Life Portfolio Dashboard with goals, milestones, evidence, reviews, and reminders.

The shared kernel is the orchestrator, phase skills, schemas, rubrics, and future adapter layer. See [docs/product-forms-and-integration-strategy.md](docs/product-forms-and-integration-strategy.md).

The standalone Web/App execution plan is tracked in [docs/standalone-web-app-goal-plan-2026-06.md](docs/standalone-web-app-goal-plan-2026-06.md).

## Project Structure

```text
.
├── AGENT.md                         # Generic agent orchestrator
├── agent-pack.json                  # Platform-neutral manifest
├── docs/                            # Product and architecture notes
├── INSTALL.md                       # Installation guide
├── skills/
│   ├── life-vision-board/           # Installable Codex Skill package
│   ├── goal-clarification.md        # Agent Pack phase docs
│   ├── current-stage-assessment.md
│   ├── target-milestones.md
│   ├── stage-goal-decomposition.md
│   ├── resource-curation.md
│   ├── personalized-coaching.md
│   ├── review-adjustment.md
│   └── visual-rendering.md
├── schemas/                         # Goal and user state templates
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

Then restart Codex so the `life-vision-board` skill is picked up.

If installing directly from a GitHub repo with a Codex skill installer, use the skill path:

```text
skills/life-vision-board
```

Example:

```bash
install-skill-from-github --repo MichaelFromWH/personalized-lifelong-learning --path skills/life-vision-board
```

See [INSTALL.md](INSTALL.md) for more options.

## Use With Generic Agents

For Claude Code, ChatGPT, Coze, Dify-style workflows, or other Agent runtimes:

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
powershell -ExecutionPolicy Bypass -File .\skills\life-vision-board\scripts\validate-skill.ps1
```

The transcript harness generates:

- `tests/transcripts/*.transcript.md`
- `tests/transcripts/manifest.json`
- `tests/transcript-harness-report.md`

## Status

Current version: `0.2.0`

This is an early Agent Pack. It already includes a complete workflow, schemas, tests, and a Codex-installable skill. The next major upgrade is a real model transcript runner that calls OpenAI / Claude / Coze adapters instead of deterministic local transcripts.

## License

MIT. See [LICENSE](LICENSE).
