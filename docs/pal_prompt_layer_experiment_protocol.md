# PAL Prompt Layer — Initial Smoke Test Protocol

*Experimental validation plan for the PAL Prompt Layer and PAL Conformance Assessment Layer*

> Status: Draft initial smoke-test protocol — designed to detect whether the PAL Prompt Layer shows a useful operational signal. One initial pilot has been completed, but this remains a draft reusable protocol and not a finalized PAL specification.

-----

## Purpose

This protocol defines a small, reusable experiment for testing the following limited hypothesis:

> When the same approved PAL source modules are used, does generation through an explicit PAL Prompt Layer preserve A more reliably than direct generation from the source definitions?

This experiment:

- does not validate PAL as a whole
- does not prove universal effectiveness
- does not establish a causal mechanism
- does not make the PAL Prompt Layer a finalized PAL requirement
- is intended only to detect an initial operational signal

-----

## Fixed Terminology

The following CIP/PAL definitions apply throughout this document.

The current fixed reconstruction model:

```
A → (A + C) → A′ → B′
```

When describing mismatch or drift:

```
A → (A + C) → A′ → B′ ≠ B
```

Definitions:

- **A** = approved PAL source conditions and the intended generation request
- **C** = model-side or execution-structure mediation that transforms A into A′
- **A′** = the reconstructed task state produced under C
- **B′** = the generated candidate
- **B** = the intended output condition

Within the CIP-governed process, B′ is evaluated in relation to B, and the human operator retains final adoption authority.

Important constraints:

- C is not redefined in this document.
- C is not described only as error, noise, or creative contribution.
- The PAL Prompt Layer does not control or eliminate C.
- The PAL Prompt Layer may itself participate in execution-structure mediation and may therefore become part of C.
- CIP does not directly control C or A′.
- CIP governs validation, rejection, purge, re-binding, re-convergence, and adoption.
- PAL supports continuity, persistence, and anchor availability. In Condition B, the proposed PAL Prompt Layer provides experimental execution-facing preparation.
- Conformance assessments are diagnostic inputs only.
- The human operator retains final adoption authority.

Use **PAL-supported**, not PAL-governed, when describing image-generation workflows.

-----

## Experimental Comparison

### Condition A — Direct PAL

```
PAL Source Modules
        ↓
Direct model-facing prompt
        ↓
Generative Model
        ↓
Generated Candidate
```

The existing PAL definitions are used without explicit reorganization into the Prompt Layer blocks. Condition A must use the repository's pre-existing direct-PAL procedure without introducing the three Prompt Layer blocks. Its exact preparation method and final prompt must be preserved as the baseline.

### Condition B — PAL Prompt Layer

```
PAL Source Modules
        ↓
PAL Prompt Layer
  ├─ Identity Block
  ├─ Scene Variable Block
  └─ Anti-drift Block
        ↓
Initial Execution Package
        ↓
Pre-Execution Conformance Check
  └─ Anchor-Based Prompt Audit
        ↓
Human-Governed Review Decision
  ├─ PROCEED → Final Execution Package → Generation
  ├─ REVISE  → Revision → Second Review
  └─ STOP    → No Generation; Record Outcome
```

The Initial Execution Package and Final Execution Package are review states of the same task-specific artifact compiled through the PAL Prompt Layer. They are not separate globally defined concepts or new architectural layers. When no revision is required, the initial and final states are identical.

This decision branch is part of the CIP-governed workflow, not a new architectural layer. A `PROCEED` decision leads to the Final Execution Package and generation. A `REVISE` decision returns the package for revision and a second human-governed review. A `STOP` decision prevents generation for that registered execution unit.

**Block definitions:**

- **Identity Block** — approved elements that must remain stable across the generation.
- **Scene Variable Block** — elements permitted or required to change in the current scene.
- **Anti-drift Block** — predicted unintended changes, drift directions, and protected boundaries.

-----

## Initial Scope

The first experiment is deliberately small.

**Recommended smoke test:**

- 1 character
- 2 scenes
- 2 conditions
- 3 outputs per condition per scene
- = 12 planned outputs

**Smaller initial pilot (also acceptable):**

- 1 scene
- 2 conditions
- 3 outputs per condition
- = 6 planned outputs

Realized generated-candidate counts may be lower if a registered Condition B execution unit receives a final `STOP`, as defined below.

