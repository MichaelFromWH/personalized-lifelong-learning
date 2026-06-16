# Skill: Learning Map

Use this skill after the goal and current position are clear enough to draw a route.

## Purpose

Create a structural map that helps the learner see where they are, where they are going, and what path connects the two.

## When To Use

- The learner needs a big-picture route.
- There are multiple milestones or prerequisites.
- The plan would feel arbitrary without a map.
- The learner asks for a visual or intuitive explanation.

## Process

1. Summarize the start point and destination.
2. Identify the minimum viable path, not every possible topic.
3. Split the journey into 3 to 6 milestones.
4. Mark dependencies: what must come before what.
5. Add risk points: likely confusion, motivation dips, time traps, safety issues.
6. Add evidence checkpoints.
7. Produce a text map first.
8. If the learner approves, hand off to `visual-rendering.md`.

## Output Format

```markdown
## Learning Map

- Start:
- Destination:
- Main route:
- Milestones:
- Key dependencies:
- Risk points:
- Evidence checkpoints:

```mermaid
flowchart LR
  A["Current position"] --> B["Milestone 1"]
  B --> C["Milestone 2"]
  C --> D["Target"]
```
```

## Visual Brief

Include this only after the text map is accepted or likely to be reviewed for image output:

```markdown
### Visual Brief For Learning Map

- Canvas:
- Style:
- Layout:
- Nodes:
- Color logic:
- Must include:
- Must avoid:
```

## Quality Bar

A good learning map feels like a route, not a syllabus dump. It shows the learner what matters now, what comes later, and what evidence proves movement.

