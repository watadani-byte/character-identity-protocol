# Glossary: Character Identity Protocol

Core terms used throughout the documentation.

-----

## Archetype Drift

A character drift phenomenon in which a generated character
retains partial visual continuity with the anchor identity
while shifting toward a stronger nearby archetype in the
model’s reconstruction space. Archetype Drift is distinct
from facial collapse or structural degradation. It is a
directional failure: the character’s visual features remain
substantially intact, but the identity interpretation
consistency — the social register, personality impression,
and role identity — shifts toward a more dominant nearby
template. The result is captured by the phrase
same face, different person.

As an example: a character defined as a reserved, precise
intellectual may drift across generation cycles toward a
warmer, more approachable register — not through any single
dramatic change, but through gradual reweighting of expressive
and social dimensions. The face remains recognizable.
The person does not.

Archetype Drift is particularly significant in multi-scene,
multi-session, and video generation workflows, where cumulative
drift across outputs can produce a character who is visually
continuous but identity-discontinuous. Standard structural
gates — Face Gate, Skeleton Gate, Proportion Gate — may not
detect this failure mode, as they evaluate feature similarity
rather than identity register.

Detection of Archetype Drift may require evaluation beyond
structural feature comparison, including assessment of social
impression, expressive register, and role identity consistency
against the anchor UID definition.

*See: [Identity Drift Taxonomy — Archetype Drift](whitepaper_v1.md) — [PAL Hypothesis Document](pal_hypothesis.md)*

-----

## Anchor-Sufficient Convergence (ASC)

> Same UID. Different prompt. Same character.

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

## Infrastructure Condition

Within the PAL framework, an infrastructure condition refers
to the deployment state in which anchor materials remain
available at inference time through persistent file, project,
caching, or reference systems.

Infrastructure condition describes the implementation layer
of PAL — how anchor materials are made available.

Distinct from stabilization condition, which describes
the functional effect of that availability.

> PAL is an infrastructure condition.
> Its functional effect is a stabilization condition.

