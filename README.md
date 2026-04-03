# Character Identity Protocol (CIP)

Generative AI does not preserve identity.

The same prompt produces different people.

CIP introduces a protocol to control it.

CIP is a protocol for controlling identity in probabilistic generative systems — operating entirely at inference time, without model modification.

```
A (input) → A′ (reconstructed) → B′ (output)

CIP controls A′.
```

> This repository is under active documentation development.
> For a structured reading experience, use the
> [GitHub Pages navigation](https://watadani-byte.github.io/character-identity-protocol/).

*Licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/) — 2026*

-----

## The Problem

You generate a character. It is exactly right.

You generate it again. It is different.

This is not a prompt failure. It is the expected behavior of a probabilistic system. Without operational control, identity drift emerges naturally across turns, sessions, and platforms.

-----

## From Generation to Control

This is not a generation problem.
It is a control problem.

```
Conventional:
Generate → Drift → Retry → Drift → Collapse

CIP:
Generate → Gate → PASS (accept) / FAIL → Hard Abort → Re-bind → Generate
```

CIP introduces a governance layer between the user and the model:

|Component         |Role                                                     |
|------------------|---------------------------------------------------------|
|**Anchor**        |Validated identity reference — the single source of truth|
|**Identity Gates**|PASS / FAIL validation (Face ∧ Skeleton ∧ Proportion)    |
|**Hard Abort**    |Immediate termination on identity failure                |
|**Re-convergence**|Controlled recovery from last verified anchor state      |

Identity is not assumed to persist. It is continuously validated and recovered.

-----

## Core Model

```
Core Model:     A → (A + C) → B′  (Reconstruction Control Model)
Control Target: A′  (reconstructed state)
Key Operations: Anchor · Gates · Hard Abort · Re-convergence
```

CIP does not improve generation.
It makes identity a controlled variable.

This is not a prompt technique.
It is a control protocol.

> CIP governs identity. PAL sustains it.

> CIP should be read not as a denial of misuse risk,
> but as a governance response to it.

-----

## Documentation

**Start Here**

- [Getting Started](docs/getting_started.md)
- [White Paper](docs/whitepaper_v1.md)
- [CIP Specification v0.1](docs/cip_spec_v0.1.md)

**Core Concepts**

- [Core Model — A → (A + C) → B′](docs/model_a_c_b.md)
- [Technical Mechanism](docs/technical_mechanism.md)
- [Re-Convergence — Identity Recovery](docs/reconvergence.md)
- [Persistent Anchor Layer (PAL)](docs/column_pal.md) — *Cross-session identity persistence*
- [PAL Hypothesis Document](docs/pal_hypothesis.md) — *Formal hypothesis and ASC definition*

**Protocol**

- [Architecture Diagram](docs/architecture_diagram.md)
- [Quality Gate & Hard Abort](docs/quality_gate_addendum.md)
- [Protocol Template](docs/protocol_template.md)
- [PAL Operations Manual](docs/pal_operations_manual_v0.1.md) — *File management, versioning, and continuity operations*

**Cases**

- [Case 01A: Baseline Failure](docs/cases/case_01_failure_log.md)
- [Case 01B: Mira Project](docs/cases/case_01b_mira_project.md)
- [Case 04: Cross-Platform Migration](docs/cases/case_04_shizuka.md)
- [Case: PAL Contamination — Unintended Library Accumulation](docs/cases/case_pal_contamination_01.md)
- [All Cases →](docs/cases/case_01_failure_log.md)

**Columns**

- [Miracle Images and Convergence Behavior](docs/column_miracle_image.md)
- [Character Identity Drift in Generative AI](docs/column_identity_drift.md)
- [Translation Loss and the YAML-First Principle](docs/column_translation_loss.md)
- [Reconstruction Durability and Identity Longevity](docs/column_reconstruction_durability.md)

**Reference**

- [Glossary](docs/glossary.md)
- [CIP vs Existing Methods](docs/cip_vs_existing_methods.md)
- [Decision Pack](docs/decision_pack.md)

-----

## Attribution and Priority Note

The term **Persistent Anchor Layer (PAL)** and its formulation as an
infrastructure hypothesis for cross-session stabilization were first
named and documented by Hitoshi Watadani in March 2026 in this
repository.

To the author’s knowledge, this repository contains the first explicit
articulation of PAL as a distinct governance-oriented concept.
If you use this concept in your work, citation is appreciated.

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
│   ├── cases/
│   │   ├── case_01_failure_log.md
│   │   ├── case_01b_mira_project.md
│   │   ├── case_04_shizuka.md
│   │   └── case_pal_contamination_01.md
│   │
│   ├── columns/
│   │   ├── column_pal.md
│   │   ├── column_miracle_image.md
│   │   ├── column_identity_drift.md
│   │   ├── column_translation_loss.md
│   │   └── column_reconstruction_durability.md
│   │
│   ├── pal_hypothesis.md
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
  title={Character Identity Protocol: Operational Governance for Identity Convergence in Probabilistic Generative Systems},
  author={Hitoshi Watadani},
  year={2026},
  note={GitHub Repository},
  url={https://github.com/watadani-byte/character-identity-protocol}
}
```

-----

## Contributing — Platform Implementation Examples

CIP is designed as an open governance standard.

One area where community contribution is particularly valuable:

**PAL implementation examples on new platforms**

As new AI platforms emerge — including domain-specific LLMs, video generation systems, and multimodal agents — documenting how PAL maps to their persistent layer features helps CIP grow as a platform-agnostic standard.

If you have implemented or observed PAL-like behavior on a platform not yet documented, contributions are welcome:

- Open an [Issue](https://github.com/watadani-byte/character-identity-protocol/issues) describing the platform and feature
- Reference the [PAL column](docs/column_pal.md) and [Architecture Diagram](docs/architecture_diagram.md) for formatting guidance
- Include: platform name, persistent layer feature, mapping to PAL / HDLA / ARCM layers

> CIP provides the governance framework.
> The community provides the platform coverage.

-----

## License

Licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/)