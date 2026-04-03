# PAL Operations Manual v0.1

*Operational guidance for file creation, versioning, repository use, and continuity management*

**Status:** Working Operations Manual  
**Scope:** Character-centric PAL management workflows, with extension notes for enterprise documentation environments  
**Nature:** Operational guidance  
**Date:** 2026-04-03

-----

## 1. Purpose

This document defines how to **create, manage, revise, and preserve** a PAL over time.

The PAL Hypothesis document describes what PAL is and how it may function as a cross-session stabilization layer.
This document addresses a different question:

> How should a PAL be managed so that it remains usable, auditable, and stable across ongoing operational use?

A PAL is not created once. It is maintained continuously.

PAL should not be treated as a loose collection of prompts or images.
It should be treated as a **versioned, modular operational asset system**.

-----

## 2. Governing Principles

A PAL should be managed as a **versioned modular reference system**.

|Principle                      |Description                                                                    |
|-------------------------------|-------------------------------------------------------------------------------|
|One file, one role             |Each file serves a distinct, explicit function                                 |
|Modular replacement            |Update by replacing modules, not rebuilding from scratch                       |
|Execution / research separation|Keep live-use materials separate from exploratory materials                    |
|Checkpoint preservation        |Successful anchors are preserved, not discarded                                |
|Drift as operational data      |Observed drift is logged systematically, not discarded                         |
|Infrastructure discipline      |PAL is managed like an operational asset layer, not an informal prompt notebook|

The goal is not to build one perfect file.
The goal is to maintain a stable operational layer that can be updated without losing continuity.

-----

## 3. YAML-First and SSOT Policy

YAML is the **Single Source of Truth (SSOT)** for all PAL definitions.

English-language prompts are a **delivery format**, not the authoritative source layer.

This means:

- Identity definitions should be authored in YAML first
- English prompts should be generated from the YAML definition, not the other way around
- When generation quality degrades, return to the YAML source — not to the English prompt
- Do not edit YAML to match English. Edit English to match YAML.

**SSOT enforcement:**

> If a conflict exists between the YAML definition and the English prompt, the YAML definition is authoritative.

This policy applies to all modules: identity_core, behavioral_profile, delta_lexicon, and acceptance_criteria.

-----

## 4. File Module Specification

A PAL should be divided into discrete, reusable modules.

**Core modules (required for operational use):**

|Module               |Description                                                        |
|---------------------|-------------------------------------------------------------------|
|`identity_core`      |Stable YAML definition of the target identity                      |
|`structural_anchor`  |Multi-angle structural reference (character sheet or equivalent)   |
|`active_anchor`      |Most recent operationally validated reference asset                |
|`behavioral_profile` |Continuity definition for behavior, affect, and relational register|
|`delta_lexicon`      |Controlled wording set for managed modifications                   |
|`acceptance_criteria`|Explicit success and failure conditions                            |
|`operation_notes`    |Context-specific instructions for current workflow                 |

**Supporting modules (as needed):**

|Module                 |Description                                                                     |
|-----------------------|--------------------------------------------------------------------------------|
|`supporting_anchors`   |Additional validated references for specific scene types                        |
|`anti_drift`           |Documentation of observed drift directions — research asset, not execution input|
|`scene_packs`          |Scene-specific prompt and reference bundles                                     |
|`platform_notes`       |Platform-specific PAL mapping observations                                      |
|`session_review`       |Post-session quality and continuity logs                                        |
|`contamination_reports`|Documented contamination events and resolutions                                 |

**Important:** Anti-drift materials are research assets.
They should be documented and preserved, but should not be mixed into live execution inputs.

-----

## 5. File Creation Policy

### 5.1 Write for reuse

Files should be written to function across multiple sessions and workflows, not for a single use.

### 5.2 Write for auditability

Each file should make its purpose explicit. Another operator should be able to identify why it exists and how it should be used without needing additional context.

### 5.3 Keep active files focused

Active execution files should remain narrow in scope.
Do not accumulate session history, exploratory notes, or drift documentation in live operational files.

### 5.4 Keep anti-drift separate

Anti-drift references are operationally valuable as documentation.
They should be stored in the `anti_drift/` module, not injected into live execution inputs.

### 5.5 Make constraints explicit

If a constraint matters operationally, it must be written down.
Do not rely on implicit recall. Explicit constraints are operationally durable. Implicit ones are not.

### 5.6 Keep file scope narrow

A file should address one operational problem.
Narrow scope improves replaceability, reduces contamination risk, and simplifies rollback.

-----

## 6. Naming and Metadata Policy

Every PAL file should be identifiable at a glance from its filename and metadata header.

**Recommended metadata fields:**

- `title`
- `module_type`
- `version`
- `status` — active / archive / deprecated / experimental
- `date`
- `scope`
- `uid` (character identifier)
- `notes` (brief description of last change)

**Filename convention:**

```
{uid}_{module_type}_{variant}_{version}_{status}.{ext}
```

