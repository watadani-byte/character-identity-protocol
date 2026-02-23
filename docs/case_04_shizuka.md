# Case 04: Cross-Platform Character Migration — “Shizuka”

> All case studies are observational logs from real production workflows.
> Results may vary by model version and configuration.

**Scenario**: Recovery and migration of a “lost” character from Stable Diffusion to ChatGPT (GPT Image 1.5)  
**Platform**: Stable Diffusion (source) → ChatGPT / GPT Image 1.5 (target)  
**Protocol**: Anchor-based recovery + Recovery Framing  
**Result**: High-fidelity identity recovery confirmed (human-judged baseline comparison) across platform architecture change

-----

## Character Credit

Character “Shizuka” original design by **あーる @AIアートグラファー** ([@REd8358](https://x.com/REd8358))

> あーる @AIアートグラファー is a Japan-based AI illustrator known for photorealistic AI art of exceptional quality, with a distinctive character worldbuilding style centered on original characters (Nagi / Rei / Kana / Rio). Their work commands a following of over 18,000 on X.

*Published with permission of the original creator.*

-----

## What This Demonstrates

A character originally generated in Stable Diffusion had become “lost” — the original prompt no longer reproduced the same result consistently.

This case demonstrates that a character identity can be recovered and re-established on a completely different platform through the anchor-based recovery procedure, without access to the original generation parameters.

The platform architecture difference (Stable Diffusion → ChatGPT / GPT Image 1.5) did not prevent convergence.

-----

## Reproducibility Note

Migration results may vary depending on:

- Stylistic domain distance between source and target platform (illustration → photorealistic)
- Anchor image quality
- Prompt precision

Cross-platform migration is classified as **Experimental** in the [Reproducibility Scope](reproducibility_scope.md).

-----

## The “Lost Character” Problem

Identities become lost through:

- Session context expiration
- Model version updates
- Prompt drift across iterations
- Platform migration

The original prompt no longer yields the same result. Increasing prompt detail makes it worse — not better.

-----

## Recovery Procedure

### Step 1: Anchor Preparation

The last known high-identity image was identified and used as the convergence anchor.

Key requirement: the image must represent the character at a high-identity state — not a draft, not an approximation.

### Step 2: Gap Analysis and Recovery Framing

The original prompt was compared against the anchor image.

Instruction to the model:

> *The attached image was successfully generated once using the prompt below, but the character is now lost. Close the gap between the prompt and the image as much as possible to maximize recall probability. Generate.*
> 
> （添付画像は下記プロンプトで一度は生成に成功しましたが迷子になっています。プロンプトと画像の差分を可能な限り埋めて呼び出しの可能性を上げて下さい。）

From a structural perspective, the original prompt no longer reconstructed into the same internal generation target (A → A’). The anchor constrained reconstruction toward the previous solution basin, reducing divergence.

**Why “Recovery” framing matters:**

- “Recreate” → generate something similar → variation is acceptable
- “Recover” → return to a specific prior state → convergence is required

### Step 3: Identity Confirmation

Upon generation, output was compared against the anchor image.  
Confirmation: visual identity match confirmed. Character recovered.

### Step 4: Identifier Assignment

Name-based identifier “Shizuka” (静) assigned — derived from the character’s visual qualities rather than imposed arbitrarily.

The name reflects her defining trait: a constant quiet smile, never intrusive.

> *She always wears a quiet smile, but never imposes. The kind of presence that makes you wonder if she’ll even acknowledge you.*
> 
> （彼女は常に静かに笑顔を浮かべてますが介入してきません。）

### Step 5: Character Design Sheet

A character design sheet was generated to consolidate identity into a single reference document.

### Step 6: Registration and Cleanup

- Finalized prompt extracted and recorded
- Character registered under identifier “Shizuka”
- Contaminated intermediate generations purged
- Session chat discarded

> *So she can find her way home. Shizuka must never get lost again.*
> 
> （静が二度と迷子にならない様に。）

-----

## Analysis

|Metric             |Result                                          |
|-------------------|------------------------------------------------|
|Source platform    |Stable Diffusion (SDXL)                         |
|Target platform    |ChatGPT (GPT Image 1.5)                         |
|Recovery method    |Anchor image + Recovery Framing                 |
|Identity confirmed |Yes — human-judged match against anchor baseline|
|Style shift        |Illustration → semi-photorealistic (expected)   |
|Re-anchoring events|0                                               |
|Session outcome    |Character registered, session discarded         |

**Key finding**: Cross-platform identity recovery is achievable through anchor-based convergence without access to original generation parameters. Style domain shift is expected and does not constitute identity failure.

-----

## Why This Works

The anchor image encodes a previously achieved solution state, independent of the platform that generated it.

When provided to a different platform:

- The model statistically biases toward the anchor as a high-density reference state
- The minimal prompt reduces reinterpretation pressure
- The model converges toward the anchor rather than generating freely

### Structural Interpretation

In migration, the original prompt no longer mapped directly to the same latent basin. The target platform reconstructed A into a different A’. The anchor constrained reconstruction toward the previous solution state — redirecting the model’s optimization rather than overriding it.

Recovery framing reduces reconstruction freedom by introducing a previously validated target state. This is the operational mechanism behind cross-platform convergence.

This protocol does not extract latent parameters or reverse-engineer proprietary models.

> Optimization never disappears. It is redirected toward a validated baseline.

-----

## Source

- [Original session log with images (PDF)](https://github.com/watadani-byte/character-identity-protocol/releases/download/v0.1/Shizuka_Migration.pdf) — Japanese, full resolution
- Character “Shizuka” original design by **あーる @AIアートグラファー** ([@REd8358](https://x.com/REd8358)) — published with permission

-----

## Related

- [Case 01: Baseline Failure](case_01_failure_log.md) — no protocol
- [Case 06: Serendipitous Creation](case_06_README.md) — same minimal prompt structure produced new character
- [Technical Mechanism](technical_mechanism.md) — how anchor control works
- [Reproducibility Scope](reproducibility_scope.md) — cross-platform validation status
