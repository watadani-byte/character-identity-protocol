# Character Identity Protocol (CIP)

CIP is an adoption-governance protocol for probabilistic outputs.

It does not exist simply to make generated outputs more consistent.  
It exists to determine whether an output remains valid for adoption under identity, brand-code, and rights-control constraints.

In probabilistic generative and agentic systems, resemblance is not enough.  
Functional usefulness is not enough.  
Outputs that violate these constraints are not merely low-quality — they are non-adoptable.

CIP introduces a governance layer between generation and adoption.  
Its purpose is to govern whether an output should be adopted, rejected, or purged, and whether the workflow should enter Hard Abort, re-binding, or re-convergence.

Character identity in image and video generation is one concrete entry point.  
But the underlying problem is broader: probabilistic outputs used as IP, brand, persona, or control-bound assets require explicit adoption governance.

CIP governs the adoption layer.

In CIP, *identity* refers to the continuity that must be preserved in A — including character identity, role, function, brand code, policy boundary, persona, or operational meaning. An *operational criterion* is the explicit adoption condition used to determine whether that identity has been preserved in B′.

CIP operates entirely at inference time, without model modification.

```
A → (A + C) → A′ → B′
A → (A + C) → A′ → B′ ≠ B
A′ ≈ T_C(A)

A + C is shorthand for non-linear mediation, not simple addition.

A  = user input, approved intent, or reference condition
C  = model-side or execution-structure mediation that transforms A into A′
A′ = reconstructed task state produced through the transformation of A under C
B′ = actual output

CIP does not directly control C or A′. It governs validation, rejection, purge, re-binding, re-convergence, and adoption around the transformation from A to A′ under C.

A′ may not be fully observable. In some workflows, however, parts of the transformation path or reconstructed task state may be partially exposed through generated prompts, rewritten instructions, execution traces, intermediate representations, or other inspectable artifacts. These exposed artifacts are not necessarily identical to A′. They provide diagnostic evidence that may be evaluated together with anchor comparisons, validation gates, generated outputs, and other available workflow evidence.

C explains why drift can occur. It does not excuse unmanaged drift.

C is broad by design, but not unlimited: it refers to model-side or execution-structure mediation that transforms A into A′. In agentic systems, C can also include scaffolding, tool routing, memory, evaluation loops, retry behavior, or other execution structures when they mediate or replace conditions derived from A before B′ is produced.

Creative transformation is acceptable while A's intended identity remains preserved. When that identity is no longer preserved, the transformation constitutes drift in relation to A.

In its shortest form, drift is the failure to preserve A's intended identity.

The human operator retains final adoption authority.
```

## Canonical Summary

Character Identity Protocol (CIP) is an inference-time adoption-governance framework for probabilistic AI outputs.

It defines how identity continuity, drift, validation gates, failure handling, re-binding, re-convergence, purge, and human adoption decisions should be governed when AI systems generate or reconstruct identity-bound assets.

CIP is not a prompt trick, image-generation workflow, LoRA method, reference-image technique, or character-consistency tutorial.

The shortest accurate summary is:

**CIP governs whether a probabilistic output remains adoptable under identity, brand-code, and rights-control constraints.**

-----

> This repository is under active documentation development.
> For a structured reading experience, use the
> [GitHub Pages navigation](https://watadani-byte.github.io/character-identity-protocol/).

*Licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/) — 2026*

-----

## Why This Repository Exists

Many existing components address continuity and control problems in probabilistic generative systems:
reference images, prompt templates, anchor reuse,
versioned assets, quality checks, retry workflows,
and platform-specific persistence features.

These components are useful.
The problem is that they do not address adoption governance —
the explicit, closed, and auditable determination of whether an output
may be adopted, rejected, or purged under defined constraints.

A secondary problem compounds this:
AI-generated summaries of this domain
tend to make its operationally fragmented reality
appear more coherent and already-solved than it is.
Unresolved governance problems are absorbed into familiar
explanatory frames and begin to appear as if they were
already established method components.
Still-unnamed but important distinctions
can disappear in the process.

This repository refers to that tendency as
**Summary Assimilation**.

Summarization is useful. The problem is not summarization itself,
but the loss of governance-relevant distinctions that can occur
when AI-generated summaries are accepted without human review.

CIP is an attempt to respond to both problems:
to define the missing governance structure explicitly,
and to name distinctions that would otherwise
be assimilated into existing frameworks
before they can be examined.

