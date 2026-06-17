param(
  [string]$Root = "."
)

$ErrorActionPreference = "Stop"
$failures = New-Object System.Collections.Generic.List[string]

function Add-Failure([string]$message) {
  $script:failures.Add($message) | Out-Null
}

function Assert-FileExists([string]$path) {
  $fullPath = Join-Path $Root $path
  if (-not (Test-Path -LiteralPath $fullPath -PathType Leaf)) {
    Add-Failure "Missing file: $path"
    return $false
  }
  return $true
}

function Assert-Contains([string]$path, [string[]]$terms) {
  $fullPath = Join-Path $Root $path
  if (-not (Assert-FileExists $path)) {
    return
  }
  $content = Get-Content -LiteralPath $fullPath -Raw -Encoding UTF8
  foreach ($term in $terms) {
    if ($content -notmatch [regex]::Escape($term)) {
      Add-Failure "File $path missing required term: $term"
    }
  }
}

$requiredFiles = @(
  "README.md",
  "INSTALL.md",
  "LICENSE",
  "CONTRIBUTING.md",
  "agent-pack.json",
  "AGENT.md",
  "docs/superpowers/specs/2026-06-16-loop-learning-os-agent-pack-design.md",
  "docs/superpowers/plans/2026-06-16-loop-learning-os-agent-pack.md",
  "skills/goal-clarification.md",
  "skills/level-assessment.md",
  "skills/learning-map.md",
  "skills/path-planning.md",
  "skills/resource-curation.md",
  "skills/tutoring-coach.md",
  "skills/review-adjustment.md",
  "skills/visual-rendering.md",
  "schemas/learner-profile.schema.md",
  "schemas/goal-contract.schema.md",
  "schemas/learning-state.schema.md",
  "schemas/learning-plan.schema.md",
  "tests/evaluation-rubric.md",
  "tests/run-transcript-harness.ps1",
  "tests/test-transcript-harness.ps1",
  "tests/self-test-report.md"
)

foreach ($file in $requiredFiles) {
  Assert-FileExists $file | Out-Null
}

Assert-Contains "AGENT.md" @(
  "Learning OS Orchestrator",
  "learning_stage",
  "stage_transition",
  "STAGE_TRANSITION_RULES",
  "USER_FACING_LANGUAGE",
  "INTERNAL_LABELS_HIDDEN",
  "OPENING_PROCESS_PREVIEW",
  "STAGE_PURPOSE_BRIEF",
  "OKR_DECOMPOSITION",
  "KEY_RESULTS_TO_ACTIONS",
  "LL_OS_STEP_GOAL_CLARIFICATION",
  "LL_OS_STEP_LEVEL_ASSESSMENT",
  "LL_OS_STEP_LEARNING_MAP",
  "LL_OS_STEP_PATH_PLANNING",
  "LL_OS_STEP_RESOURCE_CURATION",
  "LL_OS_STEP_TUTORING_COACH",
  "LL_OS_STEP_REVIEW_ADJUSTMENT",
  "LL_OS_GUIDANCE_STYLE",
  "LL_OS_GOAL_CATEGORY_ROUTING"
)

Assert-Contains "skills/visual-rendering.md" @(
  "TEXT_FIRST",
  "USER_CONFIRMATION_REQUIRED",
  "GPT-image-2",
  "MODERN_AESTHETIC",
  "CLEAR_STRUCTURE"
)

Assert-Contains "tests/evaluation-rubric.md" @(
  "goal_contract",
  "OKR breakdown",
  "current_position",
  "gap_diagnosis",
  "learning_map",
  "stage_path",
  "learning_plan",
  "tutoring_feedback",
  "review_adjustment",
  "learner_state_memory"
)

Assert-Contains "README.md" @(
  "Personalized Lifelong Learning",
  "personalized-lifelong-learning",
  "GitHub",
  "Codex",
  "Claude",
  "ChatGPT",
  "Coze"
)

Assert-Contains "INSTALL.md" @(
  "Codex Skill",
  "Generic Agent",
  "GitHub",
  "skills/personalized-lifelong-learning"
)

