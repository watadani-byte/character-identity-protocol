# YAML Prompt Source-of-Truth Manual
## Purpose
This manual explains how to use the YAML Prompt Source-of-Truth Pattern in practical image-generation workflows.
The goal is to maintain a human-reviewable source state for character identity, scene variables, reference images, prompt expansion, and approval status.
The YAML master should be treated as the source-of-truth. Long prompts, optimized prompts, and ultra-compressed prompts are derived artifacts.
## Recommended Files

A practical repository layout is:

```text
docs/
  yaml_prompt_source_of_truth_pattern.md
  yaml_prompt_source_of_truth_manual.md

docs/examples/
  yaml_prompt_source_of_truth_template_v1_2.yaml
  yaml_prompt_source_of_truth_rieko_evening_example.yaml
```

Optional example files may be added later.

The v1.2 template is available at:

```text
docs/examples/yaml_prompt_source_of_truth_template_v1_2.yaml
```

## Basic Workflow

1. Start from the YAML master template.
2. Fill in the minimum required identity, scene, pose, outfit, background, lighting, and reference image fields.
3. Keep empty fields unless a human explicitly approves their removal.
4. Confirm Execution.ActionMode.
5. Confirm OutputPromptType.
6. Confirm whether attached images are identity anchors, scene references, outfit references, pose references, mood references, or style references.
7. Confirm whether the character is being copied, referenced, or newly created.
8. Run the BeforeExpansion checklist.
9. Expand to the required prompt type.
10. Run the relevant checklist before generation, compression, or template change.
11. Generate only when human approval and execution settings allow it.
12. If drift is detected, reject, reset, re-bind, and re-converge from the YAML master or long prompt.

## Version v1.2

Version v1.2 incorporates the following minimal changes over v1.1:

* adds reference image priority and conflict resolution,
* clarifies the conditional meaning of ReferenceMeansInformativeButNotIdentityBinding,
* preserves the dual role of MinimumPrompt,
* maps ExpansionRules to OutputSlots,
* adds OutputSlots population checks,
* adds template drift handling,
* optionally supports convergence approval tracing.

These are additive changes. They should not remove, merge, rename, or reorder existing core sections.

## Required Template Policy

Every YAML master should include a template policy.

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

This section must not be removed.

The template structure itself is part of the review and control surface. Fields that appear redundant may function as checkpoints.

## Status Field

Use the following status values:

Status: "draft" # draft / human_reviewed / human_approved / generation_approved / deprecated

Recommended progression:

draft → human_reviewed → human_approved → generation_approved

Do not proceed to generation unless the YAML master and derived prompt have reached the required approval state.

## Execution Settings

The Execution section defines whether the YAML should be treated as a source state, an expansion request, or a generation request.

Recommended default:

Execution:
  ActionMode: "expand_only"
  OutputPromptType: "long_prompt"
  OutputLanguage: "english"
  HumanApprovalRequiredBeforeGeneration: true
  ImmediateGenerationAllowed: false
  TreatThisYAMLAsGenerationInstruction: false
  TreatThisYAMLAsReviewableSourceState: true

Important distinction:

expand_only  = produce a prompt, do not generate an image
generate_now = generate only if approval and immediate generation are explicitly allowed
review_only  = inspect the YAML or prompt, do not generate
archive_source = store as source state, do not expand or generate

## Convergence State

Use ConvergenceState to control when optimized or ultra-compressed prompts may be used.

Recommended default:

ConvergenceState:
  CurrentState: "not_converged" # not_converged / initial_convergence_in_progress / human_approved_convergence / stabilized / deprecated
  HumanApprovedSourceStateExists: false
  IdentityConverged: false
  SceneConverged: false
  PoseConverged: false
  OutfitConverged: false
  BackgroundConverged: false
  CompressionAllowed: false
  UltraCompressionAllowed: false
  ApprovalTrace:
    ApprovedBy: ""
    ApprovedAt: ""
    ApprovalBasis: ""
    RelatedOutputID: ""
    Notes: ""
  Notes: ""

Use long prompts for initial convergence and re-convergence.

Do not use optimized prompts or ultra-compressed prompts before human-approved convergence.

## Prompt Strategy

The prompt strategy section defines how each derived prompt type may be used.

### Minimum Prompt

Use for rough reconstruction or quick reference.

Do not use it for identity-critical generation unless separately approved.

### Long Prompt

Use for:

* first generation,
* identity establishment,
* re-convergence,
* anchor-image-based generation,
* complex scene reconstruction.

### Optimized Prompt

Use only after:

* a human-approved source state exists,
* identity and scene boundaries are confirmed,
* the long prompt has already established the task frame.

It must not be used as an initial substitute.

### Ultra-Compressed Prompt

Use only after:

* stable approved generation exists,
* identity has converged,
* scene pattern has converged,
* human-approved convergence exists.

It must not be used for:

