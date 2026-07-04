# Prompting as Specification Management under Model Mediation

## 1. Purpose

This note positions prompting, in AI-assisted operational workflows, as a form of specification management rather than as wording optimization.

It is distinct from casual prompting, brainstorming, or simple Q&A, where the goal is typically a single useful response and structure adds little. This note instead addresses **operational prompting**: prompts used to direct document management, code editing, file operations, artifact updates, repository maintenance, and other multi-step AI-assisted workflows, where the prompt effectively functions as a work order.

## 2. Prompting Is Not Only Wording Optimization

Much general prompting advice focuses on phrasing: how to ask a question so the model produces a better or more relevant answer. This is a reasonable concern for conversational or exploratory use.

In operational workflows, however, a prompt does more than request an answer. It defines the work order, the scope of permitted action, the constraints the AI must respect, and the conditions under which output may be adopted. Treating such a prompt only as a wording problem understates what it is actually doing.

## 3. Structured Prompts as Lightweight Specifications

A structured prompt is not better merely because it uses Markdown, YAML, JSON, headings, or bullet points. The useful property of structure is that it can separate elements that are otherwise mixed together in ordinary prose: task, context, scope, allowed changes, forbidden changes, fixed definitions, output format, procedure, review requirements, and human approval conditions.

> The value of structure is not the markup itself, but the separation of specification elements that would otherwise be mixed together in ordinary prose.

Separating these elements makes the human's intent and specification more explicit and more reviewable. It does not, by itself, change how the model processes or executes the request.

## 4. Relation to the CIP/PAL Model

This note uses the existing CIP/PAL model without modification:

```
A → (A + C) → A′ → B′
```

Where C remains defined as model-side or execution-structure mediation that transforms A into A′.

- **A** is the human intent, specification, constraints, and approved state.
- **C** still mediates and transforms A into A′; a structured prompt does not remove or bypass C.
- A structured prompt helps clarify A, and can reduce the ambiguity available for C to fill in unmanaged ways.
- Human review is still required to compare A against A′, where A′ is observable, and against the actual output B′.

If A is unclear or underspecified, the risk condition still applies:

```
A → (A + C) → A′ → B′ ≠ B
```

Structured prompting does not eliminate this risk. It can make deviations easier to notice, because the specification against which A′ and B′ are compared is more explicit.

## 5. Operational Risk of Underspecified Prompts

In file, artifact, and repository workflows, vague prompts carry a specific operational risk. Examples of underspecified operational prompts include:

- "clean up this repository"
- "organize these files"
- "fix the documentation"
- "remove unnecessary files"
- "make this better"
- "update everything accordingly"

These are risky when the AI has file-editing or command-execution capability, because the missing operational detail may be supplied by the system itself — through inferred deletion, renaming, overwriting, reorganization, or scope expansion — rather than by the human operator.

This is best understood as a specification-management and artifact-state risk, not as a simple attribution of fault to the user or the AI:

> Artifact-state accidents often arise when an underspecified A is combined with model-side or execution-structure mediation that fills in missing operational details.

## 6. Recommended Specification Elements

For operational prompts, the following checklist can help make A explicit:

- Task
- Context
- Target files or artifacts
- Allowed changes
- Forbidden changes
- Required procedure
- Output format
- Diff or summary requirements
- Human approval requirement
- Recovery or backup expectations, when relevant

A minimal template:

```markdown
# Task
Describe the requested work.

# Context
Provide relevant background.

# Scope
List files, directories, or artifacts that may be changed.

# Allowed Changes
List the changes that are permitted.

# Forbidden Changes
List actions that are not permitted, such as deletion, renaming, moving, overwriting, or modifying unrelated files.

# Required Procedure
Describe whether the AI should inspect first, propose a diff, wait for approval, or apply changes.

# Output Format
Specify the final response format.

# Human Approval
State that final adoption or repository approval remains with the human reviewer.
```

This template is a starting point, not a fixed schema. Individual tasks may omit fields that do not apply, or add others.

## 7. Limits

Structured prompting has clear limits, and this note does not claim otherwise:

- Structured prompting is not a guarantee of correct or faithful output.
- Long prompts can still bury important constraints where they are easy to miss.
- Conflicting instructions within the same prompt can still cause drift.
- Examples given for illustration may be mistaken for requirements.
- The AI may still misclassify background information as instruction, or the reverse.
- Human review remains necessary regardless of prompt structure.

> Structured prompting reduces ambiguity in A and improves reviewability of A′ and B′, but it does not eliminate C or remove the need for human judgment.

This note does not claim that structured prompts guarantee correct output, that markup controls the model, that Markdown, YAML, or JSON is inherently superior in all situations, that AI can be made safe simply by writing better prompts, or that prompt structure replaces human review.

## 8. Relationship to Existing Documents

This note connects to, but does not replace, several existing documents in this repository:

- [Prompt Lifecycle Design Rationale](prompt_lifecycle_design_rationale.md) explains why different prompt forms exist across a workflow's lifecycle.
- [YAML Prompt Source-of-Truth Pattern](yaml_prompt_source_of_truth_pattern.md) discusses the specific risks and benefits of using a structured source format as the canonical prompt state.
- [Explicit Instruction Fidelity and Artifact-State User Responsibility](explicit_instruction_fidelity_and_user_responsibility.md) addresses whether explicitly declared instructions are actually followed.
- [Artifact-State Governance in AI-Assisted Document Management](artifact_state_governance.md) addresses how file and artifact state is preserved, tracked, and recovered.
- [PAL Prompt & Conformance Layers](pal_prompt_and_conformance_layers.md) discusses experimental, PAL-supported approaches to prompt-side conformance checking.

This note sits alongside these by treating operational prompting itself as a specification-management activity: it is about how a prompt should be written so that A is explicit enough to be reviewed, rather than about lifecycle, source-of-truth format, instruction-following fidelity, or artifact-state tracking individually.

## 9. Scope and Governance Note

This document does not redefine the C model, the canonical `A → (A + C) → A′ → B′` sequence, PAL terminology, protocol definitions, benchmarks, experiment records, or glossary terms. It does not grant AI models governance authority. Consistent with existing CIP/PAL usage, any AI role described here — including tools described as `PAL-supported` — remains advisory. Final adoption and repository authority remains with the human operator.
