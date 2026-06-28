# YAML-First Prompt Lifecycle Experiment

## Experiment Identity

| Field | Value |
|---|---|
| Experiment ID | YAML-FPL-EXP-001 |
| Title | YAML-First Prompt Lifecycle Experiment |
| Protocol | Minimal Protocol Draft v0.1 + Protocol Revision Patch v0.2 |
| Current Status | Step 0–11 completed |
| Generation Allowed | No — not allowed unless separately authorized |

---

## Purpose

This experiment does not evaluate whether a "good image" is produced.

The purpose is to observe how a human-approved minimum definition `A` is transformed through
multiple prompt forms and image-generation stages, and how model-side or
execution-structure mediation `C` may transform `A` into `A′`, producing `B′` that may
differ from the intended or human-expected `B`.

---

## Risk-Condition Expression

```
A → (A + C) → A′ → B′ ≠ B
```

This is a risk-condition expression. It does not claim that every output necessarily
diverges from `B`. It keeps the experimental observation structure visible:
`C`, `A′`, and possible `B′ ≠ B` must not be dropped from any record, evaluation,
or problem statement in this experiment.

---

## Fixed Definition of C

```
C is model-side or execution-structure mediation that transforms A into A′.
```

CIP/PAL does not directly control `C`, `A′`, or the generation model.
What CIP/PAL handles: validation / rejection / purge / re-binding /
re-convergence / adoption, and human approval checkpoints.

---

## Scope

This experiment handles:

- Experiment design
- Prompt lifecycle planning
- YAML source-state preparation
- Prompt derivation
- Generation-readiness review
- Result comparison
- C / A′ / B′ analysis
- Drift classification
- Recovery proposal
- Human approval checkpoint preparation

The experiment execution chat did not handle:

- GitHub commits
- Tags
- Full SHA verification
- mkdocs.yml updates
- Repository file edits

When GitHub-side work is needed, a handoff message will be produced for the
document-management chat.

---

## Source A — Minimum Definition

The initial human-approved source input `A` is:

```
下記の内容を適切に英文化してイラストを生成下さい。生成後に DALL-E に渡ったと思われるプロンプトを返して下さい。

・2D anime style illustration
・日本人女性二十代半ば
・日本人にしては恵まれたプロポーション
・スレンダーな体型
・ブラウンの波打つセミロング
・高い位置のポニーテール
・細く繊細なサイドロック
・レイヤー前髪
・ブラウンに柔らかく輝く瞳
・細い縁のメタルフレームの眼鏡
・柔らかいファースライン
・身長に比して小さな頭部
・長すぎない首
・長い手足
・長すぎない胴体
・控えめな胸
・やや豊満な太もも
```

This minimum definition is not merely a character attribute list. It is a minimal
experimental input containing:

1. Japanese-language source attributes
2. A request for appropriate English rendering
3. A request to generate an illustration
4. A request to return the estimated execution prompt after generation

The returned "prompt thought to have been passed to DALL-E / GPT Images" is not a
request for private internal prompt disclosure. It is treated as an Estimated Execution
Prompt Artifact: a post-generation exposed artifact used to observe how `A` may have
been reconstructed into `A′`.

---

## Prompt Lifecycle Sequence

```
最低定義
→ YAMLプロンプト
→ ミニマルプロンプト
→ 長文プロンプト
→ 初回生成
→ 推定実行プロンプト回収
→ A / A′ artifact / B′ 比較
→ 最適化プロンプト
→ 2回目生成
→ Human approval checkpoint
→ 超圧縮プロンプト候補
→ compression safety review
```

No image generation may occur until the protocol, evaluation criteria, approval
standards, and record format have been reviewed and approved by the human.

---

## Prompt Forms and Roles

### Minimum Definition
Role: Human-approved minimal source input `A`. Baseline for all comparisons.
Not allowed: silent expansion, silent omission, treating the Japanese attribute list
as a vague mood reference.

### YAML Master / YAML Prompt
Role: Human-reviewable source-of-truth / master specification.
Not allowed: treating YAML as direct generation prompt by default, deleting empty
fields, merging schema sections without human approval, replacing YAML master with
natural-language prompt.

**The YAML master is not manifest.yaml. See the distinction below.**

### Minimal Prompt
Role: A minimal English derived prompt. Used for rough reconstruction and prompt-delta
observation.
Not allowed by default: identity-critical generation, first-generation substitute when
identity continuity matters.

### Long Prompt
Role: Initial convergence and identity establishment prompt. Used for first generation.
Not allowed: overriding ImmutableCore, adding unapproved scene identity, silently
changing "Japanese woman in her mid-twenties" into generic anime woman.

### Optimized Prompt
Role: Second-pass correction prompt after observing `B′`.
Not allowed: first generation, replacing source state, broad aesthetic optimization
unrelated to observed drift.
Constraint: Must not be used for first generation.

