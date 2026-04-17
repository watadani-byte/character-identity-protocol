# CIP vs Existing Methods

## Purpose

Many existing approaches address character consistency by modifying the model itself or by optimizing prompt inputs. CIP operates differently: it introduces a governance layer at the generation workflow level, governing the conditions under which outputs are accepted or rejected without altering the model.

In the current framework, PAL supports generative continuity and persistent anchoring, while CIP governs validation, stopping, re-binding, recovery, adoption, rejection, and purge.

This document clarifies the distinctions between CIP and commonly used approaches.

-----

## Comparison Table

|Approach                             |Category                 |What It Modifies or Provides                              |Typical Use                                                                                   |
|-------------------------------------|-------------------------|----------------------------------------------------------|----------------------------------------------------------------------------------------------|
|**LoRA**                             |Model-centric            |Model weights (low-rank adapter)                          |Fine-tuning a model to generate a specific character or style                                 |
|**DreamBooth**                       |Model-centric            |Model weights (full or partial fine-tune)                 |Training a model to associate a subject with a unique identifier                              |
|**ControlNet**                       |Model-centric            |Generation via structural conditioning (pose, depth, edge)|Constraining image composition and structure during generation                                |
|**IP-Adapter / Image Prompting**     |Reference-based          |Visual conditioning signal at inference time              |Improving resemblance to a reference image during generation                                  |
|**Platform Image Reference Features**|Reference-based          |Platform-native image conditioning                        |Providing visual reference within a platform’s native generation interface                    |
|**Prompt Engineering**               |Prompt-centric           |Text input to the model                                   |Optimizing prompts to guide model outputs toward intended results                             |
|**Manual QA / Brand Review**         |Human review             |Output selection and approval                             |Human evaluation of generated outputs against brand or character standards                    |
|**PAL (Persistent Anchor Layer)**    |Continuity infrastructure|Anchor material availability across sessions              |Maintaining persistent anchor materials for cross-session identity continuity                 |
|**Character Identity Protocol (CIP)**|Governance layer         |Generation workflow (not the model)                       |Governing identity stability through anchors, validation gates, and hard-abort recovery cycles|

-----

## Key Clarification

> **CIP does not modify model weights or internal architecture. CIP governs the generation workflow.**

LoRA, DreamBooth, and ControlNet are training-side or conditioning-side techniques that intervene at the model level. Prompt engineering optimizes the input signal. IP-Adapter and platform image reference features provide visual conditioning at inference time. None of these approaches introduce explicit identity governance — defined failure conditions, Hard Abort, re-binding, adoption, rejection, purge, or auditability — into the generation workflow.

**Reference guidance is not identity governance.**

Improving visual resemblance is not the same as governed identity continuity. A generation workflow that produces consistent-looking outputs is not audit-ready unless it provides: a validated anchor, comparison outputs, defined failure criteria, PASS/FAIL rules, adoption and rejection conditions, and a recovery or purge procedure.

CIP operates entirely at inference time. It does not modify model weights, training data, or internal architecture. Instead, it defines a structured operational workflow:

- **Anchor materials** provide a validated identity reference for each generation cycle
- **Identity validation gates** evaluate each output against defined criteria, beginning with structural gates such as face, skeleton, and proportion, and extending to domain-critical gates where required
- **Hard Abort** terminates the cycle when validation fails, preventing drift propagation
- **Adoption / Rejection / Purge** determine what happens to outputs after gate evaluation
- **Re-binding and re-convergence** restart the cycle from the last verified anchor state

This makes CIP applicable to generative systems capable of accepting anchor references — including closed-source platforms, to the extent that they expose sufficient reference, generation, and review controls — and usable on top of existing model-centric or reference-based techniques.

PAL (Persistent Anchor Layer) supports this workflow by maintaining anchor materials across sessions, ensuring that re-convergence remains possible even after session resets or platform transitions.

-----

## What Existing Methods Do Well

The methods listed above are valid and useful within their respective domains.

- LoRA and DreamBooth can significantly improve character resemblance within a trained model.
- ControlNet provides reliable structural conditioning for pose and composition.
- IP-Adapter and platform image reference features enable reference-guided generation at inference time without model modification.
- Manual QA and brand review provide human judgment as a quality control layer.

These techniques address generation quality and resemblance. They do not address the governance problem: how to detect identity failure, halt drift propagation, recover to a verified state, and maintain an auditable record of adoption and rejection decisions.

-----

## Summary

Existing approaches to character consistency generally operate by modifying the model (LoRA, DreamBooth, ControlNet), conditioning generation on a reference image (IP-Adapter, platform image features), or optimizing inputs (prompt engineering). These are valid techniques for improving resemblance and generation quality, but do not introduce explicit identity governance into the generation workflow.

PAL supports continuity by maintaining anchor materials across sessions.

CIP addresses a different problem: how to detect, halt, and recover from identity drift in a principled and auditable way. Its contribution is the operational governance layer — anchor materials, identity validation gates, adoption and rejection conditions, hard-abort recovery cycles, and purge procedures — that remains applicable regardless of the underlying model or platform.

-----

*See also: [Technical Mechanism](technical_mechanism.md) — [Glossary](glossary.md)*