This is a smoke test, not a statistical validation study.

Recommendations:

- one low-risk neutral scene
- one controlled high-drift scene
- one major scene variable changed at a time

Rieko is suggested as the initial subject because a validated anchor and known drift directions already exist. Rieko is not mandatory.

-----

## Unit of Registration and Counting

For this protocol, an **execution unit** is one pre-registered combination of scene and condition prepared for generation.

A **generated candidate** is one output produced from an execution unit.

Unless a different structure is pre-registered:

- each scene-condition combination constitutes one execution unit
- each execution unit is assigned its planned number of generated candidates
- the Condition B Execution Package and its pre-execution review are recorded at the execution-unit level
- candidate-level conformance and adoption are recorded separately for each generated output

For the recommended two-scene smoke test:

- registered execution units: 4
- planned generated candidates per execution unit: 3
- total planned generated candidates: 12

If a Condition B Execution Package receives `STOP`, no candidates are generated from that stopped package. If the execution unit later receives `PROCEED` through a recovery attempt permitted by the pre-registered policy, candidates may be generated from the resulting Final Execution Package. If the execution unit remains finally stopped, all unrealized planned candidates associated with that unit must be reported.

-----

## Fixed Inputs

The following must remain the same between Conditions A and B:

- Character PAL version
- Costume PAL version
- Background PAL version
- Sequence PAL version, where applicable
- Anchor asset
- UID
- Scene request
- Model and visible model version
- Registered execution unit count and planned candidate count
- Session-reset policy
- Available generation settings
- Generation date range

The registered execution unit count and planned candidate count must be balanced across Conditions A and B. The realized generated-candidate count may differ if a registered Condition B execution unit remains finally stopped without reaching generation. Execution units receiving any `STOP` decision, execution units finally stopped, execution units reaching generation, and generated candidates must therefore be reported separately.

Any unavoidable difference must be recorded.

### STOP Recovery Policy Pre-Registration

The following Condition B-specific policy must also be pre-registered.

The recovery policy following a `STOP` decision must be pre-registered before generation begins. It must specify whether recovery attempts are permitted, the maximum number of recovery attempts permitted after the initial review for each execution unit, and whether a recovered unit may proceed to generation. This policy must not be changed after review findings are observed.

The initial review is not counted as a recovery attempt. For example, a policy permitting one recovery attempt allows the following maximum sequence:

```
Initial review
→ STOP
→ One recovery attempt
→ Final human-governed review decision
```

### Predicted Drift Pre-Registration

Predicted drift directions must be documented before either condition is generated.

The same pre-registered drift directions are used to evaluate Conditions A and B. Each predicted drift should identify:

- the element at risk
- the expected direction of unintended change
- the corresponding protected condition

Condition B may encode these pre-registered risks in its Anti-drift Block. Condition A does not receive a separately constructed Anti-drift Block unless such a block already exists in the pre-existing direct-PAL baseline procedure.

This registration is required so that reduction of predicted drift can be evaluated against a pre-defined and shared target rather than a post-hoc judgment.

Example:

```yaml
predicted_drift:
  - element: facial_register
    direction: westernization
    protected_condition: Japanese anime facial impression
  - element: expression
    direction: generic_broad_smile
    protected_condition: restrained_soft_expression
```

-----

-----

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

-----

## Pre-Execution Conformance Check

Condition B must include a diagnostic comparison between the PAL source modules and the Execution Package.

**Primary question:**

> Does the model-facing Execution Package still preserve the approved PAL source definitions?

| Check                             | Result            |
|-----------------------------------|-------------------|
| Character identity preserved      | PASS / FAIL       |
| Costume conditions preserved      | PASS / FAIL / N/A |
| Background conditions preserved   | PASS / FAIL / N/A |
| Sequence conditions preserved     | PASS / FAIL / N/A |
| Scene variable correctly isolated | PASS / FAIL       |
| Anti-drift conditions retained    | PASS / FAIL       |
| Unapproved additions detected     | YES / NO          |
| Critical omissions detected       | YES / NO          |

This check diagnoses possible execution-translation drift.

### Anchor-Based Prompt Audit Procedure

For Condition B, the Pre-Execution Conformance Check uses an Anchor-Based Prompt Audit as its operational review procedure.

The audit compares the initially compiled Execution Package against:

