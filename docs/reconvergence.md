# Re-Convergence — Identity Recovery in CIP

Most generative workflows attempt to fix drift by retrying.
CIP does not.

It terminates the process and restores a known-valid state.

-----

## Retry vs. Re-Convergence

This distinction defines the difference between uncontrolled generation and controlled systems.

```
Conventional (Retry):
Generate → Drift → Retry → Drift → Retry → Collapse
(Same contaminated context. Drift compounds.)

CIP (Re-Convergence):
Generate → Drift → FAIL → Hard Abort → Re-bind Anchor → Generate
(Context is exited. Recovery begins from verified state.)
```

**Retry** continues within the contaminated reconstruction context. Each attempt inherits the drift of the previous. The system has no mechanism to return to a known-valid state.

**Re-convergence** exits that context entirely. The contaminated cycle is terminated. Recovery begins from the last verified anchor — a state that has previously passed all identity gates.

-----

## Why Re-Convergence Is Required

Generative systems do not self-correct identity drift through continued sampling.

Once drift occurs, additional generation within the same context tends to propagate divergence rather than restore identity. This is a structural property of probabilistic reconstruction, not a correctable output error.

Re-convergence addresses this by:

- terminating the contaminated generation cycle immediately (Hard Abort)
- returning to the last validated anchor state
- resetting the reconstruction context
- resuming generation under full gate enforcement

-----

## The Re-Convergence Sequence

```
Identity Gate FAIL
        ↓
Hard Abort — terminate current cycle immediately
        ↓
Roll back to last verified Anchor
        ↓
Reset context (environment reset)
        ↓
Re-inject Anchor as primary reconstruction stabilizer
        ↓
Reset sampling configuration if applicable
        ↓
Resume generation under full Gate enforcement
```

-----

## Entry Condition

Re-convergence may only begin from a **verified anchor** — an output that has previously passed all identity gates:

```
PASS ⇔ Face Gate ∧ Skeleton Gate ∧ Proportion Gate
```

If no verified anchor exists, re-convergence cannot proceed. A new anchor formation cycle must be initiated first.

-----

## Re-binding

Re-binding is the act of re-injecting the verified anchor into a new generation cycle.

Re-binding procedure:

1. Select the last verified anchor
1. Re-inject as the primary conditioning reference
1. Apply minimal prompt (invariant attributes only)
1. Apply identifier binding (UID) to reinforce identity recall
1. Resume generation under gate enforcement

Re-binding is not optional. It is a governance requirement within the CIP framework.

-----

## Hard Abort vs. Progressive Correction

|Approach                   |Behavior                            |Risk              |
|---------------------------|------------------------------------|------------------|
|Progressive correction     |Adjust and retry within same context|Drift compounds   |
|Hard Abort + Re-convergence|Terminate and restart from anchor   |Drift is contained|

CIP mandates Hard Abort. Progressive correction assumes the system can self-correct. CIP treats this assumption as operationally unsafe.

-----

## Bounded Generation Cycles (BGC)

Re-convergence operates within bounded generation cycles.

Each cycle has a defined entry point (anchor) and a defined exit condition (Hard Abort or session end). Stability is maintained by chaining cycles through disciplined re-convergence — not by assuming identity persists indefinitely.

```
Cycle A → Generate → Gate → PASS / FAIL (Hard Abort)
                                    ↓
                              Re-binding
                                    ↓
Cycle B → Generate → Gate → PASS / FAIL (Hard Abort)
```

-----

## Key Principle

> Re-convergence does not fix a bad output.
> It restores the conditions under which good outputs can be produced.

*See: [CIP Specification v0.1](cip_spec_v0.1.md) — [Quality Gate & Hard Abort](quality_gate_addendum.md) — [Protocol Template](protocol_template.md)*