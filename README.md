# Character Identity Protocol (CIP)

**Character Identity Protocol (CIP)** is an operational governance framework
for stabilizing character identity in probabilistic generative systems.

Generative models do not produce deterministic outputs. Even with identical prompts, the same character may appear different across generations.

Even under identical conditions, generative systems reconstruct outputs rather than reproduce them exactly (A → A′).

CIP addresses this operational problem by introducing a structured workflow built around anchors, minimal prompts, and identity validation gates.

**CIP does not attempt to control the model itself.
It controls the conditions under which identity convergence occurs.**

CIP is not a prompting technique. It is an operational protocol for stabilizing identity reconstruction in probabilistic generative systems, using anchor-based convergence, identity gates, and hard-abort recovery cycles.

*Licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/) — 2026*

For the theoretical framework and full protocol description, see the White Paper:  
[White Paper: Character Identity Protocol v1.0](docs/whitepaper_v1.md)

-----

## Generative AI Mental Model

Generative image models do not retrieve or reproduce images from memory.
They reconstruct outputs by sampling from a probability distribution learned during training.

This means that even with identical inputs, outputs may vary.
Identity is not preserved automatically — it must be actively maintained.

```
Training Distribution
        ↓
Probabilistic Generation
        ↓
Character Drift
        ↓
User Intervention
        ↓
Character Identity Protocol (CIP)
```

Because generation is probabilistic, small changes in prompt, pose, or context can cause the model to reconstruct a different identity.
This is not a failure — it is the natural behavior of these systems.

CIP addresses this by operating at the **operational layer**, between the user and the model.
It does not modify the model itself.
Instead, it governs the conditions under which generation is allowed to continue:
controlling anchor references, validating identity gates, and triggering hard aborts when drift is detected.

> CIP stabilizes identity by governing generation conditions — not by modifying the model.

In practice, drift appears in multiple forms such as identity drift, proportion drift, style drift, and angle drift.
A detailed taxonomy is provided in the [Character Drift Taxonomy](docs/character_drift_taxonomy.md) document.

-----

The following section explains why character identity is inherently unstable in generative systems.

## The Problem

You generate an image of a character.
It is exactly right — the face, the proportions, the presence.

You try to generate the same character again.
It is different.

You try again.
Different again.

This is not a failure of skill. It is how generative AI works.

In generative image systems:

- The same prompt can produce different faces
- Character proportions may drift over iterations
- Identity consistency degrades across turns
- Cross-platform reproduction becomes unreliable

This is not a prompt engineering failure.
It is a property of **probabilistic generative systems**.

Each output is a new reconstruction sampled from the model’s learned distribution.
Without operational control, **identity drift emerges naturally**.

CIP was designed to operationally control this reconstruction behavior.

In image generation communities, this problem is often discussed as character consistency, identity preservation, or consistent character generation.
CIP addresses it at the operational governance layer.

-----

## The CIP Approach

Operationally, this governance layer functions as a convergence control protocol
applied during inference.

CIP treats character identity as a **convergence control problem**.

In other words, CIP does not attempt to generate identity; it recovers it.

Rather than enforcing strict instructions, the protocol aligns generation with the natural convergence behavior of the model.

CIP introduces four operational elements:

|Element       |Role                                            |
|--------------|------------------------------------------------|
|Anchor Image  |Previously validated identity reference         |
|Minimal Prompt|Lightweight identity constraints                |
|Identity Gates|Validation checks (Face ∧ Skeleton ∧ Proportion)|
|Hard Abort    |Immediate termination when drift occurs         |

Identity Gates are evaluated by the operator (typically a human reviewer), with optional metric-based verification.

Together these form a controlled generation loop.

**CIP does not attempt to control the model itself.
It controls the conditions under which identity convergence occurs.**

> This is not a generation method.
> It is a character identity governance protocol.

CIP defines the validation gates. The similarity threshold is an operator-defined parameter.

-----

## Core Operational Loop

```
Anchor Image + Minimal Prompt
        ↓
Generation
        ↓
Identity Gates
        ↓
PASS → Accepted Output
FAIL → Hard Abort → Re-bind Anchor → Re-converge
```

Identity is therefore **not assumed to persist**.

Instead, it is **continuously recovered through controlled convergence cycles**.

```mermaid
flowchart TD
    A[Anchor Image + Minimal Prompt] --> B[Generation]
    B --> C["Identity Gates
(Face ∧ Skeleton ∧ Proportion)"]
    C -->|PASS| D[Accepted Output]
    C -->|FAIL| E[Hard Abort]
    E --> F[Re-binding]
    F --> G[Re-convergence]
    G --> B
```

-----

## CIP Operational Architecture

