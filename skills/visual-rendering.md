# Skill: Visual Rendering

Use this skill only after the learner confirms a text learning map, plan, or review summary.

## Required Markers

- TEXT_FIRST
- USER_CONFIRMATION_REQUIRED
- GPT-image-2
- MODERN_AESTHETIC
- CLEAR_STRUCTURE

## Purpose

Turn approved learning maps, plans, or review summaries into clear, beautiful, modern images that make the learning route easier to feel and remember.

## When To Use

- The learner approves the text version and asks for a visual.
- The learner would benefit from a learning map image, plan card, review dashboard, or progress poster.
- The environment has access to GPT-image-2 or an equivalent image-generation model.

## Hard Rules

- Always generate the text version first.
- Always ask for user confirmation before image generation.
- Do not hide uncertainty in the image.
- Do not put too much text in the image.
- Prefer clean structure over decoration.
- Make it useful on mobile screens.

## Visual Types

| Type | Use For | Layout |
| --- | --- | --- |
| Learning map | Start, target, milestones, risks, checkpoints. | Route map / subway map / board path. |
| 7-day plan card | Daily tasks and evidence. | Compact weekly grid. |
| Review dashboard | Progress, evidence, changes, next focus. | Status dashboard. |
| Goal contract poster | Destination and success criteria. | One-page mission card. |

## Image Prompt Template

```text
Create a modern, clean, high-clarity learning OS visual.

Subject: [learning map / 7-day plan / review dashboard / goal contract]
Learner goal: [goal]
Current position: [current position]
Target: [target]
Key nodes: [nodes]
Risks: [risks]
Evidence checkpoints: [checkpoints]

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

Output language: Chinese unless the learner requests another language.
```

## Output Format Before Calling Image Model

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

A good visual makes the learner feel: "I know where I am, where I am going, and what I should do next."

