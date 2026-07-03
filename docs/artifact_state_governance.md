# Artifact-State Governance in AI-Assisted Document Management

## Status

Observation / evaluation note.

This document is not a core CIP/PAL redefinition. It does not introduce a new protocol, benchmark, or governance authority. It records an operational evaluation axis for AI-assisted document management.

## Purpose

AI-assisted document management should not be evaluated by raw model intelligence alone.

A model may be strong at reading, reasoning, summarizing, or rewriting documents, while still being unreliable as a document-management agent if the surrounding artifact and file-state environment creates ambiguity about:

- which file is the current canonical working version;
- whether a referenced file is stale;
- whether duplicate filenames refer to different states;
- whether temporary files are being mistaken for durable records;
- whether provenance, rollback, diffs, and adoption boundaries are visible to the human reviewer.

In short:

> A model that can understand documents is not automatically capable of managing documents.

Japanese-friendly formulation:

> 文書を読めることと、文書を管理できることは別である。

## Definition

**Artifact-State Governance** is the evaluation and control of how AI-assisted workflows manage the state of working artifacts over time.

It concerns whether a human reviewer can reliably identify, inspect, approve, reject, roll back, and preserve the correct artifact state during AI-assisted document work.

Artifact-State Governance includes:

- canonical version handling;
- current working artifact clarity;
- duplicate-name ambiguity prevention;
- stale-reference risk control;
- provenance tracking;
- rollback compatibility;
- human-reviewable change boundaries;
- Git/GitHub compatibility;
- separation between temporary working state and durable repository state.

## Relationship to File-State Governance

**File-State Governance** is a narrower term. It focuses on files: filenames, versions, uploads, duplicates, paths, and file references.

**Artifact-State Governance** is broader. It includes files, artifacts, canvases, generated documents, temporary working objects, chat-local drafts, repository files, and any AI-managed object that may be treated as a working source.

In document-management workflows, the artifact may not always be a conventional file. It may be a live artifact, a canvas, a generated document pane, a chat-local draft, or an uploaded file reference. Therefore, Artifact-State Governance is the more general term.

## Distinction from Raw Model Intelligence

Raw model intelligence concerns whether a model can understand, reason about, or rewrite document content.

Artifact-State Governance concerns whether the system can safely manage the state of documents as operational objects.

These are distinct capabilities.

A model may perform well on:

- long-context reading;
- terminology audit;
- theoretical consistency review;
- markdown rewriting;
- summarization;
- structural editing.

The same model may still be unreliable for document management if it cannot maintain clarity around:

- the current canonical artifact;
- stale versus current files;
- duplicate filenames;
- temporary versus durable files;
- source provenance;
- accepted versus rejected states;
- rollback points;
- human approval boundaries.

Artifact-State Governance therefore becomes an independent evaluation axis for AI-assisted document management.

## Operational Observations

The following observations are operational notes. They should not be read as universal product claims, fixed technical descriptions, or rankings of products. Product behavior may vary by plan, mode, interface, workspace, project configuration, or future product updates.

### ChatGPT Library-Style Behavior

Public product documentation describes ChatGPT Library behavior as a file store that may preserve uploaded files separately from individual chats when Library is available. This can be useful for reuse and retrieval across workflows.

In document-management workflows, however, Library-style reuse may increase artifact-state ambiguity when multiple files with the same or similar names exist.

Observed risks include:

- uncertainty about which file is the current canonical version;
- stale-file reference risk;
- wrong-file or unintended-file reference risk;
- cross-chat contamination risk;
- increased human verification burden;
- increased AI confusion when similar files exist;
- duplicate filename ambiguity, including numbered suffixes added by the upload environment.

This does not mean Library-style file storage is unsuitable in general. It means that, for repository-grade document management, the human operator must verify the exact file identity, freshness, and canonical status before treating a retrieved file as authoritative.

### Claude Artifacts-Style Behavior

Claude Artifacts-style workflows appear more current-artifact oriented within a specific conversation. In practice, this can make the active artifact easier to treat as the current working version during a document-editing session.

This may reduce confusion for both the AI and the human reviewer when the workflow requires iterative editing of a single document.

However, this should not be overstated.

Artifacts may provide version history, customization, or restore-like behavior in some product contexts. Public product behavior and user observation may differ depending on mode, interface, plan, and future updates.

More importantly, artifact history is not equivalent to Git/GitHub-style repository provenance.

Artifact-oriented editing is useful for maintaining a current working state, but it does not by itself provide:

- explicit commits;
- signed or externally auditable history;
- release tags;
- branches;
- repository-wide diffs;
- pull requests;
- durable rollback points;
- long-term provenance across independent tools.

Therefore, Claude Artifacts-style workflows may be strong as a current working artifact environment, but should still be paired with Git/GitHub for durable provenance, rollback, auditability, and release history.

### Fable 5 Temporary-File-Style Observation

The user has observed that Fable 5 appears to maintain multiple temporary files within a chat-like context.

This is a user-observed behavior, not a confirmed public product specification.

The operational implication is still important: even if a model is strong at review, reasoning, or warning detection, ambiguous temporary-file state can make it less suitable as the primary document-management agent.

A model can be useful as:

- auxiliary reviewer;
- warning detector;
- terminology-risk detector;
- boundary reviewer;
- experiment-record consistency reviewer.

