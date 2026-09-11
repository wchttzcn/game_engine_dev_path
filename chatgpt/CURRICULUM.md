# Curriculum — Current Design

This is a living roadmap. It should change as the learner progresses.

Do not fully script months of future lessons in advance. Keep the global progression stable and detail the current world/chapter as needed.

## Skill tracks

The curriculum currently has these major tracks:

1. **Systems**
   - memory
   - pointers
   - allocators
   - cache
   - data layout
   - OS-level concepts

2. **Gameplay**
   - movement
   - collision
   - abilities
   - state machines
   - rules
   - combat

3. **Engine**
   - game loop
   - world/entity model
   - assets
   - events
   - serialization
   - architecture

4. **Juice / Game Feel**
   - particles
   - camera shake
   - hitstop
   - tweening
   - animation curves
   - audio variation
   - feedback

5. **Simulation**
   - determinism
   - snapshots
   - rewind
   - replay
   - temporal state

6. **Multiplayer**
   - sockets
   - client/server
   - authority
   - replication
   - latency
   - disconnect/reconnect
   - prediction/resimulation when appropriate

7. **Tools**
   - debug overlay
   - runtime inspection
   - Dear ImGui
   - profiler
   - timeline debugger
   - rule inspector
   - network debugger
   - editor tooling

8. **Rendering**
   - transforms
   - cameras
   - shaders
   - buffers
   - batching
   - 2D/3D rendering
   - lower-level graphics APIs later

## Approximate game progression

### World 0 — Systems Foundations

Purpose:
Move from high-level/frontend assumptions toward memory-aware systems thinking without spending months in console-only exercises.

Topics:

- Memory layout
- Alignment
- Padding
- Pointers
- Slices
- Lifetimes
- Ownership
- Stack / heap
- Allocators
- Arrays / dynamic arrays
- AoS vs SoA
- Cache locality
- Basic data-oriented reasoning
- Game loop concepts

Initial challenge discussed:

### Challenge 0.1 — 100,000 Bullets

Given:

```odin
Bullet :: struct {
    active:   bool,
    position: [2]f32,
    damage:   u16,
    owner:    u8,
    velocity: [2]f32,
    lifetime: f32,
}
```

Before running code, predict:

- `size_of(Bullet)`
- `align_of(Bullet)`
- offsets of each field

Then:

- verify in Odin
- draw the memory layout
- reorder fields without changing types to reduce size if possible
- calculate memory usage for 100,000 bullets
- reason about cache effects
- compare AoS vs SoA for a bullet update loop

The original intended follow-up was:

### Lesson 0.2 — Pointers, Slices & “Who Owns This Memory?”

This challenge has not yet been completed in the conversation.

---

## Game 1 — Pong

Main purpose:
Understand the frame and the game loop.

Topics:

- input
- delta time
- fixed vs variable timestep
- position / velocity
- simple collision
- collision response
- game state
- update/render separation
- audio
- first debug overlay

Progression:

### Pong v0 — It Works

- paddle movement
- ball movement
- collision
- score

### Pong v1 — It Feels Good

- particles
- hit pause
- screen shake
- trails
- pitch variation
- squash/stretch
- impact feedback

### Pong v2 — Engine Thinking

Ask:

- Why is camera shake inside Ball code?
- Why does particle code know about collision?
- How should audio feedback be triggered?

Only then consider extracting reusable systems.

---

## Game 2 — Snake

Main purpose:
Data-oriented programming and memory representation.

Topics:

- arrays
- ring buffers
- grids
- occupancy
- allocation behavior
- contiguous memory
- AoS vs SoA
- cache locality

Potential constraint:

> No heap allocation during gameplay.

Tooling:

- runtime state display
- grid debugging
- memory usage counters

---

## Game 3 — Breakout / Juice Laboratory

Main purpose:
Game feel and runtime tuning.

Topics:

- hitstop
- camera trauma
- particles
- animation curves
- audio variation
- trails
- impact response

This is a strong point to introduce **Dear ImGui**.

Potential ImGui panel:

- ball speed
- hitstop duration
- screen shake trauma/decay
- particle count/lifetime/spread
- audio pitch min/max

Educational question:

Why are gameplay-tuning values compile-time constants rather than runtime data?

Potential future concepts:

- config data
- save/load tuning profiles
- reusable tooling APIs

---

## Game 4 — Precision Platformer / Dead Cells DNA

Main purpose:
Movement, combat timing, and responsiveness.

Movement topics:

- acceleration
- deceleration
- friction
- variable jump height
- coyote time
- jump buffering
- wall interactions
- dash
- drop-through platforms
- forgiving collision behavior

Combat topics:

- startup frames
- active frames
- recovery
- hitboxes
- hurtboxes
- knockback
- hitstop
- cancel windows
- invulnerability frames
- gameplay/animation synchronization

Key principle:

