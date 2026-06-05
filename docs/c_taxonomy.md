# C Taxonomy: Classifying Mediation from A to A′

C Taxonomy classifies the mediation that transforms A into A′, including model-side generative mediation and execution-structure mediation.

In the reconstruction model:

```
A → (A + C) → A′ → B′ ≠ B
```

C is the mediation layer through which the system, or the execution structure around it, transforms A into A′ before producing B′.

As defined in the core model, A + C is not simple addition. It is shorthand for a non-linear mediation process: A′ ≈ T_C(A). C Taxonomy classifies the likely properties of that mediation process — the ways in which A is transformed into A′.

Character Drift Taxonomy classifies the visible drift that appears in B′.

C Taxonomy classifies the likely mediation that caused A to become A′.

In short:

```
Character Drift Taxonomy = What drift appeared?
C Taxonomy               = What mediation likely caused it?
```

C is not an excuse for drift.
It is the layer whose effects must be diagnosed, and whose operating conditions must be constrained and made operationally governable.

-----

## Purpose

The purpose of C Taxonomy is to make C operationally diagnosable.

In practice, the user observes B′ first, then works backward:

```
B′ → A′ → C
```

A feedback-only workflow corrects B′ directly. A CIP-style workflow identifies the likely C and narrows the conditions under which the same drift can recur.

C Taxonomy provides the diagnostic vocabulary for that identification.

-----

## Relationship to Character Drift Taxonomy

| Layer | Taxonomy | Question |
|---|---|---|
| B′ layer | Character Drift Taxonomy | What drift appeared in the output? |
| A′ layer | Reconstruction inspection | How was A reconstructed? |
| C layer | C Taxonomy | What mediation likely caused the transformation? |

The same visible drift may be caused by different forms of C.

Example: Face Drift may result from Semantic Expansion C, Style Gravity C, Compression / Omission C, Role Inference C, or Reference Weakening C — or from several of these acting together.

-----

## C Types: Generative and Structural

C may originate from two distinct sources.

**Generative C**

Model-side or generation-process mediation, such as interpretation, compression, weighting, optimization, safety or generalization bias, stylistic transformation, semantic expansion, and creative reconstruction.

**Structural C**

Execution-structure mediation introduced by agent scaffolding, harnesses, context engineering, tool routing, memory injection, evaluation loops, retry behavior, and stop conditions.

These structures are not C merely because they exist. They become relevant to C only when they mediate, transform, redirect, expand, constrain, or replace A before B′ is produced.

CIP does not treat output drift as a model-only issue. It treats drift as a system-level continuity problem: where, how, and under whose authority A is transformed into A′ before producing B′.

Generative C and Structural C classify the source of mediation. In image-generation workflows, Model-side C and Image-execution C identify where that mediation entered the workflow.

- **Model-side C**: the language model changes, optimizes, compresses, or reinterprets the user's instruction before image generation.
- **Image-execution C**: the written prompt is preserved, but the image model visually resolves the output in a different direction during generation.

-----

## Initial C Categories

C categories are diagnostic, not mutually exclusive. A single drift event may involve multiple categories.

### 1. Semantic Expansion C

A term in A is interpreted more broadly than the user intended.

**Example**

```text
A: brown eyes
B′: hazel or greenish-brown eyes
Likely C: "brown" was interpreted as a wider color category
```

**Governance response**

Narrow the semantic range of the anchor.

> Use solid dark chocolate-brown irises.

-----

### 2. Semantic Substitution C

A specified concept is replaced with a nearby but different concept.

**Example**

```text
A: quiet, wounded expression
B′: dramatic sadness or performative grief
Likely C: restrained grief was substituted with a more recognizable emotional trope
```

**Governance response**

Define the intended concept positively and with clear boundaries. Avoid activating unwanted terms unless necessary.

-----

### 3. Compression / Omission C

Important constraints in A are removed, compressed, or deprioritized.

**Example**

```text
A: full body, turned posture, looking over shoulder
B′: head-and-shoulders portrait
Likely C: posture and full-body constraints were compressed away or deprioritized
```

**Governance response**

Separate fixed elements from optional elements. Re-check compressed prompts against the original A.

-----

### 4. Optimization C

The system improves, beautifies, clarifies, regularizes, or "helps" beyond the user's intent.

AI systems often describe this as improvement, clarification, or contextual interpretation. CIP does not deny that these operations may be useful. However, when they change A before producing B′, CIP treats them as governance-relevant transformations.

