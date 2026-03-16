# CIP vs Existing Methods

## Purpose

Many existing approaches address character consistency by modifying the model itself or by optimizing prompt inputs. CIP operates differently: it introduces a governance layer at the generation workflow level, governing the conditions under which outputs are accepted or rejected without altering the model.

This document clarifies the distinctions between CIP and commonly used approaches.

-----

## Comparison Table

|Approach                             |Category        |What It Modifies                                          |Typical Use                                                                                   |
|-------------------------------------|----------------|----------------------------------------------------------|----------------------------------------------------------------------------------------------|
|**LoRA**                             |Model-centric   |Model weights (low-rank adapter)                          |Fine-tuning a model to generate a specific character or style                                 |
|**DreamBooth**                       |Model-centric   |Model weights (full or partial fine-tune)                 |Training a model to associate a subject with a unique identifier                              |
|**ControlNet**                       |Model-centric   |Generation via structural conditioning (pose, depth, edge)|Constraining image composition and structure during generation                                |
|**Prompt Engineering**               |Prompt-centric  |Text input to the model                                   |Optimizing prompts to guide model outputs toward intended results                             |
|**Character Identity Protocol (CIP)**|Governance layer|Generation workflow (not the model)                       |Governing identity stability through anchors, validation gates, and hard-abort recovery cycles|

-----

## Key Clarification

> **CIP does not modify the model. CIP governs the generation process.**

LoRA, DreamBooth, and ControlNet are training-side or conditioning-side techniques that intervene at the model level. Prompt engineering optimizes the input signal. None of these approaches introduce explicit identity validation or failure conditions into the generation workflow.

CIP operates entirely at inference time. It does not modify model weights, training data, or internal architecture. Instead, it defines a structured operational workflow:

- **Anchor images** provide a validated identity reference for each generation cycle
- **Identity validation gates** evaluate each output against defined criteria (face, skeleton, proportion)
- **Hard Abort** terminates the cycle when validation fails, preventing drift propagation
- **Re-binding and re-convergence** restart the cycle from the last validated anchor state

This makes CIP compatible with any generative system capable of accepting image references — including closed-source platforms — and applicable on top of existing model-centric techniques.

-----

## Summary

Existing approaches to character consistency generally operate by modifying the model (LoRA, DreamBooth, ControlNet) or by optimizing inputs (prompt engineering). These are valid techniques but do not introduce explicit identity governance into the generation workflow.

CIP addresses a different problem: how to detect, halt, and recover from identity drift in a principled and auditable way. Its contribution is the operational governance layer — anchors, identity validation gates, and hard-abort recovery cycles — that remains applicable regardless of the underlying model or platform.

-----

*See also: [CIP Terminology Mapping](cip_terminology_mapping.md) — [Technical Mechanism](technical_mechanism.md) — [Glossary](glossary.md)*