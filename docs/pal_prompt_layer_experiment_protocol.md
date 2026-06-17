# PAL Prompt Layer — Initial Smoke Test Protocol

*Experimental validation plan for the PAL Prompt Layer and PAL Conformance Assessment Layer*

> Status: Draft initial smoke-test protocol — designed to detect whether the PAL Prompt Layer shows a useful operational signal. Not yet executed and not a finalized PAL specification.

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

The existing PAL definitions are used without explicit reorganization into the Prompt Layer blocks. Condition A must use the repository’s pre-existing direct-PAL procedure without introducing the three Prompt Layer blocks. Its exact preparation method and final prompt must be preserved as the baseline.

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
- = 12 outputs

**Smaller initial pilot (also acceptable):**

- 1 scene
- 2 conditions
- 3 outputs per condition
- = 6 outputs

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

If a Condition B execution unit receives `STOP`, no candidates are generated from that Execution Package. The affected execution unit remains in the experimental record, and all unrealized planned candidates associated with that unit must be reported.

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
- `STOP` recovery policy

The registered execution unit count and planned candidate count must be balanced across Conditions A and B. The realized generated-candidate count may differ if a registered Condition B execution unit receives `STOP`. Registered execution units, stopped execution units, and generated candidates must therefore be reported separately.

Any unavoidable difference must be recorded.

### STOP Recovery Policy Pre-Registration

The recovery policy following a `STOP` decision must be pre-registered before generation begins. It must specify whether recovery attempts are permitted, the maximum number of attempts per execution unit, and whether a recovered unit may proceed to generation. This policy must not be changed after review findings are observed.

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

## Pre-Execution Conformance Check

Condition B must include a diagnostic comparison between the PAL source modules and the Execution Package.

**Primary question:**

> Does the model-facing Execution Package still preserve the approved PAL source definitions?

|Check                            |Result           |
|---------------------------------|-----------------|
|Character identity preserved     |PASS / FAIL      |
|Costume conditions preserved     |PASS / FAIL / N/A|
|Background conditions preserved  |PASS / FAIL / N/A|
|Sequence conditions preserved    |PASS / FAIL / N/A|
|Scene variable correctly isolated|PASS / FAIL      |
|Anti-drift conditions retained   |PASS / FAIL      |
|Unapproved additions detected    |YES / NO         |
|Critical omissions detected      |YES / NO         |

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

|Audit item                                                                          |Result     |
|------------------------------------------------------------------------------------|-----------|
|Protected identity and continuity conditions preserved                              |PASS / FAIL|
|Scene variables remain within approved scope                                        |PASS / FAIL|
|Explicit drift boundaries retained                                                  |PASS / FAIL|
|Critical approved source condition omitted                                          |YES / NO   |
|Unsupported interpretation introduced                                               |YES / NO   |
|Scene, style, optimization, or production instructions override protected conditions|YES / NO   |
|Unnecessary reconstruction pressure introduced                                      |YES / NO   |
|Traceability to approved PAL Source Modules maintained                              |PASS / FAIL|

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
1. retain the complete diagnostic review findings
1. record the approved revision instruction
1. produce a revised Execution Package
1. retain a structured diff or revision log
1. conduct a second human-governed review
1. proceed to generation only after the human operator records `PROCEED`

**For STOP:**

1. retain the initially compiled Execution Package
1. retain the diagnostic review findings
1. record the reason for stopping
1. do not submit that Execution Package for generation

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
- stopped pre-execution execution units
- Execution Packages receiving `PROCEED`
- generated candidates
- candidate-level conformance and adoption outcomes

A stopped pre-execution execution unit does not contribute generated candidates. All unrealized planned candidates associated with that unit must be reported rather than concealed through unregistered replacement generation.

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
1. Pre-register the predicted drift directions.
1. Pre-register the Condition A / Condition B generation order or randomization procedure.
1. Prepare and preserve the Condition A direct model-facing prompt according to the pre-existing direct-PAL procedure.
1. Compile the initial Condition B Execution Package through the PAL Prompt Layer.
1. Preserve the initial Condition B Execution Package before review.
1. Conduct the Anchor-Based Prompt Audit against the approved source conditions, applicable anchors, generation request, and predicted drift.
1. Record the audit findings and the human decision as `PROCEED`, `REVISE`, or `STOP`.
1. If `REVISE`, preserve the initial package, review findings, revision instruction, revised package, and revision history; then conduct a second human-governed review.
1. Submit Condition B for generation only after the human operator records `PROCEED`.
1. Generate Condition A and Condition B outputs according to the pre-registered order.
1. Use separate clean sessions where practical.
1. Balance or randomize A/B order where practical so that one condition is not always generated first.
1. Do not progressively correct failed generated candidates.
1. Do not promote any candidate into a new anchor during the experiment.
1. Preserve failed candidates as experimental evidence, but do not retain them as active production anchors or approved workflow states.
1. Record platform errors, prompt rewrites, refusals, or unexpected execution behavior.

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