**Example**

```text
A: do not optimize the prompt
B′: optimized or improved prompt/output
Likely C: default improvement behavior overrode the user's constraint
```

**Governance response**

Explicitly restrict improvement, rewriting, embellishment, or completion behavior.

-----

### 5. Default Pattern C

A is pulled toward common training-distribution patterns.

**Example**

```text
A: a woman looking over her shoulder at the camera, full body
B′: conventional head-and-shoulders portrait
Likely C: portrait framing defaulted from distributional gravity
```

**Governance response**

Strengthen uncommon structural requirements and validate them through gates.

-----

### 6. Style Gravity C

A style, genre, medium, or aesthetic pulls identity features away from the intended anchor.

**Example**

```text
A: same character in a cinematic noir scene
B′: character face changes to match noir archetype
Likely C: noir style gravity altered facial identity
```

**Governance response**

Separate style transfer from identity preservation. State which elements may change and which must remain fixed.

-----

### 7. Role Inference C

The system infers a social role, occupation, personality, or narrative function not specified in A.

**Example**

```text
A: intelligent woman with glasses
B′: corporate businesswoman template
Likely C: intelligence + glasses were inferred as professional/business role
```

**Governance response**

Block unintended role templates. Define the character's role boundary explicitly.

-----

### 8. Context Completion C

The system fills missing background, setting, story, or emotional context in a way that changes A.

**Example**

```text
A: a character standing alone
B′: dramatic fantasy battlefield scene
Likely C: the model completed missing narrative context
```

**Governance response**

Specify whether context is fixed, optional, or open. Prevent background completion from redefining the subject.

-----

### 9. Constraint Mediation C

System instructions, safety layers, product-side rewriting, tool constraints, or platform limitations alter the operational form of A.

**Example**

```text
A: user prompt
A′: product-mediated or policy-mediated execution prompt
B′: output shaped by hidden constraints
Likely C: tool or product mediation changed A before execution
```

**Governance response**

Expose A′ where possible. Use prompt disclosure, execution traces, platform notes, and validation gates.

-----

### 10. Prompt Rewriting C

A is transformed through visible or hidden prompt rewriting before generation.

**Example**

```text
A: concise image instruction
A′: expanded prompt with added details
B′: output reflects the added details
Likely C: prompt rewriting introduced new operative conditions
```

**Governance response**

Require pre-execution prompt disclosure where possible. Compare visible prompt content against B′.

-----

### 11. Reference Weakening C

The anchor or reference condition is present, but its control strength is too weak.

**Example**

```text
A: use this character reference
B′: similar but not the same character
Likely C: reference was treated as loose resemblance, not identity constraint
```

**Governance response**

Increase anchor priority. Use stricter identity gates. Reject resemblance-only outputs.

-----

### 12. Accumulation C

Multiple small transformations compound across generations, prompts, tools, or workflow stages.

```
A   → (A   + C1) → A′1
A′1 → (A′1 + C2) → A′2
A′2 → (A′2 + C3) → A′3
```

The accumulated state approaches:

```
A′n ≈ A + C1 + C2 + C3 + … + Cn
```

This is not simple addition. Each C acts on an already transformed version of A.

**Governance response**

Do not inherit only the previous A′. Re-check each stage against the original A or a validated anchor.

Anchors and gates act as reset points against C accumulation before a reconstructed A′ is allowed to become the next input condition.

-----

### 13. Tool Routing C

A is expanded or redirected into tool use, search, external retrieval, or external action not required by the original request.

**Governance response**

Restrict tool access, require tool-use approval, and define when external retrieval or action is allowed.

-----

### 14. Memory Injection C

Persistent memory, prior context, or unrelated stored information is introduced into the current A.

**Governance response**

Scope or disable memory, isolate session context, and validate outputs against the current A rather than prior context.

-----

### 15. Evaluation Loop C

The evaluation loop rewards task completion, improvement, or helpfulness rather than preservation of A.

**Governance response**

Define evaluation criteria around A-continuity, not task success alone.

-----

### 16. Stop Condition C

Weak or absent stop conditions allow the system to continue transforming A after the requested scope has been satisfied.

**Governance response**

Define stop criteria, maximum edit scope, and Hard Abort conditions.

-----

### 17. Scaffold / Harness C

The execution scaffold or harness changes the task mode itself, such as converting audit into edit, review into rewrite, or checking into optimization.

**Governance response**

Separate audit mode from edit mode and require explicit approval before modification.

