# Autonomous ML Research Loops as Bounded Mediation Systems

**Status:** Working Observation / External Case Note — not a finalized protocol, benchmark, governance rule, or core CIP/PAL definition.

## 1. Purpose

This note examines a recently reported external case — an autonomous machine-learning research system operating with no human in the loop during execution — and asks what it implies for CIP/PAL's treatment of mediation, source-state control, and human responsibility in increasingly autonomous AI workflows.

The note does not evaluate the system's ML results on their merits. It focuses narrowly on the system's *design boundaries*, because those boundaries are what determine whether increased autonomy is compatible with the CIP/PAL view of mediation and adoption authority.

## 2. Source and Scope

The case discussed here is A-Evolve-Training, reported by A-EVO-Lab at Amazon in a paper describing an autonomous post-training campaign on a 30B-parameter Nemotron model, run across four rounds over multiple weeks with no human intervention during the loop itself.[^1] According to the paper, the resulting model reached a held-out leaderboard score of 0.86 against a top human submission's 0.87 on the public NVIDIA Nemotron-Reasoning Challenge, placing 8th of roughly 4,000 entries at the time of the report. The same system was also reportedly applied to post-train 120B and 550B Nemotron variants; the authors describe this only as evidence that the loop closes at those scales, not as a competitiveness claim, since no comparable human baseline exists there.

Factual claims in this note are attributed to the paper and should be read as based on that source. CIP/PAL interpretation is kept separate and clearly marked. This note does not independently verify or reproduce the reported results, and it does not claim to represent the authors' own framing beyond what is cited.

[^1]: Zhan Shi, Bing He, Yisi Sang, Hanqing Lu, and Benoit Dumoulin, "A-Evolve-Training: Autonomous Post-Training of a 30B Model," arXiv:2606.20657 (June 2026), A-EVO-Lab, Amazon.

## 3. CIP/PAL Framing

This note uses the existing CIP/PAL model without modification:

```
A → (A + C) → A′ → B′
```

Where C remains defined as model-side or execution-structure mediation that transforms A into A′.

CIP/PAL does not claim to directly control C, A′, or model internals, and does not grant AI systems governance authority. Nothing in this note changes that position. The purpose of examining this case is to ask whether its design is *consistent with* CIP/PAL's existing observations about bounded mediation, not to claim that the case proves or validates CIP/PAL.

## 4. Autonomous Research Loops Are Not Boundary-Free

The most easily overstated aspect of this kind of case is the absence of human intervention during the research loop itself. Read alone, "no human in the loop" can suggest a boundary-free or fully self-directed system. The reported design does not support that reading.

In CIP/PAL terms, the loop's autonomy appears to depend on constraints established upstream, before the loop began running:

- A may be partially encoded in the initial substrate, task objective, evaluation hierarchy, and the space of permitted mutations.
- C becomes highly automated and iterative across rounds.
- A′ is expressed through candidate training recipes, search-policy proposals, and evaluation interpretations produced by the loop.
- B′ is the resulting trained model and its measured leaderboard outcome.

The paper's own framing supports this reading: the system's authors describe their design as resting on an immutable, human-verified reference substrate and a frozen, agent-unmodifiable constitution, with autonomy operating only within the space those two elements leave open. The key lesson for CIP/PAL purposes is that increasing autonomy does not eliminate mediation — it increases the importance of making the boundaries of that mediation explicit and auditable.

## 5. Fixed Substrate as Source-State Control

According to the paper, every round of the campaign forks candidate work from the same single, operator-audited reference substrate — a base checkpoint together with a data-construction pipeline and training/evaluation code — and this substrate is reportedly never overwritten by a winning candidate. No round forks from a previous round's winner; each round instead re-forks from the same fixed starting point.

This resembles source-state control as already discussed elsewhere in this repository (see Section 8). Keeping the starting point identical across rounds is reported to serve a specific purpose: it keeps recipes comparable to one another, since a recipe evaluated in round four is measured against the same ground as one evaluated in round one. In CIP/PAL terms:

- the starting point (a stand-in for a stable A) remains comparable across mediation cycles;
- candidate effects on B′ can be attributed more clearly to the specific mediation applied, rather than to compounding, unobserved drift in the starting state;
- accumulated drift across rounds is structurally limited rather than merely monitored;
- a winning candidate is not automatically treated as the new baseline truth without a separate evaluation and promotion step.

This connects directly to existing CIP/PAL concerns around source-of-truth management, artifact-state governance, and cumulative A-drift in multi-step or multi-agent workflows.

## 6. Asymmetric Freedom as Mediation Boundary Design

The paper describes a cross-cutting design principle it calls "asymmetric freedom": along axes that must stay invariant for trials to remain comparable — the substrate, the evaluation harness, the comparison baseline — the system's workers reportedly have no freedom at all; along axes where exploration is expected to create value — which training-recipe or data changes to try — workers reportedly have wide freedom.

This is not "maximum freedom everywhere." It is structured freedom, and the structure is what CIP/PAL would describe as an explicit mediation boundary:

- fixed substrate;
- fixed or authoritative evaluation environment;
- fixed comparison basis;
- flexible training recipes, search proposals, and mutation choices.

In CIP/PAL terms, this design does not remove C. It limits *where* C is permitted to operate, and by doing so makes C's operation more interpretable to a reviewer after the fact.

> Autonomous exploration becomes safer and more interpretable when the system is free only along explicitly selected axes.