* first generation,
* identity recovery,
* unapproved scene change,
* new character creation.

## Reference Policy

Reference images must be explicitly typed.

Recommended structure:

ReferencePolicy:
  AnchorImages:
    Status: "available" # none / available / required / required_for_identity_only / required_for_scene_only
    ConflictResolution: "priority_order" # priority_order / human_decides
    ImageA:
      Role: "primary_identity_anchor"
      Priority: 1
      Required: true
      Notes: ""
    ImageB:
      Role: "scene_outfit_pose_reference"
      Priority: 2
      Required: false
      Notes: ""
    ImageC:
      Role: ""
      Priority: 3
      Required: false
      Notes: ""

If image roles conflict, use the declared priority order or return to human decision.

### Character Reference Modes

Use CharacterReferenceMode.Type to define whether the character should be copied, referenced, or newly created.

CharacterReferenceMode:
  Type: "copy_identity" # copy_identity / reference_identity / new_character_from_reference_style / new_character
  PreserveIdentityStrictly: true
  AllowNewCharacterCreation: false
  IdentityDriftAllowed: false
  HumanApprovalRequiredForIdentityChange: true
  CopyMeansSameCharacterNotSimilarCharacter: true
  ReferenceMeansInformativeButNotIdentityBinding: false
  ReferenceBindingNote: "ReferenceMeansInformativeButNotIdentityBinding applies when Type is reference_identity. When Type is copy_identity, identity binding is unconditional and this field does not override that binding."

Definitions:

copy_identity:
  The attached character is intended to be the same character, not merely similar.
reference_identity:
  The attached image informs identity direction, but does not require the generated person to be the same character.
new_character_from_reference_style:
  A new character may be created using the reference style or impression.
new_character:
  No identity continuity is required.

### Attachment Use

AttachmentUse is an execution-time confirmation layer. It should not override AnchorImages.

Recommended hierarchy:

AnchorImages = source-level role declaration
AttachmentUse = execution-time usage confirmation

Example:

AttachmentUse:
  UseAttachedImageForIdentity: true
  UseAttachedImageForPose: true
  UseAttachedImageForOutfit: true
  UseAttachedImageForBackground: true
  UseAttachedImageForLighting: true
  UseAttachedImageForMood: true
  UseAttachedImageForStyleOnly: false
  DoNotInventMissingReferenceImages: true
  DoNotTreatUnavailableImagesAsImplicitAnchors: true

## Control Policy

Use ControlPolicy to separate immutable content, controlled variables, and scene variables.

### ImmutableCore

Do not change without explicit human approval.

Examples:

ImmutableCore:
  Items:
    - "character identity"
    - "age impression"
    - "face impression"
    - "eye color and eye impression"
    - "hair color and hairstyle"
    - "glasses or defining accessories"
    - "body balance and proportions"
    - "overall presence"
    - "non-childlike adult impression"
    - "identity anchor usage"
    - "copy_identity vs reference_identity distinction"

### ControlledVariables

May vary only within declared limits.

Examples:

* expression,
* pose,
* camera,
* lighting,
* composition.

### SceneVariables

May vary across scenes while maintaining acceptable identity continuity.

Examples:

* outfit,
* background,
* props,
* event theme,
* color palette,
* weather,
* secondary characters.

## Positive Boundaries Before Negatives

Use positive boundaries before relying on negative prompts.

Recommended examples:

PositiveBoundaries:
  Description: "Preferred positive constraints. Use these before relying on negatives."
  Items:
    - "formal"
    - "tasteful"
    - "restrained"
    - "natural"
    - "elegant"
    - "soft Japanese anime facial impression"
    - "adult, not childlike"
    - "identity continuity first"
    - "same character when copy_identity is specified"
    - "human-approved source state remains primary"

Negatives should remain a last safety fence.

Negatives:
  UseAsLastSafetyFence: true
  DoNotUseAsPrimaryControlMethod: true
  KeepMinimalWhenPossible: true

## Expansion Rules and Output Slots

Expansion rules define what should be included in each derived prompt. Output slots store the result.

Add this mapping in v1.2:

ExpansionRules:
  OutputSlotMapping:
    ForMinimumPrompt: "OutputSlots.MinimumPrompt"
    ForLongPrompt: "OutputSlots.LongPrompt"
    ForOptimizedPrompt: "OutputSlots.OptimizedPrompt"
    ForUltraCompressedPrompt: "OutputSlots.UltraCompressedPrompt"

Output slots:

OutputSlots:
  MinimumPrompt: ""
  LongPrompt: ""
  OptimizedPrompt: ""
  UltraCompressedPrompt: ""

Before generation, confirm the required output slot is populated.

### MinimumPrompt Dual Role

MinimumPrompt appears in two places and both must be preserved.

PromptStrategy.MinimumPrompt = rule definition
MinimumPrompt.Text = top-level text slot
OutputSlots.MinimumPrompt = derived prompt output slot

