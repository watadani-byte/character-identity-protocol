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
Core Model:     A → A′ → B′  (Reconstruction Control Model)
Control Target: A′  (reconstructed state)
Key Operations: Anchor · Gates · Hard Abort · Re-convergence
```

CIP does not improve generation.
It makes identity a controlled variable.

This is not a prompt technique.
It is a control protocol.

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
- [Persistent Anchor Layer (PAL)](docs/column_pal.md)

**Protocol**

- [Architecture Diagram](docs/architecture_diagram.md)
- [Quality Gate & Hard Abort](docs/quality_gate_addendum.md)
- [Protocol Template](docs/protocol_template.md)

**Cases**

- [Case 01A: Baseline Failure](docs/case_01_failure_log.md)
- [Case 01B: Mira Project](docs/case_01b_mira_project.md)
- [Case 04: Cross-Platform Migration](docs/case_04_shizuka.md)
- [All Cases →](docs/case_01_failure_log.md)

**Columns**

- [Persistent Anchor Layer (PAL)](docs/column_pal.md)
- [Miracle Images and Convergence Behavior](docs/column_miracle_image.md)
- [Character Identity Drift in Generative AI](docs/column_identity_drift.md)

**Reference**

- [Glossary](docs/glossary.md)
- [CIP vs Existing Methods](docs/cip_vs_existing_methods.md)
- [Decision Pack](docs/decision_pack.md)

-----

## Citation

```bibtex
@misc{character_identity_protocol_2026,
  title={Character Identity Protocol: Operational Governance for Identity Convergence in Probabilistic Generative Systems},
  author={Watadani},
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