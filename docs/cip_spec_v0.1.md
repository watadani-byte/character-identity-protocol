# CIP Specification — Draft v0.1

Character Identity Protocol (CIP) — Operational Governance Specification

*Status: Draft — v0.1*  
*Licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/) — 2026*

-----

## Preamble

This document defines normative requirements for conformant implementation of the Character Identity Protocol (CIP).

The key words “SHALL”, “SHALL NOT”, “SHOULD”, “SHOULD NOT”, and “MAY” in this document are to be interpreted as described in [RFC 2119](https://www.rfc-editor.org/rfc/rfc2119) and [RFC 8174](https://www.rfc-editor.org/rfc/rfc8174):

- **SHALL** — an absolute requirement for conformance
- **SHALL NOT** — an absolute prohibition for conformance
- **SHOULD** — recommended; deviation requires justification
- **SHOULD NOT** — not recommended; adoption requires justification
- **MAY** — permitted but optional

This specification governs the operational layer only.  
It does not govern model internals, training procedures, or proprietary system behavior.

-----

## 1. Anchor Requirements

### 1.1 Anchor Definition

An **Anchor** is a previously generated output image that has been validated as a stable identity reference.

### 1.2 Anchor Selection

**1.2.1** The anchor SHALL represent a converged identity state — an output that has been verified against identity criteria.

**1.2.2** The anchor SHALL NOT be a draft, exploratory, or unvalidated output.

**1.2.3** The anchor SHOULD be the highest-purity output available for the target identity.

**1.2.4** Anchor selection SHALL be operator-owned. CIP governs the workflow after anchor selection.

### 1.3 Anchor Storage

**1.3.1** The anchor SHALL be retained in a form that allows re-injection into the generation workflow.

**1.3.2** The anchor SHOULD be associated with a unique identifier (UID) for consistent reference across cycles and sessions.

**1.3.3** Anchor metadata SHOULD include: anchor ID, creation timestamp, and identity gate results at time of validation.

-----

## 2. Minimal Prompt Requirements

### 2.1 Prompt Design

**2.1.1** The minimal prompt SHALL describe only invariant identity attributes of the character.

**2.1.2** The minimal prompt SHALL NOT include precise numeric constraints (e.g., exact measurements, rigid proportions) that may reduce the model’s ability to locate stable reconstruction regions.

**2.1.3** The minimal prompt SHOULD remain short and abstract — sufficient to identify the character, not to fully specify it.

**2.1.4** The minimal prompt SHOULD describe traits rather than measurements (e.g., “small head relative to height” rather than “8-head body ratio”).

**2.1.5** The anchor image SHALL carry the primary identity information. The prompt MAY serve as an auxiliary constraint only.

### 2.2 Prompt Stability

**2.2.1** The core minimal prompt SHOULD remain stable across cycles for the same identity.

**2.2.2** Modifications to the minimal prompt across cycles SHOULD be documented as part of the operational audit record.

-----

## 3. Identity Gate Requirements

### 3.1 Gate Definitions

A conformant CIP implementation SHALL include the following three identity gates:

|Gate           |Evaluation Target                                                    |
|---------------|---------------------------------------------------------------------|
|Face Gate      |Facial identity similarity relative to anchor                        |
|Skeleton Gate  |Skeletal structure and body proportion consistency relative to anchor|
|Proportion Gate|Overall body proportion consistency relative to anchor               |

### 3.2 Gate Evaluation

**3.2.1** All three gates SHALL be evaluated after each generation output.

**3.2.2** Gate evaluation SHALL be human-primary. Human judgment SHALL be the authoritative evaluation method.

**3.2.3** Automated similarity metrics MAY be used as supplementary verification but SHALL NOT replace human gate evaluation.

**3.2.4** The pass condition SHALL be:

```
PASS ⇔ Face Gate ∧ Skeleton Gate ∧ Proportion Gate
```

**3.2.5** Generation SHALL proceed only when all gates return PASS.

**3.2.6** Operational practice suggests a similarity threshold of approximately 90%, as assessed by human judgment. Operators SHOULD document any deviation from this threshold.

**3.2.7** The threshold MAY be adjusted by the operator for specific production contexts, provided the adjustment is documented.

### 3.3 Gate Results

**3.3.1** Each gate evaluation SHALL produce a result of PASS or FAIL.

**3.3.2** Gate results SHALL be recorded as part of the operational audit record.

-----

## 4. Hard Abort Requirements

### 4.1 Abort Trigger

**4.1.1** A Hard Abort SHALL be triggered immediately when any identity gate returns FAIL.

**4.1.2** A Hard Abort SHALL NOT be deferred, delayed, or bypassed.

**4.1.3** Incremental correction after a gate failure SHALL NOT be attempted. The generation cycle SHALL be terminated.

### 4.2 Abort Procedure

**4.2.1** Upon Hard Abort, the operator SHALL:

1. Terminate the current generation cycle immediately
1. Discard all outputs from the failed turn onward
1. Record the Hard Abort event in the operational audit record

**4.2.2** The Hard Abort event SHALL be logged with: timestamp, turn number, gate that triggered abort, and anchor ID in use.

-----

## 5. Re-Binding Requirements

### 5.1 Re-Binding Definition

**Re-binding** is the process of re-injecting the last validated anchor into a new generation cycle following a Hard Abort or session reset.

### 5.2 Re-Binding Procedure

**5.2.1** Following a Hard Abort, the operator SHALL re-bind the last validated anchor before resuming generation.

**5.2.2** Re-binding SHALL use the anchor that was validated most recently prior to the abort event.

**5.2.3** The re-bound cycle SHALL be treated as a new convergence cycle (Cycle N+1).

**5.2.4** Generation SHALL NOT resume from a contaminated or partially drifted state.

### 5.3 Re-Convergence

**5.3.1** Following re-binding, the operator SHALL verify that identity gates pass before treating outputs as production-ready.

**5.3.2** Re-convergence SHOULD be confirmed within the first 1–3 outputs of the new cycle.

-----

## 6. Cycle Requirements

### 6.1 Cycle Definition

A **cycle** is a bounded context window within which identity convergence is maintained under CIP governance.

A cycle begins at anchor injection and ends at Hard Abort, session reset, or operator-initiated closure.

### 6.2 Cycle Boundaries

**6.2.1** Each cycle SHALL begin with anchor re-injection and minimal prompt confirmation.

**6.2.2** CIP SHALL NOT assume indefinite identity persistence across cycles.

**6.2.3** Operators SHOULD treat each cycle as an independent convergence window, with identity verified at the start of each cycle.

### 6.3 Cycle Frequency

**6.3.1** Re-anchoring SHOULD be performed periodically within extended generation sessions.

**6.3.2** Based on operational observations, re-anchoring SHOULD be performed after every 10–15 generation turns, though this MAY vary by context.

-----

## 7. Audit Record Requirements

### 7.1 Audit Record Definition

A **CIP audit record** is a log of operational decisions made during a generation cycle.

### 7.2 Required Fields

**7.2.1** A conformant CIP audit record SHALL include the following fields for each generation event:

|Field                    |Description                                            |
|-------------------------|-------------------------------------------------------|
|Anchor ID                |Identifier of the anchor in use                        |
|Prompt hash or identifier|Stable reference to the minimal prompt used            |
|Gate result              |PASS or FAIL for each gate (Face, Skeleton, Proportion)|
|Timestamp                |Time of evaluation                                     |
|Operator                 |Identity of the operator performing evaluation         |

**7.2.2** Hard Abort events SHALL be recorded as distinct entries in the audit record.

**7.2.3** Re-binding events SHALL be recorded as distinct entries in the audit record.

### 7.3 Audit Record Retention

**7.3.1** Audit records SHOULD be retained for the duration of the production workflow.

**7.3.2** Audit records MAY be used to support compliance review, partner due diligence, or internal governance reporting.

-----

## 8. Operational Boundaries

### 8.1 Scope

**8.1.1** CIP governs reconstruction behavior at the operational layer only.

**8.1.2** CIP SHALL NOT claim to control model internals, training distributions, or proprietary system behavior.

**8.1.3** CIP SHALL NOT guarantee deterministic output reproduction.

### 8.2 Platform Independence

**8.2.1** CIP SHOULD be implementable across multiple generative platforms without platform-specific modification.

**8.2.2** CIP SHALL NOT depend on platform-specific features, session persistence mechanisms, or proprietary APIs.

### 8.3 Human Authority

**8.3.1** Human judgment SHALL be the final authority for all gate evaluations and abort decisions.

**8.3.2** Automated systems MAY assist in gate evaluation but SHALL NOT override human judgment.

-----

## 9. Conformance

A workflow is considered **CIP-conformant** if and only if all SHALL requirements defined in this specification are satisfied.

A workflow is considered **CIP-recommended** when it additionally satisfies all SHOULD requirements.

Partial conformance MAY be declared with explicit documentation of which requirements are satisfied.

-----

## Appendix A — Normative Summary

|Requirement                                   |Level    |
|----------------------------------------------|---------|
|Anchor must be a validated converged output   |SHALL    |
|Anchor selection is operator-owned            |SHALL    |
|Minimal prompt describes invariant traits only|SHALL    |
|Numeric constraints in prompts                |SHALL NOT|
|All three gates evaluated after each output   |SHALL    |
|Gate evaluation is human-primary              |SHALL    |
|Generation proceeds only when all gates PASS  |SHALL    |
|Hard Abort on any gate FAIL                   |SHALL    |
|No incremental correction after gate FAIL     |SHALL NOT|
|Re-bind last validated anchor after Hard Abort|SHALL    |
|Audit record maintained per cycle             |SHALL    |
|Automated metrics as supplementary only       |MAY      |
|Re-anchoring every 10–15 turns                |SHOULD   |
|Threshold approximately 90%                   |SHOULD   |

-----

## Appendix B — Glossary

**Anchor** — A previously validated output image used as the identity reference for a generation cycle.

**Convergence** — The statistical stabilization of output characteristics relative to the anchor.

**Cycle** — A bounded context window within which identity convergence is maintained under CIP governance.

**Face Gate** — Identity validation check targeting facial similarity relative to the anchor.

**Hard Abort** — Immediate termination of a generation cycle upon gate failure.

**Identity Drift** — The gradual degradation of identity similarity across generation turns.

**Identity Gates** — The set of three operational validation gates: Face Gate, Skeleton Gate, Proportion Gate.

**Minimal Prompt** — An auxiliary text constraint describing only invariant identity attributes.

**Proportion Gate** — Identity validation check targeting overall body proportion consistency relative to the anchor.

**Re-binding** — Re-injection of the last validated anchor into a new generation cycle.

**Re-convergence** — The process of re-establishing identity stability following re-binding.

**Skeleton Gate** — Identity validation check targeting skeletal structure and body proportion consistency relative to the anchor.

-----

*This specification is draft v0.1. Formal gate definitions, conformance testing procedures, and quantitative threshold specifications are planned for subsequent versions.*

*See: [Technical Mechanism](technical_mechanism.md) for theoretical framing.*  
*See: [Decision Pack](decision_pack.md) for enterprise evaluation.*