|Dimension                  |Result                     |
|---------------------------|---------------------------|
|Character conformance      |PASS / WARNING / FAIL      |
|Costume conformance        |PASS / WARNING / FAIL / N/A|
|Background conformance     |PASS / WARNING / FAIL / N/A|
|Scene-variable execution   |PASS / WARNING / FAIL      |
|Sequence continuity        |PASS / WARNING / FAIL / N/A|
|Anti-drift compliance      |PASS / WARNING / FAIL      |
|Critical identity violation|YES / NO                   |
|Human adoption decision    |ADOPT / REJECT             |

**A high aggregate score must not compensate for a critical character-identity failure.**

Conformance assessments are diagnostic inputs only. They do not replace human judgment or the CIP-governed adoption process.

-----

## Primary Questions

The initial smoke test should answer only these four questions:

1. Was character identity preserved more often?
1. Were the requested scene variables executed correctly?
1. Was the predicted drift reduced?
1. Did the human operator adopt more outputs?

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

- Critical identity violation rate
- Human adoption rate

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

Do not create a combined score that can override a critical identity violation.

Do not treat the pre-execution outcome measures as proof that the final generated identity was preserved.

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
stopped_pre_execution_unit_count: <record after execution>
unrealized_candidate_count_due_to_stop: <record after execution>
condition_b_pre_execution_reviews:
  - execution_unit_id: unit_B_neutral
    scene: neutral_scene
    condition: B
    method: anchor_based_prompt_audit
    reviewer_type: hybrid
    initial_execution_package: <path>
    applicable_anchors:
      - <anchor path or identifier>
    findings:
      protected_conditions_preserved: pass | fail
      variables_within_scope: pass | fail
      drift_boundaries_retained: pass | fail
      critical_omission_detected: true | false
      unsupported_interpretation_detected: true | false
      protected_condition_override_detected: true | false
      unnecessary_reconstruction_pressure_detected: true | false
      source_traceability_confirmed: pass | fail
    human_decision: revise
    decision_reason: <text>
    revision_required: true
    revision_instruction: <path or N/A>
    revised_execution_package: <path or N/A>
    revision_log: <path or N/A>
    final_execution_package: <path or N/A>
    human_reviewer: <identifier>
    reviewed_at: <timestamp>
  - execution_unit_id: unit_B_high_drift
    scene: high_drift_scene
    condition: B
    method: anchor_based_prompt_audit
    reviewer_type: hybrid
    initial_execution_package: <path>
    applicable_anchors:
      - <anchor path or identifier>
    findings:
      protected_conditions_preserved: pass | fail
      variables_within_scope: pass | fail
      drift_boundaries_retained: pass | fail
      critical_omission_detected: true | false
      unsupported_interpretation_detected: true | false
      protected_condition_override_detected: true | false
      unnecessary_reconstruction_pressure_detected: true | false
      source_traceability_confirmed: pass | fail
    human_decision: proceed
    decision_reason: <text>
    revision_required: false
    revision_instruction: N/A
    revised_execution_package: N/A
    revision_log: N/A
    final_execution_package: <path>
    human_reviewer: <identifier>
    reviewed_at: <timestamp>
stop_recovery_policy:
  permitted: true
  maximum_attempts_per_execution_unit: 1
  recovered_unit_may_proceed_to_generation: true
primary_outcomes:
  - critical_identity_violation_rate
  - human_adoption_rate
diagnostic_role: PAL Conformance Assessment Layer provides diagnostic input only
human_final_authority: true
protocol:
  file: docs/pal_prompt_layer_experiment_protocol.md
  version: v0.1
  commit: <git commit hash>
```

The `findings` fields contain diagnostic evidence. The `human_decision` field records the operator’s decision within the CIP-governed workflow.

Values separated by `|` in the `findings` fields indicate allowed alternatives. Each experiment record must contain one selected value. The `reviewer_type` and `human_decision` fields shown above contain example values; replace them with the single value applicable to each experiment instance.

A stopped execution unit remains part of the `registered_execution_unit_count` but does not contribute generated candidates. All unrealized planned candidates associated with the stopped unit must be reported under `unrealized_candidate_count_due_to_stop`. The difference between `total_planned_generated_candidate_count` and `realized_generated_candidate_count` must be accounted for in the result record.

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