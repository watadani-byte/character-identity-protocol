# PAL-SEQ-EXP-001

## Status

- Experiment status: draft pre-registration / not yet executed
- Research record status: draft
- Lock status: pending human confirmation
- Experiment type: follow-up sequence-continuation smoke test
- Character: Rieko
- Comparison: Condition A — Direct Delta Continuation / Condition B — Combined PAL-Supported Delta Continuation

## Purpose

This experiment tests whether linked frame-to-frame continuation from one shared human-approved base frame can preserve inherited state while executing one permitted delta at a time.

It follows PAL-PL-EXP-001, which showed a meaningful positive signal in character-identity retention but did not adequately test true frame-to-frame continuation.

## Fixed Terminology

> C is model-side or execution-structure mediation that transforms A into A′.

```text
A → (A + C) → A′ → B′
A → (A + C) → A′ → B′ ≠ B
```

The PAL Prompt Layer is not C as a whole. CIP does not directly control C or A′. AI reviews are diagnostic evidence only. The human operator retains final authority.

## Central Distinction

```text
PAL-PL-EXP-001
Primary Identity Anchorからの反復的identity / scene reconstruction

PAL-SEQ-EXP-001
Shared Human-Approved Base Frameから分岐する連結されたframe-to-frame delta continuation
```

## Experimental Structure

```text
Neutral Phase 1
→ Shared Human-Approved Base Frame
        ├─ Condition A Branch
        └─ Condition B Branch
```

The shared base frame is created through a neutral procedure and is not counted as a Condition A or B candidate.

## Neutral Phase 1

- maximum attempts: 3
- same prompt across attempts
- same generation settings across attempts
- select the first candidate passing all required base-state checks
- no best-of-N selection by aesthetics
- if all three candidates fail, stop before Condition A/B execution
- rejected neutral candidates are retained as evidence

## Condition A

Condition A uses reconstructed Direct Delta Continuation.

It:
- uses the Current Approved Sequence Reference
- uses one short natural-language delta instruction
- does not use PAL Prompt Layer block labels
- does not fully re-disclose all PAL conditions at each step
- permits selective re-injection only under the pre-registered rule
- freezes the three primary deltas before execution
- permits at most one recovery attempt per step, without the Condition B combined review workflow

## Condition B

Condition B evaluates a combined PAL-supported sequence workflow consisting of:
- GPT structured delta preparation
- Claude direct diagnostic audit
- separate GPT over-reconstruction review
- human-governed approval
- reduced delta-only execution

Results are attributed to the combined workflow, not to any one component alone.

Each primary step requires GPT compilation, Claude direct audit, separate GPT supplementary review, and a human pre-execution decision. Recovery attempts require a revised package, Claude delta review, and a new human pre-execution decision; a repeat supplementary GPT review is required only when Claude introduces a new revision or the human operator requests it.

## Sequence Steps

1. Step 1 — shift only her gaze slightly toward the viewer
2. Step 2 — raise only her left hand slightly
3. Step 3 — shift only her gaze softly toward her raised left hand

A later step may proceed only after the immediately preceding step receives APPROVE FOR SEQUENCE CONTINUATION within the same condition branch.

Generation order across branches: A_step_01, B_step_01, B_step_02, A_step_02, A_step_03, B_step_03. Within each branch, steps proceed in order (A_step_01 → A_step_02 → A_step_03; B_step_01 → B_step_02 → B_step_03). If one branch receives STOP SEQUENCE BRANCH, only the other registered branch continues; the stopped branch is not backfilled with a substitute candidate.

## Sequence Decisions

- APPROVE FOR SEQUENCE CONTINUATION
- REJECT FOR SEQUENCE CONTINUATION
- STOP SEQUENCE BRANCH

APPROVE FOR SEQUENCE CONTINUATION authorizes the candidate to become the next Current Approved Sequence Reference. It does not constitute final-use adoption or identity-anchor validation.

REJECT FOR SEQUENCE CONTINUATION is a candidate-level decision. After REJECT FOR SEQUENCE CONTINUATION, the human operator records a post_reject_action linked to the rejected attempt:
- authorize_recovery_attempt, if recovery is permitted, attempts remain, and the human operator approves
- stop_sequence_branch, if recovery is not permitted, not approved, or the attempt limit is reached

The post_reject_action is scoped to the rejected attempt and the branch transition that follows it (attempt_linked_branch_transition). STOP SEQUENCE BRANCH itself is a branch-level terminal state, recorded separately in branch_status and branch_stop.

## Candidate Counts

- planned primary candidates: 6
- maximum permitted recovery candidates: 6
- maximum possible generated candidates: 12
- Neutral Phase 1 candidates are counted separately

All realized values remain `null` until execution.

## Session Policy

- one branch chat per condition
- no cross-condition context sharing
- rejected candidates are not designated, attached, or reused as later sequence references
- rejected candidates may remain in the branch conversation history; this is recorded as a possible confounder

## Evaluation

Initial evaluation is condition-blinded, and evaluator-facing branch IDs are anonymized.

The evaluator may see:
- anonymous reference frame
- candidate frame
- permitted delta
- anonymous branch ID

The evaluator must not initially see:
- Condition A/B
- exact prompt
- Prompt Layer package
- review history
- generation order

Actual condition and branch mapping is stored only in condition_mapping.csv and remains undisclosed until the first evaluation pass is complete.

## Human Authority

The human operator decides:
- Shared Base Frame approval
- per-candidate sequence approval or rejection
- branch stop
- selective re-injection
- final-use adoption
- identity-anchor validation
