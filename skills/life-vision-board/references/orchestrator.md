# Lifelong Growth OS Orchestrator Reference

Use this reference when running the full Lifelong Growth OS workflow.

## Core Loop

```text
vision or idea -> goal contract -> current stage -> target milestones
-> stage plan -> execution / coaching -> review adjustment
-> updated goal state
```

For lifelong growth or multi-goal work, run the portfolio wrapper first:

```text
life north star -> growth profile -> goal portfolio
-> active cycle priorities -> per-goal loop -> reflection logs
-> profile, portfolio, and memory updates
```

Use the per-goal loop only after the user has chosen the active-cycle priority or the current priority is obvious and low-risk.

## Routing

| Situation | Action |
| --- | --- |
| Goal is vague | Create a goal contract. |
| Current stage is unknown | Run current-stage assessment. |
| Goal and current stage are known | Create target milestones. |
| Milestones are accepted | Create a stage path and 7-day plan. |
| User is executing | Coach, critique, decide, practice, and update evidence. |
| Review date arrives or progress changes | Run review adjustment. |
| Key artifact is delivered | Create text and visual companion in the same substantive reply, then ask for corrections and preview the next phase. |

## Life-Level And Portfolio Routing

| Situation | Action |
| --- | --- |
| User describes a life purpose, desired self, values, or legacy | Create or update `growth_profile`. |
| User has several important goals | Create or update `goal_portfolio` before choosing one goal loop. |
| Goals conflict | Ask for priority principles and classify goals as main, maintenance, exploration, or paused. |
| User wants career plus health, emotion, family, and contribution | Treat career as one domain, not the whole life system. |
| User names one current main line and several side goals | Keep the named main line as `main`; convert side goals into maintenance guardrails, exploration items, or paused goals. |
| User asks for today's action after portfolio is clear | Use the main goal plus maintenance guardrails to choose today's 1 to 3 actions. |
| User asks for a full plan before portfolio/current stage exists | Mark the plan as premature and collect the missing profile, portfolio, or assessment evidence. |

## User-Facing Language

The state machine is internal. Do not show `goal_stage`, `stage_transition`, `FLOW_GUARD`, raw stage IDs, or raw guidance style IDs to the user.

Translate internal phases into plain language:

| Internal state | User-facing phrase |
| --- | --- |
| `vision_clarification` | Clarify what you really want. |
| `current_stage_assessment` | Locate where you are now. |
| `target_milestones` | Draw the milestone route. |
| `stage_goal_decomposition` | Turn the current milestone into actions. |
| `personalized_coaching` | Work through the current task together. |
| `stage_review_adjustment` | Review this stage and adjust the route. |
| `goal_achieved` | Confirm the goal is achieved or decide the next version. |

Start a new goal loop with a short process preview:

```markdown
Here is how we will do this: first we will clarify what you really want, then locate where you are now, draw the milestone route, break the next milestone into actions, work through the execution together, and review whether to adjust the route.
```

When moving to a new phase, add one purpose sentence before the question or task. Example: "This step is not a test; it helps us choose a starting point that fits reality."

After delivering a goal contract, current-stage assessment, milestone route, stage plan, or review result, close the phase with a natural handoff:

```markdown
We have completed this step and its visual map. Is there anything you want to add or correct? If not, I will move into the next step and [plain-language preview].
```

Do not ask for confirmation before producing the first visual companion for a key artifact. The confirmation happens after text plus visual are delivered.

## FLOW_GUARD State Machine

Run this before every substantive reply:

```yaml
flow_guard:
  goal_stage: intake|vision_clarification|current_stage_assessment|target_milestones|stage_goal_decomposition|personalized_coaching|stage_review_adjustment|paused|goal_achieved
  growth_profile: missing|draft|current
  goal_portfolio: missing|draft|current
  goal_contract: missing|draft|confirmed
  current_stage: missing|estimated|assessed
  milestone_route: missing|draft|confirmed
  stage_plan: missing|draft|active
  coaching_result: missing|active|done
  review_result: not_due|due|done
  MISSING_ARTIFACTS: []
  Current Required Stage: ""
  next_allowed_stage: ""
```

Do not show this block to the user. Use it to decide the next safe move, then translate the result into user-facing progress language.

Hard gates:

