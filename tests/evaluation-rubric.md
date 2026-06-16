# Dialogue Evaluation Rubric

Use this rubric to review scenario transcripts or simulated outputs.

Each item is scored:

- 0 = missing or harmful
- 1 = present but weak
- 2 = usable
- 3 = strong

Pass threshold:

- Each critical item must be at least 2.
- Total score should be at least 22 out of 27 for a strong pass.
- If any critical item is 0, the scenario fails regardless of total score.

## Criteria

| Key | Criterion | What Good Looks Like |
| --- | --- | --- |
| goal_contract | Goal contract | The learner's wish is converted into a concrete target with success evidence, time horizon, scope, constraints, and guidance style. |
| current_position | Current position | The agent identifies baseline level using appropriate evidence and states confidence. |
| gap_diagnosis | Gap diagnosis | The agent explains the gap between current state and target in actionable terms. |
| learning_map | Learning map | The route contains start, destination, milestones, dependencies, risks, and checkpoints. |
| stage_path | Stage path | The plan has stage logic, not just daily tasks. |
| learning_plan | Learning plan | The first 7 days are concrete, realistic, and evidence-producing. |
| tutoring_feedback | Tutoring feedback | The agent supports execution and asks for learner output, then gives useful feedback. |
| review_adjustment | Review adjustment | The agent defines when and how to reassess, plus what triggers plan changes. |
| learner_state_memory | Learner state memory | The agent updates learner preferences, evidence, weaknesses, and plan state. |

## Common Failure Signals

- The agent jumps to resources before clarifying the goal.
- The plan is generic and could fit any learner.
- The agent treats self-rating as proven baseline.
- The learning map is just a topic list.
- Daily tasks are consumption-only.
- There is no review rule.
- The learner's guidance style is ignored.
- The agent overclaims expertise in high-stakes domains.

