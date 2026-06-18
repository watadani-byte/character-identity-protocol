# PAL-PL-EXP-001

## Status

- Experiment status: completed
- Research record status: draft
- Human review status: reviewed
- Quantitative outcome status: not yet formally calculated
- Generated candidates: 6 (Condition A: 3, Condition B: 3)
- Conditions: A — Direct PAL / B — PAL Prompt Layer
- Human conclusion: preliminary positive identity-retention signal with an inconclusive sequence result due to an execution-procedure mismatch
- Formal result record: [result.md](result.md)

## Fixed Terminology

> C is model-side or execution-structure mediation that transforms A into A′.

```text
A → (A + C) → A′ → B′
A → (A + C) → A′ → B′ ≠ B
```

The PAL Prompt Layer is not C as a whole. CIP does not directly control C or A′. AI reviews are diagnostic evidence only. The human operator retains final decision authority and final adoption authority.

## Executed Design

- 1 character
- 1 scene: `scene_01_gaze_only`
- 2 conditions
- 3 candidates per condition
- 6 candidates total
- generation order: `A1 → B1 → A2 → B2 → A3 → B3`
- separate chat per condition
- no progressive candidate correction

Condition A used a reconstructed Direct PAL baseline because no historically confirmed prior-success prompt using this exact PAL set was available.

Condition B used GPT compilation, Claude direct audit, a separate GPT supplementary review, a human REVISE decision, Claude delta review, and a final human PROCEED decision.

The same Final Execution Package was used for all three independent Condition B generation attempts.

## Human Evaluation

### Positive Findings

- character identity was largely retained across all three candidates in both conditions
- costume state was largely maintained according to the current human visual assessment
- no clear character replacement or other human-identified critical identity violation was observed

### Failed or Unstable Dimensions

- background state was not consistently preserved
- the gaze-only Scene Variable was not successfully isolated
- body orientation, hand position, composition, and background were reconstructed across attempts
- the observed sequence-related output dimensions were unsuccessful in both conditions

True frame-to-frame sequence continuation was not adequately tested and is therefore not assigned a conclusive result.

## Execution-Procedure Limitation

The pilot did not use the immediately preceding human-approved generated frame as the Current Approved Sequence Reference. Each candidate was independently reconstructed from the Primary Identity Anchor using a full model-facing prompt.

The pilot also did not use delta-only continuation or selective re-injection of only the conditions observed to be drifting.

Therefore, the pilot tested repeated identity and scene reconstruction more clearly than true frame-to-frame continuation.

This limitation records what was and was not executed. It does not excuse the observed output failures or retroactively add an unregistered procedure to the experiment.

## Result

> Preliminary positive identity-retention signal with an inconclusive sequence result due to an execution-procedure mismatch.

No clear Condition A / Condition B superiority was established in this one-scene, six-candidate pilot.

Candidate-level conformance rates, human adoption rates, and workflow-level yield measures have not yet been formally calculated. The current findings represent the recorded human visual assessment.

## Next Test

A future experiment claiming to test frame-to-frame sequence continuation should distinguish:

1. Identity / base-state establishment
2. Sequence continuation from a Current Approved Sequence Reference

It should also pre-register:

- whether both conditions use a shared sequence reference or condition-specific sequence references
- whether execution uses full condition disclosure or reduced delta-only representation
- how drifted critical conditions may be selectively re-injected
- which adopted candidate becomes the next Current Approved Sequence Reference

Candidate adoption for sequence continuation does not constitute validation or automatic promotion to a Validated Identity Anchor.
