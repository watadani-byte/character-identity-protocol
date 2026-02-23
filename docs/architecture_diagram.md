# Architecture Diagram: Where the Anchor Intervenes

This diagram shows the standard generation pipeline and where the anchor mechanism applies constraint.

-----

## Identity Validation Flow

```
Prompt + Anchor Image
        ↓
      Model
        ↓
      Output
        ↓
  ┌─────────────┐
  │  Face Gate  │
  │ Proportion  │
  │    Gate     │
  │  Skeleton   │
  │    Gate     │
  └─────────────┘
        ↓
   PASS     FAIL
    ↓          ↓
Continue   Hard Abort
```

-----

## Standard Pipeline (No Anchor)

```
User Prompt (A)
      │
      ▼
┌─────────────────────┐
│  Layer A             │  Language interpretation
│  (Prompt parsing)    │
└─────────┬───────────┘
          │
          ▼
┌─────────────────────┐
│  Layer B             │  ← UNCONTROLLED
│  Reconstruction A→A' │  Model rewrites the problem
│  (Optimization)      │  Identity drift originates here
└─────────┬───────────┘
          │
          ▼
┌─────────────────────┐
│  Layer C             │  Latent sampling + rendering
│  (Execution)         │
└─────────┬───────────┘
          │
          ▼
     Output (A')
     (Unpredictable)
```

-----

## With Anchor Mechanism

```
Minimal Prompt (A)  +  Anchor Image ──────────────┐
      │                                            │
      ▼                                            │
┌─────────────────────┐                           │
│  Layer A             │  Low activation           │
│  (Prompt parsing)    │  (minimal prompt)         │
└─────────┬───────────┘                           │
          │                                        │
          ▼                                        ▼
┌─────────────────────────────────────────────────┐
│  Layer B                                         │  ← CONSTRAINED
│  Reconstruction A→A'                             │  Anchor biases solution space
│  (Optimization)                                  │  toward prior convergence point
└─────────┬───────────────────────────────────────┘
          │
          ▼
┌─────────────────────┐
│  Layer C             │  Latent sampling + rendering
│  (Execution)         │
└─────────┬───────────┘
          │
          ▼
     Output ≈ Anchor
     (Convergence preserved)
```

-----

## Key Insight

The anchor does not bypass Layer B.  
It supplies Layer B with a high-density prior — a previously achieved solution state.

Layer B optimizes toward that prior rather than reconstructing freely.

> Optimization never disappears.  
> It is redirected toward a validated baseline.

-----

## Quality Gate Position

```
     Output
        │
        ▼
┌───────────────────┐
│   Quality Gate     │
│                    │
│  FaceGate     PASS │──→ Continue
│  SkeletonGate PASS │
│  ProportionGate    │
│             FAIL   │──→ HARD ABORT
└───────────────────┘
```

*See: [Quality Gate Addendum](quality_gate_addendum.md)*