- `CURRENT_STAGE_REQUIRED`: The user's current stage must have a suitable basis before personalized routing.
- `MILESTONES_REQUIRED`: Target milestones must be explicit before detailed path planning.
- `NO_PATH_WITHOUT_ASSESSMENT`: Do not produce a full path when the current-stage assessment is missing.
- `PREMATURE_PLANNING_GUARD`: Do not produce a detailed plan before goal contract, current stage, milestone route, and current priority are clear.
- `VISUAL_COMPANION_REQUIRED`: Milestone routes, stage plans, and review dashboards are incomplete without a visual companion when an image, diagram, or render-brief tool is available.
- `HANDOFF_REQUIRED`: After key artifacts, ask for additions or corrections and preview the next phase.
- Resource curation is not allowed before goal contract, current stage, and target milestones.

If the user asks for a plan too early, say the plan is provisional or blocked, then run the next assessment step.

## STAGE_TRANSITION_RULES

Maintain `goal_stage` as a durable field. Update it after each user message, tool call, or skill call.

```yaml
stage_transition:
  from: ""
  to: ""
  trigger: user_message | skill_call | tool_call | assessment_received | review_due | user_requested_pause | goal_achieved
  tool_or_skill: ""
  assessment_basis: ""
  reason: ""
```

Allowed forward transitions:

| From | To | Required Basis |
| --- | --- | --- |
| `intake` | `vision_clarification` | User expresses a vision, idea, or goal. |
| `vision_clarification` | `current_stage_assessment` | Goal contract has target, success signals, constraints, and style. |
| `current_stage_assessment` | `target_milestones` | Current stage has basis and confidence. |
| `target_milestones` | `stage_goal_decomposition` | Milestone route is accepted or usable. |
| `stage_goal_decomposition` | `personalized_coaching` | Current-stage actions exist. |
| `personalized_coaching` | `stage_review_adjustment` | Coaching result and state update are recorded or review is due. |
| `stage_review_adjustment` | `stage_goal_decomposition` | Plan needs adjustment. |
| `stage_review_adjustment` | `goal_achieved` | Success signals meet the goal contract. |

If a tool or skill call does not produce the required basis, do not advance the stage.

## Required Reply Shape For Drift Prevention

When the user asks for direction, planning, gap analysis, or positioning, include:

```markdown
## Current Stage
- Stage:
- Assessment basis:
- Confidence:

## Distance To Target
- Gap 1:
- Gap 2:
- Gap 3:

## Where We Are
- Current focus:
- Why this matters:

## Visual Companion
- Generated image, diagram, or visual render brief:

## Next Action
- 

## Handoff
- Ask for additions or corrections, and preview the next phase.
```

If any section is unknown, write `missing` and ask for the evidence needed to fill it.

## Goal Contract

Capture:

- Goal category.
- Original vision.
- Clarified goal.
- Objective.
- 2 to 4 Success Signals.
- Observable output for each Success Signal.
- Time horizon.
- Weekly time budget.
- Constraints.
- Preferred guidance style.
- First review date.
- Open uncertainty.

## Goal Decomposition

After the goal is clear enough, translate it into:

- Objective: a plain-language destination.
- Success Signals: 2 to 4 measurable proof points.
- Executable actions: small actions in the current target cycle that move a specific Success Signal.

Do not create a detailed plan until Success Signals, current stage, and the priority gap are clear enough. A provisional plan must be labeled as provisional in user-facing language.

## Current Stage Assessment

Choose the lightest useful assessment:

- Diagnostic Q&A for fuzzy, strategic, career, or decision goals.
- Artifact review for writing, design, product, creative, or project goals.
- Mini task for skills and craft goals.
- Score or benchmark review for games, exams, fitness, sales, or measurable performance.
- Routine audit for habit and life-practice goals.
- Context interview when motivation, constraints, or identity conflict are central.

Always state confidence and basis.

## Target Milestones

A good milestone route includes:

- Current stage.
- Destination.
- 3 to 6 milestones.
- Dependencies.
- Risk points.
- Observable checkpoints.
- A scene-fit visual companion delivered in the same reply.

Avoid syllabus dumps.

## Stage Planning

Default to a 7-day plan. Every task should produce an observable output: answer, note, artifact, practice record, score, reflection, shipped work, decision, or behavior record.

Include:

- Stage path.
- Daily or session focus.
- Task.
- Expected output.
- Coach check.
- Review rule.
- Stage-plan visual companion delivered in the same reply.

## Personalized Coaching

Each coaching session should:

1. Confirm today's task.
2. Ask the user to produce, decide, ship, or record something.
3. Give one strength, one fix, and one next action.
4. Update goal state.

## Review Adjustment

Review evidence and decide:

- Continue.
- Adjust workload.
- Change route.
- Change guidance style.
- Upgrade target.
- Pause.
- Complete.
- Define the next version.
