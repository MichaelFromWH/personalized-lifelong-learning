# Schema: Learner Profile

Use this schema to store relatively stable learner information. Update it when evidence changes.

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
    accessibility_needs: []
    safety_boundaries: []
  memory_notes:
    effective_explanations: []
    ineffective_explanations: []
    recurring_patterns: []
    important_context: []
  updated_at: ""
```

