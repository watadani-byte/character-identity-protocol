# Prompt Review Checklist and Lightweight Manifest Use

**Status:** Practical Guide / Support Note — not a new core theory, protocol, benchmark, or experiment record.

## 1. Purpose

This note describes a lightweight practice for reviewing operational prompts before they are used for document management, file updates, experiment preparation, or GitHub-related work.

A one-shot prompt can be useful as a task-specific instruction. However, when that prompt may cause files to be edited, renamed, deleted, reorganized, committed, or summarized into repository state, it is worth reviewing before use.

This note introduces a practical relationship between a **Prompt Review Checklist**, a lightweight manifest file, the task-specific one-shot prompt, and final human approval. Together, these may function as a small **Execution Package** for bounded documentation or repository work.

This does not make a prompt reusable by default, does not remove C, and does not guarantee instruction fidelity. Human judgment remains final.

## 2. CIP/PAL Framing

This note uses the established CIP/PAL model without modification:

```
A → (A + C) → A′ → B′
```

Where C remains defined as model-side or execution-structure mediation that transforms A into A′.

The checklist and manifest described here do not control C directly. They only make the human instruction, task boundary, expected artifact state, and review criteria easier to inspect before and after execution.

## 3. Why Operational Prompts Need Review

Operational prompts differ from casual exploratory prompts. A prompt used for repository work may affect document contents, file names, navigation entries, experiment records, version history, README summaries, glossary consistency, or commit and tag preparation.

Even a well-written one-shot prompt still passes through model-side or execution-structure mediation before it becomes an executed task. For this reason, it is useful to check the prompt before sending it, especially when artifact state may change.

The review goal is not to eliminate mediation. It is to reduce avoidable ambiguity and preserve a clear human approval boundary.

## 4. Prompt Review Checklist

A Prompt Review Checklist is a human pre-flight review applied before sending an operational prompt to an AI system. It asks whether the prompt clearly states:

- the task to be performed;
- the limited scope of the task;
- the target files or artifacts;
- the allowed changes;
- the forbidden changes, including whether deletion, renaming, moving, overwriting, or unrelated file edits are prohibited unless explicitly allowed;
- the expected output format;
- the required procedure;
- where human approval is required;
- whether examples are clearly separated from requirements;
- whether fixed CIP/PAL definitions are protected;
- and whether the prompt avoids claiming that structure eliminates C or guarantees correctness.

The checklist is not a scoring system, and it does not certify a prompt as correct. It is a practical review aid. A prompt that fails the checklist should be revised before use.

## 5. When a Manifest Is Useful

A lightweight manifest is useful when a task has enough artifact impact that its identity and expected state are worth recording. This applies especially to document updates, experiment preparation, experiment result recording, multi-file repository changes, GitHub commit preparation, tasks involving fixed terminology, tasks involving allowed and forbidden file operations, or tasks that may later need review by another model or human reviewer.

The manifest does not replace the prompt. It records the task boundary and review frame.

In repository work, this may be recorded as `manifest.yml` or `manifest.yaml`, depending on the existing task or experiment directory convention.

## 6. When a Manifest Is Unnecessary

A manifest is usually unnecessary for casual discussion, brainstorming, short wording suggestions, isolated terminology clarification, minor copyediting with no repository state change, or exploratory reasoning that will not directly modify files or records. In these cases, a checklist alone may be sufficient, or no formal review artifact may be needed.

The purpose of the manifest is to reduce ambiguity where artifact-state risk exists, not to add process overhead to every interaction.

## 7. Lightweight Execution Package

For small documentation or repository tasks, the following three items may be treated together as a lightweight Execution Package:

1. **One-shot prompt** — the task-specific instruction given to the AI.
2. **Prompt Review Checklist** — the human pre-flight check applied before the prompt is used.
3. **Manifest file** — the lightweight record of task identity, scope, constraints, expected updates, and review status.