*CIP governs generation acceptance through identity validation gates and hard-abort recovery cycles.*

```mermaid
flowchart LR
    A["Anchor Image + Minimal Prompt"] --> B[Generation Engine]
    B --> C["Identity Gates
Face Gate
Skeleton Gate
Proportion Gate"]
    C -->|PASS| D[Accepted Output]
    C -->|FAIL| E[Hard Abort]
    E --> F[Re-binding]
    F --> G[Re-convergence]
    G --> B
```

-----

## Why Anchors Work

A previously generated image represents a **known converged solution** within the model’s output space.

When supplied as a reference, the anchor increases the probability that reconstruction returns to a previously validated identity state.

```
Model Exploration
        ↓
Anchor Attraction
        ↓
Identity Convergence
```

The anchor does not override the model.
It biases reconstruction toward a previously validated identity state.

```mermaid
flowchart TD
    A[Learned Distribution] --> B[Model Exploration]
    B --> C[Anchor Attraction]
    C --> D[Convergence]
    D --> E{Identity Gates}
    E -->|PASS| F[Accepted Output]
    E -->|FAIL| G[Hard Abort → Re-binding]
    G --> B
```

*CIP core mechanism: latent sampling, identity drift, and anchor re-attraction.*

```mermaid
flowchart TD
    A[Latent Distribution] --> B[Sampling]
    B --> C[A′ — Reconstructed Output]
    C --> D{Identity Drift?}
    D -->|No drift| E[Accepted Output]
    D -->|Drift detected| F[Hard Abort]
    F --> G[Anchor Re-attraction]
    G --> B
```

-----

## Cycle-Based Stabilization

Identity stability is not permanent in probabilistic systems.
Instead it exists within bounded convergence windows.

```
Cycle A → Drift → Re-binding → Cycle B
```

CIP restores stability by periodically re-injecting the anchor and restarting the convergence process.

```mermaid
flowchart LR
    A[Cycle A: Convergence Window] --> B[Drift Accumulation]
    B --> C[Context Stability Threshold]
    C --> D[Re-Binding / Re-Convergence]
    D --> E[Cycle B: Re-Converged Window]
```

> Stability is not infinite.
> Stability is chained through disciplined re-convergence.

-----

## Inference-Time Protocol

CIP operates **entirely at inference time**.

The protocol:

- does not modify model weights
- does not alter training data
- does not access proprietary model internals

Instead, it constrains reconstruction behavior through **input design and operational control**.

This allows CIP to function across multiple platforms and closed-source systems.

-----

## Scope Clarification

**This is NOT:**

- A prompt template library
- A fine-tuning method
- A LoRA training technique
- A model architecture modification

**This IS:**

- An operational governance protocol
- A statistical convergence control framework
- A validation discipline using structured gates

CIP is model-agnostic: it defines a conformance workflow, not a model capability claim or a platform feature requirement.

-----

## Review Notes (Expected Questions)

- **Does CIP claim determinism?**
  No. CIP is a governance workflow for *bounded* stability under gates within a context-bound window (cycle). It does not guarantee identical outputs.
- **Is CIP just prompt engineering?**
  No. CIP is an operational conformance loop: Anchor → Minimal Prompt → Gates → Hard Abort → Re-binding → Re-convergence.
- **What is the measurable claim?**
  CIP makes outcomes audit-ready: every PASS/FAIL is recorded as an operational audit trail (anchor ID, prompt hash, gate result, timestamp, operator).
  Human gate evaluation SHALL be primary; metrics MAY be added as verification.
  *Audit-ready = every PASS/FAIL is traceable to (anchor ID, prompt hash, gate result, timestamp, operator).*

-----

## Minimal Prompt Principle

CIP intentionally avoids highly specific prompt constraints.

Overly precise instructions can push the model away from the statistical regions where stable reconstructions occur.
Instead, CIP favors minimal attribute descriptions that leave room for the model to converge naturally.

**Example of rigid specification (often unstable):**

- 8-head body ratio
- exact height specification
- precise numeric constraints

**Example of minimal attribute description:**

- small head relative to height
- long limbs
- modest chest
- full thighs

The second form allows the model to search within its learned distribution more freely and often leads to more stable convergence toward the anchor.

In practice this means:

- Prompts describe invariant traits, not exact measurements
- Prompts remain short and abstract
- The anchor image carries the majority of identity information

CIP therefore treats prompts as identity hints, not full character definitions.
The anchor remains the primary stabilizer of identity.

```
Minimal Prompt → Model Exploration → Anchor Attraction → Convergence
```

-----

## Who This Is For

