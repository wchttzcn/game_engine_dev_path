# Workflow

## Preferred workflow now

The user currently prefers **this chat as the lesson/mentor interface** rather than building a separate academy website.

Recommended setup:

```text
ChatGPT / Mentor Chat
    ↓
lesson / challenge / architecture discussion

Local Editor
    ↓
Odin implementation

Codex CLI
    ↓
repo-aware review / build / run / test / debugging

Git
    ↓
history / experiments / progress
```

## Why Codex CLI is useful

For this project Codex CLI can be useful because the learning happens in a real repository.

The local agent can:

- inspect files
- inspect directory structure
- run `odin` commands
- inspect build output
- run tests
- inspect git diffs
- help debug
- review the current challenge in context

But the educational rule is critical:

> Codex should not become the person who writes the game.

Preferred prompts:

```text
Review my current challenge attempt.
Do not modify files.
Tell me what I got right, what is conceptually wrong,
and give only Hint Level 1.
```

or:

```text
I am implementing Pong.
Inspect my current implementation.
Do not modify files.
My collision occasionally behaves incorrectly.
Help me reason about the cause.
Start with one hint.
```

Avoid prompts such as:

```text
Implement Pong in Odin for me.
```

unless the educational goal is explicitly to inspect generated code rather than practice implementation.

## Suggested repository shape

```text
game-engine-journey/
│
├── AGENTS.md
├── README.md
├── progress.md
│
├── curriculum/
│   ├── ROADMAP.md
│   └── ...
│
├── journal/
│   ├── 000-start.md
│   └── ...
│
├── labs/
│   ├── 00-memory-layout/
│   └── ...
│
├── games/
│   ├── 01-pong/
│   ├── 02-snake/
│   └── ...
│
├── engine/
│
└── experiments/
```

`engine/` should initially remain empty.

## Progress tracking

A simple progress document can record:

- current world
- current chapter
- current lesson
- XP if gamification remains motivating
- completed concepts
- learning concepts
- revisit list
- games
- engine systems extracted so far
- technical debt
- open questions

Progress does not need to be automated at the beginning.

## Journal

After major projects, write a short technical postmortem.

Suggested questions:

- What was awkward about the architecture?
- Where did allocations happen?
- How many allocations happen per frame?
- Which abstractions were premature?
- Which abstractions were missing?
- What will change in the next project?
- What tool would have made debugging easier?

The journal should make the evolution of the learner’s engine thinking visible over time.

## Dear ImGui / tooling workflow

Do not introduce a full editor at the beginning.

Use tools when they solve real debugging/tuning problems.

Suggested progression by project:

- Pong: text/debug overlay
- Snake: state + grid + memory counters
- Breakout: first Dear ImGui tuning panel
- Platformer: player inspector + live movement tuning
- Baba-like: rule inspector
- Rewind game: timeline debugger
- BOKURA-like: per-player perception view
- Network game: latency/packet-loss/state-sync debugger
- Later: profiler + entity/world editor

## Lesson format

Good lesson structure:

```text
WORLD / CHAPTER / LESSON

Goal
Concept
Prediction
Challenge
Constraints
Acceptance Criteria
Hints
Reflection
Next Unlock
```

Keep lessons practical and connected to current game work.
