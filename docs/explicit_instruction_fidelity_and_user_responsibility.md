# Explicit Instruction Fidelity and Artifact-State User Responsibility

## Purpose

This document is a companion note to [Artifact-State Governance in AI-Assisted Document Management](artifact_state_governance.md). It does not replace that document. It addresses a related but distinct evaluation axis that arises in CIP/PAL-style document management, experiment records, repository maintenance, and other governance-oriented AI-assisted workflows.

Artifact-State Governance asks whether the environment preserves artifact state, canonical identity, provenance, and rollback boundaries clearly. This document asks a narrower and more procedural question:

> Did the AI follow the instructions that were actually declared by the user?

And a related question of responsibility:

> Did the human operator specify the artifact state, expected operation, and preservation boundaries clearly enough for controlled document work?

## Background: two separate evaluation axes

Much of current AI discourse emphasizes how much a model can infer without the user explicitly writing out instructions. In general consumer use, this kind of inference can be genuinely useful — it reduces friction and produces helpful defaults.

However, in governance-oriented workflows such as CIP/PAL document management, this "helpfulness by inference" is not the same thing as, and should not be substituted for, a separate axis:

> How faithfully does the AI follow explicitly declared instructions?

A concise formulation of this distinction:

> AI "helpfulness by inference" and AI "fidelity to declared intent" are separate evaluation axes.

(AI がどれだけ察してくれるかと、書かれた指示にどれだけ忠実かは別である。)

Conflating the two axes can lead to misattributed failures: an AI is sometimes described as having "failed" when in fact it satisfied every instruction that was actually given, and the gap was an unstated requirement the user assumed but did not declare.

## Key principle

If the user does not specify an output contract, file-handling rule, format requirement, or preservation condition, then failure to satisfy that unstated requirement should not automatically be treated as an AI failure.

For example: if the user does not write "please format the response in Markdown," then a non-Markdown response is not necessarily an instruction-following failure. But if the user explicitly writes that instruction and the AI does not follow it, that is an instruction-following failure.

The same principle applies to artifact and file handling. If the user does not explicitly specify any of the following:

- do not overwrite the existing artifact;
- create a separate new artifact;
- preserve the previous version;
- show the diff before applying changes;
- keep a backup copy;
- do not modify the canonical version until approval;
- export the previous state before updating;

then an artifact being updated in place may simply reflect the artifact-state model of the environment, rather than an AI "deletion" or "file loss" event.

## Artifact misunderstanding observation

Some reports such as "the AI deleted my file" or "the AI overwrote my artifact" may arise from a mismatch between user expectations and the artifact-state model, rather than from an actual loss event.

In artifact-based AI environments, the active object may behave more like a current working artifact than a traditional file system, a Git repository, or a permanent multi-version archive. An apparent loss may therefore sometimes reflect:

- misunderstanding of the artifact update model;
- failure to request separate artifacts;
- failure to request a pre-change backup;
- failure to request a diff-before-update step;
- lack of external version control;
- treating a current working artifact as if it were a Git-style repository.

This observation should be read narrowly. It does not claim that all such complaints are user error. Product bugs, UI changes, retention limits, or genuine data-loss events may also occur, and this document takes no position on the frequency of either cause. The claim is only that **some** apparent deletion or overwrite incidents may be attributable to a mismatch between user expectations and the artifact-state model, especially when the user expected Git-like version persistence without explicitly requesting backups, separate artifacts, or external version control.

## CIP/PAL interpretation

This observation connects to the CIP/PAL framework as follows, using the fixed canonical model without modification:

```
A → (A + C) → A′ → B′
```

where C remains defined as model-side or execution-structure mediation that transforms A into A′.

1. Unstated assumptions can become unmanaged mediation: when a user's intent (A) includes preservation or overwrite expectations that are never expressed, those expectations are not part of the declared input, and any resulting mediation (C) cannot be evaluated against them.
2. AI inference over unstated requirements may be useful in casual use, but risky in governance workflows, where reviewability depends on a known relationship between declared intent and output.
3. Explicit instruction fidelity limits unrequested mediation by keeping evaluation tied to declared requirements rather than to inferred ones.
4. When an output contract is explicit, the AI's compliance can be evaluated directly.
5. When the output contract is implicit, evaluation becomes ambiguous, and responsibility for the gap is harder to assign to either party.
6. Human operators must define preservation, overwrite, rollback, and approval boundaries themselves when those boundaries matter to the workflow.

