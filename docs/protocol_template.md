# CIP Protocol Template

This document defines a structured interface template for CIP-governed generation, validation, and adoption cycles.

This is not a prompt guide. It is a system interface definition.

---

## Purpose

A CIP session requires structured inputs and records at each stage of the governance loop.

This template defines the minimum required fields for a CIP-governed generation and adoption cycle.

---

## Template: Identity Declaration

The Identity Declaration defines the identity condition to be preserved across the session.

```text
[IDENTITY DECLARATION]

UID:          <unique identifier assigned to this character>
Anchor:       <reference to validated anchor image or anchor asset>
Session:      <session ID or timestamp>
Operator:     <operator identifier>

[INVARIANT ATTRIBUTES]
Face:         <face structure — concise, factual>
Hair:         <hair — color, length, texture>
Physique:     <body structure — concise>
Style regime: <rendering style — e.g., realistic / anime / illustration>

[PROMPT]
<minimal prompt — invariant attributes only, no scene>

[SCENE CONTEXT]
<scene, pose, expression, environment — separated from identity>
```

**Usage rules:**

- Identity and scene MUST be structurally separated
- Invariant attributes MUST remain unchanged across the session
- Scene context MAY change per generation cycle
- UID MUST be consistent across all cycles in the session
- Anchor reference MUST point to a validated anchor image or anchor asset

---

## Template: Gate Evaluation Record

Each generation cycle produces a gate evaluation record.

```text
[GATE EVALUATION]

Session:       <session ID>
Cycle:         <cycle number>
Anchor ref:    <anchor UID or asset reference>
Output ref:    <output image ID or hash>
Timestamp:     <ISO 8601>
Operator:      <operator identifier>

Face Gate:     PASS / FAIL
Skeleton Gate: PASS / FAIL
Proportion Gate: PASS / FAIL

Overall:       PASS / FAIL

Decision:      ADOPT / REJECT
Hard Abort:    YES / NO
Notes:         <optional — drift observations>
```

**Gate logic:**

```text
PASS ⇔ Face Gate ∧ Skeleton Gate ∧ Proportion Gate
FAIL → Reject failed output → Hard Abort → Purge → Reset context/environment → Re-bind → Re-converge → Gate validation before adoption
```

---

## Template: Hard Abort Record

When Hard Abort is triggered, a Hard Abort record is opened before re-convergence begins.

```text
[HARD ABORT RECORD]

Session:        <session ID>
Trigger cycle:  <cycle number that triggered abort>
Abort reason:   <gate failure details>
Failed output:  <output image ID or hash>
Rejected:       <timestamp>
Purge:          <timestamp or purge record for contaminated outputs/states>
Context reset:  <timestamp or reset record>
Operator:       <operator identifier>
```

---

## Template: Re-Convergence Record

When contaminated outputs/states have been purged and the context or environment has been reset, a re-convergence record is opened.

```text
[RE-CONVERGENCE RECORD]

Session:        <session ID>
Trigger cycle:  <cycle number that triggered abort>
Anchor used:    <anchor UID or asset reference — must be last validated>
UID used:       <UID — must match last validated anchor binding>
Minimal prompt: <minimal prompt used for re-binding>
Re-binding:     <timestamp>
New cycle:      <new cycle number>
Operator:       <operator identifier>
```

---

## Template: Session Summary

At session close, a summary record is produced.

```text
[SESSION SUMMARY]

Session:           <session ID>
Character UID:     <UID>
Total cycles:      <n>
PASS cycles:       <n>
FAIL / Hard Abort: <n>
Re-convergences:   <n>
Anchor version:    <anchor UID or asset reference used at close>
Operator:          <operator identifier>
Notes:             <optional>
```

---

## Structural Principles

These templates enforce the following CIP design principles:

|Principle|Template enforcement|
|---|---|
|Identity separated from scene|Identity Declaration splits invariant / scene|
|Every output is validated|Gate Evaluation Record is mandatory per cycle|
|Failure triggers Hard Abort|Gate logic is binary — no progressive correction|
|Failed outputs are not adopted|Gate Evaluation Record requires ADOPT / REJECT decision|
|Contaminated outputs/states are purged|Hard Abort Record requires purge documentation|
|Recovery starts from last validated anchor|Re-Convergence Record requires last validated anchor reference|
|All decisions are auditable|Session Summary provides complete audit trail|

---

## Notes

- These templates define the minimum required fields. Implementations may extend them.
- Field formats are illustrative. Implementations should define precise schemas.
- The gate evaluation MUST be completed before an output is adopted.
- Gate failure MUST trigger rejection, Hard Abort, purge, context/environment reset, re-binding, and re-convergence.
- Re-convergence records MUST reference the last validated anchor used, not the failed output.
- Codex output, automated evaluation, or match-rate scoring may provide evidence, but they are not the adoption decision.

*See: [CIP Specification v0.1](cip_spec_v0.1.md) — [Re-Convergence](reconvergence.md) — [Quality Gate & Hard Abort](quality_gate_addendum.md)*
