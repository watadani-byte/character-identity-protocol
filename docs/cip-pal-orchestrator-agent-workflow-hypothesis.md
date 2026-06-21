# CIP/PAL: Human-Supervised Orchestrator / Agent Workflow Hypothesis

> Status: Experimental hypothesis
> Validation status: Practice-derived, not yet experimentally validated
> Scope: Multi-AI workflow governance
> Relation to CIP: C accumulation and adoption governance
> Relation to PAL: Prompt / output / sequence checkpoints

-----

## Background

Workflows that span multiple AI systems — an orchestrator model, one or more specialized agent models, and intermediate tool calls — introduce mediation at every transition between systems. In the CIP/PAL framework, each such transition is a potential site of C: model-side or execution-structure mediation that transforms A into A′.

```
A → (A + C) → A′ → B′
```

When a workflow chains multiple AI systems, C does not occur once. It can occur at each hand-off between systems, and each subsequent C acts on an already-reconstructed state rather than on the original A. This can be understood as a C accumulation pattern under the CIP core model: each stage's output becomes the next stage's input, and small transformations that look acceptable at each step may compound.

B′ — an output candidate that may differ from the expected B — emerges from this chain. B′ is not assumed to be adoptable merely because it was produced by the most recent AI system in the chain.

This document records an operational hypothesis, derived from practice on a single project, about where and how human checkpoints can be placed in such a multi-AI chain to keep C accumulation observable and governable.

-----

## Hypothesis

A human-supervised Orchestrator / Agent workflow may support the preservation of user intent by improving the observability and governance of C-induced transformations before they become canonical. Compared with fully automated multi-agent chaining, this workflow is hypothesized to make each AI-generated transformation more reviewable before adoption.

This is a comparative hypothesis, not a comparative result. No controlled comparison against a fully automated multi-agent chain has been conducted.

-----

## Workflow Diagram

```
Human
  ↓
ChatGPT Orchestrator
  ↓ ← Human checkpoint
Codex
  ↓ ← Human checkpoint
Specialized AI Layer
  - ChatGPT / GPT Image 2.0
  - Claude / GitHub Copilot
  - Gemini / Google tools / Veo 3
  - Perplexity / Web search
  ↓ ← Human checkpoint
Codex
  ↓ ← Human checkpoint
ChatGPT Final Review
  ↓
Human Final Adoption
```

This diagram is descriptive, not prescriptive. It reflects one observed workflow pattern and should not be interpreted as a universal architecture.

-----

## Core Principle

```
AI output ≠ adopted result
AI output = review candidate
Final adoption = human decision
```

At each checkpoint, the human operator records one of:

- **PROCEED** — may advance to the next step
- **REVISE** — must be corrected before advancing
- **HOLD** — additional confirmation needed
- **REJECT** — not adopted

These are human decisions. No AI-generated review result independently produces any of them.

-----

## Role / Risk Table

| Layer | Role | Observed or Plausible Risk |
|---|---|---|
| ChatGPT Orchestrator | Plans the workflow, sequences sub-tasks, routes work to specialized agents | Premature commitment to a plan; silent scope drift between the stated task and the orchestrated sub-tasks |
| Codex | Executes code-level or structured tasks between orchestration and specialized AI layers | Introducing implementation choices not specified by the human; silent normalization of ambiguous instructions |
| ChatGPT / GPT Image 2.0 | Image generation and editing | Aestheticization; identity drift; cultural or stylistic reframing, such as Westernization; reinterpreting expression or composition; adding unrequested direction; auto-optimizing toward a "better image" |
| Claude / GitHub Copilot | Documentation support, code assistance, structured review | Over-confident normalization of ambiguous source material; silent paraphrase drift in transcription-sensitive tasks |
| Gemini / Google tools / Veo 3 | Search, video, multimodal generation | Source conflation; unverified claims presented with high confidence; format-driven content reshaping |
| Perplexity / Web search | External information retrieval | Citation drift; outdated or superseded information presented as current; source quality variance |
| ChatGPT Final Review | Pre-adoption synthesis and review | Summary Assimilation — smoothing over unresolved distinctions to produce a more coherent-looking final answer |

This table records plausible or observed risk categories per layer. It does not assert that every risk occurs in every workflow run, and it does not rank layers by overall reliability.

-----

## Operating Principle

Each AI-to-AI hand-off in the diagram above is treated as a potential C-introduction point. The human checkpoint following each hand-off is the governance response to that point: it is where the workflow operator inspects available evidence about the transformation — including the AI's output and, where exposed, intermediate artifacts such as rewritten prompts, execution traces, tool outputs, or other inspectable records — before that output is allowed to become the input to the next stage.

The human checkpoint is not only a quality gate. It is an adoption-governance gate.

The checkpoint does not assume that C is a failure by itself; it asks whether the C-induced transformation should be accepted, revised, held, or rejected before adoption.

A checkpoint that only asks "is this output good?" addresses quality. A checkpoint that also asks "does this output remain faithful to the original A, or has C silently substituted something else?" addresses adoption governance. Both questions are asked at each checkpoint in this workflow pattern.

-----

## Relation to Human-in-the-Loop Patterns

The general pattern of an orchestrator, multiple specialized agents, and human approval gates is not novel in itself. This document does not claim to introduce that pattern. Its narrower contribution is applying checkpoint placement specifically to the observation and governance of C accumulation and canonicalization within the CIP/PAL framework.

-----

## Limitations

- The hypothesis is derived from the practice of a single operator on a single project.
- "Preservation of user intent" is not currently defined as a measurable metric.
- No controlled comparison against a fully automated multi-agent chain has been run.
- The designer of the workflow and the observer evaluating its effectiveness are the same person, which introduces a risk of confirmation bias.
- Checkpoint frequency, placement, and cost/benefit tradeoffs have not been systematically evaluated.

-----

## Open Questions

- Can C sources be weighted by severity or frequency rather than treated uniformly?
- What is the tradeoff between checkpoint frequency and review accuracy / reviewer fatigue?
- Could a lightweight, falsifiable metric for "intent preservation" be defined for future validation?
- Does this hypothesis hold for project types other than the one it was derived from?

-----

## Document Metadata

- Status: Experimental hypothesis
- Validation status: Practice-derived, not yet experimentally validated
- Scope: Multi-AI workflow governance
- Relation to CIP: C accumulation and adoption governance
- Relation to PAL: Prompt / output / sequence checkpoints
- This document does not redefine C, A, A′, B, B′, CIP, or PAL.
- This document does not establish a standardized, proven, or validated model. It records a working hypothesis for future testing.

-----

*See: [Core Model — A → (A + C) → A′ → B′](model_a_c_b.md) — [Glossary](glossary.md)*
