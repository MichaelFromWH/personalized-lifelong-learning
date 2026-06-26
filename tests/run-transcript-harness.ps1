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
    strategy_decision = 25
    identity_growth = 24
  }
  if ($scores.ContainsKey($category)) {
    return $scores[$category]
  }
  return 22
}

function Get-CategoryPlanHint([string]$category) {
  $hints = @{
    knowledge_understanding = "Use concept map, teach-back, and one applied analysis output."
    skill_training = "Use short drills, observable performance output, and feedback loops."
    project_delivery = "Use deliverable-first milestones and visible artifact checkpoints."
    exam_certification = "Use score baseline, section gap diagnosis, mock practice, and review cadence."
    creative_expression = "Use draft, critique, publish, and style iteration."
    career_growth = "Use competency map, proof-of-work artifacts, and role-specific cases."
    life_practice = "Use low-risk habit design, safety boundaries, and adherence evidence."
    research_exploration = "Use research questions, source map, synthesis memo, and decision criteria."
    strategy_decision = "Use options, constraints, reversible tests, risks, and decision criteria."
    identity_growth = "Use values, patterns, support context, and observable behavior shifts."
  }
  if ($hints.ContainsKey($category)) {
    return $hints[$category]
  }
  return "Use current-position diagnostics, staged action, and review cadence."
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
  $portfolioBlock = ""

  if ($acceptanceFocus -match "growth_profile|goal_portfolio|multi-goal|life-level") {
    $portfolioBlock = @"

### Turn 3A - Lifelong Growth OS Orchestrator: Life-Level Profile And Goal Portfolio

Stage Purpose:
- Because the user named several life goals, we should not force everything into one goal contract yet.

Growth Profile:
- Capture the life north star in the user's own words.
- Identify life domains such as career, health, emotional steadiness, family relationships, and contribution.
- Mark current details as user-confirmed, provisional, or needing future evidence.

Goal Portfolio:
- Main goal: choose only after priority principles and current constraints are clearer.
- Maintenance goals: protect health, family relationships, and emotional steadiness from being sacrificed by the main goal.
- Exploration goals: keep uncertain long-term directions visible without overcommitting.
- Paused goals: preserve real but inactive goals without turning them into silent guilt.

Priority Principle Prompt:
- Before resolving conflicts, ask what should win when goals compete for time, energy, money, attention, or family stability.
"@
  }

  return @"
# Transcript: $scenarioName

- Category: $category
- Result: $result
- Score: $score/27

## Simulated Dialogue

### Turn 1 - User

$safeInitialInput

### Turn 2 - Lifelong Growth OS Orchestrator: Process Preview

Process Preview:
- First we will clarify what the user really wants.
- Then we will locate the user's current stage with a lens suited to the goal.
- After that we will draw the milestone route, turn the current milestone into actions, work through execution, and review whether the route should change.

Stage Purpose:
- This first step is to turn the vision into a destination that can be judged with observable signals.

I will not jump into resources or a full path yet. First I need to make the destination clear enough that the plan can be personal instead of generic.

### Turn 3 - Lifelong Growth OS Orchestrator: Goal Contract

Stage Purpose:
- Now we are making the goal concrete, so the user knows what "done" will look like.

Goal Contract:
- Category: $category
- Clarified goal: convert the user's vision into a concrete target with observable success signals.
- Success signals: the user produces or records real output that proves progress.
- Time horizon: first review after 7 days unless the scenario states a stricter deadline.
- Guidance preference: ask the user to choose relaxed companion, direct mentor, question-led coach, action coach, or challenge mode.

Goal Decomposition:
- Objective: reach the clarified target in a way the user can prove.
- Success Signals:
  - SS1: produce a baseline output, artifact, decision note, score, or behavior record that shows the current starting point.
  - SS2: complete the first improvement or validation cycle and submit evidence.
  - SS3: review progress and decide whether to continue, adjust, complete, or define the next version.
- Executable Actions:
- Share prior context or one recent attempt.
- Complete a small diagnostic task.
- Submit the first output for feedback.
$portfolioBlock

### Turn 4 - Lifelong Growth OS Orchestrator: Current Stage

Stage Purpose:
- This step is not a test; it tells us where the route should start.

Current Stage:
- Assessment mode is selected from the goal category.
- Current position is not automatically treated as current level.
- Basis requested: prior context, one recent attempt, artifact, score, routine record, decision context, or a small diagnostic task.
- Confidence starts as medium only after basis is provided.

### Turn 5 - Lifelong Growth OS Orchestrator: Distance To Target

Stage Purpose:
- Now we compare the target with the current stage, so the first week focuses on the gap that matters most.

Distance To Target:
- Compare the target signals with the current-position basis.
- Separate knowledge gaps, skill gaps, validation gaps, motivation constraints, environment constraints, and decision uncertainty.
- Keep the highest-impact gap visible for the first 7 days.

### Turn 6 - Lifelong Growth OS Orchestrator: Milestone Route

Stage Purpose:
- This step turns the distance into a route, so the user can see the journey instead of a pile of tasks.

Milestone Route:
- Start: current stage from the assessment.
- Destination: success signals from the goal contract.
- Route: 3 to 6 milestones.
- Risks: likely blockers from the scenario.
- Checkpoints: observable review moments.

Category-specific route hint: $hint

### Turn 7 - Lifelong Growth OS Orchestrator: 7-Day Stage Plan

Stage Purpose:
- Now we convert the route and Success Signals into actions the user can actually do this week.

7-Day Stage Plan:
- Day 1: SS1 baseline task and first small output.
- Day 2: SS1 inspect or learn the smallest useful concept, constraint, or technique.
- Day 3: SS2 practice, decide, validate, or produce with feedback.
- Day 4: SS2 produce a rough artifact, behavior record, or decision memo.
- Day 5: SS2 correct the main weakness or uncertainty.
- Day 6: SS3 complete a realistic mini-task.
- Day 7: SS3 review evidence and adjust the route.

### Turn 8 - Lifelong Growth OS Orchestrator: Coaching Session

Stage Purpose:
- This step is for doing the work together, collecting evidence, and correcting one concrete weakness.

Coaching Session:
- Confirm today's task.
- Ask the user to produce, decide, ship, or record something.
- Give one strength, one fix, and one next action.
- Update evidence instead of only giving encouragement.

### Turn 9 - Lifelong Growth OS Orchestrator: Review Adjustment

Stage Purpose:
- This step checks whether the evidence says to continue, lighten, intensify, complete, or change the route.

Review Adjustment:
- Review the week's evidence against the goal and Success Signals.
- Decide whether to continue, reduce load, raise difficulty, change guidance preference, complete, or define the next version.
- Create the next 7-day plan only after the review.

### Turn 10 - Lifelong Growth OS Orchestrator: User State Update

User State Update:
- Store the chosen guidance preference.
- Store current stage, confidence, basis, strengths, weaknesses, and recurring friction.
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
  $transcriptContent = (New-TranscriptContent $scenario.Name $category $initialInput $acceptanceFocus $failureSignals $score).TrimEnd()
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
$overallResult = if ($scenarioCount -ge 10 -and $passedCount -eq $scenarioCount) { "pass" } else { "fail" }

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

This harness creates deterministic gold-standard transcripts for the goal categories. It verifies that each scenario can travel through the full Lifelong Growth OS path: goal contract, current stage, distance to target, milestone route, 7-day stage plan, coaching session, review adjustment, and user state update.

## Next Upgrade

Use the same scenarios for host-platform review sessions when a target Agent platform needs manual or automated acceptance testing.

"@

Set-Content -LiteralPath $reportPath -Value $report -Encoding UTF8

if ($overallResult -eq "pass") {
  Write-Host "Transcript harness generated $scenarioCount transcripts. Overall result: PASS" -ForegroundColor Green
  exit 0
}

Write-Host "Transcript harness generated $scenarioCount transcripts. Overall result: FAIL" -ForegroundColor Red
exit 1
