# Lifelong Growth OS Agent Pack Architecture

This document describes the reusable, public Agent Pack architecture. It intentionally excludes any private real-user profile, plan, reflection, notification, or prototype data.

## Public Source Package

The GitHub repository should contain only reusable product and agent assets:

- `agent-pack.json`: product metadata, package identity, entrypoints, schemas, and validation commands.
- `AGENT.md`: platform-neutral orchestrator prompt for agents.
- `skills/life-vision-board/`: Codex-installable skill package. The folder name stays stable for compatibility even though the public product name is `终身成长OS / Lifelong Growth OS`.
- `schemas/`: portable state templates for growth profiles, goal portfolios, and growth logs.
- `tests/`: deterministic validation, scenario coverage, and transcript harness outputs.
- `docs/`: public architecture, Agent platform Skill strategy, contribution rules, and implementation notes.

## Current Scope

The current delivery mode is an Agent platform plugin / Skill / Agent Pack. This repository should not assume a standalone Web/App product, self-hosted model stack, proprietary model integration layer, or custom agent runtime at this stage.

## Private User Data Boundary

The reusable package must not store private user state in source control. Runtime or user-specific systems should keep this data in a private store, such as a platform memory layer, encrypted database, user-owned workspace, or local gitignored directory.

Recommended private data categories:

- `growth_profile`: values, life north star, desired identity, long-term domains, motivation patterns, and memory policy.
- `goal_portfolio`: active goals, roles, priority rules, conflicts, and current cycle focus.
- `goal_contract`: per-goal destination, success signals, constraints, guidance style, and review cadence.
- `stage_plan`: current milestone, weekly plan, daily actions, and review rules.
- `growth_log`: daily, weekly, and monthly reflection evidence.
- `notification_preferences`: calendar channel, message channel, reminder windows, and consent history.

For a local prototype, use a gitignored path such as:

```text
data/users/<user-id>/
```

## Runtime Loop

The host Agent platform session follows this loop:

```text
intake
-> life-level growth profile update when needed
-> multi-goal portfolio update when needed
-> goal contract
-> current stage assessment
-> target milestones
-> stage plan
-> execution coaching
-> review and adjustment
-> memory update
```

The agent should expose the current conversation stage to the user when the user asks where they are in the process. This prevents the experience from feeling like an endless interrogation.

## Multi-Goal Support

Lifelong Growth OS treats multi-goal support as a first-class behavior. Goals can be assigned roles such as:

- `mainline`: the current primary growth or product direction.
- `supporting`: a goal that strengthens the mainline.
- `maintenance`: an ongoing baseline goal.
- `exploration`: a goal under discovery.
- `paused`: a goal intentionally deferred.

The agent should help the user understand tradeoffs across goals instead of flattening every goal into the same priority level.

## Notification And Calendar Integrations

The public Agent Pack can describe reminder and review preferences, but concrete integration credentials and user-specific calendar events belong outside this repository.

Suggested implementation boundary:

- Agent Pack: reminder intent, cadence, message tone, review rule, and consent requirement.
- Private runtime: Feishu/Lark, Google Calendar, email, or other connector credentials and delivery state.

## Compatibility

The package id remains `life-vision-board` for existing install paths and skill references. Public-facing product copy should use:

```text
终身成长OS / Lifelong Growth OS
```
