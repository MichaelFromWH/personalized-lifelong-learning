param(
  [string]$SkillRoot = (Split-Path -Parent $PSScriptRoot)
)

$ErrorActionPreference = "Stop"
$failures = New-Object System.Collections.Generic.List[string]

function Add-Failure([string]$message) {
  $script:failures.Add($message) | Out-Null
}

function Require-File([string]$relativePath) {
  $path = Join-Path $SkillRoot $relativePath
  if (-not (Test-Path -LiteralPath $path -PathType Leaf)) {
    Add-Failure "Missing file: $relativePath"
  }
}

function Require-Text([string]$relativePath, [string[]]$terms) {
  $path = Join-Path $SkillRoot $relativePath
  if (-not (Test-Path -LiteralPath $path -PathType Leaf)) {
    Add-Failure "Missing file: $relativePath"
    return
  }
  $content = Get-Content -LiteralPath $path -Raw -Encoding UTF8
  foreach ($term in $terms) {
    if ($content -notmatch [regex]::Escape($term)) {
      Add-Failure "$relativePath missing term: $term"
    }
  }
}

Require-File "SKILL.md"
Require-File "agents/openai.yaml"
Require-File "references/orchestrator.md"
Require-File "references/state-schemas.md"
Require-File "references/evaluation-rubric.md"

Require-Text "SKILL.md" @(
  "name: personalized-lifelong-learning",
  "Loop Learning OS",
  "FLOW_GUARD",
  "learning_stage",
  "stage_transition",
  "STAGE_TRANSITION_RULES",
  "USER_FACING_LANGUAGE",
  "INTERNAL_LABELS_HIDDEN",
  "OPENING_PROCESS_PREVIEW",
  "STAGE_PURPOSE_BRIEF",
  "OKR_DECOMPOSITION",
  "KEY_RESULTS_TO_ACTIONS",
  "MISSING_ARTIFACTS",
  "NO_PATH_WITHOUT_ASSESSMENT",
  "CURRENT_POSITION_REQUIRED",
  "GAP_DIAGNOSIS_REQUIRED",
  "goal contract",
  "level assessment",
  "learning map",
  "path planning",
  "tutoring",
  "review adjustment"
)

Require-Text "references/orchestrator.md" @(
  "Core Loop",
  "Learner-Facing Language",
  "Goal Contract",
  "OKR Breakdown",
  "Level Assessment",
  "Learning Map",
  "Review Adjustment"
)

Require-Text "references/state-schemas.md" @(
  "learner_profile",
  "goal_contract",
  "learning_stage",
  "stage_transition_log",
  "learning_state",
  "learning_plan"
)

Require-Text "references/evaluation-rubric.md" @(
  "OKR breakdown"
)

if ($failures.Count -gt 0) {
  Write-Host "PERSONALIZED LIFELONG LEARNING SKILL VALIDATION FAILED" -ForegroundColor Red
  foreach ($failure in $failures) {
    Write-Host "- $failure"
  }
  exit 1
}

Write-Host "PERSONALIZED LIFELONG LEARNING SKILL VALIDATION PASSED" -ForegroundColor Green