The contribution is not novelty at the level of base technology.
It is closer to identifying an unresolved operational domain,
naming its missing structure,
and reframing it as an adoption-governance problem.

-----

## The Problem

You generate an output. It appears correct.

You generate it again. It is no longer safely adoptable.

This is not a prompt failure. It is the expected behavior of a probabilistic system. Without adoption governance, drift accumulates undetected — and outputs that should be rejected continue to propagate.

-----

## From Generation to Control

This is not merely a generation problem.
It is an adoption-governance problem.

```
Conventional:
Generate → Drift → Retry → Drift → Collapse

CIP:
Generate → Gate
  ├─ PASS → Adopt
  └─ FAIL → Hard Abort → Reject
                           ↓
                  Preserve rejection evidence
                           ↓
                  Purge from active workflow
                           ├─ Stop
                           └─ Re-bind → Re-convergence → Generate
```

CIP introduces a governance layer between probabilistic generation and human adoption:

|Component                       |Role                                                        |
|--------------------------------|------------------------------------------------------------|
|**Anchor**                      |Validated reference state retained within the approved identity and continuity conditions|
|**Identity Gates**              |PASS / FAIL validation against defined identity constraints; character workflows may begin with Face ∧ Skeleton ∧ Proportion|
|**Hard Abort**                  |Immediate termination when identity or governance failure is detected|
|**Adoption / Rejection / Purge**|CIP governance decisions after gate evaluation              |
|**Re-convergence**              |Controlled recovery from the last verified anchor state     |

Identity continuity is not assumed to persist. It is continuously evaluated, and the workflow is recovered from the last validated anchor state when failure occurs.

**Reference-based generation is not adoption governance.**
Reference images, IP-Adapter-like systems, LoRA, ControlNet, and platform image reference features may improve resemblance or continuity. They do not define failure conditions, Hard Abort, adoption, rejection, purge, or auditability.

-----

## Core Model

```
Core Model:        A → (A + C) → A′ → B′
Mismatch / Drift:  A → (A + C) → A′ → B′ ≠ B
Formal shorthand:  A′ ≈ T_C(A)
Governance Layer:  Workflow conditions around the transformation from A to A′ under C, including validation, rejection, purge, re-binding, re-convergence, and adoption
Key Operations:    Anchor · Gates · Hard Abort · Re-bind · Re-convergence · Adoption / Rejection / Purge
Human Authority:   The human operator retains final adoption authority
```

**Hard Abort:** immediate termination of a contaminated generation or adoption cycle when identity or governance failure is detected.

**Re-binding:** reconnecting the workflow to the last validated anchor, UID, and governing constraints before re-convergence.

**Purge:** removing drifted or contaminated outputs, states, or references from adoption candidates and active downstream workflow conditions. Purge does not require deletion of retained rejection evidence, audit records, or experimental records.

CIP does not primarily optimize generation.
It makes adoptability a controlled variable.

This is not a prompt technique.
It is a workflow-level control and adoption-governance protocol.

> CIP governs adoptability: validation, failure handling, adoption, rejection, and purge under identity, brand-code, and rights-control constraints.
> PAL supports continuity, persistence, and anchor availability across generative workflows.

PAL (Persistent Anchor Layer) and CIP operate as two distinct but coordinated layers. PAL originally existed inside CIP, but was separated and expanded because its scope became broader. PAL supports the availability and continuity of approved reference conditions; CIP governs the workflow through which generated candidates and available evidence are evaluated, candidates are adopted or rejected, and failed continuity states are purged, re-bound, or returned to re-convergence.

> CIP should be read not as a denial of misuse risk,
> but as a governance response to it.

-----

## Documentation

**Start Here**

- [Getting Started](docs/getting_started.md)
- [White Paper](docs/whitepaper_v1.md)
- [CIP Specification v0.1](docs/cip_spec_v0.1.md)

**Core Concepts**

- [Core Model — A → (A + C) → A′ → B′](docs/model_a_c_b.md)
- [C Taxonomy — Classifying Mediation from A to A′](docs/c_taxonomy.md)
- [Technical Mechanism](docs/technical_mechanism.md)
- [Re-Convergence — Identity Recovery](docs/reconvergence.md)

**Protocol**

- [Architecture Diagram](docs/architecture_diagram.md)
- [Quality Gate & Hard Abort](docs/quality_gate_addendum.md)
- [Protocol Template](docs/protocol_template.md)

**Related Frameworks**