**Examples:**

```
rieko_identity_core_v0.1_active.yaml
rieko_active_anchor_bridal_v0.2_active.pdf
rieko_anti_drift_bridal_v0.1_archive.md
rieko_behavioral_profile_v0.1_active.yaml
```

**Status labels:**

|Label         |Meaning                                     |
|--------------|--------------------------------------------|
|`active`      |Current operational file                    |
|`archive`     |Preserved for reference or rollback         |
|`deprecated`  |No longer recommended for live use          |
|`experimental`|Test use only — not for production workflows|

-----

## 7. Versioning Policy

All PAL files and module sets should be versioned explicitly using a three-part scheme: `MAJOR.MINOR.PATCH`.

### 7.1 Major Version Change

Use when PAL structure changes substantially.

Triggers:

- Module structure redesign
- Major identity reinterpretation
- Replacement of core operational logic
- Acceptance criteria model change

Example: `v1.0.0 → v2.0.0`

### 7.2 Minor Version Change

Use when the PAL is meaningfully improved without structural change.

Triggers:

- Stronger active anchor identified
- New supporting anchors added
- Behavioral profile clarity improved
- Anti-drift coverage expanded
- Delta lexicon refined

Example: `v0.1.0 → v0.2.0`

### 7.3 Patch Version Change

Use for small corrections that do not affect operational behavior.

Triggers:

- Wording fixes
- Metadata correction
- Formatting cleanup
- Score annotation adjustment without criteria change

Example: `v0.1.0 → v0.1.1`

-----

## 8. Revision Triggers

A PAL should be revised when any of the following occurs:

- A stronger active anchor is operationally validated
- A new recurring drift pattern is observed and confirmed
- A current file is consistently producing contamination or ambiguity
- A better delta wording pattern is confirmed across multiple sessions
- Acceptance criteria prove too weak, too strict, or too vague
- A platform-specific behavior changes in a way that affects operational outcomes
- A workflow expands into a new scene domain or state

**Revision discipline:**

Do not revise because a more visually appealing output was generated.
Revision should be driven by **continuity value**, not aesthetic novelty.
Version increments should reflect operational improvement, not preference.

-----

## 9. Archive and Rollback Policy

Previous operational states should always be recoverable.

### 9.1 Archive before replacing

Before replacing any active module, move the prior version to `archive/` with its version label intact.

Always archive:

- Previous active anchors
- Previous identity core versions
- Prior acceptance criteria versions
- Drift notes linked to major revisions

### 9.2 Preserve rollback paths

At any point in the operational lifecycle, it must be possible to return to the last known reliable state.
This is not optional. It is a core operational requirement.

### 9.3 Record revision reasons

Every version change should include a brief revision note.

Example:

```
v0.2: active anchor updated following stronger bridal continuity result in session 2026-03-15.
```

### 9.4 Separate archive from live use

Archived materials should not remain in active execution folders.
Move deprecated and archived files explicitly.
Do not rely on filename suffixes alone to distinguish them from live files.

-----

## 10. Session Management Policy

### 10.1 Separate research from execution

**Research sessions:** taxonomy development, drift discovery, concept testing, comparative analysis

**Execution sessions:** production-oriented generation, active recall, limited modifications, checkpoint generation

Do not mix research activity into execution sessions without explicit intent.

### 10.2 Keep execution sessions focused

Short, focused sessions reduce contamination risk and uncontrolled drift accumulation.

### 10.3 One major change per session turn

Do not attempt multiple major transformations simultaneously.
Compound changes make drift attribution difficult.

### 10.4 Preserve checkpoints immediately

When a success state is identified, preserve it before continuing.
Deferred preservation is a common source of unrecoverable loss.

-----

## 11. Contamination Prevention and Detection

PAL operates as a normative persistence layer, not only a visual reference system.
Contaminated anchor materials may stabilize unintended behavioral frames with the same effectiveness as intended ones.

### 11.1 Prevention

- Audit anchor library contents before deployment
- Define contamination criteria before deployment, not after
- Do not register exploratory, adversarial, or untested materials into the active execution layer
- Anti-drift references should remain in `anti_drift/` — not in active execution inputs
- Maintain strict separation between execution assets and research assets at all times

### 11.2 Detection indicators

Contamination may be indicated by:

- Persistent behavioral register shifts not traceable to prompt changes
- Resistance to operator direction across multiple sessions
- Outputs that systematically reflect materials registered in the library but not actively invoked
- Drift patterns that do not respond to rollback of prompt changes alone

### 11.3 Response protocol

When contamination is detected or suspected:

1. **Stop active execution immediately.** Do not continue production workflows under suspected contamination.
1. Disconnect session references to the affected library layer.
1. Purge suspect materials from the persistent reference layer — even if their connection to the anomaly is unclear.
1. Do not rely on session reset alone. Session reset clears conversation context. It does not purge the persistent reference layer.
1. Verify that shared or parallel sessions are also no longer exposed to affected materials.
1. Re-validate the library and behavioral baseline before resuming governed operation.
1. Document the event in `contamination_reports/`.
1. If the anomaly is severe or the mechanism is unclear, escalate to platform support.