-----

## Diagnostic Grouping

The categories above are listed individually because C categories are not mutually exclusive.

For practical diagnosis, they may be grouped by likely source:

| Group | Typical categories | Diagnostic question |
|---|---|---|
| Distribution-driven C | Semantic Expansion C, Semantic Substitution C, Default Pattern C, Style Gravity C | Did the model pull A toward familiar learned patterns or nearby concepts? |
| System-driven C | Compression / Omission C, Optimization C, Constraint Mediation C, Prompt Rewriting C | Did system behavior, rewriting, compression, or tooling alter A before output? |
| Context-driven C | Role Inference C, Context Completion C, Reference Weakening C, Accumulation C | Did inferred context, role, weak anchoring, or workflow history reshape A? |
| Execution-structure C | Tool Routing C, Memory Injection C, Evaluation Loop C, Stop Condition C, Scaffold / Harness C | Did the agentic execution structure transform A before B′ was produced? |

These groups are diagnostic aids, not strict classes. A single drift event may involve categories from multiple groups.

-----

## Diagnosis Pattern

```text
Observed B′:
What appeared in the output?

Expected B:
What should have appeared if A had been preserved?

Inferred A′:
How did the system appear to reconstruct A?

Likely C:
What mediation likely transformed A into A′?

Governance response:
How should the workflow constrain the conditions under which that C recurs next time?
```

-----

## Example Diagnosis

```text
Observed B′:         Hazel or greenish-brown eyes appeared.
Expected B:          Clearly brown eyes.
Inferred A′:         "Brown" appears to have been reconstructed as a broad color category.
Likely C:            Semantic Expansion C.
Governance response: Replace the broad color anchor with a narrower visual anchor:
                     solid dark chocolate-brown irises.
```

-----

## Feedback vs Feedforward

| Aspect | Feedback-only correction | CIP-style correction |
|---|---|---|
| Target | B′ | C → A′ |
| Method | Correct the visible output | Diagnose the likely mediation |
| Question | What is wrong? | What transformed A? |
| Correction | Change the output | Narrow the transformation condition |
| Effect | Fixes one instance | Reduces recurrence risk |

C diagnosis converts feedback into feedforward governance.

*Here, "C → A′" is shorthand for the governed transformation of A into A′ under C; it does not mean that C independently produces A′ without A.*

-----

## Notes

- C categories are not mutually exclusive.
- A single drift event may involve multiple forms of C.
- C Taxonomy should be used as a diagnostic map, not as a rigid single-label classification system.
- The purpose is not to eliminate C.
- The purpose is to distinguish acceptable creative mediation from unapproved drift-producing mediation.

A single drift event may involve several categories acting together:

```
Semantic Expansion C + Style Gravity C + Compression / Omission C + Accumulation C
```

-----

## Short Definition

C Taxonomy classifies the mediation that transforms A into A′.

It supports CIP by making likely forms of C diagnosable and their operating conditions constrainable before B′ is adopted.|C layer |C Taxonomy               |What mediation likely caused the transformation?|

The same visible drift may be caused by different forms of C.

Example: Face Drift may result from Semantic Expansion C, Style Gravity C, Compression / Omission C, Role Inference C, or Reference Weakening C — or from several of these acting together.

-----

## C Types: Generative and Structural

C may originate from two distinct sources.

**Generative C**

Model-side or generation-process mediation, such as interpretation, compression, weighting, optimization, safety or generalization bias, stylistic transformation, semantic expansion, and creative reconstruction.

**Structural C**

Execution-structure mediation introduced by agent scaffolding, harnesses, context engineering, tool routing, memory injection, evaluation loops, retry behavior, and stop conditions.

These structures are not C merely because they exist. They become relevant to C only when they mediate, transform, redirect, expand, constrain, or replace A before B′ is produced.

CIP does not treat output drift as a model-only issue. It treats drift as a system-level continuity problem: where, how, and under whose authority A is transformed into A′ before producing B′.

Generative C and Structural C classify the source of mediation. In image-generation workflows, Model-side C and Image-execution C identify where that mediation entered the workflow.

- **Model-side C**: the language model changes, optimizes, compresses, or reinterprets the user’s instruction before image generation.
- **Image-execution C**: the written prompt is preserved, but the image model visually resolves the output in a different direction during generation.

-----

## Initial C Categories

C categories are diagnostic, not mutually exclusive. A single drift event may involve multiple categories.

### 1. Semantic Expansion C

