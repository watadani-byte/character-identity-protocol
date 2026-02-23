# Quality Gate & Hard Abort Discipline

> This document formalizes the stop-conditions and validation logic used in production deployments of the Character Identity Protocol.

-----

## Overview

The Quality Gate is a mandatory validation checkpoint applied after every generation turn.

It is not a guideline — it is a hard operational constraint.

-----

## Gate Structure

All three gates must pass simultaneously:

```
PASS = FaceGate ∧ SkeletonGate ∧ ProportionGate
```

|Gate          |What It Checks                            |
|--------------|------------------------------------------|
|FaceGate      |Facial identity consistency against anchor|
|SkeletonGate  |Skeletal proportion and alignment         |
|ProportionGate|Overall body proportion consistency       |

If **any** gate fails → **Hard Abort**.

-----

## Hard Abort Protocol

When a gate failure is detected:

1. **Stop generation immediately**
1. **Do not attempt progressive correction**
1. **Discard all outputs from the failed turn onward**
1. **Open new session**
1. **Re-inject anchor image + minimal prompt**
1. **Verify identity before proceeding**

> The system is allowed to generate. It is not allowed to degrade.

-----

## Match Rate Threshold

- **Minimum threshold**: 90% (human-judged)
- **Measurement**: Visual comparison against anchor image by trained operator
- **Automation**: None — human judgment only

> 90% = shipping threshold, not research metric.

If match rate drops below 90%:

- Session is abandoned
- Anchor image is discarded if contaminated
- Chat log is discarded

-----

## Why No Progressive Correction

Progressive correction after identity failure leads to **contamination** — the accumulation of drift in the session context that cannot be reversed by prompt adjustment.

A session that has failed is not recoverable. It must be restarted.

Attempting correction wastes generation budget and produces outputs that cannot be trusted.

-----

## Session Contamination

Contamination occurs when:

- Failed generations are not discarded
- Generation continues after drift detection
- Session length exceeds anchor stability range without re-anchoring

**Contaminated sessions must be abandoned entirely.**

Recommended re-anchoring frequency: every 10–15 turns.

-----

## Philosophy

This discipline is not artistic rigidity.

It is production governance.

In professional workflows — editorial, fashion, IP management — identity failure is not a style variation. It is a deliverable failure.

The Hard Abort policy exists to prevent that failure from propagating.

-----

## Relation to Other Documents

- [Technical Mechanism](technical_mechanism.md) — why drift occurs
- [Quickstart](quickstart.md) — operational flow including abort procedure
- [Reproducibility Scope](reproducibility_scope.md) — known degradation conditions
- [White Paper Section 5](whitepaper_v1.md) — governance and IP context