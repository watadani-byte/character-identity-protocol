# PAL-PL-EXP-001 — Result Record

## Experiment Status

- Experiment ID: PAL-PL-EXP-001
- Execution status: completed
- Research record status: draft
- Human review status: reviewed
- Result classification: human conclusion recorded; shared protocol classification not yet assigned

## Protocol Reference

- Protocol file: docs/pal_prompt_layer_experiment_protocol.md
- Protocol version: \<record protocol document version, if assigned\>
- Protocol Git commit: \<record exact protocol commit\>
- Result record commit: recorded in repository history

## Fixed Terminology

> C is model-side or execution-structure mediation that transforms A into A′.

```text
A → (A + C) → A′ → B′
A → (A + C) → A′ → B′ ≠ B
```

CIP does not directly control C or A′. The PAL Prompt Layer is not C as a whole. AI review outputs are diagnostic evidence only. The human operator retains final decision authority and final adoption authority.

## Executed Conditions

- Character: Rieko (character_uid: rieko_v1)
- Scene: scene_01_gaze_only
- Condition A: reconstructed_direct_pal_baseline
- Condition B: pal_prompt_layer_combined_workflow
- Separate chat per condition: yes
- Progressive candidate correction: none

## Generated Candidate Count

| Unit | Condition | Planned | Realized | Final pre-execution status |
|---|---|---:|---:|---|
| `unit_A_scene_01` | A | 3 | 3 | baseline frozen |
| `unit_B_scene_01` | B | 3 | 3 | PROCEED |

- Total planned: 6
- Total realized: 6
- Generation order: A1 → B1 → A2 → B2 → A3 → B3

Condition A and Condition B were executed in separate chats. The same Final Execution Package was used for three independent single-image attempts in Condition B. No progressive correction of generated candidates was performed.

## Positive Findings

- Character identity retention showed a meaningful positive signal in both conditions.
- The same character was largely preserved across three independent outputs per condition.
- Costume state was largely maintained in both conditions according to the current human visual assessment.
- No clear character replacement or other human-identified critical identity violation was observed in either condition.

Character identity retention is a major prerequisite for later sequence-continuity work and must not be obscured by the failure of other dimensions.

## Failed or Unstable Dimensions

- Background state was not consistently preserved across the independent reconstruction attempts in either condition; it changed substantially between the first and second generated candidates.
- The gaze-only Scene Variable was not successfully isolated in either condition.
- Body orientation, hand position, composition, and background were reconstructed across attempts.
- The observed sequence-related output dimensions were unsuccessful in both conditions, although true frame-to-frame continuation was not adequately tested.

## Execution-Procedure Mismatch

The pilot executed the following procedures:

- Used the Primary Identity Anchor for each independent attempt
- Used a full model-facing prompt for each attempt
- Generated each candidate as an independent attempt
- Did not use the immediately preceding human-approved frame as the Current Approved Sequence Reference
- Did not use delta-only continuation instructions

The pilot did not execute the following procedures, which prior successful sequence operations used:

- Using the immediately preceding human-approved frame as the Current Approved Sequence Reference
- Proceeding from the adopted frame to the next delta
- Changing only one major delta at a time
- Using short delta-only model-facing instructions
- Selectively re-injecting only the drifted critical conditions

This is recorded as a methodological limitation that bounds what the experiment actually tested. It is not an excuse for the observed output failures, nor is it retroactive pre-registration of a procedure that was not used.

## What This Pilot Actually Tested

- Whether the same character can be repeatedly reconstructed from the Primary Identity Anchor
- Whether costume and broad scene conditions can be repeatedly generated
- Whether a gaze-only request executes without disturbing other conditions, under independent reconstruction with full prompt disclosure
- Whether Condition B showed an observable advantage over the reconstructed Direct PAL baseline under these conditions

## What This Pilot Did Not Establish

