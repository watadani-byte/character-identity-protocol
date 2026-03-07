# Character Identity Drift in Generative AI

## From Sakuga Collapse to the Character Identity Protocol

> This article is observational and conceptual in nature.
> Statements about generative model behavior are based on operational practice rather than controlled laboratory measurement.

-----

## Introduction

Anyone who has watched animation long enough has seen a familiar phenomenon.

A character appears perfectly drawn in one scene — the correct face, proportions, and expression.
In the next scene, something feels subtly wrong. The character technically resembles the original, yet the impression has changed. The face looks slightly different. The proportions feel off. The character seems like someone else.

In Japanese animation culture, fans often call this *sakuga collapse* — drawing collapse.

In this article we use a broader technical term for the same underlying phenomenon: **identity drift**.
Identity drift occurs when the visual identity of a character changes across images even though the character is intended to remain the same.

While sakuga collapse originates from animation production, identity drift appears prominently in modern generative AI systems as well.

This article traces that problem from its familiar form in animation — sakuga collapse — to its modern manifestation in generative systems as identity drift, and finally to operational responses such as the Character Identity Protocol (CIP).

-----

## The Same Prompt, a Different Character

Users of generative image models quickly encounter an unexpected behavior.

You generate an image of a character.
It looks perfect — exactly the identity you wanted.

You run the same prompt again.

The result is different.

The face changes slightly.
The proportions shift.
The character still resembles the description, but the identity is no longer the same.

This phenomenon is what we call identity drift.

The reason lies in how generative models operate.
Images are reconstructed probabilistically from learned training distributions. Even with identical prompts, the internal reconstruction process may converge on different identity outcomes.

-----

## Can Identity Drift Be Measured?

A natural response is to attempt measurement.

Various similarity metrics exist for comparing generated images:

- CLIP similarity
- LPIPS perceptual distance
- face embedding similarity
- structural similarity indices

These metrics can detect signals of visual similarity.

However, they do not fully capture character identity perception.

Two images may score highly similar according to numerical metrics while still appearing to represent different characters to a human observer. Conversely, two images that appear to depict the same character may exhibit measurable feature differences.

One reason is that human perception of identity is holistic.
We recognize faces and characters through the configuration of many visual cues simultaneously, while most similarity metrics compare limited sets of visual features.

In other words:

> AI metrics can detect signals of drift, but they cannot fully determine identity judgment.

-----

## The Tolerance Problem

In many engineering disciplines, tolerance is treated as tolerance.

If a component falls within the allowed range of a specification, it is considered acceptable. A measurement of 10.00 ± 0.05 mm treats 9.97 mm and 10.03 mm as equally valid outcomes.

Character identity perception behaves differently.

Small visual changes can produce a strong perception of “someone else.”
Human face perception is known to be extremely sensitive to structural differences, which is why even subtle variations can cause a character to appear like a different person.

This is precisely what audiences recognize in animation as sakuga collapse, or identity drift.

The character may resemble the reference drawing.
Yet the identity feels wrong.

Identity perception is not governed by simple tolerance ranges.

-----

## The Prompt Myth

When stable character results appear in generative AI systems, many observers assume the existence of a secret prompt.

The reasoning appears intuitive:

```
Stable output
→ must come from a special prompt.
```

However, in practice, long and highly detailed prompts often introduce instability rather than stability.

Each additional instruction constrains the model’s reconstruction process.
If those constraints push the model toward sparsely represented regions of the training distribution, instability becomes more likely.

This raises an interesting question:

If longer prompts are not necessarily more stable, what explains the rare moments when a character appears perfectly stable?

-----

## The “Miracle Image”

Many practitioners of generative AI have experienced the following situation.

A generated image appears that feels exactly right.
The face, proportions, and overall presence of the character align perfectly with the intended identity.

Users often save this image carefully, assuming that running the same prompt again will reproduce the result.

The next day, they try again.

The result is different.

The previous image was not a deterministic output.
It was a momentary convergence — what some practitioners informally call a “miracle image.”

From the perspective of generative models, such images can be interpreted as transient local optima within the model’s reconstruction space.

The difficulty is not creating the miracle image once.

The difficulty is maintaining that identity afterward.

The central problem therefore becomes operational: once a converged identity appears, how can that state be preserved across subsequent generations?

One clue comes from an unexpected place: the behavior of extremely simple prompt tokens.

-----

## Why “1girl” Works

A useful example of prompt behavior is the token:

```
1girl
```

This term originates from tagging systems such as Danbooru, where it simply indicates that a single female character appears in the image.

Originally, the meaning is purely descriptive:

```
1girl = one female character in the image
```

However, because such tags are frequently attached to illustrations depicting central characters, many training datasets associate `1girl` with typical character portraits.

As a result, generative models often treat `1girl` as a strong anchor for producing a central female figure.

This illustrates an important principle:

> Stable prompts often correspond to dense regions of the training distribution, rather than highly detailed textual descriptions.

In other words, stability often comes from navigating the training distribution, not from writing increasingly complex prompts.

-----

## Identity Is Not a Prompt Problem

These observations suggest that character stability may depend less on prompt complexity and more on how generation is governed during production.

If identity drift is inevitable in probabilistic reconstruction systems, then stability requires an operational response.

The core questions become:

- How do we detect identity drift?
- When should generation stop?
- How do we restore the correct identity state?

-----

## From Observation to Protocol

These questions motivated the development of the Character Identity Protocol (CIP).

CIP is an identity governance protocol for generative systems.

CIP does not attempt to force identity stability through prompt complexity.
Instead, it governs the generation process through a structured operational loop.

```
Anchor Image
+ Minimal Prompt
→ Generation
→ Identity Gates
→ Hard Abort if drift occurs
```

In this framework:

- similarity metrics act as drift signals
- human observers remain the final identity authority

This separation is necessary because identity recognition involves holistic judgment that cannot be fully reduced to feature comparisons.

-----

## Figure 1 — Identity Drift Control Loop

```
          Anchor Image
               │
        Minimal Prompt
               │
               ▼
        Image Generation
               │
               ▼
        Identity Gates
  (Face / Skeleton / Proportion)
               │
        ┌──────┴──────┐
        │             │
        ▼             ▼
      PASS           FAIL
        │             │
        │        Hard Abort
        ▼             │
 Continue Cycle       │
        └──── Re-bind Anchor ───┘
```

*CIP treats character identity stability as an operational control problem within generative systems. Anchor images define the target identity state, while identity gates detect drift and trigger re-binding when necessary.*

-----

## Looking Forward

Research into automated identity evaluation continues.

Current challenges include bridging the gap between similarity metrics and human identity perception, as well as developing reliable methods for anchor selection and identity stability measurement.

Until these problems are better understood, operational governance remains necessary.

Protocols such as CIP attempt to formalize this operational layer, providing a structured method for managing identity stability in probabilistic generative systems.

Because when identity drift occurs, the result is instantly recognizable — not to algorithms, but to people.

-----

*See also: [Miracle Images and Convergence Behavior](column_miracle_image.md) — [Technical Mechanism](technical_mechanism.md) — [White Paper](whitepaper_v1.md)*