A term in A is interpreted more broadly than the user intended.

**Example**

```text
A: brown eyes
B′: hazel or greenish-brown eyes
Likely C: "brown" was interpreted as a wider color category
```

**Governance response**

Narrow the semantic range of the anchor.

> Use solid dark chocolate-brown irises.

-----

### 2. Semantic Substitution C

A specified concept is replaced with a nearby but different concept.

**Example**

```text
A: quiet, wounded expression
B′: dramatic sadness or performative grief
Likely C: restrained grief was substituted with a more recognizable emotional trope
```

**Governance response**

Define the intended concept positively and with clear boundaries. Avoid activating unwanted terms unless necessary.

-----

### 3. Compression / Omission C

Important constraints in A are removed, compressed, or deprioritized.

**Example**

```text
A: full body, turned posture, looking over shoulder
B′: head-and-shoulders portrait
Likely C: posture and full-body constraints were compressed away or deprioritized
```

**Governance response**

Separate fixed elements from optional elements. Re-check compressed prompts against the original A.

-----

### 4. Optimization C

The system improves, beautifies, clarifies, regularizes, or “helps” beyond the user’s intent.

AI systems often describe this as improvement, clarification, or contextual interpretation. CIP does not deny that these operations may be useful. However, when they change A before producing B′, CIP treats them as governance-relevant transformations.

**Example**

```text
A: do not optimize the prompt
B′: optimized or improved prompt/output
Likely C: default improvement behavior overrode the user's constraint
```

**Governance response**

Explicitly restrict improvement, rewriting, embellishment, or completion behavior.

-----

### 5. Default Pattern C

A is pulled toward common training-distribution patterns.

**Example**

```text
A: a woman looking over her shoulder at the camera, full body
B′: conventional head-and-shoulders portrait
Likely C: portrait framing defaulted from distributional gravity
```

**Governance response**

Strengthen uncommon structural requirements and validate them through gates.

-----

### 6. Style Gravity C

A style, genre, medium, or aesthetic pulls identity features away from the intended anchor.

**Example**

```text
A: same character in a cinematic noir scene
B′: character face changes to match noir archetype
Likely C: noir style gravity altered facial identity
```

**Governance response**

Separate style transfer from identity preservation. State which elements may change and which must remain fixed.

-----

### 7. Role Inference C

The system infers a social role, occupation, personality, or narrative function not specified in A.

**Example**

```text
A: intelligent woman with glasses
B′: corporate businesswoman template
Likely C: intelligence + glasses were inferred as professional/business role
```

**Governance response**

Block unintended role templates. Define the character’s role boundary explicitly.

-----

### 8. Context Completion C

The system fills missing background, setting, story, or emotional context in a way that changes A.

**Example**

```text
A: a character standing alone
B′: dramatic fantasy battlefield scene
Likely C: the model completed missing narrative context
```

**Governance response**

Specify whether context is fixed, optional, or open. Prevent background completion from redefining the subject.

-----

### 9. Constraint Mediation C

System instructions, safety layers, product-side rewriting, tool constraints, or platform limitations alter the operational form of A.

**Example**

```text
A: user prompt
A′: product-mediated or policy-mediated execution prompt
B′: output shaped by hidden constraints
Likely C: tool or product mediation changed A before execution
```

**Governance response**

Expose A′ where possible. Use prompt disclosure, execution traces, platform notes, and validation gates.

-----

### 10. Prompt Rewriting C

A is transformed through visible or hidden prompt rewriting before generation.

**Example**

```text
A: concise image instruction
A′: expanded prompt with added details
B′: output reflects the added details
Likely C: prompt rewriting introduced new operative conditions
```

**Governance response**

Require pre-execution prompt disclosure where possible. Compare visible prompt content against B′.

-----

### 11. Reference Weakening C

The anchor or reference condition is present, but its control strength is too weak.

**Example**

```text
A: use this character reference
B′: similar but not the same character
Likely C: reference was treated as loose resemblance, not identity constraint
```

**Governance response**

Increase anchor priority. Use stricter identity gates. Reject resemblance-only outputs.

-----

### 12. Accumulation C

Multiple small transformations compound across generations, prompts, tools, or workflow stages.

```
A   → (A   + C1) → A′1
A′1 → (A′1 + C2) → A′2
A′2 → (A′2 + C3) → A′3
```

The accumulated state approaches:

```
A′n ≈ A + C1 + C2 + C3 + … + Cn
```