- [Persistent Anchor Layer (PAL)](docs/column_pal.md) — *Continuity, persistence, and anchor availability across generative workflows*
- [PAL Hypothesis Document](docs/pal_hypothesis.md) — *Formal hypothesis and ASC definition*
- [Multi-Agent Verification and Intent Adherence in CIP/PAL](docs/multi_agent_verification_and_intent_adherence.md) — working analysis note distinguishing A-adherence verification from final-output B′-quality verification in multi-agent or orchestration-based AI systems.
- [Human-Checkpointed Multi-Model Workflow](docs/human_checkpointed_multi_model_workflow.md) — working workflow note on exposing distributed C as reviewable intermediate artifacts for human validation, rejection, re-binding, re-convergence, and adoption decisions.
- [PAL Prompt Layer and PAL Conformance Assessment Layer](docs/pal_prompt_and_conformance_layers.md) — *Promising experimental translation and diagnostic architecture; not a finalized PAL specification*
- [PAL Prompt Layer Initial Smoke Test Protocol](docs/pal_prompt_layer_experiment_protocol.md) — *Draft controlled comparison of Direct PAL and PAL Prompt Layer workflows*
- [PAL Reconnected Layer (PRL)](docs/prl_v0.1_draft.md) — *Four-layer operational control architecture (draft)*
- [PAL Operations Manual](docs/pal_operations_manual_v0.1.md) — *File management, versioning, and continuity operations*
- [Human-Supervised Orchestrator / Agent Workflow Hypothesis](docs/cip-pal-orchestrator-agent-workflow-hypothesis.md) — *A working hypothesis on observing and governing the accumulation and canonicalization of C in workflows that span multiple AI systems. This is an operational note, not a standardization proposal.*

The PAL Prompt Layer, PAL Conformance Assessment Layer, and Anchor-Based Prompt Audit remain experimental. They do not redefine PAL, C, A′, or CIP, and they do not replace human validation or final adoption authority.

**Cases**

- [Case 01A: Baseline Failure](docs/case_01_failure_log.md)
- [Case 01B: Mira Project](docs/case_01b_mira_project.md)
- [Case 04: Cross-Platform Migration](docs/case_04_shizuka.md)
- [Case: PAL Contamination — Unintended Library Accumulation](docs/case_pal_contamination_01.md)
- [Case 05: Serendipitous Creation](docs/case_05_serendipitous.md)
- [Case 06: Cross-Platform Validation (Gemini)](docs/case_06_gemini.md)
- [Sequence PAL Case Analysis: Hana Wedding Series](docs/sequence_pal_case_hana_wedding.md) — historical case analysis of sequence-continuity drift, human approval checkpoints, and agentic auto-progression risk.
- [All Cases →](docs/case_01_failure_log.md)

**Columns**

- [Is Prompt Engineering Over?](docs/prompt-engineering-as-intent-preservation.md) — *Prompt engineering reframed as intent preservation, including Anchor-Based Prompt Audit*
- [A Simple Structure for Writing Prompts](docs/column_prompt_structure.md)
- [Miracle Images and Convergence Behavior](docs/column_miracle_image.md)
- [Character Identity Drift in Generative AI](docs/column_identity_drift.md)
- [Translation Loss and the YAML-First Principle](docs/column_translation_loss.md)
- [Reconstruction Durability and Identity Longevity](docs/column_reconstruction_durability.md)
- [Artifact-State Governance in AI-Assisted Document Management](docs/artifact_state_governance.md) — operational evaluation note on artifact-state clarity, canonical version handling, and document-management suitability as an independent axis from raw model intelligence.
- [Explicit Instruction Fidelity and Artifact-State User Responsibility](docs/explicit_instruction_fidelity_and_user_responsibility.md) — Distinguishes AI inference-based helpfulness from fidelity to explicitly declared instructions, and clarifies user-side responsibility for specifying artifact-state expectations.

**Reference**

- [Glossary](docs/glossary.md)
- [CIP vs Existing Methods](docs/cip_vs_existing_methods.md)
- [Decision Pack](docs/decision_pack.md)

-----

## Attribution and Priority Note

The term **Persistent Anchor Layer (PAL)** and its formulation
as an infrastructure hypothesis for cross-session stabilization
were first named and documented by Hitoshi Watadani
in March 2026 in this repository.

To the author's knowledge, this repository contains
the earliest explicit documentation of:

- **PAL** as a distinct continuity-oriented concept,
- **CIP** as an inference-time adoption-governance framework for probabilistic outputs, and
- **Summary Assimilation** as a term for the loss of
  still-unnamed distinctions through AI summarization.