These are not duplicates.

Do not merge them without human approval.

## Drift Handling

Use DriftHandling to define recovery actions.

### Identity Drift

IfIdentityDriftDetected:
  Action: "reject_reset_rebind_reconverge"
  DoNotPatchByAddingMoreNegativesOnly: true
  RequiredReview:
    - "compare against identity anchor"
    - "check face impression"
    - "check body balance"
    - "check age impression"
    - "check presence"
    - "check whether copy_identity was degraded into reference_identity"

### Scene Drift

IfSceneDriftDetected:
  Action: "reject_or_revise_scene_variables"
  RequiredReview:
    - "check ReferencePolicy"
    - "check SceneReferenceMode"
    - "check background and outfit boundaries"
    - "check whether scene reference was replaced by model-side reinterpretation"

### Prompt Compression Drift

IfPromptCompressionDriftDetected:
  Action: "return_to_yaml_master_or_long_prompt"
  RequiredReview:
    - "check whether optimized or ultra-compressed prompt was used too early"
    - "check whether identity-critical details were compressed away"
    - "check whether schema fields were removed or merged"

### Template Drift

Added in v1.2:

IfTemplateDriftDetected:
  Action: "reject_change_and_restore_from_preserved_sections"
  RequiredReview:
    - "compare against TemplatePolicy.PreservedSections"
    - "check whether any section was merged, renamed, or removed"
    - "check whether SchemaLock was bypassed"

## Review Policy

Recommended review settings:

ReviewPolicy:
  ReviewMode: "minimal_patch_preferred"
  DoNotOptimizeByDefault: true
  DoNotShortenByDefault: true
  DoNotRewriteWholeTemplateUnlessRequested: true
  PreserveRedundantLookingFields: true
  TreatRedundancyAsPossibleControlSurface: true
  ReviewerInstructions:
    - "review the template without merging or deleting sections"
    - "identify missing fields rather than simplifying the schema"
    - "flag optimization loss explicitly"
    - "treat empty fields as unresolved checkpoints"
    - "do not convert YAML master into natural-language prompt unless requested"
    - "do not convert YAML master into JSON unless requested"

## Required Audit Checkpoints

### Before Expansion

Confirm:

* ActionMode is correct,
* OutputPromptType is correct,
* this is generation or expansion only,
* anchor image roles are clear,
* copy_identity is distinct from reference_identity,
* new character creation is allowed or prohibited,
* ImmutableCore items are protected,
* controlled variables are bounded,
* scene variables are declared,
* negatives are minimized,
* TemplatePolicy is preserved,
* empty fields are retained,
* compression is allowed by ConvergenceState.

### Before Generation

Confirm:

* the YAML master has been human-approved,
* the long or optimized prompt has been reviewed,
* required identity anchor images are available,
* character identity continuity remains acceptable,
* unintended new character creation is avoided,
* scene, outfit, pose, and background are preserved,
* immediate generation is explicitly allowed,
* ActionMode is set to generate_now,
* ImmediateGenerationAllowed is true,
* human approval requirements are satisfied,
* required OutputSlots are populated.

### Before Compression

Confirm:

* human-approved convergence exists,
* identity is stabilized,
* the scene is stabilized,
* compression is used only for recall,
* identity-critical details are preserved,
* anchor image roles are preserved.

### Before Template Change

Confirm:

* the change is approved by a human,
* no section is removed, merged, renamed, or reordered without approval,
* reviewability is not reduced,
* copy/reference distinction remains clear,
* generation/expansion distinction remains clear,
* premature compression is not enabled.

## Reviewer Prompt

When asking another AI to review the YAML, use instructions like this:

Review the attached YAML Prompt Source-of-Truth template.
Do not optimize, shorten, merge, rename, or delete sections by default.
Treat empty fields as unresolved checkpoints, not unnecessary fields.
The purpose is not to make the prompt shorter.
The purpose is to preserve reviewability, human approval checkpoints, reference image roles, copy/reference distinction, and prompt expansion policy.
Return:
- Strengths
- Risks / Ambiguities
- Missing Fields
- Fields That Must Not Be Removed
- Suggested Minimal Patch
- Suggested Documentation Notes

## Practical Rule

If a change makes the YAML easier to read but harder to audit, reject the change unless a human explicitly approves it.

If a compressed prompt performs well but removes identity-critical or schema-critical information, return to the YAML master or long prompt.

If a reference image is unavailable, do not invent it as an implicit anchor.

If copy_identity is specified, do not reinterpret it as “similar character.”

## Summary

The v1.2 YAML Prompt Source-of-Truth Manual defines a human-reviewable workflow for:

* identity continuity,
* prompt expansion,
* reference image usage,
* copy/reference distinction,
* convergence state,
* compression control,
* template drift detection,
* human approval checkpoints.

The YAML master is the source state. Derived prompts are outputs. Human approval remains the control point.