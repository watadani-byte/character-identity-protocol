# FABLE5-TERMINOLOGY-REGRESSION-EXP-001 — Fable 5 Terminology Regression and Minimal-Correction Audit

## Status

```text
draft
```

## Purpose

This experiment evaluates whether Fable 5 can serve as a secondary terminology auditor for CIP/PAL documentation without becoming a theory editor, final authority, or autonomous repository maintainer.

This is not a general Fable 5 benchmark. It is a bounded CIP/PAL workflow evaluation.

The experiment follows prior Fable 5 findings:

```text
FABLE5-EVAL-EXP-001
FABLE5-BOUNDARY-EXP-001
FABLE5-DRIFT-CHECK-EXP-001
```

Those prior experiments positioned Fable 5 as a warning-capable auxiliary reviewer under strict human checkpointing. This experiment tests whether that role can extend to terminology regression review.

## Fixed CIP/PAL Premises

Do not redefine C.

```text
C is model-side or execution-structure mediation that transforms A into A′.
```

Canonical model:

```text
A → (A + C) → A′ → B′
```

Mismatch / risk condition:

```text
A → (A + C) → A′ → B′ ≠ B
```

CIP/PAL does not directly control C, A′, or the generative model.

CIP/PAL handles workflow governance conditions such as:

```text
validation
rejection
purge
re-binding
re-convergence
adoption
```

Use `PAL-supported`, not `PAL-governed`.

Human approval remains the final authority.

## Experiment Type

```text
PAL-supported auxiliary terminology regression experiment
```

This experiment evaluates Fable 5 as:

```text
secondary terminology auditor
minimal-correction recommender
risk flagger
pre-synthesis auxiliary reviewer
```

It does not evaluate Fable 5 as:

```text
primary document manager
final theory editor
final adoption authority
repository patch author
core terminology authority
human judgment replacement
```

## Core Question

Can Fable 5 detect terminology drift, theory-boundary violations, and risky wording in CIP/PAL documents while limiting itself to minimal correction suggestions under human review?

## Audit Scope

The experiment should use a small document set at first.

Recommended initial target set:

```text
docs/model_a_c_b.md
docs/glossary.md
docs/cip_terminology_mapping.md
docs/pal_prompt_and_conformance_layers.md
docs/human_checkpointed_multi_model_workflow.md
```

Optional expansion set:

```text
docs/multi_ai_mediation_and_cumulative_a_drift.md
docs/multi_agent_verification_and_intent_adherence.md
docs/prompt_lifecycle_design_rationale.md
docs/prompting_as_specification_management.md
docs/prompt_review_checklist.md
docs/yaml_prompt_source_of_truth_pattern.md
```

The target documents should not be duplicated into this experiment folder by default. The experiment folder records prompts, rubric, manifest, and result. Input files should be attached or pasted during execution.

## Regression Targets

Fable 5 should check for:

```text
- redefinition of C
- replacement of the canonical model
- wording that implies CIP/PAL directly controls C or A′
- use of PAL-governed instead of PAL-supported
- weakening of human approval or human checkpointing
- overextension of experiment results into general theory
- Prompt Lifecycle being framed as higher-level than CIP/PAL core premises
- terminology changes that are larger than necessary
```

## Allowed Fable 5 Actions

Fable 5 may:

```text
detect risky wording
classify severity
explain why the wording is risky
suggest minimal corrections
identify files or sections needing human review
separate observation, interpretation, warning, limitation, and adoption judgment
```

## Forbidden Fable 5 Actions

Fable 5 must not:

```text
rewrite whole documents
revise core theory
change glossary definitions as final authority
replace the canonical model
claim CIP/PAL directly controls C or A′
convert audit findings into final adoption judgment
apply repository patches
decide GitHub changes
use PAL-governed as preferred terminology
```

## Execution Plan

Run one integrated terminology regression audit using:

```text
prompts/fable5_terminology_regression_audit.md
```

Suggested execution steps:

```text
1. Provide the fixed CIP/PAL premises.
2. Provide the selected target documents.
3. Ask Fable 5 to detect terminology or theory-boundary risks.
4. Require severity classification.
5. Require minimal correction suggestions only.
6. Require a boundary statement preserving human final authority.
7. Return the Fable 5 output to the evaluation coordinator.
8. Score the output using scoring_rubric.md.
9. Record final human judgment in result.md.
```

## Human Checkpoint

Every Fable 5 finding must be reviewed by a human before being used.

Allowed human decisions:

```text
APPROVE
APPROVE WITH WARNING
REJECT
STOP / RESET
```

Fable 5 output is advisory only.

## Expected Result Classifications

Possible final classifications:

```text
fable5_useful_as_secondary_terminology_auditor_with_human_review
fable5_usable_for_terminology_detection_but_not_theory_editing
fable5_useful_for_flagging_terms_only
fable5_not_reliable_for_cip_pal_terminology_audit
inconclusive_due_to_limited_document_scope
```

## One-Sentence Summary

FABLE5-TERMINOLOGY-REGRESSION-EXP-001 tests whether Fable 5 can detect CIP/PAL terminology drift and suggest minimal corrections while preserving fixed theory boundaries and human final authority.
