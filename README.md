# 终身成长OS / Lifelong Growth OS

终身成长OS is a platform-neutral Agent Pack for turning vague goals, ambitions, learning targets, projects, habits, career moves, creative work, research directions, and life changes into a staged execution loop.

Product direction: **Lifelong Growth OS**. The repository keeps the `life-vision-board` package name for compatibility, while the architecture is expanding toward long-term, multi-goal growth support.

It replaces the earlier learning-focused skill with a broader goal-support workflow:

```text
vision or idea -> clarify the real goal -> locate current position
-> draw target milestones -> break down the current stage
-> coach execution -> review and adjust -> confirm achievement or next version
```

The core upgrade is simple but important: the agent should locate the user's current position, not always ask for a current level. Current level is only one useful lens for games, exams, and skill training. Projects, habits, life decisions, research directions, and product bets need different position diagnostics.

## What It Does

终身成长OS helps an agent guide users through:

- shaping a life-level growth profile and life north star
- managing a multi-goal portfolio across main, maintenance, exploration, and paused goals
- clarifying vague visions or goals
- assessing the current position with a method that matches the goal type
- identifying the distance to the target
- drawing target milestones before detailed planning
- turning the current milestone into executable actions
- coaching execution through feedback, critique, decisions, or practice
- reviewing progress and adjusting the route
- updating user state memory

## Current Delivery Mode

Lifelong Growth OS currently ships as an Agent platform plugin / Skill / Agent Pack.

The repository is intentionally focused on reusable instructions, workflow protocols, schemas, tests, and installable Skill assets. The host Agent platform provides chat UI, model routing, tools, accounts, permissions, storage, and deployment.

Current target hosts include Codex Skills, Claude Code project instructions or skill-like packages, Coze bots/workflows, and Dify-style workflow agents.

See [docs/agent-platform-skill-strategy.md](docs/agent-platform-skill-strategy.md).

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
├── docs/architecture/               # Generic Agent Pack and data architecture notes
├── scripts/                         # Local installation helpers
└── tests/                           # Validation and transcript harness
```

Private real-user growth data should not be committed to the Agent Pack source. Use a private store such as `data/users/<user-id>/` or an equivalent platform workspace.

See `docs/architecture/lifelong-growth-os-agent-pack-architecture.md` for the generic source/data boundary.

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
install-skill-from-github --repo MichaelFromWH/lifelong-growth-os --path skills/life-vision-board
```

See [INSTALL.md](INSTALL.md) for more options.

## Use With Generic Agents

For Agent platforms that support project instructions, skills, workflow bots, or knowledge files:

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

Run Codex Skill validation:

```powershell
powershell -ExecutionPolicy Bypass -File .\skills\life-vision-board\scripts\validate-skill.ps1
```

The transcript harness generates:

- `tests/transcripts/*.transcript.md`
- `tests/transcripts/manifest.json`
- `tests/transcript-harness-report.md`

## Status

Current version: `0.2.0`

This is an early Agent Pack. It already includes a complete workflow, schemas, tests, and a Codex-installable skill. The current architecture upgrade adds life-level growth profiles, multi-goal portfolios, and daily/weekly/monthly reflection logs. The next major upgrade is better Agent-platform packaging and real user scenario evaluation inside host platforms.

## License

MIT. See [LICENSE](LICENSE).