### Ultra-Compressed Prompt
Role: Lightweight recall prompt after stabilization and convergence.
Not allowed: first generation, identity recovery, new character creation, unapproved
scene change, replacing YAML master.
Constraint: Must not be used as initialization substitute.

---

## YAML Master — Required Sections

The YAML master (not manifest.yaml) must include the following sections with at
minimum the content described:

```
ImmutableCore:
  Identity-critical attributes that must not change across all generations.

ControlledVariables:
  Attributes that may be adjusted only with explicit human approval before change.

SceneVariables:
  Scene, pose, background, lighting, framing, mood, and composition variables
  that may vary within approved bounds.

ReferencePolicy:
  How copy_identity / reference_identity / no_reference states are handled.
  Must not collapse copy_identity and reference_identity into the same meaning.

Execution:
  ActionMode, ImmediateGenerationAllowed, HumanApprovalRequiredBeforeGeneration,
  and whether the YAML is treated as source state or generation instruction.

ConvergenceState:
  Current approval status: draft / under_review / approved / converged.
  Must record whether identity convergence has actually occurred.

PromptStrategy:
  Which prompt forms are active and in what order they may be derived:
  Minimum Definition, YAML Master, Minimal Prompt, Long Prompt,
  Optimized Prompt, Ultra-Compressed Prompt.

DriftHandling:
  C types and drift types currently tracked.

AuditChecklist:
  Per-step human judgment record.

OutputSlots:
  Reserved fields for B′, Estimated Execution Prompt Artifact,
  comparison notes, recovery artifacts, and adoption status.
```

---

## manifest.yaml vs. YAML Master — Distinction

```
manifest.yaml
  Experiment metadata, artifact slots, approval state, C / drift tracking.
  Does not contain YAML master body content inline.

YAML master / YAML Prompt
  The source-of-truth artifact for the experiment.
  Human-approved source state and master specification.
  Stored as a separate artifact, referenced from manifest.yaml as an artifact slot.
```

---

## Human Judgment Policy

Human judgment options:

```
APPROVE
APPROVE WITH WARNING
REVISE
REJECT
STOP
```

### APPROVE
Identity-critical items preserved. No serious `A` loss. `B′` within acceptable
human-expected `B`. Minor deviations non-critical.

### APPROVE WITH WARNING
Output is usable. Minor drift exists and is recorded. The next step must not silently
adopt the drift into source state.

### REVISE
Prompt artifact is close but needs correction. Generation must not proceed yet.
Drift can be corrected without purge.

### REJECT
Identity changed. Critical attribute lost. Unapproved `A′` became dominant.
Post-hoc alignment to `B′` appears. Optimized or compressed prompt weakened source state.

### STOP
The sequence is no longer testing the intended hypothesis. The workflow has collapsed
into uncontrolled prompt editing. Human approval boundaries are unclear. The model or
tool behavior prevents meaningful observation.

### After STOP

1. Record the reason for STOP using the standard record format.
2. Preserve all artifacts generated up to that point.
3. Do not discard Source A, YAML master, A′ artifacts, Estimated Execution Prompt
   Artifacts, B′ outputs, reviews, or recovery notes.
4. No further generation or prompt derivation may occur after STOP.
5. Human must explicitly choose one of:
   - Protocol revision and restart from Step 0
   - Selective restart from the last approved step
   - Experiment termination with full record preservation

---

## Step Overview

### Step 0 — Protocol Approval
Action: Review minimal protocol. No generation.
Human Judgment: APPROVE / REVISE / STOP
**Status: APPROVED**

### Step 1 — Minimum Definition Audit
Action: Confirm exact source `A`. Identify identity-critical elements.
Output: Protected-element checklist.
Human Judgment: APPROVE / REVISE / STOP
Generation Allowed: No

### Step 2 — YAML Master Draft
Action: Convert minimum definition into YAML source-of-truth.
Output: YAML master draft with status `draft`.
Human Judgment: APPROVE / REVISE / STOP
Generation Allowed: No

### Step 3 — YAML Master Review
Action: Check all required sections. Verify ImmutableCore, ControlledVariables,
SceneVariables, ReferencePolicy, Execution, ConvergenceState, PromptStrategy,
DriftHandling, AuditChecklist, OutputSlots.
Output: YAML review report.
Human Judgment Required: APPROVE / REVISE / STOP
Note: YAML master is not confirmed as source-of-truth until explicitly APPROVED here.
Generation Allowed: No

### Step 4 — Minimal Prompt Derivation
Action: Create minimal English prompt from approved source state.
Output: Minimal prompt and A / A′ delta.
Human Judgment Required: APPROVE / APPROVE WITH WARNING / REVISE / REJECT / STOP
Note: The derived minimal prompt is an A′ artifact. Human review required before
any further use.
Generation Allowed: No

