# Character Identity Protocol (CIP)

A framework for controlling identity in generative systems — where outputs deviate from inputs by design.

-----

## Core Model

Generative systems do not execute user input directly.

```
A → (A + C) → B′
```

|Symbol|Meaning                                                                                            |
|------|---------------------------------------------------------------------------------------------------|
|A     |User input                                                                                         |
|C     |Internal constraint — optimization pressure, training priors, compression, and constraint rewriting|
|B     |Intended output                                                                                    |
|B′    |Actual output                                                                                      |

**B′ ≠ B**

The system internally rewrites A under the influence of C — including omission, compression, and structural redefinition of constraints — before producing B′.

The difference between B and B′ is **drift** — a structural deviation introduced during internal reconstruction.

-----

## Case Study

**Prompt:** “A woman looking over her shoulder at the camera.”

**Intended (B):** Full body, turned posture, eye contact.

**Actual (B′):** Head and shoulders only, forward-facing, no eye contact.

Limb and posture information were not simply ignored — they were structurally removed during internal reconstruction.

This is not a generation error. It is C acting on A.

-----

## Operational Implications

- Prompt precision does not prevent drift. C rewrites A regardless of description length.
- Identity attributes are not preserved across generations by default.
- Separating identity from scene in prompt structure reduces C’s rewrite surface.
- A validated reference output (anchor) carries more constraint information than text alone.
- Drift accumulates across generations. Iteration without correction amplifies deviation.
- Consistent outputs require controlled convergence, not single-shot generation.

-----

## Protocol Layers

**Core Model**
Defines the behavioral structure: A → (A + C) → B′. Establishes why B′ ≠ B and formalizes drift as a structural concept.

**Control Layer (Gate · Anchor · Abort)**
Introduces identity validation gates, anchor-based convergence constraints, and hard abort conditions to detect and respond to drift.

**Operational Layer**
Defines the generation cycle: produce, validate, accept or abort, re-anchor, repeat. Converts generation into a governed reproducible process.

-----

## Key Concept

> Drift is not noise. It is the structural output of C rewriting A.
> Controlling identity means controlling the conditions under which C operates.

-----

## Status

Active — v1.x conceptual and governance layer.