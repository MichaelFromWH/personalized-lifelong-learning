param(
  [string]$Root = "."
)

$ErrorActionPreference = "Stop"
$failures = New-Object System.Collections.Generic.List[string]

function Add-Failure([string]$message) {
  $script:failures.Add($message) | Out-Null
}

function Assert-PathExists([string]$path, [string]$kind) {
  $fullPath = Join-Path $Root $path
  if (-not (Test-Path -LiteralPath $fullPath)) {
    Add-Failure "Missing $kind`: $path"
    return $false
  }
  return $true
}

function Assert-FileContains([string]$path, [string[]]$terms) {
  $fullPath = Join-Path $Root $path
  if (-not (Test-Path -LiteralPath $fullPath -PathType Leaf)) {
    Add-Failure "Missing file for content check: $path"
    return
  }
  $content = Get-Content -LiteralPath $fullPath -Raw -Encoding UTF8
  foreach ($term in $terms) {
    if ($content -notmatch [regex]::Escape($term)) {
      Add-Failure "File $path missing required term: $term"
    }
  }
}

$runner = Join-Path $Root "tests/run-transcript-harness.ps1"
if (-not (Test-Path -LiteralPath $runner -PathType Leaf)) {
  Add-Failure "Missing runner: tests/run-transcript-harness.ps1"
} else {
  & powershell -ExecutionPolicy Bypass -File $runner -Root $Root | Out-Host
  if ($LASTEXITCODE -ne 0) {
    Add-Failure "Runner exited with code $LASTEXITCODE"
  }
}

Assert-PathExists "tests/transcripts" "directory" | Out-Null
Assert-PathExists "tests/transcripts/manifest.json" "file" | Out-Null
Assert-PathExists "tests/transcript-harness-report.md" "file" | Out-Null

$transcriptDir = Join-Path $Root "tests/transcripts"
if (Test-Path -LiteralPath $transcriptDir -PathType Container) {
  $transcripts = Get-ChildItem -LiteralPath $transcriptDir -Filter "*.transcript.md" | Sort-Object Name
  if ($transcripts.Count -ne 8) {
    Add-Failure "Expected 8 transcript files, found $($transcripts.Count)"
  }

  foreach ($transcript in $transcripts) {
    $relativePath = "tests/transcripts/$($transcript.Name)"
    Assert-FileContains $relativePath @(
      "## Simulated Dialogue",
      "Goal Contract",
      "Current Position",
      "Gap Diagnosis",
      "Learning Map",
      "7-Day Plan",
      "Tutoring Session",
      "Review Adjustment",
      "Learner State Update",
      "Score:"
    )
  }
}

Assert-FileContains "tests/transcript-harness-report.md" @(
  "Transcript Harness Report",
  "Overall result: PASS",
  "8/8 scenarios passed",
  "Average score:"
)

if (Test-Path -LiteralPath (Join-Path $Root "tests/transcripts/manifest.json") -PathType Leaf) {
  try {
    $manifest = Get-Content -LiteralPath (Join-Path $Root "tests/transcripts/manifest.json") -Raw -Encoding UTF8 | ConvertFrom-Json
    if ($manifest.scenario_count -ne 8) {
      Add-Failure "Manifest scenario_count expected 8, found $($manifest.scenario_count)"
    }
    if ($manifest.passed_count -ne 8) {
      Add-Failure "Manifest passed_count expected 8, found $($manifest.passed_count)"
    }
    if ($manifest.overall_result -ne "pass") {
      Add-Failure "Manifest overall_result expected pass, found $($manifest.overall_result)"
    }
  } catch {
    Add-Failure "Manifest is not valid JSON: $($_.Exception.Message)"
  }
}

if ($failures.Count -gt 0) {
  Write-Host "TRANSCRIPT HARNESS TEST FAILED" -ForegroundColor Red
  foreach ($failure in $failures) {
    Write-Host "- $failure"
  }
  exit 1
}

Write-Host "TRANSCRIPT HARNESS TEST PASSED" -ForegroundColor Green
