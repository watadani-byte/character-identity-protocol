# Glossary: Character Identity Protocol

Core terms used throughout the documentation.

-----

## Anchor-Sufficient Convergence (ASC)

A convergence condition in which character identity is
maintained across generations using only a PAL-registered
anchor asset and a stable UID — without requiring
ControlNet, OpenPose, seed control, LoRA, or model
fine-tuning.

**Formal conditions:**

|Condition            |Status      |
|---------------------|------------|
|Same UID             |Required    |
|PAL-registered anchor|Required    |
|ControlNet           |Not required|
|OpenPose             |Not required|
|Seed control         |Not required|
|LoRA                 |Not required|
|Model fine-tuning    |Not required|

**Implication:**

ASC demonstrates that identity is not a property of
generation tools — it is a property of the anchor.

When PAL is properly configured, the anchor asset alone
is sufficient to maintain character identity across
sessions, platforms, and generation cycles.

> The anchor is sufficient. The tools are optional.

**Related:**

- [Persistent Anchor Layer (PAL)](column_pal.md)
- [High-Density Latent Anchoring (HDLA)](whitepaper_v1.md)
- [Anchor Re-Convergence Method (ARCM)](whitepaper_v1.md)

-----

## Anchor

```
Anchor = Minimal Prompt + Previously Converged Output Image
```

A previously generated image that represents a known, high-quality solution state.  
Used as a constraint to bias future generation toward the same convergence point.

The image is **not** an artistic reference or stylistic inspiration. It is a record of a solution the model has already found.

-----

## Anchor Mechanism

The protocol-level stabilizing principle by which a validated anchor image is introduced as a high-information conditioning signal to bias reconstruction toward a previously achieved identity state.

Distinct from image-to-image (which encourages variation) and seed fixing (which primarily controls initial noise sampling).

-----

## Anchor Convergence

The operational workflow for forming and re-establishing an anchor. Includes: high-density sample selection, identity gate validation, identifier binding, minimal prompt reduction, and multi-view expansion. Constitutes the entry condition of the CIP governance loop.

Distinct from Anchor Mechanism: Anchor Mechanism is the stabilizing principle; Anchor Convergence is the formation and re-convergence workflow.

-----

## Identity Recall Probability

An operational likelihood that subsequent generation cycles converge toward the same identity state as the anchor. Increased by identifier binding, multi-view expansion, and minimal prompt discipline. Not a mathematical probability but a qualitative indicator of reconstruction stability.

-----

## Convergence / Convergence Point

The state at which a generative model’s output stabilizes into a coherent, consistent result.

A “convergence point” is a location in the model’s solution space where identity, structure, and rendering align with unusual precision.

The protocol does not force convergence — it biases the search space toward a previously achieved convergence point.

-----

## Reconstruction (A→A’)

The internal process by which a generative model interprets a prompt and reformulates it into a generation target.

```
User prompt (A) → Model's internal reformulation (A') → Generation
```

This stage is:

- Invisible to the user
- Not directly controllable
- The primary source of identity drift

The anchor mechanism constrains A→A’ by supplying a high-information prior.

-----

## Layer A / Layer B / Layer C

A theoretical abstraction of the generation process — not a claim about proprietary architecture.

|Layer|Function                                 |
|-----|-----------------------------------------|
|A    |Language interpretation                  |
|B    |Reconstruction / optimization            |
|C    |Execution (latent sampling and rendering)|

Verbose prompts activate Layers A and B more strongly.  
Minimal prompts reduce pressure on Layers A and B, allowing the anchor to dominate.

-----

## Minimal Prompt

A prompt containing only factual, identity-defining attributes — no adjectives, no mood descriptors, no compositional instructions.

Purpose: to reduce optimization pressure from the model’s training priors, preserving the convergence state established by the anchor.

Example:

```
Japanese woman, black hair, brown eyes, 168cm, slender
```

Not:

```
beautiful, elegant, mysterious Japanese woman with flowing black hair...
```

-----

## Match Rate

A human-assessed similarity score between the anchor image and a generated output.

Match rate is not an identity verification metric. It is an **early warning indicator for character drift** — a signal that degradation may be beginning before full collapse occurs.

Evaluated across three dimensions:

- **FaceGate** — facial identity consistency
- **SkeletonGate** — skeletal proportion and alignment
- **ProportionGate** — overall body proportion

The similarity threshold is operator-defined. The ~90% figure is a demonstration value only — it is not a protocol standard. Treating it as a fixed threshold is a misapplication of this protocol.

> Match rate measures the **risk of drift**, not the **fact of identity**.

Match rate is a human judgment, not an automated metric.

-----

## Quality Gate

The set of validation conditions that must all pass before a generation is accepted.

```
PASS = FaceGate ∧ SkeletonGate ∧ ProportionGate
```

If any gate fails → hard abort.  
No progressive correction permitted.

*See: [Quality Gate Addendum](quality_gate_addendum.md)*

-----

## Hard Abort

The mandatory stop condition triggered when any quality gate fails.

The session is terminated. Contaminated outputs are discarded.  
No continuation, no correction, no exception.

-----

## Contamination

The accumulation of identity drift in a session’s context, caused by:

- Failed generations that were not discarded
- Continued generation after drift detection
- Excessive session length without re-anchoring

Contaminated sessions cannot be recovered by prompt adjustment.  
They must be abandoned and restarted with a clean anchor.

-----

## UID (Unique Identifier)

A stable name or label assigned to a character’s converged state.

Purpose: enables cross-session recall without re-providing the full anchor each time.  
Example: “Model Hana”, “Model A”, “Shizuka”

The UID corresponds to a specific converged visual state — not assigned arbitrarily.

-----

## Identity Drift

The gradual deviation of generated outputs from the established character identity across turns.

Caused by:

- Reconstruction variability (A→A’) accumulating across turns
- Optimization pressure from verbose prompts
- Session context degradation
- Insufficient anchoring frequency

-----

## Style Drift

The deviation of generated outputs from the defined rendering regime — line weight, color quantization, shading abstraction, texture ceiling — toward a higher information density state (typically: anime abstraction → semi-realistic → photorealistic).

Style Drift is technically distinct from structural Identity Drift.

In general production contexts, style drift may be recoverable through re-anchoring in a subsequent cycle.

**In style-defined identity domains — anime, manga, illustration, game, and franchise animation — style drift is classified as a failure at the point of occurrence, regardless of recoverability.**

This classification rests on the industry standard that:

- Rendering regime is constitutive of identity, not decorative
- A recoverable failure is still a failure
- Zero-tolerance enforcement applies to rendering regime deviation in IP-governed production

> Style Drift in anime, manga, game, and serialized IP contexts is not aesthetic variation.  
> It is identity violation — and triggers Hard Abort under the same conditions as structural drift.

*See: [Video Addendum — Style-Layer Primacy Problem](cip_video_addendum.md)*

-----

## Cross-Platform Migration

The procedure for re-establishing a character identity on a different generative platform.

The anchor image functions as a platform-agnostic identity record.  
The character’s convergence state can be recovered on any system capable of image-guided generation.

*See: [Case 04: Cross-Platform Migration — “Shizuka”](case_04_shizuka.md)*