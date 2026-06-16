# Personalized Learning State Schemas

Use these schemas as Markdown/YAML state records. Keep them compact and update them when evidence changes.

## Learner Profile

```yaml
learner_profile:
  learner_id: ""
  name_or_alias: ""
  background:
    education_or_work: ""
    relevant_experience: []
    current_context: ""
  preferences:
    guidance_style: "action_coach"
    preferred_session_length_minutes: 30
    preferred_learning_modes: []
    disliked_learning_modes: []
    motivation_triggers: []
    friction_triggers: []
  constraints:
    weekly_time_budget_hours: null
    schedule_windows: []
    tools_available: []
    safety_boundaries: []
  memory_notes:
    effective_explanations: []
    ineffective_explanations: []
    recurring_patterns: []
  updated_at: ""
```

## Goal Contract

```yaml
goal_contract:
  goal_id: ""
  category_primary: ""
  category_secondary: ""
  original_wish: ""
  clarified_goal: ""
  target_level: ""
  success_evidence: []
  time_horizon:
    start_date: ""
    target_date: ""
  weekly_time_budget_hours: null
  scope:
    included: []
    excluded: []
  constraints: []
  guidance_style: "action_coach"
  first_review_date: ""
  status: "draft"
```

## Learning State

```yaml
learning_state:
  goal_id: ""
  current_level:
    label: ""
    confidence: "low"
    evidence: []
  strengths: []
  weaknesses: []
  gap_diagnosis:
    - gap: ""
      impact: ""
      evidence: ""
      priority: ""
  learning_map:
    current_node: ""
    target_node: ""
    milestones: []
    risks: []
    checkpoints: []
  evidence_log: []
  updated_at: ""
```

## Learning Plan

```yaml
learning_plan:
  goal_id: ""
  current_stage: ""
  stage_path:
    - stage: ""
      purpose: ""
      graduation_condition: ""
  seven_day_plan:
    - day: 1
      focus: ""
      task: ""
      expected_evidence: ""
      coach_check: ""
  resources: []
  review:
    review_date: ""
    pass_signal: ""
    adjust_signal: ""
    pause_signal: ""
  status: "active"
  updated_at: ""
```

