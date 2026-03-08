# Before Consistent Characters

> This article is observational and reflective in nature.
> Statements about generative model behavior are based on operational practice rather than controlled laboratory measurement.

-----

## The Early Days

In the early days of generative image AI, creators often talked about generating “the same character.”

On forums like Reddit, people experimented with many techniques:

- Reusing long, highly detailed prompts
- Giving characters specific names
- Keeping generation within the same chat session
- Sharing seed values

But even with the same prompt, the result was rarely the same person.

The face changed.
The proportions changed.
Sometimes the entire character changed.

Creators gradually discovered something frustrating:

> Prompts describe appearance — they do not preserve identity.

-----

## The “Miracle Shot”

Most creators eventually experienced the same moment.

You generate an image.

Everything is perfect — the face, the proportions, the presence.

You save the image.

The next day, you try the same prompt again.

The character is gone.

The community often described this as “losing the character.”
In practice, it was the loss of identity continuity.

-----

## What Artists Actually Wanted

The real goal was never just to generate a good image.

Artists wanted something else.

They wanted a character who could act.

The same character appearing in different poses.
Different gestures.
Different emotions.

Like an actor performing across multiple scenes.

But generative models do not preserve identity by default.
Each generation is a new reconstruction.

So the moment a pose changed, the character often changed as well.

Below is an example of what creators often wanted to achieve: the same character appearing across multiple poses and gestures.

*Example: the same character appearing across multiple poses and gestures. Without identity stability, sequences like this often collapse into different characters.*

-----

## An Unusual Workflow

My own workflow at the time was somewhat unusual and probably not representative of typical community practice.

While many creators tried to stabilize characters through increasingly detailed prompts, I moved in the opposite direction.

Once a generation produced the “right” character, I stopped trying to recreate it with text.

Instead, I treated that image itself as the character.

From that point on, the goal was no longer to regenerate the character, but to let that same character appear in different poses, gestures, and emotions.

Looking back, this was essentially the first form of what would later become the anchor concept.

-----

## Community Solutions

Over time, the community explored several technical solutions to the same problem.

Techniques such as LoRA training, DreamBooth, seed control, and reference-image features (like Midjourney’s `--cref`) all attempted to stabilize identity.

These approaches generally worked by either:

- modifying the model itself, or
- injecting additional signals into the generation process

While effective in many cases, they often required model-level intervention or platform-specific features.

These solutions improved identity stability, but they were often tied to specific tools, training pipelines, or platform features.

However, these methods addressed identity stability through model control or feature-specific mechanisms, rather than through a general operational workflow.

-----

## From “Same Character” to Identity Governance

A different possibility gradually became clear.

Instead of trying to recreate the character through prompts, what if the correct image itself became the reference?

The moment the “right character” appears, that image becomes the anchor.

Not a prompt.
Not a description.

An image.

This idea eventually led to the Character Identity Protocol (CIP).

CIP does not attempt to control the internal workings of generative models.

Instead, it introduces an operational layer that governs identity continuity during generation.

This layer relies on:

- Anchor images
- Minimal prompts
- Validation gates
- Hard abort conditions

Generative models are probabilistic systems.
Each generation is a reconstruction, not a retrieval.

Without explicit control mechanisms, identity does not persist automatically.
Even small changes in pose, lighting, or composition can cause identity drift.

CIP therefore treats identity not as a stylistic detail, but as a governance constraint applied to the generation process.

-----

## The Core Principle

In probabilistic generative systems, identity does not persist by accident.

**It must be governed.**

-----

*See also: [Character Identity Drift in Generative AI](column_identity_drift.md) — [Miracle Images and Convergence Behavior](column_miracle_image.md) — [White Paper](whitepaper_v1.md)*