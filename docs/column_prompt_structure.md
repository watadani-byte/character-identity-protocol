# A Simple Structure for Writing Prompts

> This article is practical and introductory in nature.
> It is intended for users who are new to writing prompts for generative AI systems.

-----

In the previous section, we explained that generative AI systems do not execute prompts directly.

Instead, prompts are interpreted and compressed internally before generation.

Conceptually:

```
A (prompt)
→ A′ (internal interpretation)
→ B′ (generated output)
```

Because of this process, the way a prompt is structured can strongly influence how the AI interprets it.

When beginners start writing prompts for generative AI, they often feel confused.

Many prompt guides immediately introduce abstract structures such as:

- Theme
- Rules
- Materials
- Output

For beginners, this can easily feel like: *“What is this supposed to mean?”*

A simpler approach is to start with a structure that matches how people naturally think.

-----

## Step 1 — Start with Five Simple Elements

For beginners, prompts are easier to understand when they are broken into five parts.

- Theme
- Rules
- Materials
- Process
- Output

These correspond to very natural questions.

**Theme** — What is the topic?

**Rules** — What conditions should be followed?

**Materials** — What information or documents should be referenced?

**Process** — How should the answer be developed?

**Output** — What form should the final answer take?

This structure mirrors the way humans usually organize tasks.

```
Theme (What is the topic?)
        ↓
Rules (Conditions to follow)
        ↓
Materials (Reference information)
        ↓
Process (Steps to follow)
        ↓
Output (Final format)
```

Because it follows a natural mental flow, beginners can understand it quickly.

-----

## Step 2 — Understand the Role of Each Part

Each element in the structure plays a different role.

Understanding these roles helps prevent common mistakes when writing prompts.

-----

### Theme

The Theme defines what the prompt is about.

**Example:**

```
Theme:
Explain how generative AI works for beginners.
```

Without a clear theme, the AI may interpret the task too broadly.

-----

### Rules

Rules define the conditions that the AI should follow.

**Example:**

```
Rules:
Use simple language
Avoid technical jargon
```

Rules act as constraints on the response.
They guide how the AI should approach the task.

-----

### Materials

Materials contain reference information.

**Example:**

```
Materials:
Notes about generative AI behavior
An article about diffusion models
```

Beginners often make the mistake of mixing instructions with materials.
However, these are different things.

- Materials = reference information
- Rules = instructions

Materials provide context and information the AI may use when generating the response.

-----

### Process

The Process describes how the explanation should proceed.

**Example:**

```
Process:
1. Explain the basic idea
2. Provide a simple example
3. Summarize the key point
```

The process acts as a step-by-step guide for how the answer should be constructed.

-----

### Output

The Output defines the format of the final result.

**Example:**

```
Output:
Use bullet points
Keep sentences short
```

Output instructions help control how the answer is presented, not what it contains.

-----

## Step 3 — Simplifying the Structure

Once you become comfortable with prompts, you may notice that some elements overlap.

In particular, the Process is often simply a type of Rule.

For example:

```
Rules:
Explain the concept first
Provide an example
Summarize the key idea
```

In other words: **Process → part of Rules**

Because of this, the structure can often be simplified.

-----

## The Final Four-Part Structure

After simplification, prompts can usually be organized into four elements.

|Element  |Role                          |
|---------|------------------------------|
|Theme    |What the prompt is about      |
|Rules    |How the AI should respond     |
|Materials|What information it should use|
|Output   |How the answer should appear  |

### Why This Order Matters

If beginners are shown the four-part structure first, it can feel abstract and confusing.

That is why it is easier to introduce prompts in two stages.

First:

```
Theme → Rules → Materials → Process → Output
```

Then simplify:

```
Theme → Rules → Materials → Output
```

This progression follows a natural learning path:

```
Concrete idea
        ↓
Organized structure
        ↓
Simplified model
```

By starting with a structure that matches how people naturally think, prompt design becomes much easier to understand.

-----

## Summary

Effective prompts often share several common characteristics.

In practice, prompts tend to work best when they follow three basic principles:

- information is compressed
- instructions are structured
- requests are short and specific

These properties make prompts easier for the AI to interpret when it reconstructs their meaning internally.

Because generative AI systems internally reinterpret prompts before generating outputs, well-structured and concise prompts are generally more stable and easier for the model to follow.

In conversational systems, interactions can also be understood as a sequence of prompt–response cycles.

Conceptually, a conversation can be seen as:

```
Prompt → Response → Prompt → Response → ...
```

Each new message becomes part of the context that the AI interprets when generating the next response.

Understanding prompts in this way helps explain why:

- clear instructions improve reliability
- overly long prompts may become unstable
- long conversations can gradually change how the AI interprets a task

By thinking of prompts as structured information given to a probabilistic system, users can design prompts more effectively and avoid many common frustrations.

-----

## Next Section

This structure works well for many kinds of prompts.

However, prompts used for image generation systems often follow a slightly different pattern.

In the next section we will examine how prompts are commonly written for image generation tasks.

-----

*See also: [How Generative AI Actually Behaves](column_how_generative_ai_behaves.md) — [Identity Drift in Generative Image Models](column_identity_drift_practical.md) — [Technical Mechanism](technical_mechanism.md)*