> Simulation correctness is not the same as game-feel correctness.

Tooling:

ImGui player inspector with live values for:

- state
- position
- velocity
- grounded state
- coyote timer
- jump buffer
- movement constants
- dash constants

Debug drawings:

- hitboxes
- ground checks/rays
- velocity
- normals

---

## Game 5 — Baba-like / Rules as Data

Main purpose:
Make gameplay rules data-driven and mutable at runtime.

Examples:

- ROCK IS PUSH
- WALL IS STOP
- FLAG IS WIN
- ROCK IS YOU

Avoid hard-coded type checks as the main architecture.

Topics:

- runtime properties
- composition
- tags
- relations
- rule evaluation
- queries
- event propagation
- dependency systems

This may be a good point to discuss ECS because the problem will now exist before the abstraction is introduced.

Tooling:

**Rule Inspector** showing:

- active rules
- selected entity
- properties/tags
- which rules affect the entity

---

## Game 6 — Braid-like / Rewindable World

Main purpose:
Temporal simulation and state ownership.

Start naïvely if useful:

- snapshot entire world each frame

Then measure and improve.

Topics:

- snapshots
- ring buffers
- serialization
- state diffing
- determinism
- replay
- temporal state
- entity identity
- state ownership

Important architecture questions:

- Should particles rewind?
- Should audio rewind?
- Should animation rewind?
- Should RNG rewind?

This teaches the difference between:

- simulation state
- presentation state

Tooling:

**Timeline Debugger**

- frame scrubber
- snapshots count
- snapshot memory
- entity state by frame
- play/reverse/step controls

---

## Game 7 — PICO PARK-style Local Co-op

Main purpose:
Local multiplayer and input architecture before online networking.

Gameplay ideas:

- push
- jump
- carry
- buttons
- doors
- moving platforms
- stacking players

Topics:

- input abstraction
- keyboard/gamepad devices
- player join/leave
- controller hotplug
- shared camera
- respawn
- shared checkpoints

Avoid separate hard-coded logic for Player 1, Player 2, etc.

---

## Game 8 — BOKURA-like / Two Realities

Main purpose:
Separate simulation from per-player presentation/perception.

Example:

```text
World Entity #42
simulation type: interactable

Player A sees: animal
Player B sees: robot
```

Topics:

- shared world state
- per-player representation
- visibility
- perspective
- information ownership
- conditional interactions

Tooling:

View mode:

- Simulation
- Player A
- Player B

Switch perspectives during debugging.

---

## Game 9 — We Were Here-style Networked Puzzle

Main purpose:
Introduce online multiplayer through a lower-action puzzle game rather than jumping straight into shooter prediction complexity.

Topics:

- sockets
- TCP / UDP concepts
- packet structure
- serialization
- latency
- disconnect/reconnect
- lobby
- server authority
- client authority
- state replication
- RPC concepts

Important concept inherited from BOKURA:

> Hidden information should not be sent to clients that should not know it.

Tooling:

Network debugger:

- ping
- packets/sec
- send/receive rates
- simulated latency
- simulated packet loss
- disconnect/freeze controls
- client state comparison

---

## Game 10 — Storyteller-like / Combinatorial Logic

Main purpose:
Dynamic relationships and reactive rule systems.

Example facts/events:

- Alice loves Bob
- Bob kills Alice
- Charlie sees the murder

Possible consequences:

- Charlie hates Bob
- Bob becomes murderer
- Alice becomes dead

Topics:

- graphs
- relationships
- state transitions
- rule engines
- dependency graphs
- reactive evaluation
- constraint-like reasoning

Potential useful connection to frontend experience:

State changes → dependencies change → output is recomputed.

But now the output is a simulation, not a DOM.

---

## Engine extraction later

Only after multiple games justify it, an engine may begin to resemble:

```text
Core
├── Memory
├── Containers
├── Math
├── Time
└── Logging

Platform
├── Window
├── Input
├── File IO
└── Networking

Simulation
├── World
├── Entity
├── Rules
├── Events
├── Snapshot
└── Replay

Presentation
├── Renderer
├── Animation
├── Audio
├── Particles
└── Camera

Gameplay
├── Character Controller
├── Interaction
├── Abilities
└── Puzzle Rules

Tools
├── Debug UI
├── Inspector
├── Profiler
├── Asset Pipeline
└── Replay Viewer
```

The Simulation / Presentation split may become especially central because it connects Braid, BOKURA, We Were Here, networking, replay, and debugging.

---

## Long-term capstone direction

Possible final game:

A 2-player cooperative systemic puzzle/platformer where:

- both players share one simulated world
- they perceive parts of it differently
- some rules are mutable
- temporal/rewind mechanics exist
- networking synchronizes the shared world
- developer tooling makes hidden state observable

This is a direction, not a fixed requirement.

The capstone should come only after the supporting systems have been learned through smaller games.
