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

ASC describes an operationally observed condition in which
identity is not a property of generation tools — it is
a property of the anchor.

When PAL is properly configured, the anchor asset alone
may be sufficient to support character identity across
sessions, platforms, and generation cycles. This is an
observed pattern, not a universal guarantee.

> The anchor may be sufficient under observed conditions. The tools may be optional.

**Related:**

- [Persistent Anchor Layer (PAL)](column_pal.md)
- [High-Density Latent Anchoring (HDLA)](whitepaper_v1.md)
- [Anchor Re-Convergence Method (ARCM)](whitepaper_v1.md)

-----

## Anchor

```
Anchor = validated identity reference
```

A validated identity reference, usually derived from a previously generated and validated output that represents a known, high-quality solution state.
Used as a constraint to bias future generation toward the same convergence point.

The anchor is **not** an artistic reference or stylistic inspiration. It is a record of a solution the model has already found and that has passed identity gate validation.

*See also: [Anchor Material](glossary.md#anchor-material)*

-----

## Anchor Material

The set of materials used to maintain and re-establish anchor-guided convergence. May include a validated anchor image, a UID definition, a character sheet, a structured identity document, or a combination of these.

“Anchor material” is the broader term. “Anchor image” refers specifically to the visual component of anchor material in image-generation workflows.

-----

## Anchor Mechanism

The protocol-level stabilizing principle by which validated anchor material is introduced as a high-information conditioning signal to bias reconstruction toward a previously achieved identity state.

Distinct from image-to-image (which encourages variation) and seed fixing (which primarily controls initial noise sampling).

-----

## Anchor Convergence

The operational workflow for forming and re-establishing an anchor. Includes: high-density sample selection, identity gate validation, identifier binding, minimal prompt reduction, and multi-view expansion. Constitutes the entry condition of the CIP governance loop.

Distinct from Anchor Mechanism: Anchor Mechanism is the stabilizing principle; Anchor Convergence is the formation and re-convergence workflow.

-----

## Audit-Ready Character Consistency

A character consistency workflow that provides the minimum evidence required for governance review. Audit-ready consistency requires:

- a validated anchor
- comparison outputs evaluated against the anchor
- defined failure criteria
- PASS/FAIL rules
- adoption and rejection conditions
- a recovery or purge procedure

A workflow that produces visually consistent-looking outputs is not audit-ready unless these elements are present and documented.

Reference-based generation, improved resemblance, or human approval alone do not constitute audit-ready character consistency.

-----

## Reconstruction (A → A′ → B′)

The reconstruction model describes the process by which a probabilistic system transforms user input or reference condition A into an internally reconstructed state A′ before producing the actual output B′.

```
A → (A + C) → A′ → B′ ≠ B
A → A′ → B′
A′ ≈ T_C(A)
```

Where:

- A = user input or reference condition
- C = mediation that transforms A into A′, including model-side mediation and execution-structure mediation
- A′ = internally reconstructed state: A as transformed by C
- B′ = actual output

The expression A + C is not simple addition. It is shorthand for a non-linear mediation process in which A is interpreted, compressed, weighted, constrained, sampled, optimized, stylized, or reconstructed into A′.

A′ is not fully or directly observable under ordinary conditions. However, parts of A′ may be externalized, inferred, or tested through prompt disclosure, execution traces, anchor comparison, gate evaluation, validation decisions, and adoption controls.

C explains why drift occurs. It does not excuse unmanaged drift.

CIP does not directly control C or A′. It governs the workflow conditions around C → A′ and validates reconstructed states before adoption.

“C → A′” is shorthand for the governed transformation of A into A′ under C. It does not mean that C independently produces A′ without A.

*Formerly listed as “Reconstruction (A→A’)”*

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

A “convergence point” is an operationally observed region of reconstruction behavior where identity, structure, and rendering align with unusual precision.

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
  ├── PAL Persistence / Continuity
  └── CIP Governance
        └── Adoption / Rejection / Purge
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

## Layer A / Layer B / Layer C

A theoretical abstraction of the generation process — not a claim about proprietary architecture.

|Layer|Function                                 |
|-----|-----------------------------------------|
|A    |Language interpretation                  |
|B    |Reconstruction / optimization            |
|C    |Execution (latent sampling and rendering)|

Verbose prompts activate Layers A and B more strongly.  
Minimal prompts reduce pressure on Layers A and B, allowing the anchor to dominate.

*Note: Layer C in this abstraction is not the same as C in the reconstruction model A → (A + C) → A′ → B′. The former names a conceptual execution layer; the latter names mediation that transforms A into A′.*

-----

## Minimal Prompt

A minimal natural-language prompt derived from human-approved Minimum Requirements
or a YAML source state, used for character exploration and reconstruction behavior
observation.
It usually contains only the minimum identity-relevant attributes needed for the
test, but minimality is defined by controlled projection from source state, not
by shortness alone.

**Design Rationale:** The Minimal Prompt emerged from the observation that long, elaborate prompts activate more C-mediated transformation, increasing the risk that A is reconstructed into an unintended A′. Reducing prompt surface area reduces optimization pressure from the model’s training priors. A minimal prompt is not merely a short prompt; it is a controlled projection from a structured source state.

**Identity Lifecycle phase:** Character exploration. Used to observe how much identity can be recovered from minimal input, and to identify which attributes are load-bearing for reconstruction. Not for production identity establishment when identity continuity matters.

**What it does not replace:** The Minimal Prompt is not a substitute for the Long Prompt in identity-establishment workflows. It is not sufficient for first-generation use when identity continuity matters.

**Prerequisites:** Human-approved Minimum Requirements. Preferably a YAML source state. Convergence is not required.

Example:

```
Japanese woman, black hair, brown eyes, 168cm, slender
```

Not:

```
beautiful, elegant, mysterious Japanese woman with flowing black hair...
```

*See also: [YAML Prompt Source-of-Truth Pattern](yaml_prompt_source_of_truth_pattern.md) — [Prompt Lifecycle Design Rationale](prompt_lifecycle_design_rationale.md)*

-----

## Minimum Requirements

The human-approved minimal source input that defines the intended character, scene, or output.

**Design Rationale:** Before any prompt is written, a human must define what is required. Minimum Requirements is not a prompt; it is the source of authority from which all prompts are derived. It emerged from the need to distinguish the human-approved intent `A` from the model-mediated reconstructions `A′` that follow.

**Identity Lifecycle phase:** Pre-prompt. The starting point of the entire prompt lifecycle.

**What it does not replace:** Nothing. It is itself the source state, not a replacement for any derived artifact.

**Prerequisites:** None. This is the first artifact in the lifecycle.

*See also: [Prompt Lifecycle Design Rationale](prompt_lifecycle_design_rationale.md)*

-----

## YAML Prompt

A structured, human-reviewable YAML file that serves as the source-of-truth for character identity, scene variables, prompt strategy, and workflow governance.

**Design Rationale:** The YAML Prompt emerged from the observation that natural-language prompts are lossy projections of human intent. When a character definition is converted into English prose, useful redundancy is removed, prohibitions are weakened, and priority relationships are collapsed. The YAML Prompt preserves the structured source state from which all natural-language prompts are derived.

**Identity Lifecycle phase:** Source state management. The YAML Prompt is the master specification; all other prompt forms are derived artifacts.

**What it does not replace:** The YAML Prompt is not a generation prompt by default. It is not a replacement for the Long Prompt, Minimal Prompt, or any other derived form. Natural-language prompts are projections of the YAML, not equivalents.

**Prerequisites:** Human-approved Minimum Requirements.

*See also: [YAML Prompt Source-of-Truth Pattern](yaml_prompt_source_of_truth_pattern.md) — [Translation Loss and the YAML-First Principle](column_translation_loss.md)*

-----

## Long Prompt

A full natural-language prompt used for initial identity establishment or re-convergence after drift.

**Design Rationale:** The Long Prompt emerged from the need to make A dense and explicit before the model forms A′. Without a sufficiently detailed initial prompt, C-mediated transformation may fill missing information with distributional defaults, producing a B′ that diverges from the intended B. The Long Prompt reduces missing information that C might otherwise fill in freely.

**Identity Lifecycle phase:** Identity establishment. Used for first generation and for re-convergence when drift has occurred.

**What it does not replace:** The Long Prompt is not a substitute for the YAML master. It is a derived artifact — a controlled projection of the YAML source state into natural language. It does not eliminate C.

**Prerequisites:** Human-approved YAML master or equivalent source state.

*See also: [Prompt Compression After Human-Approved Convergence](prompt_compression_after_human_approved_convergence.md) — [Prompt Lifecycle Design Rationale](prompt_lifecycle_design_rationale.md)*

-----

## Optimization Prompt

A shorter prompt created after observing the first generation result, used to correct specific observed drift while preserving the human-approved source state.

**Design Rationale:** The Optimization Prompt emerged from the need to correct drift in B′ without replacing or weakening the source state A. It is not a general quality improvement prompt. It targets only the specific deviations observed between A and B′, aiming to return the next generation toward the intended A.

**Identity Lifecycle phase:** Convergence adjustment. Used after first generation review, not before.

**What it does not replace:** The Optimization Prompt must not be used for first generation. It must not replace the Long Prompt or the YAML master. Correction must be aimed at returning to A, not simply improving image quality.

**Prerequisites:** Observed B′ and specific drift points must exist. The human-approved source state remains authoritative. Not for first-generation identity establishment.

*See also: [Prompt Compression After Human-Approved Convergence](prompt_compression_after_human_approved_convergence.md)*

-----

## Ultra-Compressed Prompt

A lightweight recall prompt used only after human-approved convergence exists, for returning toward an established identity state.

**Design Rationale:** The Ultra-Compressed Prompt emerged from the practical need to recall an established identity without repeating the full Long Prompt. It works because the convergence state, anchor image, and rejected-drift history already exist. Without those preconditions, it is insufficient for identity establishment.

**Identity Lifecycle phase:** Identity recall after stabilization. Used only after convergence has been achieved and human-approved.

**What it does not replace:** The Ultra-Compressed Prompt must not be used for first generation, identity recovery, new character creation, or unapproved scene change. It must not replace the YAML master or the Long Prompt. Compressed prompts are not initialization substitutes.

**Prerequisites:** Human-approved convergence state. Anchor image. Established convergence history. Compression safety review passed.

*See also: [Prompt Compression After Human-Approved Convergence](prompt_compression_after_human_approved_convergence.md) — [Prompt Lifecycle Design Rationale](prompt_lifecycle_design_rationale.md)*

-----

## Transition Prompt

A prompt used to move from one approved scene or sequence state to the next, while preserving the established identity.

**Design Rationale:** The Transition Prompt emerged from sequence-generation workflows where a character must move through a series of scenes without losing identity continuity. It differs from the Long Prompt in that it assumes convergence already exists and focuses on scene or state change rather than identity establishment.

**Identity Lifecycle phase:** Sequence continuation. Used after convergence is established and a new scene or state change is required.

**What it does not replace:** The Transition Prompt must not be used before convergence exists. It does not replace the Long Prompt for initial identity establishment. It does not replace the YAML master.

**Prerequisites:** Established and human-approved convergence state. Approved anchor image. Defined target scene or sequence state.

*See also: [Sequence PAL Case Analysis: Hana Wedding Series](sequence_pal_case_hana_wedding.md) — [Prompt Lifecycle Design Rationale](prompt_lifecycle_design_rationale.md)*

-----

## Identity Establishment

The workflow phase in which an initial human-approved convergence state is created for a character through prompt-guided generation, anchor formation, and identity gate validation.

**Design Rationale:** Identity Establishment is distinguished from Identity Recall because the two phases have different preconditions and prompt requirements. Before convergence exists, the workflow requires a Long Prompt and human approval at each generation step. After convergence, lighter recall mechanisms may be used.

**Identity Lifecycle phase:** Foundational. Must precede Identity Recall and Transition prompts.

**What it is not:** Identity Establishment is not a single generation event. It is a governed process that ends only when a human-approved anchor and convergence state have been validated through identity gates.

*See also: [Prompt Lifecycle Design Rationale](prompt_lifecycle_design_rationale.md) — [Quality Gate & Hard Abort](quality_gate_addendum.md)*

-----

## Identity Recall

The workflow phase in which a previously established identity state is re-invoked using a lightweight prompt and an approved anchor, without repeating the full identity establishment process.

**Design Rationale:** Identity Recall emerged from the observation that once a convergence state exists, re-establishing the full identity from scratch is unnecessary and risks introducing new drift. Recall assumes that the anchor, convergence state, and approved constraints are already available.

**Identity Lifecycle phase:** Post-convergence. Requires an established and human-approved convergence state as a precondition.

**What it is not:** Identity Recall is not identity recovery. If the convergence state has been lost or contaminated, recovery requires re-establishment, not recall. The Ultra-Compressed Prompt used for Identity Recall must not be used as an initialization substitute.

*See also: [Prompt Lifecycle Design Rationale](prompt_lifecycle_design_rationale.md) — [Prompt Compression After Human-Approved Convergence](prompt_compression_after_human_approved_convergence.md)*

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

A human-assessed similarity score between the anchor and a generated output.

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

If any gate fails → Hard Abort.  
No progressive correction permitted.

These are the minimal structural gates.

They may not detect all identity failures. In domains where style,
cultural frame, archetype register, costume state, sequence meaning,
or persona consistency are identity-critical, additional gates must be
defined by the operator.

*See: [Quality Gate Addendum](quality_gate_addendum.md)*

-----

## Hard Abort

The mandatory stop condition triggered when any quality gate or governance condition fails.

A contaminated generation or adoption cycle is terminated. Drifted outputs are discarded and are not allowed to propagate downstream.

Hard Abort is followed by purge, re-binding, and re-convergence from the last validated anchor state or governing condition.

-----

## Adoption / Rejection / Purge

CIP governance decisions applied after gate evaluation.

- **Adoption**: an output that passes all gates is accepted into the production workflow.
- **Rejection**: an output that fails one or more gates is discarded; Hard Abort is triggered.
- **Purge**: contaminated outputs and associated generation state are cleared before re-binding begins.

These distinctions ensure that drift does not propagate through accepted outputs and that the re-convergence cycle begins from a verified clean state.

-----

## Contamination

The accumulation of identity drift in a session’s context, caused by:

- Failed generations that were not discarded
- Continued generation after drift detection
- Excessive session length without re-anchoring

Contaminated sessions cannot be recovered by prompt adjustment.  
They must be abandoned and restarted with a clean anchor.

-----

## Reference-Based Generation

Generation conditioned on a reference image at inference time, without model modification. Examples include IP-Adapter, platform image prompting features, and similar systems.

Reference-based generation may improve visual resemblance or continuity. It does not constitute identity governance: it does not define failure conditions, Hard Abort, re-binding, adoption, rejection, purge, or auditability.

Reference guidance is not identity governance.

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

- Reconstruction variability (A → A′) accumulating across turns
- Optimization pressure from verbose prompts
- Session context degradation
- Insufficient anchoring frequency
- Model-side or execution-structure mediation that transforms A before B′ is produced

C — mediation that transforms A into A′, including model-side and execution-structure mediation — explains why drift occurs. It does not excuse unmanaged drift.

-----

## Cumulative Identity Divergence Coefficient / 累積別人化係数

A proposed CIP/PAL operational term for describing the accumulated degree to which A becomes “someone/something else” through repeated C-mediated transformations.

It applies when small deviations across prompts, generations, tools, sessions, or workflow stages accumulate until the resulting A′ or B′ no longer preserves the intended identity, role, meaning, or operational criterion of the original A.

This is not currently an established academic term or standardized metric. In CIP/PAL, it functions as a conceptual measure or diagnostic indicator of cumulative drift risk, rather than a fixed mathematical coefficient.

*Related: C Accumulation — Drift — A-continuity — Re-binding — Purge*

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

## Summary Assimilation

The tendency of AI systems to absorb immature but significant
observations into pre-existing explanatory frames
during summarization, abstraction, or reformulation,
thereby reducing the visibility of genuinely novel distinctions.

In the context of character consistency workflows,
Summary Assimilation causes operationally fragmented practices
to appear as a unified and already-solved system.
Unresolved control problems are presented as existing method
components, and genuinely important but still-unnamed distinctions
disappear into apparently adequate descriptions.

Summarization is useful. The problem is not summarization itself,
but the loss of governance-relevant distinctions that can occur
when AI-generated summaries are accepted without human review.
Human judgment after summarization is necessary to verify that
critical distinctions have not been absorbed or flattened.

CIP is in part a response to this tendency:
by naming distinctions explicitly,
it attempts to preserve their visibility
before they can be assimilated into familiar frameworks.

-----

## Cross-Platform Migration

The procedure for re-establishing a character identity on a different generative platform.

The anchor material functions as a platform-agnostic identity record that can be reintroduced into a different system as a reference input. Identity gates are re-applied in the new environment to confirm whether convergence has been achieved.

Recovery quality and the viability of subsequent sequential generation remain dependent on the capabilities of the target system — particularly its ability to preserve the anchor as a stable reference point across iterative updates. Cross-platform migration does not guarantee operational equivalence across platforms.

*See: [Case 04: Cross-Platform Migration — “Shizuka”](case_04_shizuka.md)*

-----

## PAL and CIP: Framework Relationship

PAL (Persistent Anchor Layer) and CIP (Character Identity Protocol) operate as two complementary layers of the same framework. PAL originally existed inside CIP, but was separated and expanded because its scope became broader.

**PAL handles:**

- generative continuity
- persistent anchoring across sessions
- anchor material availability at inference time

**CIP handles:**

- governance and validation
- gate-based stopping conditions
- Hard Abort, re-binding, re-convergence
- adoption, rejection, purge
- contamination control
- auditability

PAL alone does not constitute identity governance.
CIP alone does not provide persistent continuity infrastructure.

PAL supports continuity.
CIP governs adoption and failure handling.
Together, they form the continuity-governance stack.

*See: [PAL Hypothesis Document](pal_hypothesis.md) — [Column: PAL](column_pal.md)*

-----

## Re-Anchoring Principle

The operational principle that identity is not permanently preserved but must be periodically re-established through controlled re-convergence cycles.

Re-anchoring is triggered when:

- identity gate evaluation approaches failure
- session length approaches the Max Context Stability Threshold (MCST)
- Hard Abort has been executed

Re-anchoring restores the validated anchor condition and resets drift accumulation. It is a governance requirement, not an optional optimization.

-----

## Inter-PAL Conflict

A condition in which two or more PAL-registered anchor assets contain conflicting identity definitions for the same character or role.

Inter-PAL Conflict may occur during:

- cross-session migration between platforms
- version updates to anchor materials
- multi-operator workflows where anchor definitions diverge

Resolution requires explicit anchor governance: identifying the authoritative anchor, deprecating conflicting materials, and re-establishing a single verified convergence state.

*See: [PAL Hypothesis Document](pal_hypothesis.md)*

-----

## Anchor Preservation Governance (APG)

A governance structure responsible for preserving externally defined structured anchors under operational conditions.

APG defines four functions:

- **Rule checking**: evaluating outputs against anchor-defined identity criteria
- **Interpretive consistency monitoring**: detecting subtle shifts in identity register
- **Drift signal detection**: identifying accumulating deviation before gate failure
- **Governance decision**: determining adoption, rejection, or Hard Abort

APG is distinct from PAL (which manages anchor material availability) and from monitoring or guardrails (which may flag outputs but do not define structured recovery procedures).

*See: [PAL Hypothesis Document — Section 9.4, Section 15.6](pal_hypothesis.md) — [pal-lab/docs/glossary.md](https://github.com/watadani-byte/pal-lab)*