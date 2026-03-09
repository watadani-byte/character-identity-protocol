# Character Drift Taxonomy

> This document is observational and technical in nature.
> Statements about generative model behavior are based on operational practice rather than controlled laboratory measurement.

-----

Generative image models often fail to reproduce the same character consistently.
Even when prompts remain identical, generated characters may change across generations.

This phenomenon can be understood as **character drift**.

This document provides a taxonomy of common drift types observed in practice and explains their underlying statistical causes.

-----

## Drift Types

### 1. Identity Drift

Identity Drift occurs when a generated character becomes a different individual despite identical prompts.

<!-- [Image: Identity Drift comparison] -->

*The visual identity of the character changes even though the prompt remains constant.*

-----

### 2. Age Drift

Age Drift occurs when the perceived age of a character changes because contextual cues such as clothing or pose activate different statistical associations in the training distribution.

<!-- [Image: Age Drift comparison] -->

*Clothing and expression may shift the statistical interpretation of age.*

-----

### 3. Eye Color Drift

Eye Color Drift occurs when eye color varies across generations because color attributes are represented as probabilistic clusters rather than discrete values.

<!-- [Image: Eye Color Drift comparison] -->

*Color categories such as brown, amber, and hazel often exist within the same statistical cluster.*

-----

### 4. Proportion Drift

Proportion Drift occurs when skeletal proportions change because body geometry is inferred from statistical body-type clusters rather than fixed parameters.

<!-- [Image: Proportion Drift comparison] -->

*Body geometry is not fixed and may converge toward different body-type clusters.*

-----

### 5. Style Drift

Style Drift occurs when rendering shifts toward a different visual style, often because models regress toward higher-density stylistic regions such as photorealism.

<!-- [Image: Style Drift comparison] -->

*Photographic imagery typically dominates training distributions, making stylistic regression common.*

-----

### 6. Background Drift

Background Drift occurs when environmental context changes because background elements are weak constraints compared to the primary subject.

<!-- [Image: Background Drift comparison] -->

*Backgrounds are often treated as secondary context and therefore change easily.*

-----

### 7. Rendering Collapse

Rendering Collapse occurs when structural coherence breaks down during image reconstruction, producing distorted anatomy or unstable geometry.

<!-- [Image: Rendering Collapse comparison] -->

*Certain structures such as hands, glasses, or background figures are particularly unstable.*

-----

## Taxonomy

The following taxonomy summarizes common forms of character drift observed in generative image workflows.

```
Character Drift
│
├─ Identity Drift
├─ Age Drift
├─ Eye Color Drift
├─ Proportion Drift
├─ Style Drift
├─ Background Drift
└─ Rendering Collapse
```

Most forms of character drift occur when generation shifts toward high-density regions of the training distribution.

-----

## Training Distribution Density

Most forms of generative drift are not random failures.
They occur when the model regresses toward high-density regions of the training distribution.

Generative models reconstruct images from learned statistical distributions.

When the generation process becomes uncertain, the model tends to shift toward regions of the distribution where training examples are dense.

These high-density regions represent the model’s statistical “common sense.”

As a result, unusual prompts or unstable conditions often lead the generation back toward more common visual patterns.

This statistical regression explains many forms of character drift observed in generative image systems.

-----

## Core Observation

> Generative models are most stable in high-density regions of the training distribution.
> When generation becomes uncertain, outputs tend to regress toward those regions.

This statistical tendency explains many forms of character drift.

-----

*See also: [Identity Drift in Generative Image Models](column_identity_drift_practical.md) — [Character Identity Drift in Generative AI](column_identity_drift.md) — [White Paper](whitepaper_v1.md)*