Assert-Contains "agent-pack.json" @(
  '"name": "personalized-lifelong-learning"',
  '"displayName": "Personalized Lifelong Learning"',
  '"codexSkill"',
  '"genericAgent"'
)

Assert-FileExists "scripts/install-codex-skill.ps1" | Out-Null
Assert-FileExists "scripts/install-codex-skill.sh" | Out-Null
Assert-FileExists "skills/personalized-lifelong-learning/SKILL.md" | Out-Null
Assert-FileExists "skills/personalized-lifelong-learning/agents/openai.yaml" | Out-Null
Assert-FileExists "skills/personalized-lifelong-learning/references/orchestrator.md" | Out-Null
Assert-FileExists "skills/personalized-lifelong-learning/references/state-schemas.md" | Out-Null
Assert-FileExists "skills/personalized-lifelong-learning/references/evaluation-rubric.md" | Out-Null
Assert-FileExists "skills/personalized-lifelong-learning/scripts/validate-skill.ps1" | Out-Null

Assert-Contains "skills/personalized-lifelong-learning/SKILL.md" @(
  "personalized-lifelong-learning",
  "Loop Learning OS",
  "learning_stage",
  "stage_transition",
  "STAGE_TRANSITION_RULES",
  "USER_FACING_LANGUAGE",
  "INTERNAL_LABELS_HIDDEN",
  "OPENING_PROCESS_PREVIEW",
  "STAGE_PURPOSE_BRIEF",
  "OKR_DECOMPOSITION",
  "KEY_RESULTS_TO_ACTIONS",
  "FLOW_GUARD",
  "MISSING_ARTIFACTS",
  "NO_PATH_WITHOUT_ASSESSMENT",
  "CURRENT_POSITION_REQUIRED",
  "GAP_DIAGNOSIS_REQUIRED",
  "goal contract",
  "level assessment",
  "learning map",
  "path planning",
  "tutoring",
  "review adjustment",
  "references/orchestrator.md"
)

Assert-Contains "schemas/learning-state.schema.md" @(
  "learning_stage",
  "stage_transition_log",
  "last_stage_transition"
)

Assert-Contains "skills/personalized-lifelong-learning/references/state-schemas.md" @(
  "learning_stage",
  "stage_transition_log",
  "last_stage_transition"
)

$scenarioDir = Join-Path $Root "tests/scenarios"
if (-not (Test-Path -LiteralPath $scenarioDir -PathType Container)) {
  Add-Failure "Missing directory: tests/scenarios"
} else {
  $scenarioFiles = Get-ChildItem -LiteralPath $scenarioDir -Filter "*.md" | Sort-Object Name
  if ($scenarioFiles.Count -lt 8) {
    Add-Failure "Expected at least 8 scenario files, found $($scenarioFiles.Count)"
  }

  $requiredCategories = @(
    "category: knowledge_understanding",
    "category: skill_training",
    "category: project_delivery",
    "category: exam_certification",
    "category: creative_expression",
    "category: career_growth",
    "category: life_practice",
    "category: research_exploration"
  )

  $allScenarioText = ($scenarioFiles | ForEach-Object {
    Get-Content -LiteralPath $_.FullName -Raw -Encoding UTF8
  }) -join "`n"

  foreach ($category in $requiredCategories) {
    if ($allScenarioText -notmatch [regex]::Escape($category)) {
      Add-Failure "No scenario covers category: $category"
    }
  }

  foreach ($scenario in $scenarioFiles) {
    $relativePath = "tests/scenarios/$($scenario.Name)"
    Assert-Contains $relativePath @(
      "User Profile",
      "Initial Input",
      "Expected Skill Chain",
      "Acceptance Focus",
      "Failure Signals"
    )
  }
}

if ($failures.Count -gt 0) {
  Write-Host "VALIDATION FAILED" -ForegroundColor Red
  foreach ($failure in $failures) {
    Write-Host "- $failure"
  }
  exit 1
}

Write-Host "VALIDATION PASSED" -ForegroundColor Green
Write-Host "Required files, skill routing, schemas, visual rules, and scenario coverage are present."


