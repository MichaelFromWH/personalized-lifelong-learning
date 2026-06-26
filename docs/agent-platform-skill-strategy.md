# Agent Platform Skill Strategy

Current scope: Lifelong Growth OS ships first as an Agent Platform Skill / Agent Pack.

This repository should stay focused on reusable instructions, workflow protocols, schemas, tests, and installation assets that can be loaded into existing agent platforms. It should not assume a standalone Web/App product, a self-hosted model stack, or a custom agent runtime.

## Primary Form

The current product form is:

```text
Agent platform plugin / Skill / Agent Pack
```

Target host environments may include:

- Codex Skills.
- Claude Code project instructions or skill-like packages.
- Coze bots or workflows.
- Dify-style workflow agents.
- Other platforms that can load structured instructions, state schemas, and workflow references.

The host platform is responsible for chat UI, accounts, model routing, tool permissions, file access, scheduling, and deployment.

## Repository Responsibilities

This repository owns:

- `AGENT.md`: the platform-neutral orchestrator prompt.
- `skills/`: phase protocols that can be copied into skill libraries or workflow references.
- `skills/life-vision-board/`: the current Codex-installable Skill package.
- `schemas/`: portable state templates for growth profiles, goal portfolios, goal contracts, stage plans, and logs.
- `tests/`: structural validation, deterministic scenario transcripts, and quality rubrics.
- `docs/`: public architecture and implementation notes for the Agent Pack itself.

## Explicit Non-Goals For This Stage

This stage does not include:

- A standalone Web/App product.
- A persistent Life Portfolio Dashboard built and hosted by this repository.
- A self-hosted model stack.
- A proprietary model integration layer.
- A custom agent runtime or orchestration framework.
- Provider adapters for direct model calls.

Those ideas may be revisited later only after the Agent Platform Skill experience proves real user value.

## Design Principle

Keep the pack host-platform-native:

- Use Markdown and lightweight schemas.
- Let each host platform provide the model, tools, identity, permissions, storage, and UI.
- Avoid runtime assumptions that only make sense inside a custom app.
- Keep user-specific data outside source control.

## Validation Focus

The current validation target is not "can we build an app?" It is:

- Can an existing agent platform load the workflow clearly?
- Can the agent guide many goal types without collapsing into generic advice?
- Can the agent expose the current phase so users are not lost in endless questions?
- Can the pack preserve private user data boundaries?
- Can the same scenarios be reviewed deterministically through the transcript harness?
