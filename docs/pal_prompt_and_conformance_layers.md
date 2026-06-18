## Two-Stage Distinction for Sequence Continuation Tests

### A. Scope

The two-stage distinction between identity or base-state establishment and sequence continuation is not required for every PAL experiment. It is required only when an experiment claims to test frame-to-frame sequence continuation.

Single-image tests, independent composition generation, and standalone costume or background variation tests do not require this distinction.

When an experiment claims to test frame-to-frame sequence continuation, it must distinguish identity or base-state establishment from sequence continuation.

### B. Phase 1 — Identity / Base-State Establishment

Conceptual flow:

```text
Primary Identity Anchor
+ Approved PAL Source Conditions
+ Initial Scene Request
→ Candidate Base Frame
→ Human Identity and State Check
```

The human confirms:

- character identity
- costume state
- background state
- composition
- pose
- initial scene state
- suitability as the starting state for continuation

Approval of a Candidate Base Frame for sequence continuation does not automatically validate it as a new identity anchor or constitute final adoption for another purpose.

### C. Phase 2 — Sequence Continuation

Conceptual flow:

```text
Current Approved Sequence Reference
+ Minimal Permitted Delta
+ Selective Re-injection of Drifted Conditions When Needed
→ Next Candidate
→ Human Review
```

**Current Approved Sequence Reference** is defined as:

> The human-approved representation of the current sequence state used as the reference for the next permitted delta.

### D. Required Distinctions

```text
Primary Identity Anchor
≠ Current Approved Sequence Reference
≠ Validated Identity Anchor

Sequence Reference Selection
≠ Identity-Anchor Validation

Approval for Sequence Continuation
≠ Candidate Adoption for Final Use
≠ Permanent Incorporation into Approved Identity
```

Using the immediately preceding human-approved generated frame as a temporary Current Approved Sequence Reference does not automatically promote it to a Validated Identity Anchor.

### E. Sequence Continuation Rules

- In a true frame-to-frame sequence test, use the immediately preceding human-approved frame or state as the Current Approved Sequence Reference.
- Change only one major delta at a time as a general rule.
- Use only candidates explicitly approved for sequence continuation as the next Current Approved Sequence Reference; do not inherit rejected candidates.
- Delta-only execution does not require full re-disclosure of all PAL conditions at every step.
- When drift is observed in a protected condition, that condition may be selectively re-injected.
- Record whether full condition disclosure was used.
- Record whether reduced delta-only execution was used.
- The possibility that full disclosure increases scene reconstruction pressure may be recorded as a hypothesis or observation, not as a definitive causal claim.
- Full condition disclosure is not categorically worse than reduced delta-only execution.
- Reduced delta-only execution is not categorically superior to full disclosure.
- When the Current Approved Sequence Reference is not used and each candidate is independently generated from the Primary Identity Anchor, the results must not be treated as true frame-to-frame continuation results.

### F. Execution Modes

The following are execution modes or task-specific model-facing representations, not new architectural layers:

- full condition disclosure
- reduced delta-only execution
- selective condition re-injection

Do not define new Layers, such as a PAL Delta Layer, for these modes.

### G. Recommended Record Structure

The following fields may be added to the sequence-continuation record for each generation step:

```yaml
sequence_continuation:
  current_sequence_reference:
    reference_status: human_approved
    reference_source_candidate_id: <candidate_id>
    reference_asset_path: <path>
    fixed_state_record: <path or identifier>
    approved_for_sequence_continuation: true
    purpose: next_delta_generation
    identity_anchor_status: unchanged
  inherited_state: <state record reference>
  permitted_delta: <defined delta>
  prohibited_simultaneous_changes:
    - <condition>
  model_facing_instruction: <exact instruction>
  selective_reinjection:
    - <condition, if required>
```

Use `approved_for_sequence_continuation` rather than `human_adoption_for_sequence` to distinguish continuation approval from final adoption.

### H. A/B Sequence Comparison Design

When comparing conditions in a sequence-continuation test, pre-register one of the following reference designs:

1. **Common approved reference** — Both conditions use the same human-approved base frame. This design makes it easier to compare Prompt Layer or execution-representation differences.
2. **Condition-specific approved reference** — Each condition continues from its own Phase 1 base frame approved for sequence continuation. This design makes it easier to evaluate overall workflow operational performance.

These two designs measure different questions and must not be conflated.

---

*Insertion note for maintainers:*

- *This section belongs between `### Predicted Drift Pre-Registration` and `## Pre-Execution Conformance Check`.*
- *Add the following item to the existing `## Generation Procedure` list:* "If the experiment claims to test frame-to-frame sequence continuation, pre-register the two-stage procedure, Current Approved Sequence Reference policy, execution mode, and common or condition-specific reference design defined in this protocol."
- *Update the document Status line to:* "Draft initial smoke-test protocol — designed to detect whether the PAL Prompt Layer shows a useful operational signal. One initial pilot has been completed, but this remains a draft reusable protocol and not a finalized PAL specification."