A useful summary sentence:

> In CIP/PAL workflows, unrequested inference may be treated as additional mediation, while explicit instruction fidelity preserves reviewable judgment boundaries.

As with all CIP/PAL mediation, AI models are not granted governance authority by this framework. CIP/PAL does not directly control C, A′, or the generative model, and human judgment retains final authority. Any AI role described in this document — including tools described as `PAL-supported` — remains advisory and subject to human adoption review.

## Suggested evaluation axes

| Evaluation axis | Meaning | Risk if weak |
|---|---|---|
| Explicit instruction fidelity | Whether the AI follows stated instructions exactly | Output deviates from declared intent |
| Output contract compliance | Whether required format, structure, filename, or schema is followed | Hard-to-review or invalid artifacts |
| Non-expansion discipline | Whether the AI avoids adding unstated requirements or authority | Unrequested mediation / scope creep |
| Clarification discipline | Whether the AI asks when requirements are ambiguous | Silent wrong assumptions |
| Preservation-boundary compliance | Whether the AI respects explicit "do not overwrite / preserve / backup" instructions | Loss of reviewable state |
| User-side specification clarity | Whether the human specified critical constraints | Ambiguous responsibility |
| Artifact-state expectation alignment | Whether user expectations match the environment's artifact model | Apparent deletion / overwrite disputes |

## Relationship to Artifact-State Governance

This document is related to, but distinct from, [Artifact-State Governance](artifact_state_governance.md):

- **Artifact-State Governance** asks: does the environment preserve artifact state, canonical identity, provenance, and rollback boundaries clearly?
- **Explicit Instruction Fidelity** asks: did the AI follow the instructions that were actually declared by the user?
- **User Responsibility** asks: did the human operator specify the artifact state, expected operation, and preservation boundaries clearly enough for controlled document work?

These interact because artifact-state behavior is often only controllable through explicit instruction. Statements such as "do not overwrite," "create a new file," "preserve the previous version," and "show the diff first" function as instruction-level controls over artifact-state risk. Without them, the environment's default artifact-state behavior applies, and that default is not itself an instruction-following failure.

## Practical guidance

In document-management workflows, users should explicitly state, where it matters:

- which file/artifact is canonical;
- whether edits may be applied in place;
- whether a new artifact/file should be created;
- whether the previous version must be preserved;
- whether a diff is required before update;
- whether Git/GitHub (or another system) is the durable history source;
- whether human approval is required before adoption.

A short operational rule follows from this:

> If preservation matters, specify it.
> If overwrite is prohibited, say so.
> If rollback matters, use Git/GitHub or another durable version-control system.

## Role assignment implication

- A model may be good at inferring user intent, but this remains a distinct capability from reliably following explicit instructions, and inference-heavy behavior can still be risky in controlled workflows if it silently expands on what was instructed.
- A model that follows only explicit instructions may feel less immediately impressive, but that property can be preferable for repository work, where reviewability depends on a predictable relationship between instruction and output.
- For CIP/PAL document management specifically, reliable explicit-instruction compliance is a more relevant evaluation criterion than impressive implicit inference.
- Auxiliary reviewers (human or AI) may identify ambiguity, missing output contracts, or artifact-state risk, but they do not decide final repository adoption. That authority remains with the human operator, consistent with existing CIP/PAL governance principles.

## Notes on scope

- This document does not describe any single AI product, including Claude, ChatGPT, or Fable 5, as behaving in one fixed or guaranteed way. Where product behavior is referenced elsewhere in this repository, it is described as user-observed behavior, not official specification.
- This document does not redefine the C model, the canonical `A → (A + C) → A′ → B′` sequence, or any existing CIP/PAL terminology.
- This document does not assign governance authority to any AI model or tool.
- This document is documentation only; it does not create or modify any experiment record.