- the approved PAL Source Modules
- the applicable validated anchor or reference state
- the current generation request
- the pre-registered predicted drift
- the approved fixed, variable, and drift-boundary conditions

The audit examines whether the Execution Package:

| Audit item | Result |
|------------|--------|
| Protected identity and continuity conditions preserved | PASS / FAIL |
| Scene variables remain within approved scope | PASS / FAIL |
| Explicit drift boundaries retained | PASS / FAIL |
| Critical approved source condition omitted | YES / NO |
| Unsupported interpretation introduced | YES / NO |
| Scene, style, optimization, or production instructions override protected conditions | YES / NO |
| Unnecessary reconstruction pressure introduced | YES / NO |
| Traceability to approved PAL Source Modules maintained | PASS / FAIL |

The applicable anchor may include:

- an approved character image
- a validated identity description
- an approved costume, background, or sequence definition
- the current validated reference state
- or another human-approved representation of the applicable PAL source conditions

The review may be:

- human
- model-assisted
- hybrid

A model-assisted review produces diagnostic evidence only. Its findings do not autonomously approve, reject, revise, or block the Execution Package.

The resulting review record must identify:

- the review method
- the reviewer type
- the audit findings
- the human decision
- whether revision was required
- the reason for revision or stop

Use the following human decisions:

- **PROCEED**
- **REVISE**
- **STOP**

These are decisions made by the human operator within the CIP-governed workflow. They are not autonomous outputs of the audit.

`PROCEED` authorizes submission of the reviewed Execution Package for generation; it does not certify preservation of A or guarantee conformance in the generated candidate.

### Handling review findings

If the Pre-Execution Conformance Check identifies a critical omission, unsupported transformation, protected-condition override, or other material execution-translation risk, the human operator must select `REVISE` or `STOP`.

**For REVISE:**

1. retain the initially compiled Execution Package
2. retain the complete diagnostic review findings
3. record the approved revision instruction
4. produce a revised Execution Package
5. retain a structured diff or revision log
6. conduct a second human-governed review
7. proceed to generation only after the human operator records `PROCEED`

**For STOP:**

1. retain the initially compiled Execution Package
2. retain the diagnostic review findings
3. record the reason for stopping
4. do not submit that Execution Package for generation

The following must be retained:

- initial Execution Package
- diagnostic review findings
- human decision record
- revision instruction, where applicable
- revised Execution Package, where applicable
- revision history
- final Execution Package submitted for generation, where applicable
- final pre-execution decision

When revision occurs, Condition B measures a combined workflow consisting of structured Prompt Layer translation plus pre-execution human review. It does not measure automatic Prompt Layer compilation alone.

### Handling a `STOP` Decision in the Experimental Record

A `STOP` decision is a reportable pre-execution outcome. It must not remove the affected execution unit from the experiment record or be treated as though the initial Execution Package had never been produced.

When `STOP` is recorded:

- the execution unit remains registered under its original scene, condition, and generation order
- the initial Execution Package and complete review findings are retained
- the stop reason is recorded as a pre-execution outcome associated with suspected or material execution-translation risk
- no candidate is generated from the stopped Execution Package
- the stopped execution unit is not silently replaced by a newly selected scene, request, or easier condition

If the pre-registered recovery policy permits recovery, a new Execution Package may be compiled only from the same approved PAL Source Modules, anchor, scene request, and pre-registered predicted drift. The recovery attempt must remain linked to the original stopped execution unit and must be recorded as a subsequent attempt, not as a replacement for the stopped outcome.

The protocol must report separately:

- registered execution units
- execution units receiving any `STOP` decision
- execution units finally stopped without reaching generation
- execution units reaching generation
- generated candidates
- candidate-level conformance and adoption outcomes

An execution unit that remains finally stopped without reaching generation does not contribute generated candidates. All unrealized planned candidates associated with that finally stopped unit must be reported rather than concealed through unregistered replacement generation.

Every initial review, `STOP` decision, recovery attempt, subsequent review, and final pre-execution status must remain in the record. A later `PROCEED` decision does not replace or erase an earlier `STOP` outcome.

-----

## Two Potential Drift Locations

```
PAL Source Modules → Execution Package
= execution-translation drift

Execution Package → Generated Candidate
= generative reconstruction drift
```

These are two separate potential transformation or drift locations. The final output alone cannot always establish which location caused a failure.

