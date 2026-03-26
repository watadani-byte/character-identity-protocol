# CIP Specification — Draft v0.1

Character Identity Protocol (CIP) — Operational Governance Specification

*Status: Draft — v0.1*  
*Licensed under CC BY 4.0 — 2026*

-----

## Preamble

This document defines normative requirements for conformant implementation of the Character Identity Protocol (CIP).

Key words SHALL, SHOULD, MAY are interpreted per [RFC 2119](https://www.rfc-editor.org/rfc/rfc2119) / [RFC 8174](https://www.rfc-editor.org/rfc/rfc8174).

This specification governs the operational layer only.

-----

## 1. Anchor Requirements

### 1.1 Definition

An Anchor is a validated identity reference image.

### 1.2 Selection

- SHALL be converged identity
- SHALL NOT be draft
- SHOULD be highest-purity
- SHALL be operator-owned

### 1.3 Storage

- SHALL be reusable
- SHOULD have UID
- SHOULD include metadata

-----

## 2. Minimal Prompt

- SHALL describe invariant traits only
- SHALL NOT use rigid numeric constraints
- SHOULD remain minimal
- Anchor carries primary identity

-----

## 3. Identity Gates

Face / Skeleton / Proportion

PASS ⇔ Face Gate ∧ Skeleton Gate ∧ Proportion Gate

- SHALL evaluate every output
- SHALL be human-primary

-----

## 4. Hard Abort

- SHALL trigger on any FAIL
- SHALL terminate cycle
- SHALL discard outputs

-----

## 5. Re-Binding

- SHALL re-inject last valid anchor
- SHALL start new cycle

-----

## 6. Cycle

- SHALL start with anchor
- SHOULD re-anchor every 10–15 steps

-----

## 7. Audit

- SHALL log anchor, prompt, gate, time, operator

-----

## 8. Boundaries

- SHALL NOT control model internals
- SHALL NOT guarantee determinism

-----

## 9. Conformance

CIP-conformant ⇔ all SHALL requirements are satisfied and enforced at runtime

Conformance MAY include measurement-based validation using identity distance models as defined in Appendix C.

-----

## Appendix C — Measurement Model (Informative)

*This appendix defines an operational measurement model for CIP implementations. It is informative but intended for standardization in future versions.*

```
D_total = w1 * D_face + w2 * D_skeleton + w3 * D_proportion
```

|Condition        |Result |
|-----------------|-------|
|D_total < T1     |PASS   |
|T1 ≤ D_total < T2|WARNING|
|D_total ≥ T2     |FAIL   |

```
Drift_n = Σ D_total(i)
```

> We do not measure C.
> We measure drift.

Drift represents the observable effect of C acting on identity reconstruction.

-----

## Appendix D — Constraint Dynamics (Non-Normative)

*This appendix is non-normative. It provides a theoretical interpretation of C and drift.*

```
C = distributional gravity + entropy
Anchor = counter-force
Identity = force equilibrium
Drift = convergence to wrong target
```

C pulls toward high-density regions of the training distribution.
The anchor constrains toward a specific validated identity.
Identity stability emerges from the balance between these forces.

> CIP does not eliminate drift.
> It governs drift under probabilistic constraints.

-----

*See: [Technical Mechanism](technical_mechanism.md) — [Decision Pack](decision_pack.md)*