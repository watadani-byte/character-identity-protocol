# Minimal Prompt Template — Character Identity Protocol

Use this template to construct a minimal prompt
for CIP-governed generation.

-----

## Principle

A minimal prompt contains only invariant identity attributes.

- No adjectives
- No mood descriptors
- No subjective terms
- No scene description (unless required)

The anchor image carries identity.
The prompt reinforces — it does not replace.

-----

## Template

```
[UID / Character name],
[hair description — factual only],
[eye description — factual only],
[distinctive features — factual only],
[body proportion — factual only if needed],
[rendering style — factual only]
```

-----

## Example

```
Shiraishi Shizuka,
long dark brown hair in high ponytail,
dark brown eyes,
thin gold-framed round glasses,
slim figure,
anime style
```

-----

## What to Avoid

|Avoid                |Use instead                 |
|---------------------|----------------------------|
|“beautiful eyes”     |“brown eyes”                |
|“elegant posture”    |[omit — let anchor carry it]|
|“gentle expression”  |[omit — let anchor carry it]|
|“perfect proportions”|[omit — let anchor carry it]|

-----

> Verbose prompts destabilize reconstruction.
> See: [Minimal Prompt Principle](../whitepaper_v1.md)