- AI labs researching generative consistency
- IP owners requiring character identity guarantees
- Anime, manga, illustration, and game production studios
- Franchise animation and serialized IP management teams
- Fashion and editorial production pipelines
- Enterprise governance and audit teams

-----

## If You Are Evaluating This Repository

If you are reviewing this for:

- Enterprise evaluation
- Research analysis
- Risk / compliance review
- Platform integration feasibility

Please refer to: [Decision Pack](docs/decision_pack.md)

-----

CIP reframes character identity from a static output property to a recoverable convergence state.

## Key Insight

Identity in generative systems does not persist automatically.

**It must be recovered through controlled convergence.**

> In CIP, the core verb is not *generate* — it is *recover*.
> 
> *Recover* = re-converge to a previously validated identity state (the anchor), under gates, until the identity constraints are met (PASS).

-----

## Reading Paths

**Researchers / Technical Review**  
[White Paper](docs/whitepaper_v1.md) → [Technical Mechanism](docs/technical_mechanism.md) → [Specification v0.1](docs/cip_spec_v0.1.md)

**Practitioners**  
[Quickstart](docs/quickstart.md) → [Architecture Diagram](docs/architecture_diagram.md) → [Case Studies](docs/case_01_failure_log.md)

**Enterprise / Governance**  
[Decision Pack](docs/decision_pack.md) → [Specification v0.1](docs/cip_spec_v0.1.md)

-----

## Documentation

**White Paper**

- [Character Identity Protocol v1.0](docs/whitepaper_v1.md)
- [Master Document — Consolidated Overview](docs/master_document.md)
- [Decision Pack — Enterprise Evaluation](docs/decision_pack.md)
- [Legal Governance & Operational Evidence Framework](docs/legal_governance.md)

**Core**

- [Quickstart Guide](docs/quickstart.md)
- [Technical Mechanism](docs/technical_mechanism.md)
- [Architecture Diagram](docs/architecture_diagram.md)
- [Applications Overview](docs/applications.md)
- [Glossary](docs/glossary.md)
- [Reproducibility Scope](docs/reproducibility_scope.md)

**Case Studies**

- [Case 01A: Baseline Failure](docs/case_01_failure_log.md)
- [Case 01B: Mira Project — Hard Abort & Re-convergence](docs/case_01b_mira_project.md)
- [Case 02: Wedding Series](docs/case_02_wedding_series.md)
- [Case 03: Avedon Project](docs/case_03_avedon_project.md)
- [Case 04: Cross-Platform Migration — “Shizuka”](docs/case_04_shizuka.md)
- [Case 05: Serendipitous Creation](docs/case_05_serendipitous.md)
- [Case 06: Gemini Validation](docs/case_06_gemini.md)

**Operational**

- [Quality Gate & Hard Abort Discipline](docs/quality_gate_addendum.md)

**Further Reading**

- [Miracle Images and Convergence Behavior](docs/column_miracle_image.md)
- [When AI Stops Being Art and Starts Becoming Production](docs/column_production.md)
- [Character Identity Drift in Generative AI — From Sakuga Collapse to CIP](docs/column_identity_drift.md)
- [Before Consistent Characters](docs/column_before_consistent_characters.md)
- [Identity Drift in Generative Image Models — A Practical Explanation](docs/column_identity_drift_practical.md)
- [Generative Character Drift — A Technical Overview](docs/column_character_drift_technical.md)
- [Character Drift Taxonomy](docs/character_drift_taxonomy.md)

> **Note:** “Identity Gates” is the current term for the validation layer. “Quality Gate” remains as a legacy document and addendum title for continuity.

-----

## Citation

If referencing this protocol in academic or professional work:

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

## Contribution

Issues are open for clarification and technical discussion.
Demonstration requests may be considered depending on scope and feasibility.

→ [Open an Issue](https://github.com/watadani-byte/character-identity-protocol/issues)

-----

## Next Phase (Planned)

### CIP Specification Draft (v0.x)

A formalized specification layer is in preparation.

Planned scope:

- Normative terminology (SHALL / SHOULD / MAY)
- Formal gate definitions
- Conformance conditions
- Re-binding requirements
- Operational boundary clauses

### CIP Enterprise Pilot Framework

An enterprise-focused documentation layer is also in development.

Planned scope:

- Audit-ready logging templates
- Gate event recording schema
- Operational risk mapping
- Compliance alignment guidelines

-----

This repository represents the stable conceptual and governance layer (v1.x series).
v1.0 is the initial tagged snapshot; v1.1 reflects documentation refinement.

-----

## License

Licensed under CC BY 4.0: https://creativecommons.org/licenses/by/4.0/

-----

## Contact

For general discussion, please open a GitHub Issue. For professional or
research inquiries, contact details may be provided upon request.