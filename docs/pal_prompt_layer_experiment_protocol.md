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

CIP evaluates whether B′ is adoptable in relation to B.

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
Pre-Execution Conformance Check
        ↓
Execution Package
        ↓
Generative Model
        ↓
Generated Candidate
```

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
- Output count
- Session-reset policy
- Available generation settings
- Generation date range

Any unavoidable difference must be recorded.

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

**Handling check failures:**

If the Pre-Execution Conformance Check detects a critical omission or an unapproved transformation, the Execution Package must be revised before generation.

Both the initially compiled package and the revised package must be retained. All revisions must be logged.

In that case, Condition B measures the combined workflow of structured translation plus pre-execution human review, not automatic prompt compilation alone. This distinction must be noted in the result record.

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

1. Predefine and version the source materials.
1. Pre-register the condition order or randomization procedure.
1. Generate Condition A and Condition B outputs according to that pre-registered order.
1. Use separate clean sessions where practical.
1. Balance or randomize A/B order where practical so that one condition is not always generated first.
1. Do not progressively correct failed candidates.
1. Do not promote any candidate into a new anchor during the experiment.
1. Preserve failed candidates as experimental evidence, but do not adopt them into production.
1. Record platform errors, prompt rewrites, refusals, or unexpected execution behavior.

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

Do not create a combined score that can override a critical identity violation.

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
output_count: 12
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