- True frame-to-frame continuation from the immediately preceding human-approved frame
- Delta-only frame-to-frame continuation
- Sequence PAL operation that chains adopted frames
- Whether reduced delta-only execution outperforms full disclosure
- A clear Condition A or Condition B advantage
- Causal effectiveness of the PAL Prompt Layer
- Cross-scene or cross-session repeatability

## Condition A and Condition B Comparison

No clear advantage for either condition was established in this one-scene, six-candidate pilot.

Both conditions showed preliminary positive character identity and costume retention. In both conditions, the background state was not consistently preserved across the independent reconstruction attempts, and the gaze-only change was not successfully isolated. The observed sequence-related output failures were shared across both conditions.

Because the pilot used independent reconstruction from the Primary Identity Anchor rather than continuation from the immediately preceding human-approved frame, it did not adequately test true frame-to-frame sequence continuation. The observed output behavior — sequence-related dimension failures in both conditions — therefore cannot be attributed to a Condition A versus Condition B difference.

## Workflow-Level Findings

Condition B used a combined workflow:

1. GPT compiled the Initial Execution Package
2. Claude performed a direct Anchor-Based Prompt Audit
3. A separate GPT chat performed a supplementary review for over-optimization and over-reconstruction
4. Human decision: REVISE
5. Approved revisions:
   - add: no cultural drift caused by costume
   - add: do not let costume overwrite person identity
   - replace: theatrical gesture → no gesture drift into theatrical pose
6. Claude delta review: R-01 PASS, R-02 PASS; no unauthorized changes; source traceability maintained
7. Human final pre-execution decision: PROCEED
8. The same Final Execution Package was used for three independent single-image attempts

This workflow is not majority voting, autonomous multi-model approval, joint AI authorization, or automatic Prompt Layer compilation alone. Claude and GPT audit outputs were maintained as separate diagnostic evidence. The human retained final decision authority.

## Limitations

- One scene, six candidates: insufficient basis for causal claims or universal generalization
- Condition A was a reconstructed baseline, not a historically confirmed prior-success prompt
- True frame-to-frame sequence continuation was not tested due to the procedure mismatch described above
- The observed output failures cannot be isolated to a single cause (Prompt Layer, anchor quality, model behavior, full-prompt reconstruction pressure, probabilistic variation)
- No cross-scene or cross-session data

## Next Test Design

A future experiment claiming to test frame-to-frame sequence continuation must distinguish the following two phases:

### Phase 1 — Identity / Base-State Establishment

```text
Primary Identity Anchor
+ Approved PAL Source Conditions
+ Initial Scene Request
→ Candidate Base Frame
→ Human Identity and State Check
```

Human confirms: character identity, costume state, background state, composition, pose, initial scene state, and suitability as a starting state for continuation.

### Phase 2 — Sequence Continuation

```text
Current Approved Sequence Reference
+ Minimal Permitted Delta
+ Selective Re-injection of Drifted Conditions When Needed
→ Next Candidate
→ Human Review
```

Required distinctions:

```text
Primary Identity Anchor
≠ Current Approved Sequence Reference
≠ Validated Identity Anchor
```

Using the immediately preceding human-approved generated frame as a temporary Current Approved Sequence Reference does not automatically promote it to a Validated Identity Anchor.

Future A/B tests should pre-register either a shared sequence reference (both conditions use the same human-approved base frame) or condition-specific sequence references (each condition continues from its own adopted Phase 1 frame). These designs measure different questions and must not be conflated.

## Quantitative Outcome Status

Candidate-level conformance rates, human adoption rates, and workflow-level yield measures have not yet been formally calculated in this result record. The findings above record the current human visual assessment and must not be treated as completed quantitative scoring.

No candidate was automatically promoted to a Validated Identity Anchor.

## Human Conclusion

> Preliminary positive identity-retention signal with an inconclusive sequence result due to an execution-procedure mismatch.

In both conditions, the background state was not consistently preserved across the independent reconstruction attempts, and the gaze-only change was not successfully isolated. However, because the pilot used independent reconstruction from the Primary Identity Anchor rather than continuation from the immediately preceding human-approved frame, it did not adequately test true frame-to-frame sequence continuation.
