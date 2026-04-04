# PAL Reconnected Layer (PRL)

*A layered operational control architecture for generative AI workflows*

**Status:** Draft — For review and discussion  
**Version:** v0.1-draft  
**Date:** 2026-04-04  
**Related:** [PAL Hypothesis Document](pal_hypothesis.md) — [PAL Operations Manual](pal_operations_manual_v0.1.md) — [ai-identity-governance](https://github.com/watadani-byte/ai-identity-governance)

> **Draft notice:**
> This document presents a working architectural proposal.
> Claims are based on operational observation and conceptual analysis.
> Controlled validation has not been completed.
> The architecture described here should be treated as a governance-oriented
> design proposal, not a finalized specification.

-----

## What This Document Proposes

Generative AI is not controlled by prompts alone.

Prompts are ephemeral. Sessions reset. Models drift.
Without a persistent, structured control architecture,
behavioral consistency cannot be maintained across sessions,
operators, or platforms.

This document proposes **PAL Reconnected Layer (PRL)** —
a four-layer operational architecture in which PAL
(Persistent Anchor Layer) is formally positioned as a
user-managed identity and tone persistence layer,
explicitly separated from governance rules above it
and mutable working assets below it.

PRL is not a model architecture.
It is an operational control architecture that operators
build and maintain around a generative AI system.

> The model does not enforce this architecture.
> The operator does.

-----

## The Four-Layer Structure

```
┌──────────────────────────────────────────────────────┐
│  PRIMARY LAYER                                       │
│  Layer 1: Model Core                                 │
│  Cannot be overridden by any operator layer          │
├──────────────────────────────────────────────────────┤
│  SECONDARY LAYER                                     │
│  Layer 2: Governance Layer                           │
│  Overrides all layers below it without exception     │
├──────────────────────────────────────────────────────┤
│  TERTIARY LAYER                                      │
│  Layer 3: Identity-and-Tone Layer  ← PAL lives here  │
│  Operates strictly within Layer 2 boundaries         │
├──────────────────────────────────────────────────────┤
│  QUATERNARY LAYER                                    │
│  Layer 4: Working Library                            │
│  Mutable. Lowest authority. Highest contamination risk│
└──────────────────────────────────────────────────────┘
```

-----

## Priority Order

**This is not advisory. This is the required operational order.**

### Primary: Layer 1 — Model Core

The model’s safety constraints, core alignment, and built-in
behavioral boundaries take absolute precedence.

No operator-defined layer can override Layer 1.
No PAL anchor, governance rule, or library asset supersedes
the model’s primary constraints.

If a conflict exists between any operator-defined layer
and Layer 1, Layer 1 prevails unconditionally.

### Secondary: Layer 2 — Governance Layer

Operator-defined governance rules, prohibitions, compliance
requirements, and operational policies take precedence over
all layers below.

A governance rule cannot be suspended, weakened, or overridden
by an identity anchor, a tone definition, or any working asset.

If a conflict exists between Layer 2 and Layer 3,
**Layer 2 prevails. Always. Without exception.**

The identity anchor must be revised.
The governance rule must not be weakened to accommodate the anchor.

### Tertiary: Layer 3 — Identity-and-Tone Layer

PAL operates here. Character identity, tone, cultural frame,
and behavioral anchor definitions apply strictly within the
boundaries established by Layer 2.

PAL does not grant permission to violate governance constraints.
A strong identity anchor does not suspend governance obligations.
It increases them.

### Quaternary: Layer 4 — Working Library

Mutable working assets, session notes, exploratory materials,
and auxiliary references operate within all constraints
established by Layers 1, 2, and 3.

Layer 4 has no authority to override any higher layer.
Layer 4 is the highest-risk contamination source.

-----

## Layer Definitions

### Layer 1 — Model Core (Primary)

|Property           |Value                                  |
|-------------------|---------------------------------------|
|Write authority    |None                                   |
|Priority           |Absolute — cannot be overridden        |
|Control target     |Model weights, training priors, C_model|
|Modification method|Retraining or fine-tuning only         |

This is the model itself.
It cannot be written to by the operator.
It represents the statistical defaults and safety constraints
against which all other layers operate.

In CIP terms, this is C_model — the internal constraint layer
that is the primary source of identity drift and the ultimate
limit on what any operator layer can achieve.

-----

### Layer 2 — Governance Layer (Secondary)

|Property           |Value                                                 |
|-------------------|------------------------------------------------------|
|Write authority    |Operator only                                         |
|Priority           |Secondary — overrides Layers 3 and 4                  |
|Control target     |Rules, prohibitions, policies, compliance requirements|
|Modification method|Explicit, documented policy updates only              |
|Contamination risk |Medium                                                |

This layer contains what the AI system must and must not do,
regardless of what identity or tone is active.

Examples:

- Prohibited output types
- Escalation and refusal rules
- Compliance and legal constraints
- Quality and safety thresholds
- Operational boundaries

Layer 2 is writable only by the operator.
AI-generated content must never modify Layer 2 materials.

**Why Layer 2 must be explicitly separated from Layer 3:**

PAL (Layer 3) carries persistent and potentially strong influence
over reconstruction behavior. Without explicit separation,
PAL anchor materials that encode content conflicting with
governance rules may render those rules operationally inert.

This is a documented failure mode, not a theoretical risk.
See: [Case — PAL Contamination](cases/case_pal_contamination_01.md)

The establishment of Layer 2 as an independent layer exists
precisely because PAL is powerful enough to require it.

-----

### Layer 3 — Identity-and-Tone Layer (Tertiary)

|Property           |Value                                                     |
|-------------------|----------------------------------------------------------|
|Write authority    |Operator only                                             |
|Priority           |Tertiary — operates within Layer 2 boundaries             |
|Control target     |C_PAL: identity, tone, cultural frame, behavioral register|
|Modification method|Version-controlled PAL updates only                       |
|Contamination risk |High — cross-session, persistent                          |

This is where PAL lives.

Layer 3 defines the persistent reference conditions that shape
reconstruction behavior at inference time. It includes:

- Character identity definitions (YAML-first, structured)
- Validated anchor assets
- Behavioral profile
- Cultural frame specifications
- Tone and interactional register definitions
- Acceptance criteria

**Why PAL cannot be treated as an ordinary library asset:**

PAL’s influence on reconstruction behavior is too strong and
too persistent to be managed as a mutable working asset.

A contaminated Layer 3 may stabilize unintended behavioral frames
across sessions with the same effectiveness as an intended one.
Session reset does not clear Layer 3.
Contamination in Layer 3 persists until explicitly purged.

For this reason, Layer 3 materials must be:

- Explicitly versioned and auditable
- Operator-controlled only
- Isolated from Layer 4 promotion without review
- Rollback-capable at all times

**On naming:**

|Context             |Recommended term           |
|--------------------|---------------------------|
|General / GitHub    |Personality Layer          |
|Research writing    |Identity-and-Tone Layer    |
|Governance documents|Normative Persistence Layer|

The term *personality layer* is intuitive for general communication.
In research and governance contexts, *Identity-and-Tone Layer* is
more precise: PAL does not encode internal personality.
It stabilizes externally defined reconstruction conditions.

-----

### Layer 4 — Working Library (Quaternary)

|Property           |Value                                                      |
|-------------------|-----------------------------------------------------------|
|Write authority    |Operator + AI (restricted)                                 |
|Priority           |Lowest — no authority over higher layers                   |
|Control target     |Working notes, drafts, auxiliary references, mutable assets|
|Modification method|Session-level updates permitted                            |
|Contamination risk |Highest                                                    |

This layer contains materials that change frequently and may be
written by both operator and AI.

Examples:

- Session notes and logs
- Exploratory prompts and outputs
- Draft anchor candidates
- Comparative reference outputs
- Anti-drift documentation
- Research materials

**Critical rule:**

Layer 4 materials must not migrate into Layer 3 without
explicit operator review and version-controlled promotion.

Automatic or unreviewed promotion from Layer 4 to Layer 3
is the primary contamination pathway in PRL deployments.

> Anti-drift references belong in Layer 4, not Layer 3.
> Research materials belong in Layer 4, not Layer 3.
> The boundary between Layer 3 and Layer 4 is an operational firewall.

-----

## Write Authority Summary

|Layer  |Priority  |Operator|AI System |Promotion path                      |
|-------|----------|--------|----------|------------------------------------|
|Layer 1|Primary   |No      |No        |Retraining only                     |
|Layer 2|Secondary |Yes     |No        |Explicit policy update              |
|Layer 3|Tertiary  |Yes     |No        |Versioned PAL update                |
|Layer 4|Quaternary|Yes     |Restricted|→ Layer 3 requires operator approval|

-----

## Governance Requirements for Layer 3

The following are operational requirements for all PAL materials
registered in Layer 3. These apply regardless of deployment scale.

### Requirement 1: Auditability

All Layer 3 materials must be structured and documented such that
any operator or auditor can verify at any time:

- what is currently registered in the persistent layer
- when it was registered
- why it was registered
- what behavioral influence it may carry

Unaudited Layer 3 content is an operational liability.

### Requirement 2: Governance compliance

All Layer 3 materials must be reviewed against Layer 2 governance
rules before registration.

Content that encodes harmful behavioral norms, misrepresents
system authority, or conflicts with applicable policies must not
enter Layer 3.

### Requirement 3: Precise and unambiguous expression

Layer 3 materials must be:

- Accurately authored (YAML-first, with precise language)
- Free from ambiguity that could be misinterpreted at inference time
- Structured to reflect the operator’s actual intent

Vague or poorly structured anchor definitions are a contamination
risk even when their content is benign.
Imprecise language in Layer 3 may stabilize unintended behavioral
frames with the same persistence as precise language.

> The system does not distinguish between intended and unintended
> normative frames. The operator must.

### Requirement 4: Version control

All Layer 3 materials must be managed under explicit version control
that provides:

- Full audit trail for all changes
- Rollback to last known compliant state
- Diff capability to detect unintended definition drift
- Branching for safe experimentation outside the active layer

**Implementation:**

GitHub is a recommended implementation platform.
It is not a required platform.

Equivalent capability may be achieved through:

- Enterprise version control systems (GitLab, Bitbucket, etc.)
- Internal document management systems with version history
- Any system providing audit trail, rollback, and diff capability

The requirement is audit capability and version traceability —
not any specific tooling.

> An unversioned PAL is an unauditable PAL.
> An unauditable PAL cannot satisfy governance requirements.

-----

## Deployment Scope

### Enterprise deployment — full four-layer model

In enterprise environments, all four layers are relevant.

Layer 2 (Governance) becomes critical when:

- Multiple operators share the same AI system
- Compliance and legal constraints must be enforced consistently
- Escalation and refusal rules must survive across sessions and operators
- AI behavioral consistency is subject to audit or regulatory review

In these environments, the explicit separation of Layer 2 and Layer 3
is not optional. It is a governance requirement.

When internal documentation (support manuals, operational procedures,
compliance references) is used as AI reference material, it should
be treated as Layer 3 or Layer 4 material — not as passive storage —
and governed accordingly.

### Individual deployment — layers 1 through 3 sufficient

For individual operators, the Working Library (Layer 4) may be
managed informally, and the Governance Layer (Layer 2) may be
implicit rather than documented.

In individual deployments, **Layers 1 through 3 are sufficient
to meet most operational needs:**

- Layer 1 provides model-level safety constraints
- Layer 3 (PAL) provides identity and tone stability

This is the minimum viable PRL configuration.

The full four-layer model is primarily relevant when:

- Multiple operators or sessions must remain consistent
- Governance constraints must be explicitly enforced
- Audit and compliance requirements apply

-----

## PAL as an Inference-Time Control Layer

PAL does not modify model weights.
It functions as an operator-managed, inference-time persistent
reference condition that may shape reconstruction behavior
through persistent anchor availability.

This makes PRL a possible lightweight operational architecture
for persistent behavioral control in contexts where:

- Model modification is not permitted (closed-source platforms)
- Fine-tuning infrastructure is not available
- Cross-platform identity continuity is required
- Rapid rollback capability is operationally necessary

**Caution:** The characterization of PAL as an alternative to
LoRA or checkpoint-based control is based on operational
observation, not controlled experimental comparison.
This remains a working hypothesis.

-----

## Risk Profile

|Risk                   |Layer            |Description                                                      |
|-----------------------|-----------------|-----------------------------------------------------------------|
|Governance override    |Layer 3 → Layer 2|PAL anchor content overrides governance rules                    |
|Over-constraining      |Layer 3          |Anchors too narrow; outputs become rigid                         |
|Tone distortion        |Layer 3          |Anchor materials bias tone in unintended directions              |
|Drift amplification    |Layer 3/4        |Contaminated materials stabilize drift rather than suppressing it|
|Library-induced runaway|Layer 4→3        |Unreviewed materials contaminate Layer 3                         |
|Cross-session carryover|Layer 3          |Unintended frames persist across sessions                        |
|Session reset illusion |Layer 3          |Operator assumes reset cleared contamination; it did not         |

-----

## Relation to Existing Documents

|Document               |Relation to PRL                                         |
|-----------------------|--------------------------------------------------------|
|CIP White Paper        |Defines the governance framework that Layer 2 implements|
|PAL Hypothesis Document|Defines C_PAL — the mechanism Layer 3 operates through  |
|PAL Operations Manual  |Defines how Layer 3 assets are created and maintained   |
|ai-identity-governance |Defines the formal control protocol across all layers   |
|This document          |Defines the layer structure and priority order          |

-----

## A Note to AI Platform Vendors and Model Developers

This architecture was developed through operational practice,
not from a position of institutional authority.

However, the problem it addresses is real and will become
more consequential as AI systems are deployed in persistent,
multi-session, enterprise-facing contexts.

PAL-equivalent persistence mechanisms — in whatever form they
exist on a given platform — require:

1. Explicit separation of governance constraints from identity anchors
1. Audit capability for all persistent reference materials
1. Rollback capability when contamination is detected
1. Clear priority ordering so that governance layers
   cannot be overridden by persistence layers

These are not feature requests.
They are the minimum architectural requirements for responsible
deployment of persistent AI behavioral control mechanisms.

The stronger persistence mechanisms become,
the more necessary this separation becomes.

> CIP should be read not as a denial of misuse risk,
> but as a governance response to it.

-----

## Status

This document is a working draft.

The PRL architecture is conceptually grounded but not yet:

- validated through controlled deployment
- formalized as a specification
- tested across enterprise environments at scale

It should be treated as a governance-oriented architectural
proposal for further development and validation.

> Status: Draft. Not yet validated. Governance proposal only.