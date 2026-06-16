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
  "name: personalized-learning",
  "Loop Learning OS",
  "goal contract",
  "level assessment",
  "learning map",
  "path planning",
  "tutoring",
  "review adjustment"
)

Require-Text "references/orchestrator.md" @(
  "Core Loop",
  "Goal Contract",
  "Level Assessment",
  "Learning Map",
  "Review Adjustment"
)

Require-Text "references/state-schemas.md" @(
  "learner_profile",
  "goal_contract",
  "learning_state",
  "learning_plan"
)

if ($failures.Count -gt 0) {
  Write-Host "PERSONALIZED LEARNING SKILL VALIDATION FAILED" -ForegroundColor Red
  foreach ($failure in $failures) {
    Write-Host "- $failure"
  }
  exit 1
}

Write-Host "PERSONALIZED LEARNING SKILL VALIDATION PASSED" -ForegroundColor Green