This package does not create automatic authority. It only makes a task easier to inspect, reproduce, reject, revise, or approve.

## 8. Suggested Manifest Fields

A lightweight manifest may use fields such as:

```yaml
id:
title:
status:
type:
purpose:

related_docs:

fixed_model:
  expression: "A → (A + C) → A′ → B′"
  c_definition: "model-side or execution-structure mediation that transforms A into A′"

scope:

allowed_changes:

forbidden_changes:

expected_updates:

review_focus:

human_authority:
  final_judgment: human
  ai_governance_authority: false

forbidden_claims:
```

The manifest should stay short. It should not become a full protocol unless the task actually requires one.

## 9. Suggested Review Focus

After execution, review should usually check:

- whether the requested change stayed within the declared scope;
- whether expected files match the files actually changed;
- whether forbidden changes were avoided;
- whether fixed CIP/PAL definitions were preserved;
- whether examples were treated as examples rather than requirements;
- whether the output introduced unsupported claims;
- whether the result requires human approval before adoption;
- and whether repository state remains understandable after the change.

For repository work, review should also check whether README, navigation, experiment records, or related documents need to be updated.

## 10. Limits and Warnings

This practice has clear limits.

A checklist does not guarantee instruction fidelity; it only improves the clarity of the instruction before mediation occurs. A manifest does not remove C; the model may still transform the task understanding into A′ before producing B′. A one-shot prompt is not reusable by default, since context, target files, repository state, and task boundaries may differ between uses. The manifest does not grant AI governance authority — AI systems may assist with review, drafting, comparison, or warning detection, but final adoption remains a human responsibility. Finally, lightweight structure can create false confidence if it is mistaken for proof of correctness: checklist completion means a task is better bounded, not that its output is correct.

## 11. Relationship to Existing Documents

This is a practical support document that sits alongside existing workflow and prompt-related notes without modifying them:

- [Prompt Lifecycle Design Rationale](prompt_lifecycle_design_rationale.md) treats prompts as operational artifacts with different roles and preconditions across a workflow.
- [Prompting as Specification Management under Model Mediation](prompting_as_specification_management.md) frames prompts as lightweight task specifications that still pass through mediation.
- [YAML Prompt Source-of-Truth Pattern](yaml_prompt_source_of_truth_pattern.md) and [YAML Prompt Source-of-Truth Manual](yaml_prompt_source_of_truth_manual.md) use structured records to protect task boundaries, without claiming that YAML or manifest structure guarantees fidelity.
- [Artifact-State Governance in AI-Assisted Document Management](artifact_state_governance.md) is supported by manifest use, which helps record expected artifact state and review status before adoption.
- [Explicit Instruction Fidelity and Artifact-State User Responsibility](explicit_instruction_fidelity_and_user_responsibility.md) is reinforced here, since explicit instructions and human review remain necessary when file or repository state may change.
- [Human-Checkpointed Multi-Model Workflow](human_checkpointed_multi_model_workflow.md) can be supported by the checklist and manifest as concrete artifacts for human checkpoints before and after AI-assisted work.
- [Multi-AI Mediation and Cumulative A-Drift](multi_ai_mediation_and_cumulative_a_drift.md) is addressed in part by manifest use, which can help preserve task identity across multiple AI-assisted review or drafting steps.

This note does not modify CIP/PAL core definitions, PAL terminology, protocols, benchmarks, experiment records, glossary terms, or governance authority.

## 12. Practical Use Pattern

A typical lightweight use pattern:

1. Write a one-shot operational prompt.
2. Review it against the Prompt Review Checklist.
3. Create a short manifest if artifact-state risk exists.
4. Send the prompt to the AI system.
5. Compare the output against the prompt, manifest, and repository state.
6. Reject, revise, or approve by human judgment.
7. Record the accepted result only after human approval.

This keeps the process lightweight while preserving the core boundary: AI may assist with execution and review, but final judgment remains human.
