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
  "docs/product-forms-and-integration-strategy.md",
  "docs/standalone-web-app-goal-plan-2026-06.md",
  "docs/superpowers/specs/2026-06-16-life-vision-board-agent-pack-design.md",
  "docs/superpowers/plans/2026-06-16-life-vision-board-agent-pack.md",
  "skills/goal-clarification.md",
  "skills/current-stage-assessment.md",
  "skills/target-milestones.md",
  "skills/stage-goal-decomposition.md",
  "skills/resource-curation.md",
  "skills/personalized-coaching.md",
  "skills/review-adjustment.md",
  "skills/visual-rendering.md",
  "schemas/user-profile.schema.md",
  "schemas/goal-contract.schema.md",
  "schemas/goal-state.schema.md",
  "schemas/stage-plan.schema.md",
  "tests/evaluation-rubric.md",
  "tests/run-transcript-harness.ps1",
  "tests/test-transcript-harness.ps1",
  "tests/self-test-report.md"
)

foreach ($file in $requiredFiles) {
  Assert-FileExists $file | Out-Null
}

Assert-Contains "AGENT.md" @(
  "Life Vision Board Orchestrator",
  "goal_stage",
  "stage_transition",
  "STAGE_TRANSITION_RULES",
  "USER_FACING_LANGUAGE",
  "INTERNAL_LABELS_HIDDEN",
  "KICKOFF_ORIENTATION",
  "STAGE_PURPOSE_BRIEF",
  "GOAL_DECOMPOSITION",
  "KEY_RESULTS_TO_ACTIONS",
  "LVB_STEP_GOAL_CLARIFICATION",
  "LVB_STEP_CURRENT_STAGE_ASSESSMENT",
  "LVB_STEP_TARGET_MILESTONES",
  "LVB_STEP_STAGE_GOAL_DECOMPOSITION",
  "LVB_STEP_RESOURCE_CURATION",
  "LVB_STEP_PERSONALIZED_COACHING",
  "LVB_STEP_REVIEW_ADJUSTMENT",
  "GUIDANCE_STYLE",
  "CURRENT_POSITION_ROUTING"
)

Assert-Contains "skills/current-stage-assessment.md" @(
  "current position, not always current level",
  "Project goals",
  "Strategy or life goals",
  "Habit goals",
  "Research goals"
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
  "success signals",
  "current_stage",
  "distance_to_target",
  "target_milestones",
  "stage_path",
  "stage_plan",
  "coaching_feedback",
  "review_adjustment",
  "user_state_memory"
)

Assert-Contains "README.md" @(
  "Life Vision Board",
  "life-vision-board",
  "current position, not always ask for a current level",
  "Product Forms",
  "Life Portfolio Dashboard",
  "GitHub",
  "Codex",
  "Claude Code",
  "Claude",
  "ChatGPT",
  "Coze"
)

Assert-Contains "docs/product-forms-and-integration-strategy.md" @(
  "Product Forms And Integration Strategy",
  "Shared Kernel",
  "Agent Platform Plugin",
  "Standalone Web/App Product",
  "Adapter Boundary",
  "Life Portfolio Dashboard",
  "Codex",
  "Claude Code",
  "Coze"
)

Assert-Contains "docs/standalone-web-app-goal-plan-2026-06.md" @(
  "Standalone Web/App Goal Plan",
  "Goal Contract Draft",
  "Current Stage",
  "Target Milestone Route",
  "First 7-Day Stage Plan",
  "GLM-5.2",
  "DeepSeek-V4",
  "LangGraph",
  "Life Portfolio Dashboard"
)

Assert-Contains "INSTALL.md" @(
  "Codex Skill",
  "Generic Agent",
  "GitHub",
  "skills/life-vision-board"
)

Assert-Contains "agent-pack.json" @(
  '"name": "life-vision-board"',
  '"displayName": "Life Vision Board"',
  '"productForms"',
  '"agentPlatformPlugin"',
  '"standaloneProduct"',
  '"codexSkill"',
  '"genericAgent"'
)

Assert-FileExists "scripts/install-codex-skill.ps1" | Out-Null
Assert-FileExists "scripts/install-codex-skill.sh" | Out-Null
Assert-FileExists "skills/life-vision-board/SKILL.md" | Out-Null
Assert-FileExists "skills/life-vision-board/agents/openai.yaml" | Out-Null
Assert-FileExists "skills/life-vision-board/references/orchestrator.md" | Out-Null
Assert-FileExists "skills/life-vision-board/references/state-schemas.md" | Out-Null
Assert-FileExists "skills/life-vision-board/references/evaluation-rubric.md" | Out-Null
Assert-FileExists "skills/life-vision-board/scripts/validate-skill.ps1" | Out-Null

Assert-Contains "skills/life-vision-board/SKILL.md" @(
  "name: life-vision-board",
  "Life Vision Board",
  "goal_stage",
  "stage_transition",
  "STAGE_TRANSITION_RULES",
  "USER_FACING_LANGUAGE",
  "INTERNAL_LABELS_HIDDEN",
  "KICKOFF_ORIENTATION",
  "STAGE_PURPOSE_BRIEF",
  "GOAL_DECOMPOSITION",
  "KEY_RESULTS_TO_ACTIONS",
  "FLOW_GUARD",
  "MISSING_ARTIFACTS",
  "NO_PATH_WITHOUT_ASSESSMENT",
  "CURRENT_STAGE_REQUIRED",
  "MILESTONES_REQUIRED",
  "goal contract",
  "current stage assessment",
  "target milestones",
  "stage goal decomposition",
  "personalized coaching",
  "review adjustment",
  "references/orchestrator.md"
)

Assert-Contains "schemas/goal-state.schema.md" @(
  "goal_stage",
  "stage_transition_log",
  "last_stage_transition"
)

Assert-Contains "skills/life-vision-board/references/state-schemas.md" @(
  "goal_stage",
  "stage_transition_log",
  "last_stage_transition"
)

$scenarioDir = Join-Path $Root "tests/scenarios"
if (-not (Test-Path -LiteralPath $scenarioDir -PathType Container)) {
  Add-Failure "Missing directory: tests/scenarios"
} else {
  $scenarioFiles = Get-ChildItem -LiteralPath $scenarioDir -Filter "*.md" | Sort-Object Name
  if ($scenarioFiles.Count -lt 10) {
    Add-Failure "Expected at least 10 scenario files, found $($scenarioFiles.Count)"
  }

  $requiredCategories = @(
    "category: knowledge_understanding",
    "category: skill_training",
    "category: project_delivery",
    "category: exam_certification",
    "category: creative_expression",
    "category: career_growth",
    "category: life_practice",
    "category: research_exploration",
    "category: strategy_decision",
    "category: identity_growth"
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
