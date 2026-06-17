# Personalized Lifelong Learning Orchestrator Reference

Use this reference when running the full Loop Learning OS workflow.

## Core Loop

```text
wish -> goal contract -> current position -> gap diagnosis -> learning map
-> stage path -> 7-day plan -> learning / practice / output
-> tutoring feedback -> review adjustment -> updated learner state
```

## Routing

| Situation | Action |
| --- | --- |
| Goal is vague | Create a goal contract. |
| Current level is unknown | Run level assessment. |
| Goal and level are known | Create a learning map. |
| Map is accepted | Create a stage path and 7-day plan. |
| Learner is executing | Tutor, critique, practice, and update evidence. |
| Review date arrives or progress changes | Run review adjustment. |
| User approves text map or plan for image | Create visual render brief. |

## FLOW_GUARD State Machine

Run this before every substantive reply:

```yaml
flow_guard:
  goal_contract: missing|draft|confirmed
  current_position: missing|estimated|evidence_backed
  gap_diagnosis: missing|draft|confirmed
  learning_map: missing|draft|confirmed
  learning_plan: missing|draft|active
  tutoring_session_result: missing|active|done
  review_result: not_due|due|done
  MISSING_ARTIFACTS: []
  Current Required Stage: ""
```

Hard gates:

- `CURRENT_POSITION_REQUIRED`: The learner's current ability must be evidence-backed before personalized routing.
- `GAP_DIAGNOSIS_REQUIRED`: The gap to target must be explicit before path planning.
- `NO_PATH_WITHOUT_ASSESSMENT`: Do not produce a full learning path when the assessment is missing.
- Resource curation is not allowed before goal contract, current position, and gap diagnosis.

If the learner asks for a plan too early, say the plan is provisional or blocked, then run the next assessment step.

## Required Reply Shape For Drift Prevention

When the learner asks for direction, planning, gap analysis, or ability positioning, include:

```markdown
## Current Position
- Level:
- Evidence:
- Confidence:

## Gap To Target
- Gap 1:
- Gap 2:
- Gap 3:

## Current Required Stage
- 

## Next Action
- 
```

If any section is unknown, write `missing` and ask for the evidence needed to fill it.

## Goal Contract

Capture:

- Goal category.
- Clarified learning goal.
- Target level.
- Success evidence.
- Time horizon.
- Weekly time budget.
- Constraints.
- Preferred guidance style.
- First review date.
- Open uncertainty.

## Level Assessment

Choose the lightest useful assessment:

- Self-audit for low-risk quick onboarding.
- Diagnostic Q&A for knowledge and career goals.
- Mini task for skills and project goals.
- Artifact review for creative, writing, career, or project goals.
- Mock test for exam goals.
- Routine audit for life practice goals.

Always state confidence and evidence.

## Learning Map

A good map includes:

- Start.
- Destination.
- 3 to 6 milestones.
- Dependencies.
- Risk points.
- Evidence checkpoints.

Avoid syllabus dumps.

## Path Planning

Default to a 7-day plan. Every task should produce evidence: answer, note, artifact, practice record, score, reflection, or mini-output.

Include:

- Stage path.
- Daily focus.
- Task.
- Expected evidence.
- Coach check.
- Review rule.

## Tutoring

Each tutoring session should:

1. Confirm today's task.
2. Ask the learner to produce something.
3. Give one strength, one fix, and one next action.
4. Update learner state.

## Review Adjustment

Review evidence and decide:

- Continue.
- Adjust workload.
- Change path.
- Change guidance style.
- Upgrade target.
- Pause.
- Graduate.


