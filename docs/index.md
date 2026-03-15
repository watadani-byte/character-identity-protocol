# Character Identity Protocol — Documentation

This documentation covers the **Character Identity Protocol (CIP)**, an operational governance protocol for stabilizing character identity in probabilistic generative systems.

→ For the project overview and research context, see the [GitHub README](https://github.com/watadani-byte/character-identity-protocol)

-----

## Who This Documentation Is For

This documentation may be useful for:

**General users**
People working with generative image systems who want to understand why characters change across generations and how to maintain consistency.

**Researchers**
People studying identity drift, probabilistic reconstruction behavior, and inference-time control in generative systems.

**Governance and operational teams**
People assessing CIP for enterprise deployment, audit-ready workflows, or reproducibility requirements.

-----

## Start Here by Goal

|Goal                                 |Start with                                                                       |
|-------------------------------------|---------------------------------------------------------------------------------|
|Understand how generative AI works   |[How Generative AI Actually Behaves](column_how_generative_ai_behaves.md)        |
|Write better prompts                 |[A Simple Structure for Writing Prompts](column_prompt_structure.md)             |
|Understand why characters change     |[Character Identity Drift](column_identity_drift.md)                             |
|Try CIP immediately                  |[Getting Started](getting_started.md) → [Quickstart](quickstart.md)              |
|Read the theory and specification    |[Technical Mechanism](technical_mechanism.md) → [CIP Spec v0.1](cip_spec_v0.1.md)|
|Evaluate for enterprise or governance|[White Paper](whitepaper_v1.md) → [Decision Pack](decision_pack.md)              |

-----

## Research Entry

For readers approaching CIP from a research perspective, the recommended entry sequence is:

[Technical Mechanism](technical_mechanism.md) → [Character Drift Taxonomy](character_drift_taxonomy.md) → [CIP Specification v0.1](cip_spec_v0.1.md) → [White Paper](whitepaper_v1.md)

These documents cover the operational model, drift classification, normative requirements, and the theoretical framework.

-----

## Recommended Reading Order

### 1. Basic Understanding

- [How Generative AI Actually Behaves](column_how_generative_ai_behaves.md)
- [A Simple Structure for Writing Prompts](column_prompt_structure.md)

### 2. Prompting and Input Design

- [Writing Prompts for Image Generation](column_image_prompt_structure.md)
- [Practical Prompting for Chat AI](practical_prompting_chat_ai.md)

### 3. Understanding the Problem

- [Before Consistent Characters](column_before_consistent_characters.md)
- [Character Identity Drift in Generative AI](column_identity_drift.md)
- [Identity Drift in Generative Image Models](column_identity_drift_practical.md)
- [Miracle Images and Convergence Behavior](column_miracle_image.md)
- [When AI Stops Being Art and Starts Becoming Production](column_production.md)

### 4. Entering CIP

- [Getting Started](getting_started.md)
- [Quickstart Guide](quickstart.md)

### 5. Theory and Specification

- [Technical Mechanism](technical_mechanism.md)
- [Character Drift Taxonomy](character_drift_taxonomy.md)
- [Observed Drift Phenomena](drift_observations.md)
- [CIP Specification v0.1](cip_spec_v0.1.md)
- [Reproducibility Scope](reproducibility_scope.md)

### 6. Extensions and Reference

- [Quality Gate & Hard Abort Discipline](quality_gate_addendum.md)
- [White Paper v1.0](whitepaper_v1.md)
- [White Paper Appendices](whitepaper_appendices.md)
- [Glossary](glossary.md)

### 7. Case Studies

- [Case 01A: Baseline Failure](case_01_failure_log.md)
- [Case 01B: Mira Project — Hard Abort & Re-convergence](case_01b_mira_project.md)
- [Case 02: Wedding Series](case_02_wedding_series.md)
- [Case 03: Avedon Project](case_03_avedon_project.md)
- [Case 04: Cross-Platform Migration — “Shizuka”](case_04_shizuka.md)
- [Case 05: Serendipitous Creation](case_05_serendipitous.md)
- [Case 06: Gemini Validation](case_06_gemini.md)

-----

*Licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/) — 2026*