> A well-formed anchor stabilizes intended behavior.
> A contaminated anchor stabilizes unintended behavior.
> PAL cannot distinguish between them.
> That distinction is the operator’s responsibility.

-----

## 12. Repository Management

For long-running PAL workflows, repository-based management is recommended.

A version-controlled repository provides:

- Explicit change history
- Rollback capability
- Modular file organization
- Drift and contamination issue tracking
- Release tagging for stable PAL sets

**Recommended practices:**

|Practice                    |Implementation                               |
|----------------------------|---------------------------------------------|
|Module changes              |Record via commits with revision notes       |
|Experiments                 |Use branches, not the main operational branch|
|Drift / contamination events|Document as issues                           |
|Stable checkpoints          |Tag as releases                              |
|Active / archive separation |Maintain as explicit folder structure        |

**Platform note:** GitHub is a practical choice but not a requirement.
The core requirement is explicit version control and operational traceability — regardless of tooling.

-----

## 13. Enterprise Documentation Extension

The same operational principles described in this manual may apply to internal documentation used in enterprise AI workflows.

Many organizations already provide AI systems with access to support manuals, operational procedures, escalation rules, compliance references, and internal knowledge documents.

In these environments, continuity failures may not present as character drift.
They may present as:

- Policy drift across sessions
- Instruction drift under changing context
- Inconsistent escalation behavior
- Outdated procedure recall
- Unstable response quality across operators

When internal documentation becomes part of an AI reference workflow, it should be treated as an operational persistence layer — not as passive storage.

**Recommended practices for enterprise documentation:**

- Keep active documents separate from archive documents
- Label deprecated materials explicitly
- Preserve version history with revision reasons
- Avoid mixing exploratory or provisional content into live operational reference sets
- Define contamination criteria for documentation that should not influence AI behavior

This document remains centered on character-centric workflows.
However, the same operational logic — modularity, versioning, auditability, and rollback — applies wherever AI behavioral consistency must be maintained across sessions.

-----

## 14. Governance and Safety Notes

PAL is not a neutral convenience layer.

A more effective persistence condition carries increased governance responsibility.

**Operational risks:**

- Unintended behavioral frame locking
- Persistent bias reinforcement across sessions
- Hidden continuity contamination
- Cross-session carryover of undesirable patterns
- Operator over-trust in persistence behavior without validation

**Governance requirements:**

- Changes must be documented
- Acceptance criteria must be explicit
- Drift must be logged
- Rollback must remain possible at all times
- Operators must distinguish controlled continuity from uncontrolled lock-in

The value of PAL as a stabilization tool is inseparable from its governance obligation.

-----

## 15. Minimal Operational Workflow

A practical first operational setup may proceed as follows:

|Step|Action                         |Note                                           |
|----|-------------------------------|-----------------------------------------------|
|1   |Create `identity_core`         |Author in YAML. English prompt is a projection.|
|2   |Create `structural_anchor`     |Multi-angle reference if available             |
|3   |Register first `active_anchor` |Use validated output only                      |
|4   |Create `behavioral_profile`    |Define continuity baseline                     |
|5   |Create initial `delta_lexicon` |Document controlled modification patterns      |
|6   |Define `acceptance_criteria`   |Explicit success and failure conditions        |
|7   |Begin short execution sessions |Focused, single-objective sessions             |
|8   |Preserve successful checkpoints|Archive before continuing                      |
|9   |Log drift cases                |Record in `anti_drift/` or `drift_logs/`       |
|10  |Increment to next minor version|Only when continuity measurably improves       |

This produces a manageable PAL v0.1 operational set.

-----

## 16. Suggested Repository Layout

```
pal/
├── active/
│   ├── identity_core/
│   ├── structural_anchor/
│   ├── active_anchor/
│   ├── behavioral_profile/
│   ├── delta_lexicon/
│   ├── acceptance_criteria/
│   └── operation_notes/
│
├── supporting/
│   ├── supporting_anchors/
│   └── scene_packs/
│
├── anti_drift/
│   ├── archetype_drift/
│   ├── westernization_drift/
│   └── scene_specific_drift/
│
├── archive/
│   ├── v0.1/
│   ├── v0.2/
│   └── deprecated/
│
├── logs/
│   ├── session_logs/
│   ├── drift_logs/
│   └── contamination_reports/
│
└── README.md
```

-----

## 17. Operational Threshold

A PAL is being managed correctly when it meets three conditions:

1. **Revisable** — it can be updated without losing its history
1. **Auditable** — its state and change record are clear to any operator
1. **Recoverable** — it can be rolled back to the last known reliable state without collapse

These are the minimum operational requirements.
They are not aspirational — they are the baseline that makes PAL viable as a long-term operational tool.