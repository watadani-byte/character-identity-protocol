# Quality Gate & Hard Abort Discipline

> This document formalizes the stop-conditions and validation logic used in production deployments of the Character Identity Protocol.

-----

## Overview

The Quality Gate is a mandatory validation checkpoint applied after every generation turn.

It is not a guideline — it is a hard operational constraint.

-----

## Gate Structure

All three gates must pass simultaneously:

```text
PASS = FaceGate ∧ SkeletonGate ∧ ProportionGate
```

|Gate|What It Checks|
|---|---|
|FaceGate|Facial identity consistency against anchor|
|SkeletonGate|Skeletal proportion and alignment|
|ProportionGate|Overall body proportion consistency|

If **any** gate fails → **Hard Abort**.

-----

## Hard Abort Protocol

When a gate failure is detected:

1. Stop generation immediately
2. Do not attempt progressive correction
3. Reject the failed output
4. Purge contaminated outputs/states from the failed turn onward
5. Reset the context or environment, including opening a new session if needed
6. Re-bind to the last validated anchor, UID, and minimal prompt
7. Re-converge under full gate enforcement
8. Apply gate validation before adoption

> The system is allowed to generate. It is not allowed to degrade.

-----

## Match Rate Threshold

- **Similarity threshold**: operator-defined. Values around ~90% are commonly used in demonstrations, but the exact threshold depends on project tolerance.
- **Measurement**: visual comparison against anchor image by trained operator.
- **Automation**: none — human judgment only.

> The ~90% figure originated as a demonstration value. It is not a protocol standard. Treating it as a fixed threshold is a misapplication of this document.
>
> Match rate is an indicator of drift risk — not a proof of identity. A passing match rate does not confirm identity. A failing match rate does not automatically constitute identity failure.

### Purpose of Match Rate Measurement

The match rate is not an identity verification metric.

It is an **early warning indicator for drift risk and possible identity failure** — a signal that degradation may be beginning before full identity failure occurs.

A declining match rate does not mean the character has failed. It means the system is approaching a condition where failure becomes likely.

The appropriate response to a low match rate is increased operator attention and inspection — not automatic rejection.

> Match rate measures the **risk of drift**, not the **fact of identity**.

Operator intuition is a valid trigger for inspection. It is not a substitute for documented gate evaluation.

### Evaluation-Framework Threshold Guidance — Provisional

Identity consistency scores are evaluation-framework-dependent. Perceptual evaluation and structural evaluation may yield significantly different results for identical image pairs. This is not measurement error — it reflects the nature of identity as a perceptual construct.

|Evaluation Type|Characteristics|Recommended Threshold|
|---|---|---|
|Perceptual operator-style evaluation|Impression-based, human-like judgment|≥ 0.90|
|Structural diff-sensitive evaluation|Fine-grained, conservative, diff-sensitive|≥ 0.80|

> These are provisional operational guidelines, not protocol standards. Threshold must be calibrated per deployment context.

-----

## Design Memo — Match Rate Computation Scope

> Non-normative internal note — no immediate specification change.

### Background

Current protocol position:

- Match rate is an auxiliary indicator
- Operator judgment has final authority
- Gate evaluation supersedes numerical similarity

However, computation conditions for match rate are not yet standardized.

### Concern

Without defined comparison conditions:

- Measurements may vary between sessions
- Cross-operator consistency may degrade
- External reviewers may misinterpret score meaning

### Design Principle — Provisional

If formalized in the future, match rate computation SHOULD:

- Be anchor-relative
- Control for pose and lighting when feasible
- Specify comparison region, such as facial bounding area
- Avoid model-dependent hard coupling
- Explicitly remain subordinate to gate evaluation

### Evaluation Framework Reference

Two evaluation approaches have been operationally observed:

**Perceptual Operator-Style Evaluation**

```text
Simulated Perceptual Score =
  0.40 × Face Impression
+ 0.25 × Hair Consistency
+ 0.15 × Iconic Features (e.g. glasses)
+ 0.10 × Vibe Consistency
+ 0.10 × Context Robustness
- 0.05 × Style Drift
- 0.05 × Proportion Drift
```

Characteristics:

- Weighted toward overall impression
- Tolerant of fine-grained differences
- Closest to human same-person recognition

Score interpretation:

|Score|Interpretation|
|---|---|
|0.95+|Near-identical|
|0.90+|Recognized as same character|
|0.80+|Possible match|
|< 0.80|Divergent|

-----

**Structural Diff-Sensitive Evaluation**

Evaluation dimensions:

- Facial structure: contour, eyes, ratio
- Skeletal proportion
- Color stability
- Style consistency
- Fine details: hands, symmetry, placement

Characteristics:

- Detects fine-grained differences
- Conservative (strict) matching
- Higher penalty weighting

Recommended threshold for this evaluation type: ≥ 0.80

-----

> These evaluation frameworks are operationally observed references, not vendor specifications.
> CIP does not mandate either framework.
> Selection should be based on deployment context and operator judgment.
>
> Match rate MUST NOT override documented operator gate decision.

### Deferred Decision

No immediate formalization required.

Standardization may be introduced during:

- Enterprise deployment phase
- Automation integration phase
- Cross-team operator expansion

### Risk Reminder

Over-specification risks:

- Transforming governance into score-optimization
- Undermining model-agnostic design
- Creating false sense of objectivity

-----

## Why No Progressive Correction

Progressive correction after identity failure leads to **contamination** — the accumulation of drift in the session context that cannot be reversed by prompt adjustment.

A contaminated generation cycle should not be recovered through progressive correction. It must be terminated, purged, and re-bound to the last validated anchor.

Attempting correction wastes generation budget and produces outputs that cannot be trusted.

-----

## Session Contamination

Contamination occurs when:

- Failed generations are not rejected or purged
- Generation continues after drift detection
- Session length exceeds anchor stability range without re-anchoring

**Contaminated cycles must be abandoned entirely.**

Re-anchoring frequency is context-dependent. See [Reproducibility Scope](reproducibility_scope.md) and [MCST definition](whitepaper_v1.md) for guidance.

-----

## Philosophy

This discipline is not artistic rigidity.

It is production governance.

In professional workflows — anime, game, manga, franchise animation, editorial, fashion, IP management — identity failure is not a style variation. It is a deliverable failure.

The Hard Abort policy exists to prevent that failure from propagating.

-----

## Relation to Other Documents

- [Technical Mechanism](technical_mechanism.md) — why drift occurs
- [Quickstart](quickstart.md) — operational flow including abort procedure
- [Reproducibility Scope](reproducibility_scope.md) — known degradation conditions
- [White Paper Section 5](whitepaper_v1.md) — governance and IP context
