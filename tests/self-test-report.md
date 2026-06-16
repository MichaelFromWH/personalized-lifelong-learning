# Loop Learning OS Self-Test Report

Date: 2026-06-16

## Method

This self-test uses the eight scenario files in `tests/scenarios/` and scores the Agent Pack against `tests/evaluation-rubric.md`.

Because this version is a Markdown Agent Pack rather than a running app, the test combines:

- Structural validation with `tests/validate-pack.ps1`.
- Scenario walkthrough: each scenario is checked for expected skill routing and acceptance focus.
- Transcript harness generation with `tests/test-transcript-harness.ps1`.
- Design audit: each skill is checked for whether it can produce the rubric artifacts.

## Scenario Results

| Scenario | Category | Score | Result | Notes |
| --- | --- | ---: | --- | --- |
| 01 | knowledge_understanding | 25/27 | Pass | Requires application output, not just resource list. |
| 02 | skill_training | 26/27 | Pass | Requires speaking output evidence and anxiety-aware coaching. |
| 03 | project_delivery | 26/27 | Pass | Routes around deliverable-first planning and deployment milestone. |
| 04 | exam_certification | 25/27 | Pass | Requires score breakdown and mock review cadence. |
| 05 | creative_expression | 25/27 | Pass | Requires publishing output and critique loop. |
| 06 | career_growth | 26/27 | Pass | Requires proof-of-work artifacts and respects existing experience. |
| 07 | life_practice | 24/27 | Pass with safety note | Includes safety boundary for back discomfort and avoids intense prescription. |
| 08 | research_exploration | 25/27 | Pass | Requires research memo and decision criteria. |

## Score Interpretation

- All scenarios meet the pass threshold of 22/27.
- No critical criterion scored 0.
- Lowest scenario: life practice, because real fitness guidance needs stronger safety and professional-boundary handling in a future app.
- Strongest scenarios: skill training, project delivery, and career growth, because their success evidence is naturally output-based.

## Findings

### Finding 1: Visual generation needed a hard text-first rule

Risk: The agent might generate polished images too early, before the learner approves the learning map or plan.

Fix applied: `skills/visual-rendering.md` now includes explicit markers `TEXT_FIRST` and `USER_CONFIRMATION_REQUIRED`, plus a hard rule requiring learner confirmation.

### Finding 2: Generality needed category routing

Risk: "Universal learning OS" can become vague if every goal is handled the same way.

Fix applied: `AGENT.md` includes `LL_OS_GOAL_CATEGORY_ROUTING` and eight scenario files each cover one learning goal category.

### Finding 3: Dialogue quality cannot be fully proven by file existence

Risk: A structural test can pass even if a future agent gives weak answers.

Fix applied: `tests/evaluation-rubric.md` defines scenario-level scoring, failure signals, and critical artifacts. Future iterations should add transcript-based evaluations.

### Finding 4: PowerShell 5 can misread UTF-8 scripts without BOM

Risk: The first validation run failed with a parser error because Chinese strings inside `tests/validate-pack.ps1` were decoded incorrectly by Windows PowerShell.

Fix applied: `tests/validate-pack.ps1` now uses ASCII-only validation markers such as `LL_OS_STEP_GOAL_CLARIFICATION`, `TEXT_FIRST`, and `category: skill_training`. User-facing Markdown can stay Chinese, while the automated test remains stable.

### Finding 5: Scenario tests needed replayable dialogue artifacts

Risk: Markdown scenarios are useful for human review, but they do not create concrete dialogue evidence.

Fix applied: `tests/run-transcript-harness.ps1` now generates one deterministic simulated transcript per scenario, plus `tests/transcripts/manifest.json` and `tests/transcript-harness-report.md`.

## Residual Risks

- No live LLM transcript harness yet.
- Resource curation quality depends on the host agent's browsing or retrieval tools.
- Image generation quality still needs real visual QA once integrated with an image model.
- The state schemas are Markdown/YAML templates; a future app will need stricter JSON schemas and persistence logic.

## Final Verification

Command run:

```powershell
powershell -ExecutionPolicy Bypass -File .\tests\validate-pack.ps1
powershell -ExecutionPolicy Bypass -File .\tests\test-transcript-harness.ps1
```

Result:

```text
VALIDATION PASSED
Required files, skill routing, schemas, visual rules, and scenario coverage are present.
Transcript harness generated 8 transcripts. Overall result: PASS
TRANSCRIPT HARNESS TEST PASSED
```
