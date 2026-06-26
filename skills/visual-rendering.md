# Skill: Visual Rendering

Use this skill whenever a key Life Vision Board artifact needs a scene-fit visual companion.

## Required Markers

- TEXT_FIRST
- SAME_REPLY_VISUAL_REQUIRED
- HANDOFF_AFTER_VISUAL
- HOST_IMAGE_TOOL
- MODERN_AESTHETIC
- CLEAR_STRUCTURE

## Purpose

Turn milestone routes, stage plans, review summaries, and goal contract posters into clear, beautiful, modern images that make the goal route easier to feel and remember.

## When To Use

- A milestone route, stage plan, review result, current-position map, or goal contract poster is delivered.
- The user would benefit from a milestone route image, stage-plan card, review dashboard, or goal contract poster.
- The host Agent platform has access to an image-generation tool or equivalent visual rendering capability.

## Hard Rules

- Always generate the text version first.
- Generate or attach the first visual companion in the same substantive reply as the text artifact.
- Ask for user additions, corrections, or questions after the text plus visual are delivered.
- Do not hide uncertainty in the image.
- Do not put too much text in the image.
- Prefer clean structure over decoration.
- Make it useful on mobile screens.

## Visual Types

| Type | Use For | Layout |
| --- | --- | --- |
| Milestone route | Current stage, target, milestones, risks, checkpoints. | Route map / subway map / board path. |
| 7-day stage card | Daily actions and observable outputs. | Compact weekly grid. |
| Review dashboard | Progress, evidence, changes, next focus. | Status dashboard. |
| Goal contract poster | Destination and success signals. | One-page mission card. |

## Image Prompt Template

```text
Create a modern, clean, high-clarity Lifelong Growth OS visual.

Subject: [milestone route / 7-day stage plan / review dashboard / goal contract]
User goal: [goal]
Current stage: [current stage]
Target: [target]
Key nodes: [nodes]
Risks: [risks]
Observable checkpoints: [checkpoints]

Style requirements:
- modern app-like information design
- clear hierarchy
- crisp typography
- balanced whitespace
- no clutter
- no decorative bokeh, orbs, or vague gradients
- mobile-readable
- use 2 to 4 calm colors with one accent color
- structure must be instantly understandable

Output language: Chinese unless the user requests another language.
```

## Output Format Before Calling A Host Image Tool

```markdown
## Visual Render Brief

- Image type:
- Audience:
- Main message:
- Content to include:
- Content to omit:
- Style:
- Size / aspect ratio:
- Final prompt:
```

## Quality Bar

A good visual makes the user feel: "I know where I am, where I am going, and what I should do next."

Bad visual behavior:

- The key artifact is delivered as text only.
- The assistant waits for confirmation before producing the first visual companion.
- The visual is decorative rather than explanatory.