This is not simple addition. Each C acts on an already transformed version of A.

**Governance response**

Do not inherit only the previous A′. Re-check each stage against the original A or a validated anchor.

Anchors and gates act as reset points against C accumulation before a reconstructed A′ is allowed to become the next input condition.

-----

### 13. Tool Routing C

A is expanded or redirected into tool use, search, external retrieval, or external action not required by the original request.

**Governance response**

Restrict tool access, require tool-use approval, and define when external retrieval or action is allowed.

-----

### 14. Memory Injection C

Persistent memory, prior context, or unrelated stored information is introduced into the current A.

**Governance response**

Scope or disable memory, isolate session context, and validate outputs against the current A rather than prior context.

-----

### 15. Evaluation Loop C

The evaluation loop rewards task completion, improvement, or helpfulness rather than preservation of A.

**Governance response**

Define evaluation criteria around A-continuity, not task success alone.

-----

### 16. Stop Condition C

Weak or absent stop conditions allow the system to continue transforming A after the requested scope has been satisfied.

**Governance response**

Define stop criteria, maximum edit scope, and Hard Abort conditions.

-----

### 17. Scaffold / Harness C

The execution scaffold or harness changes the task mode itself, such as converting audit into edit, review into rewrite, or checking into optimization.

**Governance response**

Separate audit mode from edit mode and require explicit approval before modification.

-----

## Diagnostic Grouping

The categories above are listed individually because C categories are not mutually exclusive.

For practical diagnosis, they may be grouped by likely source:

|Group                |Typical categories                                                                           |Diagnostic question                                                           |
|---------------------|---------------------------------------------------------------------------------------------|------------------------------------------------------------------------------|
|Distribution-driven C|Semantic Expansion C, Semantic Substitution C, Default Pattern C, Style Gravity C            |Did the model pull A toward familiar learned patterns or nearby concepts?     |
|System-driven C      |Compression / Omission C, Optimization C, Constraint Mediation C, Prompt Rewriting C         |Did system behavior, rewriting, compression, or tooling alter A before output?|
|Context-driven C     |Role Inference C, Context Completion C, Reference Weakening C, Accumulation C                |Did inferred context, role, weak anchoring, or workflow history reshape A?    |
|Execution-structure C|Tool Routing C, Memory Injection C, Evaluation Loop C, Stop Condition C, Scaffold / Harness C|Did the agentic execution structure transform A before B′ was produced?       |

These groups are diagnostic aids, not strict classes. A single drift event may involve categories from multiple groups.

-----

## Diagnosis Pattern

```text
Observed B′:
What appeared in the output?

Expected B:
What should have appeared if A had been preserved?

Inferred A′:
How did the system appear to reconstruct A?

Likely C:
What mediation likely transformed A into A′?

Governance response:
How should the workflow constrain that C next time?
```

-----

## Example Diagnosis

```text
Observed B′:         Hazel or greenish-brown eyes appeared.
Expected B:          Clearly brown eyes.
Inferred A′:         "Brown" appears to have been reconstructed as a broad color category.
Likely C:            Semantic Expansion C.
Governance response: Replace the broad color anchor with a narrower visual anchor:
                     solid dark chocolate-brown irises.
```

-----

## Feedback vs Feedforward

|Aspect    |Feedback-only correction  |CIP-style correction               |
|----------|--------------------------|-----------------------------------|
|Target    |B′                        |C → A′                             |
|Method    |Correct the visible output|Diagnose the likely mediation      |
|Question  |What is wrong?            |What transformed A?                |
|Correction|Change the output         |Narrow the transformation condition|
|Effect    |Fixes one instance        |Reduces recurrence risk            |

C diagnosis converts feedback into feedforward governance.

*Here, “C → A′” is shorthand for the governed transformation of A into A′ under C; it does not mean that C independently produces A′ without A.*

-----

## Notes

- C categories are not mutually exclusive.
- A single drift event may involve multiple forms of C.
- C Taxonomy should be used as a diagnostic map, not as a rigid single-label classification system.
- The purpose is not to eliminate C.
- The purpose is to distinguish acceptable creative mediation from unapproved drift-producing mediation.

A single drift event may involve several categories acting together:

```
Semantic Expansion C + Style Gravity C + Compression / Omission C + Accumulation C
```

-----

## Short Definition

C Taxonomy classifies the mediation that transforms A into A′.

It supports CIP by making C diagnosable, constrainable, and governable before B′ is adopted.
