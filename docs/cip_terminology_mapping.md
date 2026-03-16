# CIP Terminology Mapping

Different communities working with generative AI use different terminology for similar concepts related to character consistency. This document maps CIP concepts to the terminology commonly used in four ecosystems, to help readers from different backgrounds understand the protocol.

-----

## Core Mapping Table

|CIP Concept             |Stable Diffusion                                  |Midjourney                                |Academic Research                          |IP / Content Industry                   |
|------------------------|--------------------------------------------------|------------------------------------------|-------------------------------------------|----------------------------------------|
|**Anchor Image**        |Reference image, img2img input, conditioning image|Reference image (`--cref`)                |Conditioning input, reference state        |Character reference sheet, master asset |
|**Minimal Prompt**      |Short prompt, low-weight prompt                   |Simple prompt, minimal tags               |Low-entropy conditioning                   |Art direction brief                     |
|**Character Identity**  |Character consistency, consistent subject         |Consistent character                      |Identity state, visual identity            |Character IP, brand character           |
|**Identity Drift**      |Prompt drift, character deviation, seed drift     |Character inconsistency, reroll divergence|Distribution shift, reconstruction variance|Character deviation, off-model output   |
|**Identity Convergence**|Stable generation, consistent output              |Consistent result                         |Convergence to target distribution         |On-model output, brand-consistent output|
|**Identity Gates**      |Manual review, comparison check                   |Visual review                             |Validation criterion, similarity threshold |Quality review, brand compliance check  |
|**Hard Abort**          |Session reset, start over                         |Reroll, new generation                    |Cycle termination, re-initialization       |Production halt, asset rejection        |

-----

## Key Clarification

> **CIP does not modify the model. CIP governs the generation process.**

CIP is an operational governance protocol. It does not fine-tune model weights, modify training data, or alter internal model architecture. Instead, it defines a structured workflow — anchor management, identity validation gates, and hard-abort recovery cycles — that governs the conditions under which generation is allowed to continue.

This distinguishes CIP from training-side approaches such as LoRA, DreamBooth, or ControlNet, which modify or constrain the model itself. CIP operates entirely at inference time and is compatible with closed-source systems.

-----

## Short Notes by Ecosystem

### Stable Diffusion

The Stable Diffusion community typically addresses character consistency through seed control, img2img conditioning, LoRA training, DreamBooth fine-tuning, and ControlNet structural guidance. These approaches generally require model-level intervention or platform-specific tooling. CIP complements these workflows by adding an operational governance layer that can be applied on top of any generation setup.

### Midjourney

Midjourney users typically work with prompt refinement, reference images (`--cref`), and rerolling to achieve consistent character outputs. Character consistency is largely managed through iterative prompt tuning and manual selection. CIP formalizes this process by introducing explicit identity validation criteria and defined failure conditions.

### Academic Research

In the machine learning literature, related concepts include conditioning inputs, generative distribution control, latent space navigation, and identity-preserving generation. CIP is most closely related to inference-time control methods, and addresses the problem of identity stability across iterative probabilistic reconstruction cycles. It does not claim access to model internals and operates as an observational operational framework.

### IP / Content Production

IP-driven content companies typically manage character consistency through character reference sheets, style guides, character bibles, and art direction review processes. When generative AI is introduced into these workflows, the absence of reliable identity persistence creates operational risk. CIP addresses this by providing a structured governance layer for anchor-based identity recovery and cross-platform character persistence.

-----

*See also: [Glossary](glossary.md) — [Technical Mechanism](technical_mechanism.md) — [Character Drift Taxonomy](character_drift_taxonomy.md)*