*See: [Stabilization Condition](glossary.md#stabilization-condition)*
*See: [PAL Hypothesis Document](pal_hypothesis.md)*

-----

## Identity Recall Probability

An operational likelihood that subsequent generation cycles converge toward the same identity state as the anchor. Increased by identifier binding, multi-view expansion, and minimal prompt discipline. Not a mathematical probability but a qualitative indicator of reconstruction stability.

-----

## Convergence / Convergence Point

The state at which a generative model’s output stabilizes into a coherent, consistent result.

A “convergence point” is a location in the model’s solution space where identity, structure, and rendering align with unusual precision.

The protocol does not force convergence — it biases the search space toward a previously achieved convergence point.

-----

## Cultural Frame Drift

A form of identity drift in which a generated output
migrates toward the dominant cultural or aesthetic
conventions of the model’s training distribution,
away from the culturally bounded definition of
the anchor identity.

Cultural Frame Drift is particularly observable when
a character defined within a minority visual culture —
such as a Japanese anime aesthetic — is generated in
contexts where the training distribution is heavily
weighted toward a different cultural convention.

The drift does not necessarily produce structural
identity failure as detected by Face Gate, Skeleton Gate,
or Proportion Gate. It may instead manifest as a shift
in facial impression, expressive register, or stylistic
rendering that moves the output away from its culturally
defined anchor.

PAL may suppress Cultural Frame Drift by keeping the
culturally bounded anchor definition persistently
available at inference time.

*See: [PAL Hypothesis — Section 10](pal_hypothesis.md)*

-----

## Convergence Recoverability

> The ability of a character identity to be repeatedly
> reconstructed as the same identity under variation,
> reinterpretation, and context change — without requiring
> strong external stabilization.

Convergence Recoverability is distinct from:

- **Match rate** — a single-generation similarity score
- **Identity gate PASS** — a binary validation outcome
- **LoRA consistency** — constraint-enforced similarity

It describes a character-level property of the identity itself,
not of the control mechanism applied to it.

Characters with high Convergence Recoverability tend to share:

- sufficient distinctiveness (clear identity markers)
- without reconstruction overload (not pushed into sparse regions)
- style-identity separation (style does not compete with identity)

**Related:**

- [Reconstruction Durability](glossary.md#reconstruction-durability-rd)
- [Column: Reconstruction Durability](column_reconstruction_durability.md)
- [High-Density Latent Anchoring (HDLA)](whitepaper_v1.md)

-----

## Reconstruction Durability (RD)

> A character-level property describing the likelihood that
> identity can be repeatedly recovered across generation cycles
> without external stabilization, determined by the character’s
> position within the model’s high-density reconstruction regions.

Reconstruction Durability is the combined property of:

- high Convergence Recoverability
- positioning in high-density reconstruction regions
- style-identity separation

**Key distinction:**
Reconstruction Durability is not a property of the control method.
It is a property of how the character was formed.

**Design implication:**

```
Character Formation (RD)
  └── CIP Governance
        └── PAL Persistence
              └── ASC Conditions
```

A character designed for high Reconstruction Durability
requires less governance overhead, produces more stable anchors,
and exhibits higher Convergence Recoverability across
platforms and model versions.

**Related:**

- [Convergence Recoverability](glossary.md#convergence-recoverability)
- [Column: Reconstruction Durability](column_reconstruction_durability.md)
- [Anchor-Sufficient Convergence (ASC)](glossary.md#anchor-sufficient-convergence-asc)

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

## Library Contamination

A condition in which anchor materials registered
in a persistent reference layer contain content
that produces harmful, misleading, or unintended
reconstruction behavior.

Because PAL may function as a normative and cultural
frame persistence layer, contaminated anchor materials
may stabilize harmful normative frames rather than
intended ones.

Library Contamination requires active purge of
affected materials. Passive removal or deprecation
is insufficient, as accessible materials may continue
to influence reconstruction behavior.

The operator is responsible for anchor library
governance, contamination detection, and purge procedures.

> PAL does not validate anchor content.
> The operator does.

*See: [PAL Hypothesis — Section 10.7](pal_hypothesis.md)*  
*See: [ai-identity-governance](https://github.com/watadani-byte/ai-identity-governance)*

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

## Normative Drift

A form of drift in which an AI system’s behavioral
rules, decision priorities, or role definition shift
across sessions — away from the anchored normative
frame and toward the model’s statistical defaults.

Normative Drift is not limited to image generation.
It may occur in conversational AI, agentic systems,
and any AI deployment where behavioral consistency
across sessions is operationally required.

Unlike structural identity drift, Normative Drift
may not be detectable through visual gate evaluation.
It requires assessment of behavioral posture,
role consistency, and interactional register
across outputs.

PAL may suppress Normative Drift by keeping a
structured role and behavioral anchor persistently
available at inference time.

*See: [PAL Hypothesis — Section 10](pal_hypothesis.md)*  
*See: [ai-identity-governance](https://github.com/watadani-byte/ai-identity-governance)*

-----

## Persistently Available

Within the CIP and PAL frameworks, “persistently available”
describes anchor materials that remain accessible across
session boundaries through platform-level persistence features.

**What this means operationally:**

- The materials remain available at the start of a new session
  without explicit re-injection by the operator
- Access is provided through persistent file, project,
  caching, or reference systems
- Availability persists across session resets

**What this does not mean:**

- Continuously loaded into active memory
- Technically permanent or immutable storage
- Parameter-level encoding within the model

The term refers to operational availability across sessions,
not to any specific technical implementation of persistence.

*See: [Persistent Anchor Layer (PAL)](column_pal.md)*

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

## Stabilization Condition

Within the PAL framework, a stabilization condition refers
to the functional effect produced when anchor materials
are persistently available at inference time.

Stabilization condition describes what PAL does —
it may improve reconstruction consistency across sessions
by maintaining anchor availability.

Distinct from infrastructure condition, which describes
how PAL is implemented.

**Usage guidance:**

- Use “stabilization condition” when describing
  the functional effect of PAL
- Use “infrastructure condition” when describing
  the implementation layer of PAL

> PAL is framed as an inference-time stabilization condition,
> not a training-time intervention.

*See: [Infrastructure Condition](glossary.md#infrastructure-condition)*
*See: [PAL Hypothesis Document](pal_hypothesis.md)*

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