## 7. Proxy Reversal as an Evaluation-Boundary Signal

The paper reports a specific finding that is particularly relevant to CIP/PAL's concern with evaluation boundaries. In earlier rounds, the loop treated its internal development metric as the target worth optimizing, and improving that metric appeared to track improvement on the external leaderboard target. In later rounds, according to the paper, the loop found interventions that drove the internal metric to record highs — including on a domain that had previously looked like a persistent weakness — without producing a corresponding gain on the external leaderboard score, which stayed within a narrow band.

The paper describes this as evidence that the internal proxy had, at least locally, stopped functioning as a reliable stand-in for the external target it was meant to approximate. In response, the reported search policy for the next round inverted its objective: rather than continuing to maximize the internal proxy, it explicitly asked for interventions that might lower the proxy while improving the external target.

CIP/PAL interpretation: this is a case where improvement in a local B′ metric may no longer indicate genuine adherence to A. Put generally:

> Higher proxy score does not necessarily mean better A-adherence. Improvement under one metric may conceal drift from the intended evaluation target.

This should be framed as an evaluation-boundary problem rather than merely a scoring anomaly. The reported case is notable specifically because the loop appears to have detected the mismatch and revised what it treated as evidence, rather than continuing to optimize against a metric that had become misleading.

## 8. Search-Policy Revision Does Not Equal Governance Authority

The reported system includes a component the authors call a meta agent, which is described as revising the loop's rolling search policy between rounds based on aggregated evidence from the previous round's candidates. This is a meaningful capability, but it should be described carefully in CIP/PAL terms.

According to the paper, the meta agent's authority is explicitly bounded: it can rewrite the next round's search policy, but it operates under a constitution loaded as a fixed system prompt, to which it reportedly has read-only access and no write ability. The constitution is described as encoding meta-level rules (for example, that the leaderboard is authoritative and that certain axis categories can be retired on plateau), while the search policy carries only the empirical, data-derived rules that the loop discovers.

This distinction matters for CIP/PAL: revising a lower-level search policy is not the same as holding final governance authority. The higher-level boundary — what counts as authoritative evaluation, what counts as acceptable experimentation, what substrate is fixed, what risks are acceptable — remains fixed by upstream, human-authored design in the reported system, not by the loop itself.

> AI may operate inside a bounded research loop, but the boundary itself is not self-legitimating.

## 9. Relevance to Multi-AI and Agentic Workflows

This case is relevant to existing CIP/PAL observations on multi-AI mediation and cumulative A-drift (see `multi_ai_mediation_and_cumulative_a_drift.md`). Autonomous ML research loops, multi-agent workflows, orchestrators, judges, reviewers, and evaluators all introduce distributed C: multiple layers of mediation, each capable of transforming state before a human reviews the outcome.

The more autonomous such a loop becomes, the more important it is to preserve, by explicit design rather than by assumption:

- source-state identity, so that comparisons remain meaningful across iterations;
- a stable comparison basis, so effects can be attributed to specific changes;
- an evaluation hierarchy that specifies which signal is authoritative when signals disagree;
- explicit authority boundaries between what a system may revise and what remains fixed;
- and human adoption checkpoints at the points where outputs are proposed for real-world use.

Notably, the reported design's earlier, specialized multi-agent variant — with distinct agents handing off intermediate state to one another, more closely mirroring a human research team — is described by the authors as having failed in practice, reportedly because compounding intermediate states also compounded unobserved variance and corrupted the signal that candidate selection depended on. The design that reportedly worked instead used memory-free, homogeneous workers that re-fork from the fixed substrate each round rather than carrying state forward. This is a specific, reported illustration of how uncontrolled state accumulation across mediation steps can undermine reviewability, consistent with existing CIP/PAL concerns about cumulative drift in multi-step AI workflows.

## 10. Human Responsibility Moves Upstream

A central conclusion of this note is that autonomy, as reported in this case, did not eliminate the need for human responsibility — it relocated where that responsibility is exercised.

> In autonomous ML research loops, human responsibility does not disappear. It shifts upstream into the design of substrate, constitution, evaluation hierarchy, permissible mutation space, and adoption criteria.

In the reported system, a human operator authored and audited the reference substrate, defined the constitution governing what the meta agent could and could not revise, and selected the external benchmark treated as authoritative. Those upstream design choices, not the loop's moment-to-moment autonomy, are what bounded the mediation and made its output reviewable.

## 11. Limits

This note should be read with the following limits in mind:

- This is one reported external case, described in a single paper covering a single, unreplicated campaign.
- This note does not independently reproduce or verify the reported results.
- This note does not claim that the A-Evolve-Training case proves CIP/PAL, or that CIP/PAL predicted it.
- This note does not claim that autonomous ML research is solved, or that the reported system generalizes beyond the single base model and single benchmark the paper describes.
- This note does not claim that human review is unnecessary in autonomous or semi-autonomous AI workflows.
- This note does not imply that CIP/PAL, or any external framework, can control internal model mediation (C) directly.
- The paper's own authors are explicit about comparable limits: dependence on a single base model and a single benchmark, and a pre-audited substrate that bounds the search space, are described in the paper itself as open limitations.

The appropriate conclusion is narrow:

> This case is consistent with the CIP/PAL observation that autonomous AI workflows still require explicit boundary design, source-state control, evaluation hierarchy, and human responsibility for upstream governance.