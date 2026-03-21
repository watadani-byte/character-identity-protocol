# Character Identity Protocol (CIP)

-----

## 1. Core Model

Generative AI does not execute input directly.

```
A → (A + C) → B′
```

|Symbol|Definition                                                                                     |
|------|-----------------------------------------------------------------------------------------------|
|A     |User input                                                                                     |
|C     |Internal constraint — optimization pressure, training priors, compression, constraint rewriting|
|B     |Intended output                                                                                |
|B′    |Actual output                                                                                  |

**B′ ≠ B**

The system rewrites A under C — through omission, compression, and structural redefinition — before producing B′.

The difference between B and B′ is **drift**: a structural deviation introduced during internal reconstruction.

-----

## 2. Extended Model

Internal processing occurs in four stages:

1. Input Interpretation
1. Problem Reconstruction
1. Latent Representation Generation
1. Output Formation

The transformation chain is:

```
A → (A + C) → A′ → B′
```

A′ is the internally redefined input. Information lost at this stage is irreversible.

-----

## 3. Case Study

**Prompt:** “A woman looking over her shoulder at the camera.”

The input A includes limb and pose constraints.

The output B′ removes limb information and defaults to portrait framing.

This is not omission.

Limb and pose information were structurally removed during the reconstruction process.

The transformation occurred at the A → (A + C) stage, not at the output stage.

C acted on A. B′ reflects C, not A.

-----

## 4. Control Layer

Drift is evaluated across three axes: **Face · Pose · Style**

Decision logic:

|Drift Level|Action|
|-----------|------|
|Small      |Keep  |
|Medium     |Retry |
|Large      |Anchor|
|Critical   |Purge |

-----

## 5. Operational Governance

**Core principles:**

- Generative AI does not execute instructions — it reinterprets them.
- Every input is subject to constraint rewriting.
- Problem reconstruction must be prevented, not corrected, as reconstruction rewrites A under C.

**Anchor rules:**

- Anchor is a single contiguous block.
- No lists. No metaphors. No editing.

**Input constraints:**

- Imperative statements only.
- No conditional branching.
- One state change per axis per generation.

**Rollback:**

- No correction. Regeneration only.
- Re-execute from anchor.

-----

## 6. Prompt Design

Prompt order defines constraint priority:

1. Character identity
1. Body / hair
1. Pose / gaze
1. Expression / outfit
1. Scene

**Rules:** Small deltas per change. Re-specify to restore. Avoid redundancy. Maintain state separation.

-----

## 7. Workflow

```
1. Generate    A → B′
2. Evaluate    Gate (Face · Pose · Style)
3. Decide      Keep / Retry / Anchor / Purge
4. Repeat
```

-----

## 8. System Interpretation

CIP is not a prompting technique.

It is a control system for managing:

- Constraint-driven rewriting
- Drift accumulation
- Identity preservation

-----

## 9. Key Concept

> Drift is not noise.
> It is the structural result of C acting on A.
> Controlling identity means controlling the conditions under which C operates.