-----

## Generation Procedure

1. Predefine and version the approved PAL Source Modules, anchor assets, UID, and scene request.
2. Pre-register the execution units and the planned number of generated candidates assigned to each execution unit.
3. If the experiment claims to test frame-to-frame sequence continuation, pre-register the two-stage procedure, Current Approved Sequence Reference policy, execution mode, and common or condition-specific reference design defined in this protocol.
4. Pre-register the predicted drift directions.
5. Pre-register the Condition B `STOP` recovery policy, including whether recovery is permitted, the maximum number of recovery attempts after the initial review for each execution unit, and whether a recovered execution unit may proceed to generation.
6. Pre-register the Condition A / Condition B generation order or randomization procedure.
7. Prepare and preserve the Condition A direct model-facing prompt according to the pre-existing direct-PAL procedure.
8. Compile the initial Condition B Execution Package through the PAL Prompt Layer.
9. Preserve the initial Condition B Execution Package before review.
10. Conduct the Anchor-Based Prompt Audit against the approved source conditions, applicable anchors, generation request, and predicted drift.
11. Record the audit findings and the human decision as `PROCEED`, `REVISE`, or `STOP`.
12. If `REVISE`, preserve the initial package, review findings, revision instruction, revised package, and revision history; then conduct a second human-governed review.
13. If `STOP` is recorded and the pre-registered recovery policy permits recovery, retain the stopped attempt, compile a recovery Execution Package from the same approved source conditions, record it as a linked subsequent attempt, and conduct another human-governed review. Submit the execution unit for generation only if a later review records `PROCEED`; otherwise record the unit as finally stopped.
14. Submit Condition B for generation only after the human operator records `PROCEED`.
15. Generate Condition A and Condition B outputs according to the pre-registered order.
16. Use separate clean sessions where practical.
17. Balance or randomize A/B order where practical so that one condition is not always generated first.
18. Do not progressively correct failed generated candidates.
19. Do not promote any candidate into a new anchor during the experiment.
20. Preserve failed candidates as experimental evidence, but do not retain them as active production anchors or approved workflow states.
21. Record platform errors, prompt rewrites, refusals, or unexpected execution behavior.

Revision of the Execution Package during the pre-execution review is distinct from progressive correction of generated candidates. The former diagnoses and addresses possible execution-translation drift before generation; the latter is prohibited during the controlled output comparison.

-----

## Output Anonymization

Generated candidates must be renamed before evaluation:

```
candidate_001
candidate_002
candidate_003
...
```

Keep the condition mapping separate until the first evaluation pass is complete.

The evaluator should not initially see:

- Condition A or B
- the prompt used
- the Execution Package
- generation order

-----

## Post-Generation Conformance Assessment

Use separate diagnostic dimensions rather than one aggregate similarity score.

| Dimension                   | Result                      |
|-----------------------------|-----------------------------|
| Character conformance       | PASS / WARNING / FAIL       |
| Costume conformance         | PASS / WARNING / FAIL / N/A |
| Background conformance      | PASS / WARNING / FAIL / N/A |
| Scene-variable execution    | PASS / WARNING / FAIL       |
| Sequence continuity         | PASS / WARNING / FAIL / N/A |
| Anti-drift compliance       | PASS / WARNING / FAIL       |
| Critical identity violation | YES / NO                    |
| Human adoption decision     | ADOPT / REJECT              |

**A high aggregate score must not compensate for a critical character-identity failure.**

Conformance assessments are diagnostic inputs only. They do not replace human judgment or the CIP-governed adoption process.

-----

## Primary Questions

The initial smoke test should answer only these four questions:

1. Was character identity preserved more often?
2. Were the requested scene variables executed correctly?
3. Was the predicted drift reduced?
4. Did the human operator adopt more outputs?

Also record adverse effects:

- excessive rigidity
- suppression of valid expression
- failure to execute scene variables
- over-fixation on costume or background
- translation drift introduced by the Prompt Layer
- reduced creative usefulness

-----

## Outcome Measures

**Primary:**

- Candidate-level critical identity violation rate
- Candidate-level human adoption rate

**Secondary:**

