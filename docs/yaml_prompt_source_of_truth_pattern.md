# YAML Prompt Source-of-Truth Pattern

## Status

Proposed operational pattern.

This document describes a YAML-based prompt source-of-truth pattern for human-reviewed image-generation workflows, especially workflows that require character identity continuity, reference-image interpretation, prompt expansion, and human approval checkpoints.

This pattern does not guarantee model compliance, identity preservation, or output consistency. It does not directly control the model-side or execution-structure mediation `C`. Instead, it provides a reviewable source state for defining, checking, rejecting, re-binding, re-converging, and adopting prompt intent before and after generation.

## Background

In prompt-based image-generation workflows, a human may approve an intended input state `A`, but the generative system may mediate or reconstruct that input into `A′`, producing an output `B′` that differs from the intended result `B`.

Within the CIP/PAL framing, the risk condition addressed by this pattern can be represented as:

```text
A → (A + C) → A′ → B′ ≠ B
```

Where:

- `A` is the human-approved source state.
- `C` is model-side or execution-structure mediation that transforms `A` into `A′`.
- `A′` is the task understanding or execution form after C-mediated transformation.
- `B′` is the produced output.
- `B` is the intended or human-expected result.

This expression describes the risk condition addressed by CIP/PAL. It does not claim that every output necessarily diverges from `B`. Rather, it keeps the intended risk structure visible: `C` may mediate `A` into `A′`, and the produced `B′` may differ from the intended or human-expected `B`.

The purpose of this pattern is not to eliminate `C`, nor to claim direct control over `A′`. The purpose is to make the human-approved source state more explicit, reviewable, and resistant to unintended optimization loss.

## Core Idea

A YAML prompt source-of-truth is not merely a prompt template.

It is a structured, human-reviewable source state that separates:

- what must remain unchanged,
- what may vary within controlled boundaries,
- what may vary freely as a scene element,
- how reference images should be interpreted,
- whether the YAML should be expanded only or used for immediate generation,
- whether the output prompt should be minimum, long, optimized, or ultra-compressed,
- whether character identity should be copied, referenced, or newly created.

The YAML file acts as the master specification. Natural-language prompts are derived artifacts.

## Why YAML

YAML is useful as a human-managed source-of-truth because it supports:

- readable nested structure,
- comments,
- stable section names,
- visible empty fields,
- GitHub diff review,
- separation of identity, scene, prompt strategy, and execution policy.

JSON may be useful as a downstream machine-execution or validation format. However, JSON is less suitable as the human-approved source state because it does not support comments in the standard format and is harder to review manually when long prompt text, approval notes, and empty unresolved fields are present.

A recommended distinction is:

```text
YAML = human-approved source state
JSON = machine-executable derived artifact
```

## Template Lock and Schema Lock

A key part of this pattern is that the template structure itself is part of the control surface.

Fields that appear redundant may still be required as review checkpoints. Empty fields are not necessarily unnecessary. They may indicate unresolved, unused, or awaiting-human-specification fields.

For this reason, the YAML template should include a `TemplatePolicy` section.

Example:

```yaml
TemplatePolicy:
  TemplateVersion: "v1.2"
  SchemaLock: true
  DoNotRemoveEmptyFields: true
  DoNotMergeSections: true
  DoNotRenameKeysWithoutHumanApproval: true
  DoNotReorderCoreSectionsWithoutHumanApproval: true
  EmptyFieldMeaning: "intentionally unresolved, unused in this case, or awaiting human specification; not unnecessary"
  HumanApprovalRequiredForTemplateChange: true
  TemplateStructureIsControlSurface: true
```

This prevents the common optimization failure where an AI reviewer or assistant removes fields because they appear unused, redundant, or overly verbose.

## Content Lock vs Schema Lock

This pattern distinguishes two kinds of locking.

### Content Lock

Content lock protects the approved character, scene, pose, or identity constraints.

Examples:

- character identity,
- face impression,
- body balance,
- age impression,
- approved pose meaning,
- identity anchor usage.

### Schema Lock

Schema lock protects the template itself.

Examples:

- `Execution`,
- `ConvergenceState`,
- `ReferencePolicy`,
- `ControlPolicy`,
- `ExpansionRules`,
- `AuditChecklist`,
- `DriftHandling`,
- `OutputSlots`.

Both are important. A prompt may preserve the character description while losing the fields that make review, rejection, re-binding, and compression control possible.

## Immutable, Controlled, and Scene Variables

The pattern separates prompt content into three major classes.

### ImmutableCore

Fields that define the human-approved identity or continuity state. These should not be changed without explicit human approval.

