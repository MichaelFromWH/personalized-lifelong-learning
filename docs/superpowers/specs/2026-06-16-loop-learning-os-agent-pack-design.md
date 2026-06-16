# Loop Learning OS Agent Pack Design

## Background

The product direction is a general-purpose personalized learning OS that can run inside existing agent environments before becoming a standalone Web/App product. The first artifact should be a platform-neutral Markdown Agent Pack rather than a full application.

## Target User

The pack serves learners with varied goals: conceptual learning, skill improvement, project delivery, exam preparation, creative expression, career growth, life practice, and open-ended research. The immediate user of this repository is an agent builder who wants to install or adapt the workflow into Codex, Claude Code, ChatGPT, Coze, or a future app wrapper.

## Scope

This version includes:

- A main orchestrator prompt.
- Eight reusable skills for the learning loop.
- Four state schemas.
- Eight scenario-based dialogue tests, one per goal category.
- A scoring rubric for dialogue quality.
- A structural validation script.
- A self-test report with findings and follow-up fixes.

## Non-Scope

This version does not include:

- A Web/App interface.
- Real user accounts or cloud storage.
- A live resource crawler.
- A proprietary model integration layer.
- Fully automated LLM transcript evaluation.

## Product Loop

The canonical loop is:

```text
wish -> goal contract -> current position -> gap diagnosis -> learning map
-> stage path -> plan -> learning / practice / output -> feedback
-> review -> adjust or graduate
```

## Architecture

The pack uses a main `AGENT.md` as an orchestrator and separate Markdown skills as callable phase protocols. State is represented in Markdown schema files so it can be pasted into any agent system, stored as files, or converted into JSON later.

The testing approach combines structural validation and scenario review:

- Structural validation proves required files, routing markers, category coverage, and visual rules exist.
- Scenario review proves the design can cover representative learning goals and expected dialogue behavior.
- Transcript harness testing generates deterministic simulated dialogues for each learning category so the full learning loop can be inspected.
- The self-test report records failures and fixes so the pack can improve over time.

## Acceptance Criteria

- The main agent clearly routes to all required skills.
- The pack covers at least eight learning goal categories.
- Each scenario defines user profile, initial input, expected skill chain, acceptance focus, and failure signals.
- Visual rendering requires text-first confirmation and includes GPT-image-2 output guidance.
- The validation script exits successfully after implementation.
- The transcript harness generates eight scenario transcripts, a manifest, and a report.
- A self-test report documents scenario-level evaluation and fixes.

## Verification Method

Run:

```powershell
powershell -ExecutionPolicy Bypass -File .\tests\validate-pack.ps1
powershell -ExecutionPolicy Bypass -File .\tests\test-transcript-harness.ps1
```

Then inspect `tests/self-test-report.md` against `tests/evaluation-rubric.md`.
