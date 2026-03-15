# Writing Prompts for Image Generation

> This article is practical and introductory in nature.
> Statements about generative model behavior are based on operational practice rather than controlled laboratory measurement.

-----

Image generation prompts follow the same basic principles as general prompts,
but the elements are mapped slightly differently.

For image generation models, prompts typically contain four major types of information:

- Subject
- Style
- Details
- Constraints

These elements correspond to the visual signals that the model uses when constructing an image.

-----

## Basic Structure of Image Prompts

```
Subject (Main object or scene)
        ↓
Style (Visual style)
        ↓
Details (Additional visual elements)
        ↓
Constraints (Restrictions or exclusions)
```

Image models interpret prompts by combining these signals to construct a visual result.

Providing clear signals helps the model understand the intended image and improves generation stability.

-----

### Subject

The Subject defines the main object or scene in the image.

**Example:**

```
Subject:
A young woman standing in a café
```

The subject establishes the core visual concept of the image.

-----

### Style

The Style determines how the image should be rendered.

**Example:**

```
Style:
Anime-style illustration
```

Style influences the visual appearance of the subject, including rendering style, artistic influences, and overall aesthetic.

-----

### Details

Details describe additional visual elements that enrich the scene.

**Example:**

```
Details:
Warm lighting
Wooden counter
Coffee cup
```

Details provide context and help guide the model toward the intended visual atmosphere.

-----

### Constraints

Constraints define restrictions or elements that should be avoided.

**Example:**

```
Constraints:
No text
No watermark
```

Constraints reduce the probability of unwanted elements appearing in the generated image.

-----

## Why This Structure Works

Image models interpret prompts by combining signals such as:

- subject
- style
- attributes
- constraints

These signals are interpreted internally and used to guide the image generation process.

Clear and structured prompts make it easier for the model to reconstruct the intended scene.

-----

## Character Consistency Changes Prompt Design

GPT Image, Stable Diffusion, and Midjourney are general image generation systems.
They can support character consistency through references, editing workflows, or additional techniques, but they do not inherently guarantee persistent character identity across generations.
Therefore, when the goal is character consistency rather than single-image quality, prompt design and prompt order must change.

-----

## Character Generation Prompt

When generating a consistent character, the order of information can influence stability.

A commonly used structure is:

1. Character identifier
1. Body type / hairstyle
1. Pose / gaze
1. Clothing / facial expression
1. Background / atmosphere

```
Character Identifier
        ↓
Body Type / Hairstyle
        ↓
Pose / Gaze
        ↓
Clothing / Expression
        ↓
Background / Atmosphere
```

Placing identity-related information early in the prompt helps the model maintain consistent character features.

-----

## Full Scene Generation Prompt

When generating a full scene rather than recalling a character, a slightly different order can be more effective.

1. Character identifier
1. Background / scene
1. Subject
1. Key details
1. Constraints

This order allows the model to establish the scene context first and then place the subject within that context.

```
Character Identifier
        ↓
Background / Scene
        ↓
Subject
        ↓
Key Details
        ↓
Constraints
```

This structure encourages the model to construct the environment before generating the main subject.

-----

## Additional Notes

- Use multi-image input only when necessary.
- Avoid excessively verbose prompts, which may cause model deviation or unintended stylistic shifts.
- A practical approach is to start with a more realistic base and then shift toward an anime style in the final stage.

If the recall prompt and the final generation prompt conflict:

- explicitly describe the transition
- generate once
- treat the resulting image as the new fixed state

-----

## Prompt Design Principles

Structure prompts as:

```
Background / Scene
→ Subject
→ Key Details
→ Constraints
```

Recommended practices:

- Avoid long paragraphs.
- Use labeled segments to clarify the role of each part.
- Prefer concrete visual signals (camera, lighting, composition) instead of abstract terms such as “high quality.”
- Perform iterations with small differences.
- If drift occurs, re-specify the important elements.

-----

## Operational Rules

### Character Recall Prompt

Prompt order for stabilizing a character:

```
Character identifier
→ Core physical traits
→ Stable attributes
→ Minimal background
→ Constraints
```

This prompt reconstructs the character before generating a full scene.

-----

## Summary

Image generation prompts share the same underlying logic as general prompts.

The key difference is that image models rely on visual signals — subject, style, details, and constraints — rather than semantic instructions.

Structuring prompts clearly and placing identity-critical information early helps the model reconstruct the intended image more reliably.

-----

*See also: [A Simple Structure for Writing Prompts](column_prompt_structure.md) — [How Generative AI Actually Behaves](column_how_generative_ai_behaves.md) — [Identity Drift in Generative Image Models](column_identity_drift_practical.md)*