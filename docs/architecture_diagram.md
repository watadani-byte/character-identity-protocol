# Architecture Diagram: Where the Anchor Intervenes

This diagram shows the standard generation pipeline and where the anchor mechanism applies constraint.

-----

## Operational Summary (At a Glance)

- **Input**: Minimal Prompt + Converged Anchor
- **Process**: Model generation under constrained reconstruction
- **Control**: Identity Validation via Face ∧ Skeleton ∧ Proportion Gates
- **Policy**: FAIL → Immediate Hard Abort & Rollback
- **Authority**: Final validation by human threshold (≈90%)

> This protocol governs generation. It does not modify models.

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

Validated by Human Threshold (≈90%)
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
│  Layer B             │  ← UNCONSTRAINED
│  Reconstruction A→A' │  Identity drift emerges here
│  (Optimization)      │
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
│  Layer A             │  Reduced interpretational │
│  (Prompt parsing)    │  load (minimal prompt)    │
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

**Clarification:**  
Layer A/B/C are conceptual abstractions for explanatory purposes. They do not imply access to or knowledge of proprietary model internals.

-----

## Quality Gate Position

```
     Output
        │
        ▼
┌─────────────────────┐
│    Quality Gate      │
│                      │
│  FaceGate        PASS│──→ Continue
│  SkeletonGate    PASS│
│  ProportionGate  FAIL│──→ HARD ABORT
└─────────────────────┘

Validated by Human Threshold (≈90%)
```

### Gate Policy

`PASS ⇔ FaceGate ∧ SkeletonGate ∧ ProportionGate`

- All gates must pass.
- Any single failure triggers Hard Abort.
- Rollback must revert to the last validated anchor.

> The ≈90% threshold refers to human-judged identity stability, not an automated similarity metric.

-----

## Auditability

Every generation decision (PASS / FAIL / Abort / Rollback) must be loggable and reproducible within session context.

-----

*See: [Quality Gate Addendum](quality_gate_addendum.md)*