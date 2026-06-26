# Lifelong Growth OS Agent Pack Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build a platform-neutral Agent Pack for Lifelong Growth OS with scenario-based tests and a self-test report.

**Architecture:** Use `AGENT.md` as the orchestrator, `skills/` as phase protocols, `schemas/` as state templates, and `tests/` as structural plus scenario validation. Keep the first version Markdown-first so it can be embedded into Codex, Claude Code, Coze, Dify-style workflows, or another host Agent platform.

**Tech Stack:** Markdown, PowerShell validation script, Mermaid-compatible text diagrams, image-generation prompt templates.

---

### Task 1: Create Structural Validation

**Files:**
- Create: `tests/validate-pack.ps1`

- [x] **Step 1: Write failing validation**

Create a script that checks required files, routing markers, visual rules, scoring rubric terms, and scenario category coverage.

- [x] **Step 2: Run validation to verify failure**

Run:

```powershell
powershell -ExecutionPolicy Bypass -File .\tests\validate-pack.ps1
```

Expected: FAIL because pack files are missing.

### Task 2: Create Agent Pack

**Files:**
- Create: `README.md`
- Create: `AGENT.md`
- Create: `skills/*.md`
- Create: `schemas/*.schema.md`

- [x] **Step 1: Implement orchestrator**

Write the main Lifelong Growth OS Orchestrator with loop, state artifacts, category routing, guidance styles, and skill routing.

- [x] **Step 2: Implement skills**

Write one focused skill per loop phase: goal clarification, current-stage assessment, milestone route, stage goal decomposition, resource curation, personalized coaching, review adjustment, visual rendering.

- [x] **Step 3: Implement schemas**

Write user profile, goal contract, goal state, and stage plan templates.

### Task 3: Create Scenario Test Suite

**Files:**
- Create: `tests/evaluation-rubric.md`
- Create: `tests/scenarios/*.md`
- Create: `tests/self-test-report.md`

- [x] **Step 1: Write evaluation rubric**

Define pass criteria for goal contract, current position, gap diagnosis, milestone route, stage path, stage plan, tutoring feedback, review adjustment, and user state memory.

- [x] **Step 2: Write scenario tests**

Create scenarios across the target categories.

- [x] **Step 3: Write self-test report**

Record simulated test outcomes, findings, fixes, and residual risks.

### Task 4: Verify And Repair

**Files:**
- Modify as needed based on validation and self-test.

- [ ] **Step 1: Run validation**

Run:

```powershell
powershell -ExecutionPolicy Bypass -File .\tests\validate-pack.ps1
```

Expected: PASS.

- [ ] **Step 2: Inspect self-test report**

Check every scenario against the rubric. Any scenario below pass threshold must produce a fix.

- [ ] **Step 3: Re-run validation**

Run the same validation command after fixes.

### Task 5: Add Transcript Harness

**Files:**
- Create: `tests/test-transcript-harness.ps1`
- Create: `tests/run-transcript-harness.ps1`
- Generate: `tests/transcripts/*.transcript.md`
- Generate: `tests/transcripts/manifest.json`
- Generate: `tests/transcript-harness-report.md`

- [x] **Step 1: Write failing harness test**

Create a test that requires the runner, scenario transcripts, a JSON manifest, and a human-readable report.

- [x] **Step 2: Run test to verify it fails**

Run:

```powershell
powershell -ExecutionPolicy Bypass -File .\tests\test-transcript-harness.ps1
```

Expected: FAIL because the runner and generated outputs do not exist yet.

- [x] **Step 3: Implement deterministic runner**

Create a local runner that reads the scenario files and generates standard simulated transcripts covering the full goal-support loop.

- [x] **Step 4: Run harness test to verify it passes**

Run:

```powershell
powershell -ExecutionPolicy Bypass -File .\tests\test-transcript-harness.ps1
```

Expected: PASS with generated transcripts.