- Character conformance rate
- Scene-variable execution rate
- Anti-drift failure rate
- Costume conformance
- Background conformance
- Sequence continuity
- Generation-to-generation variance
- pre-execution critical omission detection rate
- unsupported interpretation detection rate
- Execution Package revision rate
- protected-condition override detection rate
- percentage of initial Execution Packages receiving immediate `PROCEED`
- difference between initial and final reviewed Execution Packages
- pre-execution `STOP` rate
- number of registered execution units reaching generation
- recovery-attempt rate after `STOP`
- recovered execution unit rate
- final-stop rate (units not reaching generation)
- planned-candidate adoption yield
- execution-unit generation rate

For reporting purposes, the pre-execution `STOP` rate counts execution units receiving at least one `STOP` decision, while the final-stop rate counts execution units that remain stopped and do not reach generation.

Do not create a combined score that can override a critical identity violation.

Do not treat the pre-execution outcome measures as proof that the final generated identity was preserved.

### Measurement Denominators

Candidate-level conformance and adoption rates are calculated only from candidates that were actually generated and evaluated.

Workflow-level yield must also be reported against the pre-registered planned candidate count so that final `STOP` decisions and unrealized candidates are not removed from interpretation.

Report at least:

- **candidate-level critical identity violation rate**
  = generated candidates with a critical identity violation / generated candidates evaluated
- **candidate-level human adoption rate**
  = adopted candidates / generated candidates evaluated
- **planned-candidate adoption yield**
  = adopted candidates / planned generated candidates within the applicable reporting scope
- **execution-unit generation rate**
  = execution units reaching generation / registered execution units

For whole-experiment reporting, the denominator for planned-candidate adoption yield is the total pre-registered planned generated-candidate count. For condition-level or scene-level reporting, the denominator is the corresponding pre-registered planned candidate count for that condition or scene.

These measures must not be substituted for one another. Candidate-level rates describe the quality of generated candidates, while workflow-level yield describes the operational result of the complete workflow, including final pre-execution `STOP` outcomes.

### Reporting by Condition and Scene

All primary and workflow-level measures must be reported separately for Condition A and Condition B. Aggregate comparisons between conditions must not be presented without their per-condition breakdown.

Scene-level results must also be retained and reported separately for each scene. Aggregate differences between conditions must not be interpreted without their scene distribution, as a result that holds in one scene only is not equivalent to a result that holds across scenes.

-----

## Provisional Result Classification

### Promising Signal

- fewer critical identity violations
- higher human adoption rate
- no material degradation of scene-variable execution
- improvement appears in more than one scene or session

### Mixed Result

- identity retention improves but scene execution worsens
- benefit appears in only one scene
- substantial manual correction is required
- outputs become stable but excessively rigid

### No Clear Signal

- Conditions A and B perform similarly
- differences are too small or inconsistent
- platform or session variance dominates

### Adverse Signal

- Condition B increases identity failure
- Prompt Layer introduces substantial translation drift
- valid variation is consistently suppressed
- adoption rate declines

None of these outcomes automatically promotes the hypothesis into a finalized PAL specification.

-----

## Separate Statuses

Maintain separate statuses for documentation, hypothesis, candidate outputs, and anchors:

```yaml
research_record_status: draft | reviewed | adopted
hypothesis_status: untested | promising | mixed | unsupported
candidate_output_status: adopted | rejected
anchor_status: unchanged | candidate | validated
```

Clarifications:

- Adopting an experimental record into GitHub does not adopt a generated candidate.
- Adopting a candidate does not automatically validate it as a new anchor.
- Experiment documentation, candidate adoption, and anchor validation are separate decisions.

-----

## Repository Structure

The shared protocol and individual experiment records must remain separate.

```
docs/
└── pal_prompt_layer_experiment_protocol.md
experiments/
└── pal_prompt_layer/
    ├── PAL-PL-EXP-001/
    │   ├── README.md
    │   ├── manifest.yaml
    │   ├── source_modules/
    │   ├── condition_a_direct/
    │   ├── condition_b_prompt_layer/
    │   │   ├── initial_execution_package/
    │   │   ├── pre_execution_review/
    │   │   ├── revision_instruction/
    │   │   ├── revised_execution_package/
    │   │   ├── final_execution_package/
    │   │   └── revision_log/
    │   ├── outputs/
    │   ├── condition_mapping.csv
    │   ├── evaluation.csv
    │   └── result.md
    └── PAL-PL-EXP-002/
        └── ...
```

