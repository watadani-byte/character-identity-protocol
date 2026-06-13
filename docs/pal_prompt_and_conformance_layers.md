# Hypothesis: PAL Prompt Layer and PAL Conformance Assessment Layer
　
*An Experimental Translation and Diagnostic Structure for PAL-Governed Image Generation*

> Status: Promising experimental hypothesis — approved for documentation and validation, but not yet adopted as a finalized PAL specification.

-----

## Scope Note

This document proposes an experimental extension to PAL-governed workflows. It is not a normative PAL specification, and it does not redefine C, A, A′, B′, CIP, or PAL.

Fixed terminology preserved in this document:

- C is model-side or execution-structure mediation that transforms A into A′.
- The current fixed reconstruction model is:

```
A → (A + C) → A′ → B′
```

- When describing mismatch or drift, the canonical problem model may be written as:

```
A → (A + C) → A′ → B′ ≠ B
```

- CIP does not directly control C or A′.
- CIP governs validation, rejection, purge, re-binding, re-convergence, and adoption.
- PAL supports continuity, persistence, and anchor availability.
- Conformance measurements described in this document are diagnostic inputs only.
- Human judgment and CIP retain adoption authority.

This document does not describe PAL as directly governing adoption. It does not describe a conformance score as replacing human validation. It does not describe the PAL Prompt Layer as controlling or eliminating C.

-----

## Core Hypothesis

PAL source definitions may be correct — accurately describing the approved character, costume, background, and sequence conditions — while still producing unstable outputs when those definitions are passed directly to a generative model without an explicit model-facing translation layer.

In other words: PAL may correctly define A, but the path from A to a usable prompt is itself a transformation step. If that step is undocumented and unstructured, it may introduce drift before generation even begins.

This document proposes that PAL-governed workflows benefit from an explicit translation layer — the **PAL Prompt Layer** — positioned between PAL source modules and the generative model, and an explicit diagnostic layer — the **PAL Conformance Assessment Layer** — positioned between the generated candidate and CIP adoption review.

-----

## Proposed Structure

```
PAL Source Modules
  ├─ Character PAL
  ├─ Costume PAL
  ├─ Background PAL
  └─ Sequence PAL
          ↓
PAL Prompt Layer
  ├─ Identity Block
  ├─ Scene Variable Block
  └─ Anti-drift Block
          ↓
Pre-Execution Conformance Check
          ↓
Final Prompt / Execution Package
          ↓
Generative Model
          ↓
Generated Candidate
          ↓
PAL Conformance Assessment Layer
          ↓
CIP Validation and Adoption
```

-----

## PAL Prompt Layer

The PAL Prompt Layer reorganizes approved PAL source modules into model-facing blocks:

- **Identity Block** — what must remain stable across the generation (character identity, costume identity, background identity, sequence continuity anchors).
- **Scene Variable Block** — what may change in the current generation (pose, lighting, framing, scene-specific elements).
- **Anti-drift Block** — what is likely to change unintentionally, in which direction, and what must therefore be preserved or explicitly bounded.

These blocks may then be integrated, optimized, and, where appropriate, hyper-compressed into a final model-facing **Execution Package**.

### Clarifications

- Compression at this stage is not mere token reduction. As with the broader CIP/PAL framing, compression here means removing what obscures A, not removing A itself.
- Optimization should expose A rather than silently redefine it.
- The Prompt Layer may itself transform A. Because it may participate in execution-structure mediation, it may itself become part of C.
- Therefore, the output of the PAL Prompt Layer should not be trusted automatically.

### Pre-Execution Question

Before the Execution Package is sent to the generative model, the following question should be asked:

> Does the model-facing Execution Package still preserve the approved PAL source definitions?

This question is answered by the **Pre-Execution Conformance Check**, described below.

-----

## Two Drift Locations

This hypothesis distinguishes two separate points at which drift may be introduced:

**1. PAL Source Modules → Execution Package**
= execution-translation drift

This is drift introduced while reorganizing, compressing, or optimizing approved PAL source definitions into a model-facing prompt or Execution Package — before the generative model has produced anything.

**2. Execution Package → Generated Candidate**
= generative reconstruction drift

This is drift introduced by the generative model itself, through the mediation C that transforms the Execution Package (as A) into A′ and then B′.

These two drift locations are diagnostically distinct. A failure observed in a generated candidate may originate in either location, and the appropriate governance response differs depending on which location is responsible.

-----

## Pre-Execution Conformance Check

Before generation, the Execution Package may be checked against the PAL source modules to assess whether execution-translation drift has already been introduced.

This check is diagnostic. It does not authorize or block generation on its own; it provides input to the operator and to CIP-governed workflow conditions.

-----

## PAL Conformance Assessment Layer

After generation, the candidate is assessed separately against the source PAL modules.

A single undifferentiated similarity score is not used. Instead, separate diagnostic dimensions are retained, such as:

- Character conformance
- Costume conformance
- Background conformance
- Sequence continuity
- Anti-drift compliance
- Critical identity violations

**A high aggregate score must not compensate for a critical character-identity failure.**

Conformance scores produced by the PAL Conformance Assessment Layer are diagnostic inputs only. They do not replace human judgment or CIP adoption authority.

-----

## Relationship to CIP

The responsibility boundary in this hypothesis is as follows:

- **PAL Source Modules** define the approved continuity conditions.
- **The PAL Prompt Layer** translates those conditions into a model-facing Execution Package.
- **The Pre-Execution Conformance Check** assesses whether the translation still preserves the approved source definitions.
- **The generative model** produces a candidate.
- **The PAL Conformance Assessment Layer** diagnoses conformance against the source PAL modules.
- **CIP** governs validation, rejection, purge, re-binding, re-convergence, and adoption.
- **The human operator** retains final adoption authority.

PAL does not directly govern adoption under this hypothesis. The PAL Prompt Layer and PAL Conformance Assessment Layer provide structured continuity support and diagnostic input to the CIP-governed adoption process; they do not replace it.

-----

## Testable Claim

This hypothesis proposes a controlled comparison between:

1. Direct generation from existing PAL definitions
1. Generation through the structured PAL Prompt Layer

Where possible, the following should be held constant:

- source anchors
- scene conditions
- model and version
- output count
- session conditions
- generation settings available to the operator

The following should be evaluated:

- character identity retention
- correct execution of scene variables
- predicted drift reduction
- generation-to-generation variance
- human approval rate
- critical identity violation rate
- recovery after rejection and re-binding
- execution-translation drift
- post-generation conformance

No causal claim is made prior to testing. This document does not assert that the PAL Prompt Layer reduces drift — only that this is a testable hypothesis worth documenting.

-----

## Limitations

This hypothesis has not yet established that the absence of a structured Prompt Layer caused previously observed PAL instability.

Independent sources of drift may remain, including:

- model capability
- anchor quality or impurity
- context contamination
- probabilistic variation
- multi-reference weighting
- reference-image interpretation
- conflicts between character, costume, pose, background, and sequence conditions
- translation loss introduced by the Prompt Layer itself

The PAL Prompt Layer is not assumed to be drift-free. As noted above, it may itself become part of C, and its output should be subject to the same diagnostic scrutiny as any other stage in the pipeline.

-----

## Status and Next Steps

This document records an experimental hypothesis for further investigation. It is not a finalized PAL specification, and it has not been merged into the core PAL definition.

If validated, this structure may inform future revisions to PAL-governed workflow documentation. Until then, it remains a documented hypothesis available for testing.

*See: [PAL Hypothesis Document](pal_hypothesis.md) — [Column: PAL](column_pal.md) — [Glossary](glossary.md)*