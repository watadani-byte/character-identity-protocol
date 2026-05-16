# C Taxonomy: Classifying Generative Mediation

C Taxonomy classifies the generative mediation that transforms A into A′.

In the reconstruction model:

```
A → (A + C) → A′ → B′ ≠ B
```

C is the mediation layer through which the system interprets, compresses, expands, optimizes, constrains, or creatively transforms the user’s input A before producing B′.

Character Drift Taxonomy classifies the visible drift that appears in B′.

C Taxonomy classifies the likely mediation that caused A to become A′.

In short:

```
Character Drift Taxonomy = What drift appeared?
C Taxonomy               = What mediation likely caused it?
```

C is not an excuse for drift.
It is the layer that must be diagnosed, constrained, and made governable.

-----

## Purpose

The purpose of C Taxonomy is to make generative mediation operationally diagnosable.

In practice, the user observes B′ first, then works backward:

```
B′ → A′ → C
```

A feedback-only workflow corrects B′ directly. A CIP-style workflow identifies the likely C and narrows the conditions under which the same drift can recur.

C Taxonomy provides the diagnostic vocabulary for that identification.

-----

## Relationship to Character Drift Taxonomy

|Layer   |Taxonomy                 |Question                                        |
|--------|-------------------------|------------------------------------------------|
|B′ layer|Character Drift Taxonomy |What drift appeared in the output?              |
|A′ layer|Reconstruction inspection|How was A reconstructed?                        |
|C layer |C Taxonomy               |What mediation likely caused the transformation?|

The same visible drift may be caused by different forms of C.

Example: Face Drift may result from semantic expansion, style gravity, prompt compression, role inference, or weak anchoring — or from several of these acting together.

-----

## Initial C Categories

C categories are diagnostic, not mutually exclusive. A single drift event may involve multiple categories.

### 1. Semantic Expansion C

A term in A is interpreted more broadly than the user intended.

**Example**

A: brown eyes
B′: hazel or greenish-brown eyes
Likely C: “brown” was interpreted as a wider color category

**Governance response**

Narrow the semantic range of the anchor.

> Use solid dark chocolate-brown irises.

-----

### 2. Semantic Substitution C

A specified concept is replaced with a nearby but different concept.

**Example**

A: quiet, wounded expression
B′: dramatic sadness or performative grief
Likely C: restrained grief was substituted with a more recognizable emotional trope

**Governance response**

Define the intended concept positively and with clear boundaries. Avoid activating unwanted terms unless necessary.

-----

### 3. Compression / Omission C

Important constraints in A are removed, compressed, or deprioritized.

**Example**

A: full body, turned posture, looking over shoulder
B′: head-and-shoulders portrait
Likely C: posture and full-body constraints were compressed away or deprioritized

**Governance response**

Separate fixed elements from optional elements. Re-check compressed prompts against the original A.

-----

### 4. Optimization C

The system improves, beautifies, clarifies, regularizes, or “helps” beyond the user’s intent.

**Example**

A: do not optimize the prompt
B′: optimized or improved prompt/output
Likely C: default improvement behavior overrode the user’s constraint

**Governance response**

Explicitly restrict improvement, rewriting, embellishment, or completion behavior.

-----

### 5. Default Pattern C

A is pulled toward common training-distribution patterns.

**Example**

A: a woman looking over her shoulder at the camera, full body
B′: conventional head-and-shoulders portrait
Likely C: portrait framing defaulted from distributional gravity

**Governance response**

Strengthen uncommon structural requirements and validate them through gates.

-----

### 6. Style Gravity C

A style, genre, medium, or aesthetic pulls identity features away from the intended anchor.

**Example**

A: same character in a cinematic noir scene
B′: character face changes to match noir archetype
Likely C: noir style gravity altered facial identity

**Governance response**

Separate style transfer from identity preservation. State which elements may change and which must remain fixed.

-----

### 7. Role Inference C

The system infers a social role, occupation, personality, or narrative function not specified in A.

**Example**

A: intelligent woman with glasses
B′: corporate businesswoman template
Likely C: intelligence + glasses were inferred as professional/business role

**Governance response**

Block unintended role templates. Define the character’s role boundary explicitly.

-----

### 8. Context Completion C

The system fills missing background, setting, story, or emotional context in a way that changes A.

**Example**

A: a character standing alone
B′: dramatic fantasy battlefield scene
Likely C: the model completed missing narrative context

**Governance response**

Specify whether context is fixed, optional, or open. Prevent background completion from redefining the subject.

-----

### 9. Constraint Mediation C

System instructions, safety layers, product-side rewriting, tool constraints, or platform limitations alter the operational form of A.

**Example**

A: user prompt
A′: product-mediated or policy-mediated execution prompt
B′: output shaped by hidden constraints
Likely C: tool or product mediation changed A before execution

**Governance response**

Expose A′ where possible. Use prompt disclosure, execution traces, platform notes, and validation gates.

-----

### 10. Prompt Rewriting C

A is transformed through visible or hidden prompt rewriting before generation.

**Example**

A: concise image instruction
A′: expanded prompt with added details
B′: output reflects the added details
Likely C: prompt rewriting introduced new operative conditions

**Governance response**

Require pre-execution prompt disclosure where possible. Compare visible prompt content against B′.

-----

### 11. Reference Weakening C

The anchor or reference condition is present, but its control strength is too weak.

**Example**

A: use this character reference
B′: similar but not the same character
Likely C: reference was treated as loose resemblance, not identity constraint

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

Do not inherit only the previous A′. Re-check each stage against the original A.

-----

## Diagnosis Pattern

```
Observed B′:        What appeared in the output?
Expected B:         What should have appeared if A had been preserved?
Inferred A′:        How did the system appear to reconstruct A?
Likely C:           What mediation likely transformed A into A′?
Governance response: How should the workflow constrain that C next time?
```

-----

## Example Diagnosis

```
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