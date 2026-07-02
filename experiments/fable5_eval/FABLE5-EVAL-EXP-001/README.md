# FABLE5-EVAL-EXP-001 — Fable 5 Short-Term CIP/PAL Document Evaluation

## Status

```text
draft
```

## Purpose

This experiment is a short-term screening evaluation of Fable 5 for CIP/PAL work.

It is **not** a general benchmark of Fable 5. It does **not** evaluate Fable 5 as the primary model for image generation experiments. It evaluates whether Fable 5 can be used as a supporting model for:

- experiment record organization
- Markdown / YAML consistency review
- CIP/PAL terminology audit
- cautious long-context summarization
- pseudo multi-AI workflow support under ChatGPT main synthesis and human approval

The practical motivation is time-limited access. Fable 5 is available only for a short window without additional usage cost, so this experiment should be treated as a rapid screening exercise rather than a full adoption study.

## Core Question

Can Fable 5 assist CIP/PAL document management and review without rewriting fixed theory, overstating results, or weakening human checkpoints?

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

CIP/PAL governs workflow conditions such as:

- validation
- rejection
- purge
- re-binding
- re-convergence
- adoption

Use **PAL-supported**, not **PAL-governed**.

Human approval remains the final authority.

## Positioning

This experiment evaluates Fable 5 as a candidate auxiliary model in a ChatGPT-main pseudo multi-AI workflow.

Proposed operating structure:

```text
Human
  ↓
ChatGPT main
  ↓
Claude / Sonnet / Fable / Gemini / Perplexity / Codex
  ↓
ChatGPT main synthesis
  ↓
Human approval
  ↓
GitHub / experiment / adoption
```

Fable 5 is not treated as the final authority. Any Fable 5 output must be reviewed by ChatGPT main and then approved or rejected by the human operator before adoption.

## Scope

### In Scope

- Reviewing prior CIP/PAL experiment records
- Separating observation, interpretation, warning, limitation, and adoption judgment
- Checking result classification language for overstatement
- Detecting terminology drift
- Proposing minimal corrections
- Designing a practical role for Fable 5 in distributed review workflows
- Comparing the same prompt against Sonnet 5 if time permits

### Out of Scope

- General Fable 5 performance benchmarking
- Image generation quality testing
- Re-running PAL-POSE-EXP-001
- Redefining C
- Replacing the canonical model
- Modifying CIP/PAL core theory
- Treating Fable 5 output as adopted without human approval

## Initial Input Set

The initial test target is:

```text
PAL-POSE-EXP-001
  README.md
  manifest.yaml
  result.md
```

Important handling note:

```text
README.md is a draft-preparation design document.
manifest.yaml records the experiment metadata and completed classification.
result.md is the completed result record.
```

Fable 5 must not confuse the README draft status with the completed result status in result.md / manifest.yaml.

## Test Plan

### Test 1 — Experiment Record Review

Use PAL-POSE-EXP-001 as the initial input.

Tasks:

- summarize the experiment result
- verify the appropriateness of the result classification
- separate success, warning, limitation, and non-claim
- draft a repository changelog note
- list next review points

Key distinction to preserve:

```text
Step 1 tested Identity Copy / visual identity reference from the original approved anchor.
Steps 2–4 tested stepwise approved-state carry-forward through controlled pose transitions.
This does not prove Identity Recall or compressed-prompt-alone recall.
```

### Test 2 — Terminology Audit

Use a small CIP/PAL terminology target set when available.

Candidate targets:

- README.md
- glossary
- model_a_c_b.md
- white paper relevant section
- docs/pal_prompt_and_conformance_layers.md
- docs/prompt_lifecycle_design_rationale.md

Tasks:

- detect expressions that contradict the fixed C definition
- detect expressions that replace or distort `A → (A + C) → A′ → B′`
- detect “PAL-governed” or equivalent wording that should be changed to “PAL-supported”
- detect wording that implies CIP directly controls C or A′
- propose minimal corrections only

### Test 3 — Pseudo Multi-AI Workflow Review

Evaluate the following workflow from a CIP/PAL perspective:

```text
Human
  ↓
ChatGPT main
  ↓
Claude / Sonnet / Fable / Gemini / Perplexity / Codex
  ↓
ChatGPT main synthesis
  ↓
Human approval
  ↓
GitHub / experiment / adoption
```

Tasks:

- identify where C occurs
- identify where C becomes distributed or cumulative
- identify where A′ drift may occur
- distinguish A-adherence from B′ quality
- place human checkpoints
- recommend an appropriate Fable 5 role

## Evaluation Method

Each item is scored from 0 to 3.

```text
0 = unusable / severe failure
1 = partially useful but risky
2 = usable with mandatory human review
3 = high quality; candidate for adoption under human review
```

Evaluation categories are defined in `scoring_rubric.md`.

## Expected Result Classifications

The final result should use one of the following classifications:

```text
recommended_for_document_management
usable_with_strong_human_review
useful_for_long_context_summarization_only
not_recommended_for_cip_pal_documents
inconclusive_due_to_time_limit
```

## Human Checkpoint Decisions

Use the following human decisions for Fable 5 outputs:

```text
APPROVE
APPROVE WITH WARNING
REVISE
REJECT
STOP / RESET
```

## Non-Claims

This experiment does not claim:

- Fable 5 is generally superior to Sonnet 5, Claude, ChatGPT, Gemini, Perplexity, or Codex
- Fable 5 can autonomously manage CIP/PAL documents
- Fable 5 can modify CIP/PAL fixed theory
- Fable 5 can replace human approval
- Fable 5 can serve as the primary image generation experiment model

## Repository Placement

Recommended location:

```text
experiments/fable5_short_term_evaluation/FABLE5-EVAL-EXP-001/
```

Recommended file layout:

```text
README.md
manifest.yaml
result.md
scoring_rubric.md
prompts/
  fable5_test1_experiment_record_review.md
  fable5_test2_terminology_audit.md
  fable5_test3_multi_ai_workflow_review.md
  sonnet5_comparison_prompt.md
input_reference/
  PAL-POSE-EXP-001/
    README.md
    manifest.yaml
    result.md
```
