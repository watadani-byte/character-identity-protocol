# Column: Translation Loss and the YAML-First Principle

*Why cleaner language reduces effectiveness in generative AI workflows*

-----

> The prompt is not the character. The prompt is a projection of the character.

-----

## Observation

A recurring pattern in production generative AI workflows:

When a prompt is “cleaned up” — made more natural, more concise,
or better English — the generation result often becomes less
consistent, not more.

This is not a coincidence.

It is a structural property of how generative systems interpret input.

-----

## The Translation Loss Problem

When a structured character definition is converted into natural
English prose, several things tend to happen:

**Useful redundancy gets removed**
Repetition that appears unnecessary to a human editor is often
functionally load-bearing in generation. The model uses repeated
signals to weight reconstruction priorities. Removing them reduces
constraint strength.

**Prohibitions get weakened**
Explicit constraints (“never show X”, “viewer’s left arm must not
cross viewer’s right”) tend to get softened or dropped during
natural language editing. A prohibition that survives in YAML
often disappears in English paraphrase.

**Priority relationships become blurred**
YAML structure preserves ordering and hierarchy. Flat English prose
collapses these relationships. The model cannot reconstruct which
attributes are core and which are variable from prose alone.

**Structural separation gets merged**
Ideas that are functionally separate — identity constraints vs.
variable elements vs. prohibitions — tend to merge in natural
language. Once merged, they are difficult to recover.

> Cleaner wording is not always better wording.
> In generative AI workflows, naturalness and effectiveness
> are not the same thing.

-----

## The YAML-First Principle

The YAML-First Principle addresses this by treating the structured
definition as the canonical form, and natural language as a
downstream projection.

```
YAML (SSOT)
└── Structured definition
└── Preserved hierarchy
└── Explicit prohibitions
└── Useful redundancy intact
        ↓
English prompt (projection)
└── Delivery format only
└── Not the source of truth
```

**Key rule:**
When generation quality degrades, return to the YAML source —
not to the English prompt.

The English prompt is a lossy representation of the YAML.
The YAML is the character.

-----

## Useful Redundancy

Redundancy in a character definition is often functional,
not wasteful.

Examples of useful redundancy:

- Stating a constraint in both positive and negative form
- Repeating a priority attribute in multiple sections
- Explicitly listing what must NOT change alongside
  what must be preserved

The test for useful redundancy is not “does this say the
same thing twice?”

The test is: “if I remove this, does generation drift?”

If drift increases after removal, the redundancy was load-bearing.

> Do not remove redundancy because it looks clean.
> Remove redundancy only after testing that removal does not
> increase drift.

-----

## Human Idea Preservation

The YAML-First Principle is also a human idea preservation mechanism.

When a human author creates a character definition, the original
structure encodes:

- priority decisions
- constraint logic
- variation boundaries
- prohibitions and their reasoning

Natural language editing — even well-intentioned editing — tends
to erode this encoded structure over time.

YAML as SSOT preserves the author’s original intent against the
drift introduced by repeated translation and editing cycles.

> The goal is not to produce the best English prompt.
> The goal is to preserve the character definition long enough
> for the character to survive changing conditions.

-----

## Relation to CIP

This principle operates at the input layer of the CIP governance loop.

|CIP Layer               |YAML-First Role                                                     |
|------------------------|--------------------------------------------------------------------|
|Minimal Prompt Principle|YAML → English projection preserves minimalism                      |
|Anchor Mechanism        |YAML SSOT functions as a textual anchor parallel to the image anchor|
|Identity Gates          |Structured definition makes gate criteria explicit and auditable    |
|Hard Abort              |Return to YAML source on quality degradation                        |

The YAML definition and the anchor image together constitute
the full identity specification:

```
Identity Specification
└── Anchor Image (visual SSOT)
└── YAML Definition (structural SSOT)
```

Neither alone is sufficient.
Together they define the character completely.

-----

## Practical Rules

**Rule 1: YAML is the source of truth**
English prompts are output format.
Never edit the YAML to match the English.

**Rule 2: Preserve prohibitions explicitly**
Prohibitions that are not explicitly stated tend to disappear
during translation. State them in YAML. State them again in
English. Do not assume the model will infer them.

**Rule 3: Do not remove useful redundancy**
Before removing any repeated element, test whether removal
increases drift. If it does, the redundancy is load-bearing.

**Rule 4: When quality degrades, return to YAML**
Do not attempt to fix a degraded English prompt by editing
the English. Return to the YAML source and regenerate
the projection.

**Rule 5: Cleaner is not always better**
Natural language optimization is not generation optimization.
These are different objectives.

-----

## Status

This column documents an operational pattern observed across
production generative AI workflows.

Systematic validation has not been conducted.
These observations are recorded for further investigation.

-----

*First documented: March 2026*  
*Related: [Minimal Prompt Principle](whitepaper_v1.md) — [Glossary](glossary.md) — [White Paper](whitepaper_v1.md)*