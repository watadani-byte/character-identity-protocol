# Getting Started — Character Identity Protocol (CIP)

Character Identity Protocol (CIP) is an operational governance protocol for stabilizing character identity in probabilistic generative systems. It controls the conditions under which identity convergence occurs — not by modifying the model itself, but by governing how generation is managed.

This page guides you through the key concepts before introducing the protocol.

-----

## The Problem

Generative AI models often fail to reproduce the same character consistently across generations.

Even when prompts remain identical, the generated character may change.

This happens because:

- generative models reconstruct outputs probabilistically, not deterministically
- prompts are internally reinterpreted before generation (A → A′)
- small changes in context, pose, or wording can shift the reconstruction result

This phenomenon is known as **identity drift**.

→ See: [Character Drift Taxonomy](character_drift_taxonomy.md)

-----

## How Generative AI Actually Behaves

AI systems do not execute prompts directly.

Instead, they internally reinterpret inputs before generating outputs.

Conceptually:

```
A (user input)
→ A′ (internal interpretation)
→ B′ (generated output)
```

Because generation is probabilistic, identical inputs may not produce identical outputs.
Results can vary between generations and drift over time.

→ See: [How Generative AI Actually Behaves](column_how_generative_ai_behaves.md)

-----

## Prompt Structure

Prompts work best when information is structured and concise.

A simple structure for general prompts:

|Element  |Role                          |
|---------|------------------------------|
|Theme    |What the prompt is about      |
|Rules    |How the AI should respond     |
|Materials|What information it should use|
|Output   |How the answer should appear  |

→ See: [A Simple Structure for Writing Prompts](column_prompt_structure.md)

-----

## Writing Prompts for Image Generation

Image generation prompts typically contain four types of signals:

|Element    |Role                      |
|-----------|--------------------------|
|Subject    |Main object or scene      |
|Style      |Visual rendering style    |
|Details    |Additional visual elements|
|Constraints|Restrictions or exclusions|

For character generation, placing identity-related information early in the prompt helps maintain consistency.

→ See: [Writing Prompts for Image Generation](column_image_prompt_structure.md)

-----

## The Character Consistency Problem

Even with structured prompts, the same character may appear differently across generations.

Common drift types include:

- **Identity Drift** — the character becomes a different person
- **Style Drift** — rendering shifts toward photorealism or a different style
- **Attribute Drift** — character attributes gradually disappear from the output

These drift types arise from the probabilistic nature of generative models and the way prompts are internally compressed.

→ See: [Character Drift Taxonomy](character_drift_taxonomy.md)

-----

## Character Identity Protocol (CIP)

CIP is a structured workflow designed to manage identity convergence.

It operates through four elements:

|Element       |Role                                            |
|--------------|------------------------------------------------|
|Anchor Image  |Previously validated identity reference         |
|Minimal Prompt|Lightweight identity constraints                |
|Identity Gates|Validation checks (Face ∧ Skeleton ∧ Proportion)|
|Hard Abort    |Immediate termination when drift is detected    |

CIP does not modify the model. It governs the operational conditions under which generation is allowed to continue.

→ See: [White Paper](whitepaper_v1.md) — [Technical Mechanism](technical_mechanism.md)

-----

## Quick Start

Ready to try CIP?

→ [Quickstart Guide](quickstart.md)

-----

## Documentation

**Concepts**

- [How Generative AI Actually Behaves](column_how_generative_ai_behaves.md)
- [A Simple Structure for Writing Prompts](column_prompt_structure.md)
- [Writing Prompts for Image Generation](column_image_prompt_structure.md)

**The Problem**

- [Character Drift Taxonomy](character_drift_taxonomy.md)
- [Identity Drift in Generative Image Models](column_identity_drift_practical.md)
- [Character Identity Drift in Generative AI](column_identity_drift.md)

**Protocol**

- [White Paper](whitepaper_v1.md)
- [Technical Mechanism](technical_mechanism.md)
- [CIP Specification v0.1](cip_spec_v0.1.md)

**Guides**

- [Quickstart](quickstart.md)
- [Architecture Diagram](architecture_diagram.md)
- [Decision Pack](decision_pack.md)

**Reference**

- [Glossary](glossary.md)
- [Quality Gate Addendum](quality_gate_addendum.md)
- [Master Document](master_document.md)