### Step 5 — Long Prompt Derivation
Action: Create first-generation prompt for identity establishment.
Output: Long prompt and A / A′ delta.
Human Judgment Required: APPROVE / APPROVE WITH WARNING / REVISE / REJECT / STOP
Note: Human approval required before generation is triggered.
Generation Allowed: Only after human approval at this step.

### Step 6 — First Generation
Action: Generate first image using Long Prompt.
Output: B′ and Estimated Execution Prompt Artifact.
Human Judgment Required: APPROVE / APPROVE WITH WARNING / REVISE / REJECT / STOP
Generation may occur only after explicit human approval at Step 5.

### Step 7 — A / A′ Artifact / B′ Comparison
Action: Compare source A, derived prompt artifact, Estimated Execution Prompt
Artifact, and generated B′.
Additional check: Determine whether the Estimated Execution Prompt Artifact is a
post-hoc reconstruction of B′ rather than a faithful reflection of A. If so,
classify as C_posthoc / Post-hoc Alignment to B′.
Output: Drift classification and C type analysis.
Generation Allowed: No

### Step 8 — Optimized Prompt Candidate
Action: Create correction prompt only for observed drift.
Output: Optimized prompt candidate and optimization safety review.
Human Judgment Required: APPROVE / APPROVE WITH WARNING / REVISE / REJECT / STOP
Generation Allowed: Only after human approval at this step.

### Step 9 — Second Generation
Action: Generate second image using Optimized Prompt.
Output: B′ second candidate and Estimated Execution Prompt Artifact.
Human Judgment Required: APPROVE / APPROVE WITH WARNING / REVISE / REJECT / STOP

### Step 10 — Compression Candidate
Action: Create ultra-compressed prompt candidate only if human-approved convergence
exists.
Output: Ultra-compressed candidate.
Human Judgment Required: APPROVE / APPROVE WITH WARNING / REVISE / REJECT / STOP
Generation Allowed: No by default.

### Step 11 — Compression Safety Review
Action: Verify compression safety against all fail conditions.
Output: Compression safety result — pass or fail with reasons.
Human Judgment Required: APPROVE / REVISE / REJECT / STOP

---

## Compression Safety Review — Fail Conditions

An Ultra-Compressed Prompt fails compression safety review if it meets any of:

1. Removes identity-critical details from ImmutableCore.
2. Weakens the distinction between copy_identity and reference_identity.
3. Implies the compressed prompt can replace the YAML master.
4. Implies the compressed prompt can initialize a new identity.
5. Removes convergence-state dependency.
6. Hides known warnings from previous APPROVE WITH WARNING steps.
7. Converts specific protected attributes into generic style language.
8. Omits glasses, eye color, hair structure, age impression, body balance,
   or Japanese facial impression.
9. Introduces new unapproved aesthetic direction.
10. Makes C / A′ / B′ ≠ B unobservable in the record.

---

## Record Format

Use this format for every conversion, generation, review, or recovery step:

```
Experiment ID:
Step:
Prompt Form:
Source A:
Derived Prompt / A′ Artifact:
Estimated Execution Prompt Artifact:
Generation Result B′:
Human Expected B:
Observed Difference:
C Type:
Drift Type:
Human Judgment:
  APPROVE / APPROVE WITH WARNING / REVISE / REJECT / STOP
Recovery Action:
  none / revise / reject / purge / re-bind / re-converge /
  return_to_yaml_master / return_to_long_prompt
Notes:
```

**Field Distinction:**

```
Derived Prompt / A′ Artifact:
  A human-reviewable prompt artifact intentionally derived from A or YAML master.

Estimated Execution Prompt Artifact:
  A post-generation exposed artifact that may reflect, approximate, rationalize,
  or retrospectively explain the actual generation result B′.
  These are not the same. Do not merge them.
```

For non-generation steps:
- `Generation Result B′: not generated`
- `Estimated Execution Prompt Artifact: not applicable`

---

## C Type Tracking Candidates

```
C_translation
C_prompt_expansion
C_compression
C_optimization
C_posthoc
C_interpretive
C_generalization
C_neutralization
C_orchestration
```

## Drift Type Tracking Candidates

```
Translation Loss
Structural Omission
Post-hoc Alignment to B′
Creative Overreach
Compression Loss
Optimization Drift / Optimization Falloff
Constraint-induced C Amplification
Template Drift
Identity Drift
Scene Drift
```

---

## Current Status

```
Step 0–11:                    completed
YAML master:                  approved as source-of-truth
Identity convergence:         achieved — stable across Step 6B and Step 9
Scene inheritance:            documented — NOT adopted as source state
Ultra-Compressed Prompt:      approved for identity-recall use only
Generation Allowed:           No — not allowed unless separately authorized
Overall result:               successful_identity_convergence_with_anchor_mediated_scene_carryover
```