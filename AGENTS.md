# AGENTS.md

## Repository-level CIP/PAL Instructions

This repository uses CIP/PAL terminology.

### CIP

- CIP is an inference-time adoption-governance framework.
- CIP governs validation, adoption, rejection, purge, Hard Abort, re-binding, and workflow conditions around C → A′.
- CIP does not directly control C or A′.
- CIP is not prompt engineering, LoRA, ControlNet, image consistency, or a generation method.

### PAL

- PAL supports persistence, anchor availability, and generative continuity across sessions.
- PAL is continuity-oriented, not adoption-governance by itself.
- PAL may support CIP-governed workflows, but PAL alone does not govern adoption, rejection, purge, Hard Abort, or re-binding.

### Core model

A → (A + C) → A′ → B′ ≠ B

Formal shorthand:

A′ ≈ T_C(A)

### C

- C is mediation that transforms A into A′.
- C includes model-side mediation and execution-structure mediation.
- A + C is shorthand for non-linear mediation, not simple addition.
- C → A′ is shorthand for the governed transformation of A into A′ under C.
- C does not independently produce A′ without A.
- Do not treat all workflow conditions as C.
- Governance actions, validation decisions, adoption, rejection, purge, Hard Abort, and re-binding are not C themselves.

### Work rules

- Use the current repository text as authority.
- Do not infer new doctrine.
- Do not broaden the theory beyond the current documents.
- Do not rewrite documents unless explicitly instructed.
- Do not optimize prose globally.
- For audits, only flag inconsistencies, outdated definitions, or terminology mismatches.
- Suggested replacements must be minimal and local.
- Codex output is evidence, not the adoption decision.