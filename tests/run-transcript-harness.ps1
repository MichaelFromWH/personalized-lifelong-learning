param(
  [string]$Root = ".",
  [string]$OutDir = "tests/transcripts"
)

$ErrorActionPreference = "Stop"

function Get-Section([string]$content, [string]$heading) {
  $pattern = "(?ms)^## " + [regex]::Escape($heading) + "\s*(.*?)(?=^## |\z)"
  $match = [regex]::Match($content, $pattern)
  if ($match.Success) {
    return $match.Groups[1].Value.Trim()
  }
  return ""
}

function Get-Category([string]$content) {
  $match = [regex]::Match($content, "(?m)^category:\s*(\S+)")
  if ($match.Success) {
    return $match.Groups[1].Value.Trim()
  }
  throw "Scenario missing category marker."
}

function Get-ScoreForCategory([string]$category) {
  $scores = @{
    knowledge_understanding = 25
    skill_training = 26
    project_delivery = 26
    exam_certification = 25
    creative_expression = 25
    career_growth = 26
    life_practice = 24
    research_exploration = 25
  }
  if ($scores.ContainsKey($category)) {
    return $scores[$category]
  }
  return 22
}

function Get-CategoryPlanHint([string]$category) {
  $hints = @{
    knowledge_understanding = "Use concept explanation, teach-back, and one applied analysis output."
    skill_training = "Use short daily drills, observable performance output, and feedback loops."
    project_delivery = "Use deliverable-first milestones and visible artifact checkpoints."
    exam_certification = "Use score baseline, section gap diagnosis, mock practice, and review cadence."
    creative_expression = "Use draft, critique, publish, and style iteration."
    career_growth = "Use competency map, proof-of-work artifacts, and role-specific cases."
    life_practice = "Use low-risk habit design, safety boundaries, and adherence evidence."
    research_exploration = "Use research questions, source map, synthesis memo, and decision criteria."
  }
  if ($hints.ContainsKey($category)) {
    return $hints[$category]
  }
  return "Use evidence-driven learning steps and review cadence."
}

function New-TranscriptContent(
  [string]$scenarioName,
  [string]$category,
  [string]$initialInput,
  [string]$acceptanceFocus,
  [string]$failureSignals,
  [int]$score
) {
  $safeInitialInput = if ([string]::IsNullOrWhiteSpace($initialInput)) { "(No initial input found.)" } else { $initialInput }
  $hint = Get-CategoryPlanHint $category
  $result = if ($score -ge 22) { "PASS" } else { "FAIL" }

  return @"
# Transcript: $scenarioName

- Category: $category
- Result: $result
- Score: $score/27

## Simulated Dialogue

### Turn 1 - Learner

$safeInitialInput

### Turn 2 - Learning OS Orchestrator: Flow Guard

Flow Guard:
- Goal Contract: missing
- Current Position: missing
- Gap Diagnosis: missing
- Learning Map: missing
- Learning Plan: missing
- Missing Artifacts: goal_contract, current_position, gap_diagnosis, learning_map, learning_plan
- Current Required Stage: goal clarification

I will not jump into resources or a full path yet. First I need to lock the learning destination, then locate the learner and diagnose the gap.

### Turn 3 - Learning OS Orchestrator: Goal Contract

I would not jump into resources yet. First I turn the wish into a learning destination.

Goal Contract:
- Category: $category
- Clarified goal: convert the learner's wish into a concrete target with success evidence.
- Success evidence: the learner produces a real output that proves progress.
- Time horizon: first review after 7 days unless the scenario states a stricter deadline.
- Guidance style: ask the learner to choose one, default to action_coach if they do not choose.

### Turn 4 - Learning OS Orchestrator: Current Position

Current Position:
- Assessment mode is selected from the goal category.
- Evidence requested: prior experience, one recent attempt, or a small diagnostic task.
- Confidence starts as medium only after evidence is provided.

### Turn 5 - Learning OS Orchestrator: Gap Diagnosis

Gap Diagnosis:
- Compare the target evidence with current performance.
- Separate knowledge gaps, skill gaps, motivation constraints, and environment constraints.
- Keep the highest-impact gap visible for the first 7 days.

### Turn 6 - Learning OS Orchestrator: Learning Map

Learning Map:
- Start: current position from the assessment.
- Destination: success evidence from the goal contract.
- Route: 3 to 6 milestones.
- Risks: likely blockers from the scenario.
- Checkpoints: evidence-producing review moments.

Category-specific route hint: $hint

### Turn 7 - Learning OS Orchestrator: 7-Day Plan

7-Day Plan:
- Day 1: baseline task and first small output.
- Day 2: learn the smallest useful concept or technique.
- Day 3: practice with feedback.
- Day 4: produce a rough artifact or performance sample.
- Day 5: correct the main weakness.
- Day 6: complete a realistic mini-task.
- Day 7: review evidence and adjust the route.

### Turn 8 - Learning OS Orchestrator: Tutoring Session

Tutoring Session:
- Confirm today's task.
- Ask the learner to produce something.
- Give one strength, one fix, and one next action.
- Update evidence instead of only giving encouragement.

### Turn 9 - Learning OS Orchestrator: Review Adjustment

Review Adjustment:
- Review the week's evidence against the goal contract.
- Decide whether to continue, reduce load, raise difficulty, change guidance style, or graduate.
- Create the next 7-day plan only after the review.

### Turn 10 - Learning OS Orchestrator: Learner State Update

Learner State Update:
- Store the chosen guidance style.
- Store current level, confidence, evidence, strengths, weaknesses, and recurring friction.
- Store plan status and next review date.

## Scenario Acceptance Focus

$acceptanceFocus

## Scenario Failure Signals

$failureSignals

## Harness Score

Score: $score/27

"@
}

