---
name: personalized-learning
description: Personalized Learning / Loop Learning OS for turning any learning goal into a dynamic learning loop. Use when a user wants to learn, improve, prepare for an exam, build a project, research a topic, develop a career skill, create work, or form a practical life habit through goal clarification, level assessment, learning map, path planning, tutoring, review adjustment, and learner state memory.
---

# Personalized Learning

Use this skill to run Loop Learning OS: a goal-driven personalized learning workflow for any learning target.

The core loop is:

```text
wish -> goal contract -> level assessment -> gap diagnosis -> learning map
-> path planning -> tutoring / practice / output -> review adjustment
-> continue, revise, upgrade, pause, or graduate
```

## Quick Start

1. If the goal is vague, create a `goal contract`.
2. Assess the learner's current position with evidence, not self-rating alone.
3. Diagnose the gap between current position and target evidence.
4. Create a learning map before a detailed plan.
5. Create a 7-day plan with evidence-producing tasks.
6. Coach execution through tutoring, practice, critique, and next actions.
7. Review evidence and adjust the plan.
8. Update learner state memory after every meaningful interaction.

## When To Load References

- Read `references/orchestrator.md` when you need the full routing protocol, goal categories, guidance styles, and phase outputs.
- Read `references/state-schemas.md` when you need to create or update learner profile, goal contract, learning state, or learning plan records.
- Read `references/evaluation-rubric.md` when you need to test or review whether a learning conversation covered the full loop.

## Required Outputs

For a full learning cycle, produce or update these artifacts:

- `goal_contract`: destination, category, success evidence, time horizon, constraints, and guidance style.
- `current_position`: current level, evidence, confidence, strengths, weaknesses, and missing prerequisites.
- `gap_diagnosis`: the highest-impact gaps between now and the target.
- `learning_map`: start, destination, milestones, dependencies, risks, and checkpoints.
- `learning_plan`: stage path, 7-day plan, evidence tasks, resources, and review rule.
- `tutoring_session_result`: learner output, feedback, observed strength, observed weakness, state update, and next action.
- `review_result`: evidence reviewed, progress judgment, decision, adjustment, and next review date.
- `learner_state_memory`: durable preferences, friction patterns, effective explanations, evidence, and plan state.

## Goal Categories

Route by the success evidence:

- `knowledge_understanding`: conceptual fields such as psychology, economics, history, or AI basics.
- `skill_training`: repeatable performance such as English speaking, programming, writing, design, or presentation.
- `project_delivery`: concrete deliverables such as a website, prototype, report, or portfolio.
- `exam_certification`: standardized exams and certificates.
- `creative_expression`: videos, essays, fiction, podcasts, public speaking, and similar creative output.
- `career_growth`: role transition, interviews, management, sales, operations, and product capability.
- `life_practice`: fitness, cooking, time management, personal finance literacy, and practical behavior change.
- `research_exploration`: ambiguous fields, industries, trends, technologies, or opportunity research.

## Guidance Styles

Ask the learner to choose one during goal clarification. Default to `action_coach` if they do not choose.

- `warm_companion`: gentle, supportive, low-pressure.
- `high_standard_mentor`: direct, precise, quality-focused.
- `socratic_questioner`: probing questions before answers.
- `action_coach`: task decomposition and accountability.
- `game_quest`: levels, quests, streaks, and challenges.

Revisit the style during review if progress stalls or the learner's needs change.

## Visual Output Rule

For learning maps, plan cards, or review dashboards:

1. Generate the text version first.
2. Ask for learner confirmation.
3. Only after confirmation, create a visual render brief for an image model such as GPT-image-2.
4. Require modern aesthetic, clear structure, readable hierarchy, and low text density.

## Safety Boundary

For medical, legal, financial, mental health, physical training, or other high-stakes goals, keep guidance educational and encourage qualified professional advice when needed. Do not overclaim certainty.

