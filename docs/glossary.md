# Glossary: Character Identity Protocol

Core terms used throughout the documentation.

---

## Anchor

```
Anchor = Minimal Prompt + Previously Converged Output Image
```

A previously generated image that represents a known, high-quality solution state.  
Used as a constraint to bias future generation toward the same convergence point.

The image is **not** a reference or inspiration. It is a record of a solution the model has already found.

---

## Anchor Mechanism

The operational procedure of providing an anchor image alongside a minimal prompt to constrain generation toward a prior convergence state.

Distinct from image-to-image (which encourages variation) and seed fixing (which controls initial noise sampling only).

---

## Convergence / Convergence Point

The state at which a generative model's output stabilizes into a coherent, consistent result.

A "convergence point" is a location in the model's solution space where identity, structure, and rendering align with unusual precision.

The protocol does not force convergence — it biases the search space toward a previously achieved convergence point.

---

## Reconstruction (A→A')

The internal process by which a generative model interprets a prompt and reformulates it into a generation target.

```
User prompt (A) → Model's internal reformulation (A') → Generation
```

This stage is:
- Invisible to the user
- Not directly controllable
- The primary source of identity drift

The anchor mechanism constrains A→A' by supplying a high-information prior.

---

## Layer A / Layer B / Layer C

A theoretical abstraction of the generation process — not a claim about proprietary architecture.

| Layer | Function |
|-------|----------|
| A | Language interpretation |
| B | Reconstruction / optimization |
| C | Execution (latent sampling and rendering) |

Verbose prompts activate Layers A and B more strongly.  
Minimal prompts reduce pressure on Layers A and B, allowing the anchor to dominate.

---

## Minimal Prompt

A prompt containing only factual, identity-defining attributes — no adjectives, no mood descriptors, no compositional instructions.

Purpose: to reduce optimization pressure from the model's training priors, preserving the convergence state established by the anchor.

Example:
```
Japanese woman, black hair, brown eyes, 168cm, slender
```

Not:
```
beautiful, elegant, mysterious Japanese woman with flowing black hair...
```

---

## Match Rate

A human-assessed similarity score between the anchor image and a generated output.

Evaluated across three dimensions:
- **FaceGate** — facial identity consistency
- **SkeletonGate** — skeletal proportion and alignment
- **ProportionGate** — overall body proportion

Operational threshold: **90% minimum**.  
Below threshold → session abort.

Match rate is a human judgment, not an automated metric.

---

## Quality Gate

The set of validation conditions that must all pass before a generation is accepted.

```
PASS = FaceGate ∧ SkeletonGate ∧ ProportionGate
```

If any gate fails → hard abort.  
No progressive correction permitted.

*See: [Quality Gate Addendum](quality_gate_addendum.md)*

---

## Hard Abort

The mandatory stop condition triggered when any quality gate fails.

The session is terminated. Contaminated outputs are discarded.  
No continuation, no correction, no exception.

---

## Contamination

The accumulation of identity drift in a session's context, caused by:
- Failed generations that were not discarded
- Continued generation after drift detection
- Excessive session length without re-anchoring

Contaminated sessions cannot be recovered by prompt adjustment.  
They must be abandoned and restarted with a clean anchor.

---

## UID (Unique Identifier)

A stable name or label assigned to a character's converged state.

Purpose: enables cross-session recall without re-providing the full anchor each time.  
Example: "Model Hana", "Model A", "Shizuka"

The UID is derived from the character's visual qualities — not assigned arbitrarily.

---

## Identity Drift

The gradual deviation of generated outputs from the established character identity across turns.

Caused by:
- Reconstruction variability (A→A') accumulating across turns
- Optimization pressure from verbose prompts
- Session context degradation
- Insufficient anchoring frequency

---

## Cross-Platform Migration

The procedure for re-establishing a character identity on a different generative platform.

The anchor image functions as a platform-agnostic identity record.  
The character's convergence state can be recovered on any system capable of image-guided generation.

*See: Case 04 documentation (publication pending)*