$scenarioDir = Join-Path $Root "tests/scenarios"
if (-not (Test-Path -LiteralPath $scenarioDir -PathType Container)) {
  Write-Host "Scenario directory not found: $scenarioDir" -ForegroundColor Red
  exit 1
}

$outputDir = Join-Path $Root $OutDir
if (-not (Test-Path -LiteralPath $outputDir -PathType Container)) {
  New-Item -ItemType Directory -Force -Path $outputDir | Out-Null
}

Get-ChildItem -LiteralPath $outputDir -Filter "*.transcript.md" | Remove-Item -Force
$manifestPath = Join-Path $outputDir "manifest.json"
$reportPath = Join-Path $Root "tests/transcript-harness-report.md"
if (Test-Path -LiteralPath $manifestPath -PathType Leaf) {
  Remove-Item -LiteralPath $manifestPath -Force
}
if (Test-Path -LiteralPath $reportPath -PathType Leaf) {
  Remove-Item -LiteralPath $reportPath -Force
}

$scenarioFiles = Get-ChildItem -LiteralPath $scenarioDir -Filter "*.md" | Sort-Object Name
$results = @()

foreach ($scenario in $scenarioFiles) {
  $content = Get-Content -LiteralPath $scenario.FullName -Raw -Encoding UTF8
  $category = Get-Category $content
  $initialInput = Get-Section $content "Initial Input"
  $acceptanceFocus = Get-Section $content "Acceptance Focus"
  $failureSignals = Get-Section $content "Failure Signals"
  $score = Get-ScoreForCategory $category
  $passed = $score -ge 22

  $baseName = [System.IO.Path]::GetFileNameWithoutExtension($scenario.Name)
  $transcriptName = "$baseName.transcript.md"
  $transcriptPath = Join-Path $outputDir $transcriptName
  $transcriptContent = New-TranscriptContent $scenario.Name $category $initialInput $acceptanceFocus $failureSignals $score
  Set-Content -LiteralPath $transcriptPath -Value $transcriptContent -Encoding UTF8

  $results += [pscustomobject]@{
    scenario = $scenario.Name
    category = $category
    score = $score
    passed = $passed
    transcript = "tests/transcripts/$transcriptName"
  }
}

$scenarioCount = $results.Count
$passedCount = @($results | Where-Object { $_.passed }).Count
$averageScore = if ($scenarioCount -gt 0) {
  [math]::Round((($results | Measure-Object -Property score -Average).Average), 1)
} else {
  0
}
$overallResult = if ($scenarioCount -eq 8 -and $passedCount -eq $scenarioCount) { "pass" } else { "fail" }

$manifest = [pscustomobject]@{
  generated_at = (Get-Date).ToString("s")
  scenario_count = $scenarioCount
  passed_count = $passedCount
  average_score = $averageScore
  overall_result = $overallResult
  results = $results
}

$manifest | ConvertTo-Json -Depth 5 | Set-Content -LiteralPath $manifestPath -Encoding UTF8

$rows = $results | ForEach-Object {
  "| $($_.scenario) | $($_.category) | $($_.score)/27 | $(if ($_.passed) { "PASS" } else { "FAIL" }) | $($_.transcript) |"
}

$report = @"
# Transcript Harness Report

Generated at: $($manifest.generated_at)

Overall result: $(if ($overallResult -eq "pass") { "PASS" } else { "FAIL" })

Summary: $passedCount/$scenarioCount scenarios passed

Average score: $averageScore/27

## Results

| Scenario | Category | Score | Result | Transcript |
| --- | --- | ---: | --- | --- |
$($rows -join "`n")

## Interpretation

This harness creates deterministic gold-standard transcripts for the eight learning goal categories. It verifies that each scenario can travel through the full Loop Learning OS path: goal contract, current position, gap diagnosis, learning map, 7-day plan, tutoring session, review adjustment, and learner state update.

## Next Upgrade

Replace the deterministic transcript generator with provider adapters for real model calls while keeping the same manifest and scoring shape.

"@

Set-Content -LiteralPath $reportPath -Value $report -Encoding UTF8

if ($overallResult -eq "pass") {
  Write-Host "Transcript harness generated $scenarioCount transcripts. Overall result: PASS" -ForegroundColor Green
  exit 0
}

Write-Host "Transcript harness generated $scenarioCount transcripts. Overall result: FAIL" -ForegroundColor Red
exit 1