Examples:

- character identity,
- face impression,
- eye color and eye impression,
- hair color and hairstyle,
- body balance and proportions,
- age impression,
- overall presence,
- copy-identity versus reference-identity distinction.

### ControlledVariables

Fields that may vary, but only within declared boundaries.

Examples:

- expression,
- pose,
- camera,
- lighting,
- composition.

These fields are often where unintended mediation occurs. For example, a gentle closed-lip smile may be reconstructed as a broad theatrical smile, or a formal pose may be reconstructed as a seductive fashion pose.

### SceneVariables

Fields that may change across scenes while preserving the immutable core.

Examples:

- outfit,
- background,
- props,
- event theme,
- color palette,
- weather,
- secondary characters.

## Reference Policy

Reference images should not be treated as a single undifferentiated input.

The YAML should explicitly declare whether attached images are used as:

- primary identity anchors,
- scene references,
- outfit references,
- pose references,
- mood references,
- style references.

The YAML should also distinguish:

```text
copy_identity      = generate the same character, not merely a similar character
reference_identity = use the image as informative reference, not binding identity
new_character      = create a new character
```

This is important because “use this image as reference” can be interpreted differently by different models and tools.

## Prompt Expansion Types

The YAML master may be expanded into multiple prompt types.

### Minimum Prompt

A short prompt containing only the minimum required conditions.

This is useful for quick reference, rough reconstruction, or documentation. It is not sufficient for identity-critical generation unless separately approved.

### Long Prompt

A full natural-language prompt used for initial convergence, identity establishment, or re-convergence.

Recommended when:

- this is the first generation,
- identity continuity is important,
- anchor images are available,
- many controlled variables exist,
- previous outputs drifted and re-convergence is required.

### Optimized Prompt

A reduced but still structured prompt used after human-approved convergence.

It may support re-binding and re-convergence, but it must not be used as an initial substitute for the long prompt.

### Ultra-Compressed Prompt

A lightweight recall prompt used only after stabilization.

It must not be used for:

- first generation,
- identity recovery,
- unapproved scene change,
- new character creation.

Compressed prompts are not initialization substitutes.

## Convergence State

The YAML should declare whether convergence has occurred.

Example:

```yaml
ConvergenceState:
  CurrentState: "not_converged"
  HumanApprovedSourceStateExists: false
  IdentityConverged: false
  SceneConverged: false
  CompressionAllowed: false
  UltraCompressionAllowed: false
```

This prevents premature use of optimized or ultra-compressed prompts.

## Drift Handling

The pattern treats drift as more than visible character drift.

It recognizes at least three drift types:

1. Identity drift  
   The generated subject no longer preserves the approved character identity.

2. Scene drift  
   The generated scene, outfit, pose, or background no longer follows the approved source state.

3. Template or compression drift  
   Required schema fields, review checkpoints, or identity-critical details are removed, merged, renamed, or compressed away.

A recommended action for template drift is:

```yaml
IfTemplateDriftDetected:
  Action: "reject_change_and_restore_from_preserved_sections"
  RequiredReview:
    - "compare against TemplatePolicy.PreservedSections"
    - "check whether any section was merged, renamed, or removed"
    - "check whether SchemaLock was bypassed"
```

## Relationship to CIP/PAL

This pattern is PAL-supported. It provides a structured source state that helps human reviewers inspect intended identity, variable boundaries, reference image roles, and prompt expansion mode.

It does not claim that:

- the model will obey the YAML,
- character identity is guaranteed,
- `C` is directly controlled,
- `A′` is fully observable,
- prompt drift is impossible.

Instead, it supports:

- validation,
- rejection,
- purge,
- re-binding,
- re-convergence,
- adoption,
- reviewable human checkpoints.

## Recommended Use

Use this pattern when:

- character identity continuity matters,
- reference images are used,
- copy versus reference ambiguity is likely,
- prompts will be expanded into multiple forms,
- prompt compression is considered,
- multiple AI tools or reviewers are involved,
- GitHub diff review is useful,
- human approval must remain explicit.

Do not use this pattern as a claim of deterministic generation control.

## Summary

The YAML Prompt Source-of-Truth Pattern treats a YAML prompt as a human-approved, reviewable source state rather than a disposable prompt draft.

Its main contribution is the separation of:

- source state and generated prompt,
- immutable content and variable content,
- copy and reference,
- generation and expansion,
- long prompt and compressed prompt,
- content drift and template drift.

This makes prompt intent easier to review, preserve as a source state, reject, restore, and re-converge under human control.