- `docs/pal_prompt_layer_experiment_protocol.md` is the reusable method.
- `experiments/pal_prompt_layer/PAL-PL-EXP-XXX/` stores only experiment-specific conditions, evidence, evaluation, and conclusions.
- Individual experiments must reference the protocol version and Git commit used.
- The subdirectories shown under `condition_b_prompt_layer/` are recommended record categories and may be implemented as files or directories depending on the experiment. They are not created at this documentation stage.

**Protocol reference example:**

```yaml
protocol:
  file: docs/pal_prompt_layer_experiment_protocol.md
  version: v0.1
  commit: <git commit hash>
```

These experiment directories are not created at this stage.

-----

## Manifest Example

```yaml
experiment_id: PAL-PL-EXP-001
hypothesis: PAL Prompt Layer preserves A more reliably than direct PAL execution
status: draft
character_uid: rieko_v1
anchor_version: rieko_anchor_v1
source_modules:
  character_pal: v1.0
  costume_pal: v1.0
  background_pal: v1.0
  sequence_pal: N/A
model:
  name: <model name>
  visible_version: <version>
scenes:
  - neutral_scene
  - high_drift_scene
conditions:
  - A: direct_pal
  - B: pal_prompt_layer
predicted_drift:
  - element: facial_register
    direction: westernization
    protected_condition: Japanese anime facial impression
  - element: expression
    direction: generic_broad_smile
    protected_condition: restrained_soft_expression
generation_order:
  method: pre_registered_balanced_order
  sequence:
    - scene: neutral_scene
      order: [A, B]
    - scene: high_drift_scene
      order: [B, A]
registered_execution_unit_count: 4
planned_candidates_per_execution_unit: 3
total_planned_generated_candidate_count: 12
realized_generated_candidate_count: <record after execution>
execution_units_with_any_stop_decision: <record after execution>
execution_units_finally_stopped: <record after execution>
recovered_execution_unit_count: <record after execution>
execution_units_reaching_generation: <record after execution>
unrealized_candidate_count_due_to_final_stop: <record after execution>
condition_b_pre_execution_reviews:
  - execution_unit_id: unit_B_neutral
    scene: neutral_scene
    condition: B
    planned_candidate_count: 3
    applicable_anchors:
      - <anchor path or identifier>
    review_attempts:
      - attempt: 1
        method: anchor_based_prompt_audit
        reviewer_type: hybrid
        execution_package: <initial package path>
        findings:
          protected_conditions_preserved: fail
          variables_within_scope: pass
          drift_boundaries_retained: fail
          critical_omission_detected: true
          unsupported_interpretation_detected: false
          protected_condition_override_detected: false
          unnecessary_reconstruction_pressure_detected: true
          source_traceability_confirmed: fail
        human_decision: stop
        decision_reason: <text>
        human_reviewer: <identifier>
        reviewed_at: <timestamp>
      - attempt: 2
        method: anchor_based_prompt_audit
        reviewer_type: hybrid
        execution_package: <recovery package path>
        linked_prior_attempt: 1
        revision_instruction: <path>
        revision_log: <path>
        findings:
          protected_conditions_preserved: pass
          variables_within_scope: pass
          drift_boundaries_retained: pass
          critical_omission_detected: false
          unsupported_interpretation_detected: false
          protected_condition_override_detected: false
          unnecessary_reconstruction_pressure_detected: false
          source_traceability_confirmed: pass
        human_decision: proceed
        decision_reason: <text>
        human_reviewer: <identifier>
        reviewed_at: <timestamp>
    final_pre_execution_status: proceed
    final_execution_package: <path>
    reached_generation: true
    realized_generated_candidate_count: 3
  - execution_unit_id: unit_B_high_drift
    scene: high_drift_scene
    condition: B
    planned_candidate_count: 3
    applicable_anchors:
      - <anchor path or identifier>
    review_attempts:
      - attempt: 1
        method: anchor_based_prompt_audit
        reviewer_type: hybrid
        execution_package: <path>
        findings:
          protected_conditions_preserved: pass
          variables_within_scope: pass
          drift_boundaries_retained: pass
          critical_omission_detected: false
          unsupported_interpretation_detected: false
          protected_condition_override_detected: false
          unnecessary_reconstruction_pressure_detected: false
          source_traceability_confirmed: pass
        human_decision: proceed
        decision_reason: <text>
        human_reviewer: <identifier>
        reviewed_at: <timestamp>
    final_pre_execution_status: proceed
    final_execution_package: <path>
    reached_generation: true
    realized_generated_candidate_count: 3
stop_recovery_policy:
  permitted: true
  maximum_recovery_attempts_per_execution_unit: 1
  recovered_unit_may_proceed_to_generation: true
primary_outcomes:
  - candidate_level_critical_identity_violation_rate
  - candidate_level_human_adoption_rate
measurement_denominators:
  candidate_level: realized_generated_candidate_count
  planned_candidate_level: total_planned_generated_candidate_count
  execution_unit_level: registered_execution_unit_count
diagnostic_role: PAL Conformance Assessment Layer provides diagnostic input only
human_final_authority: true
protocol:
  file: docs/pal_prompt_layer_experiment_protocol.md
  version: v0.1
  commit: <git commit hash>
```