If you build on these concepts or use this terminology
in your own work,
appropriate attribution is requested and appreciated.

-----

## Repository Structure

```
character-identity-protocol/
├── README.md
├── LICENSE
│
├── docs/
│   ├── whitepaper_v1.md
│   ├── cip_spec_v0.1.md
│   ├── getting_started.md
│   ├── glossary.md
│   ├── quality_gate_addendum.md
│   ├── architecture_diagram.md
│   ├── technical_mechanism.md
│   ├── reconvergence.md
│   ├── model_a_c_b.md
│   ├── protocol_template.md
│   ├── whitepaper_appendices.md
│   │
│   ├── case_01_failure_log.md
│   ├── case_01b_mira_project.md
│   ├── case_02_wedding_series.md
│   ├── case_03_avedon_project.md
│   ├── case_04_shizuka.md
│   ├── case_pal_contamination_01.md
│   ├── case_05_serendipitous.md
│   ├── case_06_gemini.md
│   ├── sequence_pal_case_hana_wedding.md
│   │
│   ├── case_06/
│   │   └── images/
│   ├── case_07/
│   │   └── images/
│   │
│   ├── column_pal.md
│   ├── column_prompt_structure.md
│   ├── column_miracle_image.md
│   ├── column_identity_drift.md
│   ├── column_translation_loss.md
│   ├── column_reconstruction_durability.md
│   ├── prompt-engineering-as-intent-preservation.md
│   │
│   ├── pal_hypothesis.md
│   ├── pal_prompt_and_conformance_layers.md
│   ├── pal_prompt_layer_experiment_protocol.md
│   ├── pal_operations_manual_v0.1.md
│   ├── cip-pal-orchestrator-agent-workflow-hypothesis.md
│   ├── prl_v0.1_draft.md
│   │
│   ├── schemas/
│   │   ├── identity_schema.json
│   │   ├── identity_schema.yaml
│   │   ├── context_schema.json
│   │   ├── context_schema.yaml
│   │   ├── hard_abort_event.json
│   │   └── asc_conditions.yaml
│   │
│   └── assets/
│       ├── images/
│       │   ├── .gitkeep
│       │   ├── rieko_anchor_v1.jpg.JPEG
│       │   ├── rieko_wedding_pal_01.PNG
│       │   ├── rieko_wedding_pal_02.PNG
│       │   ├── rieko_wedding_pal_03.PNG
│       │   └── rieko_wedding_pal_04.PNG
│       ├── README.md
│       ├── sample_uid_template.md
│       └── sample_minimal_prompt_template.md
│
└── cip-enterprise-layer/
    └── (see separate repository)
```

-----

## Citation

```bibtex
@misc{character_identity_protocol_2026,
  title={Character Identity Protocol: Operational Adoption Governance for Probabilistic Outputs},
  author={Hitoshi Watadani},
  year={2026},
  note={GitHub Repository},
  url={https://github.com/watadani-byte/character-identity-protocol}
}
```

-----

## Contributing — Platform Implementation Examples

CIP is designed as an openly documented governance framework.

One area where community contribution is particularly valuable:

**PAL implementation examples on new platforms**

As new AI platforms emerge — including domain-specific LLMs, video generation systems, and multimodal agents — documenting how PAL maps to their persistent layer features helps the CIP / PAL framework grow as a platform-agnostic standard.

Platform examples document how persistence features may map to PAL, while CIP itself remains an adoption-governance framework.

If you have implemented or observed PAL-like behavior on a platform not yet documented, contributions are welcome:

- Open an [Issue](https://github.com/watadani-byte/character-identity-protocol/issues) describing the platform and feature
- Reference the [PAL column](docs/column_pal.md) and [Architecture Diagram](docs/architecture_diagram.md) for formatting guidance
- Include: platform name, persistent layer feature, and mapping to PAL layers

> CIP provides the governance framework.
> The community provides the platform coverage.

-----

## License

**Documentation, concepts, cases, and governance files**
(`README.md`, `docs/` excluding `docs/schemas/`):
Licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/).
You may read, share, and adapt with attribution.

**Schema files and machine-readable control definitions** (`docs/schemas/`):
All rights reserved — 2026.

Viewing, citation, and conceptual reference are permitted.
The following are not permitted without written permission:

- Implementation based on these machine-readable control definitions
- Redistribution of modified versions
- Commercial deployment based on these specifications
- Derivative works for commercial use

*See LICENSE for full terms.*