# CIP White Paper — Appendices

## Appendix A — Operational Terminology

The Character Identity Protocol introduces several operational concepts used throughout this document.

These terms describe observed behaviors in probabilistic generative systems and should be interpreted as **operational definitions**, not claims about internal model architecture.

-----

### Anchor

A previously validated output image used as the **identity reference state** for reconstruction.

The anchor is not an inspiration image or design reference.  
It represents a previously validated **solution state** within the model’s reconstruction space.

-----

### Convergence State

A generation output exhibiting stable identity characteristics relative to a reference anchor.

In CIP terminology, identity persistence is achieved when the model repeatedly reconstructs outputs within the **same convergence region** of the reconstruction space.

-----

### Identity Drift

Deviation of generated outputs from the anchor identity across generation turns or sessions.

Drift may occur in multiple dimensions including:

- facial structure
- skeletal configuration
- global proportions
- rendering regime
- contextual accumulation

The taxonomy of these deviations is defined in **Section 2.6 (Identity Drift Taxonomy)**.

-----

### Hard Abort

Immediate termination of a generation cycle when identity validation gates fail.

Hard Abort prevents propagation of contaminated states and forces recovery through anchor re-binding.

-----

### Re-binding

Re-injection of the last verified anchor into a new generation cycle following drift detection or session reset.

This procedure restores the model’s reconstruction process to a known convergence region.

-----

### Bounded Generation Cycle (BGC)

A controlled generation window within which identity stability is monitored.

A BGC begins at anchor injection and ends when:

- drift exceeds acceptable thresholds
- a Hard Abort is triggered
- the context window approaches the MCST boundary

-----

### Max Context Stability Threshold (MCST)

The practical upper limit of identity stability within a context-bound generation environment.

MCST is not a fixed constant.  
It varies depending on model architecture, context size, sampling configuration, and prompt entropy.

-----

## Appendix B — Operational Characteristics of Modern Image Generation Systems

This appendix summarizes commonly observed operational behavior across modern image generation systems.

These characteristics help explain why CIP introduces anchor-based convergence control, identity gates, and hard-abort discipline.

> This appendix documents operational observations. It does not claim access to proprietary model internals or architectural specifications.

-----

### 1. Non-Deterministic Generation

Image generation models operate as probabilistic systems.

The same prompt does not guarantee the same output.

Contributing factors include:

- latent sampling
- diffusion noise initialization
- probabilistic decoding

As a result, identical prompts may produce different faces, poses, compositions, or lighting conditions across generations.

**CIP relevance:**  
This property motivates anchor-guided convergence.  
The anchor supplies a previously validated identity state, increasing the probability that reconstruction returns to a known stable region.

-----

### 2. Independent Generation Cycles

Image generation should be treated as a series of independent reconstruction cycles.

Important constraints must therefore be restated in each generation turn.

Example constraint structure:

```
Change only the background.
Keep the subject's face, clothing, and pose unchanged.
```

If constraints are not restated, the model may reinterpret the scene freely.

**CIP relevance:**  
This behavior motivates cycle-based stabilization and the minimal prompt principle.  
CIP treats each generation cycle as an independent convergence window requiring explicit anchor re-injection.

-----

### 3. Image Inputs Are Reconstructed

When images are used as inputs, they are not directly copied.

Instead, they are reconstructed through internal representations:

```
Image Input → Internal Representation → Reconstructed Output
```

Because of this reconstruction process, facial details, clothing, and pose may shift between input and output.

Reference images guide reconstruction rather than enforcing exact duplication.

**CIP relevance:**  
This explains why anchor images function as convergence attractors rather than copy templates.  
CIP exploits this reconstruction behavior by supplying a previously converged image as the primary identity reference.

-----

### 4. Rendering Bias Toward Photorealism

Many image generation systems exhibit a tendency toward photorealistic rendering when explicit style constraints are not provided.

Observed drift pattern in practice:

```
anime → semi-realistic → photorealistic
```

Explicit style instructions help stabilize the rendering regime.

Examples of stabilizing instructions:

- anime-style illustration
- fictional character

**CIP relevance:**  
This pattern corresponds to **Rendering Regime Drift**, one of the drift modes defined in the Identity Drift Taxonomy.

In style-defined identity domains, rendering regime stability forms part of identity and is governed under the same gate discipline.

-----

### 5. Platform Observations

Different platforms provide different operational interfaces but exhibit broadly similar reconstruction behavior.

**Typical capabilities:**

- text-to-image generation
- reference image guidance
- iterative editing workflows
- instruction-based modification

Example instruction patterns:

```
Change the background to sunset.
Add fog behind the character.
Make the lighting warmer.
```

Reference images guide edits but do not guarantee exact identity reproduction.

**CIP relevance:**  
Across platforms, reference images guide reconstruction rather than enforce duplication.  
CIP’s anchor mechanism is designed to function within these constraints by exploiting convergence behavior rather than requiring platform-specific controls.

-----

### Summary

|Observed Characteristic           |CIP Response                              |
|----------------------------------|------------------------------------------|
|Non-deterministic generation      |Anchor-guided convergence                 |
|Independent generation cycles     |Cycle-based stabilization + minimal prompt|
|Image inputs are reconstructed    |Anchor as convergence attractor           |
|Rendering bias toward photorealism|Rendering Regime Drift detection via gates|
|Platform variation                |Model-agnostic operational protocol       |

-----

*See also: [Technical Mechanism](technical_mechanism.md) — [Architecture Diagram](architecture_diagram.md)*