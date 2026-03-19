# Why Your Character Keeps Changing

*This is a simple experiment you can run in under 5 minutes.*

## The Assumption

Same prompt. Same settings. Same character.

That is the assumption most people start with. And it seems reasonable — if you describe a character precisely enough, the model should produce the same face, the same proportions, the same presence.

Run it a second time.

The character is different.

-----

## The Experiment

Here is a simple test you can run yourself.

Take a character description. Write it as a single long prompt — all attributes in one block.

Run it twice, with the same seed, the same checkpoint, the same composition settings.

Now write the same character differently. Separate the identity from the scene. Put the character attributes first. Put the environment last.

Run both setups. Compare the results.

You may notice something.

*(A simple workflow for this test is provided below.)*

-----

## What You Will See

The faces are not exactly the same.

Not dramatically different — but not the same either. The jawline shifts slightly. The eye spacing is a little different. The hair falls in a different direction.

Run it ten times. The differences accumulate.

In some cases, after enough generations, the character begins to feel like a different person. The name is the same. The description is the same. But the identity has drifted.

This is not a failure of the model. It is how the model works.

This is not a strict rule, but an observed pattern.

-----

## The Question

If everything is the same — the prompt, the seed, the settings — why is the character not the same?

Hold that question for a moment before reading the next section.

-----

## What Is Actually Happening

The model does not execute your prompt directly.

When you write a prompt, the model does not read it the way you do. It converts your input into an internal representation — a compressed, reinterpreted version of what you wrote — and generates output based on that internal state.

In other words:

```
A (your input)
→ A′ (internal reconstruction)
→ B′ (generated output)
```

You wrote A. The model generated B′. But what actually drove the generation was A′ — something you cannot see and cannot directly control.

Small differences in how A is interpreted can produce different values of A′. And different values of A′ produce different outputs.

This is why identical prompts do not guarantee identical characters.

-----

## What This Means

Character consistency is not a prompt property.

You cannot write your way to a stable identity. No matter how detailed the description, the model will always reinterpret it. The reinterpretation is probabilistic. The output will vary.

This means consistency is not a problem of description. It is a problem of convergence.

The question is not “how do I describe this character correctly?”

It is “how do I bring the model back to the same identity state?”

-----

## What You Can Do About It

A few practical directions — not a tutorial, but a starting point.

Separating identity attributes from scene attributes tends to produce more stable reconstructions. When identity and scene are mixed together, the model may resolve the tension between them in unexpected ways.

Using a previously validated image as a reference — rather than relying on text alone — can anchor the generation toward a known stable state. An image carries more identity information than a description.

Iterative convergence tends to work better than single-shot generation. Rather than trying to get the right character in one attempt, treat generation as a process of gradual refinement toward a target state.

-----

## The Real Question

Most people ask: how do I get the same image?

That is the wrong question.

The right question is: how do I recover the same identity?

Identity is not preserved by the prompt. It drifts with each generation. The goal is not to produce an identical image — it is to bring the reconstruction back to a defined convergence point, again and again, across as many generations as you need.

That is a control problem. And it is solvable.

*This is not a guaranteed method, but a practical way to approach the problem.*