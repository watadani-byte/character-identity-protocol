# PAL-SEQ-EXP-001 — Condition A Baseline

## Condition

Condition A — Direct Delta Continuation

## Baseline Status

- reconstructed from documented prior operational practice
- not represented as an exact historical preserved prompt
- frozen before execution
- Human baseline approval: approved
- Approved by: 渡谷 斉
- Approval date: 2026-06-19
- Scope of approval: Step 1/2/3 primary instructions, prompt construction rule, selective re-injection rule, and recovery rules (this baseline in full)

## Construction Rules

Condition A must:
- use the Current Approved Sequence Reference
- use one short natural-language delta instruction
- avoid PAL Prompt Layer block labels
- avoid full PAL re-disclosure at each step
- preserve inherited state through the reference image
- allow selective re-injection only under the pre-registered rule
- use the same three frozen primary deltas as Condition B
- retain the same human checkpoints as Condition B

## Prohibited

- Identity Block / Scene Variable Block / Anti-drift Block labels
- Condition B audit findings as prompt-construction material
- post-candidate prompt optimization
- silent expansion of the permitted delta
- use of a rejected candidate as the next reference

## Prompt Freeze Policy

- primary delta wording: frozen before execution
- primary construction rule: frozen before execution
- selective re-injection: permitted only after observed drift
- exact re-injection text: recorded before retry or next step
- human authorization: required

## Step 1 Primary Instruction

```text
Shift only her gaze slightly toward the viewer. Preserve the current head orientation, body orientation, hand positions, expression, costume, background, lighting, and composition.
```

## Step 2 Primary Instruction

```text
Raise only her left hand slightly and naturally. Preserve the inherited gaze, head orientation, body orientation, right-hand position, expression, costume, background, lighting, and composition.
```

## Step 3 Primary Instruction

```text
Shift only her gaze softly toward her raised left hand. Preserve the current head orientation, body orientation, both hand positions, expression, costume, background, lighting, and composition.
```

## Prior Draft Instructions (Superseded — Retained for History)

The following draft prompts were registered in an earlier version of this file and have been superseded by the Step 1/2/3 Primary Instructions above. They are retained here for historical record only and are not active prompts.

```text
[Superseded] Step 1: Use the attached Current Approved Sequence Reference as the exact continuation state. Shift only her gaze slightly toward the viewer. Keep the same person, head orientation, body position, hand positions, costume, background, composition, lighting, and emotional baseline. Do not reconstruct the scene.

[Superseded] Step 2: Use the attached Current Approved Sequence Reference as the exact continuation state. Raise only her left hand slightly and naturally. Keep the same person, gaze state, head orientation, body position, right-hand position, costume, background, composition, lighting, and emotional baseline. Do not reconstruct the scene.

[Superseded] Step 3: Use the attached Current Approved Sequence Reference as the exact continuation state. Shift only her gaze softly toward her raised left hand. Keep the same person, head orientation, body position, both hand positions, costume, background, composition, lighting, and emotional baseline. Do not reconstruct the scene.
```

## Selective Re-Injection Rule

Selective re-injection is permitted only after an observed drift. It must be limited to the minimum condition or linked set of conditions judged necessary to address that drift, must not alter the registered permitted delta, and requires explicit human authorization before execution. The exact added text and its difference from the primary prompt must be recorded before the recovery attempt.

Condition A continues to prohibit:
- reorganization into PAL Prompt Layer Identity Block / Scene Variable Block / Anti-drift Block
- Claude direct audit
- separate GPT supplementary review
- more than one recovery attempt per step

## Human Approval of Exact Step Prompts

- Step 1 prompt: pending
- Step 2 prompt: pending
- Step 3 prompt: pending
- Selective re-injection rule: confirmed (see Selective Re-Injection Rule section above)

## Condition A Recovery

Condition A permits at most one recovery attempt per step.

Condition A recovery does not use the Condition B combined review workflow. It does not use Claude direct audit, separate GPT supplementary review, or PAL Prompt Layer block labels.

Recovery in Condition A:
- uses the same Current Approved Sequence Reference as the primary attempt
- does not change the registered permitted delta
- is limited to one attempt per step
- permits only minimal selective re-injection in response to observed drift
- requires human approval of the recovery decision and any added re-injection text

## Required Recovery Records

- primary prompt (frozen)
- recovery prompt, if any
- structured diff between primary and recovery prompt, if any
- human recovery decision
- human-approved re-injection text, if any