At the same time, it may remain unsuitable as the primary document-management agent if the artifact-state environment does not clearly expose:

- the current canonical file;
- temporary versus durable state;
- file provenance;
- accepted versus rejected versions;
- rollback path;
- human approval boundary.

This distinction allows CIP/PAL to separate review intelligence from document-management suitability.

## Evaluation Axes

| Evaluation Axis | Question | Risk if Weak |
|---|---|---|
| Canonical current-state clarity | Can the human and AI identify the current working artifact? | Wrong version may be edited or adopted. |
| File / artifact isolation | Are files or artifacts isolated by task, chat, project, or repository state? | Cross-task contamination may occur. |
| Duplicate-name ambiguity risk | Are duplicate or similar filenames clearly disambiguated? | AI or human may reference the wrong file. |
| Stale-reference risk | Can stale files be detected before use? | Outdated content may be treated as current. |
| Cross-chat contamination risk | Can files from other chats or contexts appear as relevant candidates? | Unintended prior state may enter the workflow. |
| Historical provenance | Is the origin and change history of the artifact visible? | Adoption and accountability become unclear. |
| Diff / rollback compatibility | Can changes be compared and reverted? | Rejected edits may persist or become hard to purge. |
| Human reviewability | Can the human inspect the exact artifact before adoption? | AI-mediated state changes may bypass review. |
| Git/GitHub compatibility | Can the workflow map cleanly to commits, tags, branches, diffs, and release history? | Repository history may become incomplete or misleading. |
| Suitability as primary document-management agent | Can the tool safely manage canonical state, not merely review content? | Strong reasoning may be mistaken for safe document management. |

## CIP/PAL Interpretation

In CIP/PAL terms, artifact-state ambiguity increases unmanaged mediation risk.

The fixed model remains:

```text
A → (A + C) → A′ → B′
```

Where mismatch or risk is being discussed:

```text
A → (A + C) → A′ → B′ ≠ B
```

C remains:

```text
C is model-side or execution-structure mediation that transforms A into A′.
```

Artifact-state ambiguity does not redefine C. It creates conditions in which C may become harder to observe, audit, or constrain operationally.

Examples include:

- the AI reads a stale file while the human assumes it read the current file;
- duplicate filenames cause the wrong artifact to be summarized;
- temporary files are treated as durable source files;
- an old draft is mistaken for the canonical working version;
- rejected or superseded text re-enters the workflow;
- provenance is unclear, making rollback difficult.

Artifact-State Governance reduces unnecessary mediation risk by making artifact identity, current-state status, provenance, and adoption boundaries visible to the human reviewer.

CIP/PAL does not directly control C, A′, or the generative model. It governs workflow conditions such as validation, rejection, purge, re-binding, re-convergence, and adoption through human-reviewable checkpoints.

Artifact-State Governance supports those checkpoints by ensuring that the human knows which artifact is being validated, rejected, purged, re-bound, re-converged, or adopted.

## Practical Role Assignment

The following role assignment is an operational recommendation, not a product ranking.

### Claude / Sonnet

Best suited for:

- primary document-management editing;
- current-artifact editing;
- structured document rewriting;
- maintaining a visible working artifact within a conversation;
- preparing repository-ready markdown under human review.

Caution:

- artifact history should not be treated as a substitute for Git/GitHub provenance.

### Git / GitHub

Best suited for:

- durable provenance;
- commits;
- tags;
- diffs;
- branches;
- rollback;
- release history;
- repository-wide auditability.

Git/GitHub remains the durable source of record for repository state.

### ChatGPT

Best suited for:

- experiment design;
- judgment synthesis;
- orchestration;
- cross-model reasoning;
- human-facing review;
- commit / tag note review;
- theory consistency checking;
- final synthesis before human decision.

Caution:

- Library-style file reuse can create ambiguity when many similar files exist, so file identity and freshness must be verified.

### Fable 5

Best suited for:

- auxiliary reviewer;
- warning detector;
- terminology-risk detector;
- boundary reviewer;
- experiment-record consistency reviewer.

Not recommended as:

- primary document manager;
- final authority;
- autonomous repository editor;
- sole terminology authority;
- majority-vote gate;
- replacement for human approval;
- replacement for ChatGPT main synthesis;
- replacement for Sonnet 5 document management.

Caution:

- user-observed temporary-file behavior should be treated as an artifact-state risk until file-state clarity is improved or independently verified.

## Human Review Boundary

Artifact-State Governance does not grant governance authority to AI models.

Human judgment remains final.

An AI system may propose edits, summaries, warnings, classifications, or repository notes. It must not silently determine which artifact is canonical, which version is adopted, or which rejected state should be preserved.

A human reviewer must be able to verify:

- which artifact is being edited;
- which prior state it came from;
- what changed;
- whether the change should be accepted;
- whether rejected state has been purged;
- whether the repository record reflects the accepted state.

## Conclusion

A model is not document-management capable merely because it can understand documents.

To be reliable in AI-assisted document management, the workflow must preserve:

- artifact-state clarity;
- canonical artifact identity;
- provenance;
- rollback compatibility;
- human-reviewable change boundaries;
- clear separation between temporary working state and durable repository state.

Raw model intelligence is necessary but insufficient.

Artifact-State Governance should therefore be treated as an independent evaluation axis for AI-assisted document management.