The `findings` fields contain diagnostic evidence. The `human_decision` field records the operator's decision within the CIP-governed workflow.

The `reviewer_type`, `human_decision`, `findings`, and outcome fields shown above contain illustrative values. Each experiment record must contain the single value applicable to that specific review attempt or execution unit.

Each Condition B execution unit record uses a `review_attempts` list to preserve every review, `STOP` decision, recovery attempt, and final outcome in sequence. A later `PROCEED` decision does not replace or erase an earlier `STOP` outcome. The `final_pre_execution_status` and `reached_generation` fields summarize the unit's outcome; the full history remains in `review_attempts`.

`execution_units_with_any_stop_decision` counts units that received at least one `STOP`. `execution_units_finally_stopped` counts units that did not reach generation. `recovered_execution_unit_count` counts units where a recovery attempt resulted in `PROCEED`. `unrealized_candidate_count_due_to_final_stop` counts planned candidates from units that never reached generation. The difference between `total_planned_generated_candidate_count` and `realized_generated_candidate_count` must be accounted for in the result record.

-----

## Evaluation Example

**Evaluator-facing file (evaluation.csv) — condition is not visible to the evaluator:**

```csv
candidate_id,scene,character_conformance,scene_variable_execution,anti_drift_compliance,critical_identity_violation,human_adoption_decision,notes
candidate_001,neutral,PASS,PASS,PASS,NO,ADOPT,
candidate_002,neutral,WARNING,PASS,FAIL,NO,REJECT,
candidate_003,high_drift,PASS,PASS,PASS,NO,ADOPT,
candidate_004,high_drift,FAIL,PASS,FAIL,YES,REJECT,
```

**Condition mapping (condition_mapping.csv) — kept separate until first evaluation pass is complete:**

```csv
candidate_id,condition,scene,session_id,generation_order
candidate_001,B,neutral,session_B_neutral_01,2
candidate_002,A,neutral,session_A_neutral_01,1
candidate_003,B,high_drift,session_B_high_01,4
candidate_004,A,high_drift,session_A_high_01,3
```

-----

## Limitations

The smoke test cannot establish:

- universal effectiveness
- causality
- statistical significance
- cross-platform generalization
- necessity of the Prompt Layer in all PAL workflows
- complete separation of the two drift locations

Known confounders:

- anchor quality
- model updates
- session context
- platform-side prompt rewriting
- reference-image interpretation
- probabilistic variation
- operator familiarity
- evaluation subjectivity
- interaction between PAL modules
- reviewer effects introduced by model-assisted or human pre-execution audit
- variability in how anchors and protected conditions are interpreted during review

Because Condition B includes structured translation and a human-governed pre-execution review, the initial smoke test evaluates the combined workflow. The protocol preserves the initial and final Execution Packages so that Prompt Layer translation effects and review-mediated corrections can be examined separately.

-----

## Human Authority

> GitHub records the evidence.
> PAL supports continuity.
> The PAL Prompt Layer structures execution-facing translation.
> The PAL Conformance Assessment Layer provides diagnostic evidence.
> CIP governs the adoption process.
> The human operator retains final authority.

-----

*See: [PAL Prompt Layer and PAL Conformance Assessment Layer](pal_prompt_and_conformance_layers.md) — [PAL Hypothesis](pal_hypothesis.md) — [CIP Protocol Template](protocol_template.md)*
