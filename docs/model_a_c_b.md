# Why Generative AI Does Not Execute Your Input

Most people assume generative AI works like this:

> A → B

You provide an input. The system produces the intended output.

This model is incorrect.

-----

## The Correct Model

What actually happens is:

```
A → (A + C) → B′
```

Where:

|Symbol|Meaning                                                                                            |
|------|---------------------------------------------------------------------------------------------------|
|A     |User input (prompt, instruction, request)                                                          |
|C     |Internal constraint — optimization pressure, training priors, compression, and constraint rewriting|
|B     |Intended output (what the user expects)                                                            |
|B′    |Actual output (what the system produces)                                                           |

The system does not execute A directly.

It internally rewrites A under the influence of C — including omission, compression, and structural redefinition of constraints — producing B′, which may deviate from B.

**B′ ≠ B** is not a malfunction. It is the expected behavior of a system operating under internal constraints.

> **Note on notation:** In the CIP technical documentation, the internally rewritten state is also referred to as A′ (A-prime), where A′ = A + C. The two notations describe the same phenomenon at different levels of abstraction: A → (A + C) → B′ explains *why* the rewriting occurs; A → A′ → B′ describes *what* the internal state is.

-----

## Why C Must Be Introduced

Without C, the model cannot explain observed behavior.

Generative systems are trained to optimize across a large distribution of inputs. When they receive A, they do not treat it as a fixed specification. They interpret it — compressing, reweighting, and reconstructing it — according to patterns learned during training.

This interpretation process is C.

C is not visible to the user. It cannot be directly controlled. But it is always present, and it always shapes B′.

-----

## A Concrete Example

A user prompts a text-to-image model with:

> “A woman looking over her shoulder at the camera.”

The intended output B includes: full body, turned posture, eye contact.

The actual output B′ shows: head and shoulders only, forward-facing, no eye contact.

The model compressed the compositional instruction under C — defaulting toward a common training pattern (portrait framing) rather than executing A as specified.

In this case, limb and posture information were not simply ignored — they were structurally removed during internal reconstruction.

The user wrote A. The model generated B′. The gap between them is C.

-----

## Conclusion

The difference between B and B′ can be understood as drift — a structural deviation introduced during internal reconstruction.

Character consistency, instruction following, and output reliability are all affected by C.

Understanding this model is the first step toward controlling it.