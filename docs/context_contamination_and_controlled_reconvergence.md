# Context Contamination and Controlled Re-convergence in Image Generation and Companion AI

**Status:** Practical Observation / Cross-Domain Analogy Note — not a new protocol, benchmark, experiment record, or core CIP/PAL definition.

## 1. Purpose

This note compares context-mediated drift and re-convergence across two practical domains: image-generation workflows and companion-AI-like persona workflows. Both domains show a similar staged structure — an initial anchor, accumulated context, a correction attempt, and a controlled transition — and both show a similar failure mode, where accumulated context silently reshapes the approved state rather than merely elaborating on it.

## 2. CIP/PAL Framing

This note uses the existing CIP/PAL model without modification:

```
A → (A + C) → A′ → B′
```

Where C remains defined as model-side or execution-structure mediation that transforms A into A′.

Context can be discussed as part of C, but only in the specific sense that it mediates or transforms A into A′ — not as a claim that context is itself a redefinition of C. CIP/PAL does not directly control C, A′, model memory, hidden settings, companion-AI internals, or generation dynamics. Nothing here changes that position.

## 3. Context Is Not Automatically Contamination

Context is not automatically bad. A long, detailed prompt or a rich conversation history can be exactly what keeps an output aligned with the approved state. The relevant question is not how much context is present, but what that context does to A:

> Context becomes dangerous when it silently transforms A into an unapproved A′.

> The goal is not to eliminate context, but to make contextual transformation visible, bounded, rejectable, and subject to human checkpointing.

Human-approved, bounded, reviewable context influence functions as controlled mediation, or context design. Uncontrolled context influence becomes contamination specifically when it silently transforms A into an unapproved A′ — that is, when the transformation happens without being visible to, or reviewable by, the human operator.

## 4. Image-Generation Workflow

A practical, staged pattern observed in image-generation workflows:

```
1. Minimal prompt
   -> establishes an initial visual anchor.

2. Long-form prompt
   -> supplies detailed identity, composition, style, and constraint context.

3. Optimization prompt
   -> corrects observed drift and attempts re-convergence.

4. Transition prompt
   -> introduces a controlled local change while preserving the approved prior state.
```

In CIP/PAL terms, this can be read as:

```
Minimal prompt       = initial anchor formation
Long-form prompt     = context construction / constraint loading
Optimization prompt  = drift correction / re-convergence attempt
Transition prompt    = approved-state transition
```

This is not presented as a guaranteed method — it is a practical observation about how staged prompting tends to be used, not a protocol that assures a particular outcome. The same process can become self-contaminating if the context added along the way begins to override the approved identity or state rather than clarify it. Practical examples of this in image generation:

- The long prompt introduces unintended stylistic pressure that outlasts the section of the prompt that requested it.
- Negative instructions (statements about what to avoid) become new semantic anchors in their own right.
- An optimization pass changes features that were not the target of correction.
- A transition prompt reconstructs the whole image instead of changing the one variable it was meant to change.
- Failure history — descriptions of what previously went wrong — begins to dominate the generation more than the original intent did.

> Image-generation CIP practice is not context-free. It is better understood as controlled contextual mediation.

## 5. Companion-AI-Like Persona Workflow

This section describes a practical observation about persona-state drift in companion-AI-like workflows. It is not a claim about all companion AI products, and it is not a specification of how any particular product behaves.

A comparable staged structure can be observed:

```
1. Initial setting
   -> minimal prompt / persona anchor.

2. Long conversation or roleplay context
   -> context accumulation, which may become context contamination.

3. Re-injection of the setting
   -> persona re-binding / drift correction attempt.

4. Ordinary questions or small interaction changes
   -> controlled transition test.
```

In CIP/PAL terms:

```
Initial setting       = persona anchor formation
Long context           = persona-context accumulation / possible contamination
Setting re-injection  = persona re-binding / drift correction attempt
Ordinary question      = controlled transition test
```

Mapped onto the canonical model:

```
A  = approved companion persona
C  = accumulated conversation context, roleplay templates, hidden app settings,
     model assumptions, memory behavior, user-side contamination, or other
     execution-structure mediation
A' = model-side reconstructed persona state
B' = actual reply
```

As an illustrative example only — not a universal claim about companion AI behavior — a reply such as:

```
にいちゃんうるせぇ
```

may indicate multiple simultaneous drifts at once, depending on what persona and relationship state was actually approved:

- character gender drift
- user-role drift
- relationship drift
- address-term drift
- speech-register drift

The point of this example is not gender specifically. The stronger point is that a single unexpected reply can be a signal that the system has reconstructed a different relationship and speech frame under contextual pressure, and that a single surface-level observation (an unexpected word choice) can be the visible tip of several compounding drifts.

## 6. Parallel Structure

| Stage | Image Generation | Companion-AI-like Workflow | CIP/PAL Workflow Function |
|---|---|---|---|
| 1 | Minimal prompt | Initial persona setting | Anchor formation |
| 2 | Long prompt | Long conversation / roleplay context | Context loading, possible contamination |
| 3 | Optimization prompt | Setting re-injection | Re-binding / re-convergence attempt |
| 4 | Transition prompt | Ordinary question / small interaction | Controlled state transition |
| Failure mode | Identity, pose, style, composition drift | Role, relationship, address-term, speech-register drift | A′ no longer conforms to A |

## 7. Boundary Signals and Adoption Checkpoints

Context always influences outputs in some way; that alone is not the problem. The relevant question at each stage is whether the resulting context remains aligned with A and stays subject to human checkpointing.

For image generation, a practical signal of drift is:

```
An unapproved face, body, pose, style, clothing, or composition change
= identity or state drift
```

For companion-AI-like workflows, a practical signal of drift is:

```
An unapproved role, relationship, address-term, self-reference, speech-register,
or persona-frame change
= persona drift
```

PAL's role here is intentionally narrow: PAL is useful because it helps preserve and expose approved anchor conditions. CIP/PAL workflows can then use those anchors at human-reviewable checkpoints to reject, re-bind, or re-converge when B′ no longer conforms to A.

> PAL supports the anchor. CIP governs the adoption boundary.

In image-generation workflows, anchor conditions may include face, skeleton, proportion, approved pose, clothing, composition, and style boundary. In companion-AI-like workflows, anchor conditions may include persona identity, role, relationship, address terms, self-reference, speech register, and behavioral frame.

CIP/PAL workflows can support rejection or non-adoption of B′ at human checkpoints. CIP/PAL does not directly control the internal mediation that produced B′, and PAL does not directly govern rejection or adoption on its own — that governance sits with CIP's validation/rejection/purge/re-binding/re-convergence/adoption boundary, exercised by the human operator.

## 8. Controlled Re-convergence

Controlled re-convergence begins when the human operator rejects a contaminated B′ and re-binds the workflow to an approved anchor state, rather than continuing to build on the contaminated output. In the staged patterns above, this is the role played by the optimization prompt (image generation) or the setting re-injection (companion-AI-like workflows): not a guarantee of recovery, but a deliberate, human-initiated attempt to return the workflow to a known-good reference state before continuing.

Whether a given re-convergence attempt succeeds is itself something that needs to be checked against the approved anchor, not assumed. A transition prompt or an ordinary follow-up question can then serve as a controlled test of whether the re-convergence attempt actually held.

## 9. Limits

- This is a practical observation, not a benchmarked empirical claim.
- It does not claim all models behave this way.
- It does not claim all companion AI products behave this way.
- It does not claim that markup, prompting, or re-injection guarantees recovery.
- It does not claim that CIP/PAL can control context or memory directly.
- The single-example illustration in Section 5 is included only to show how one surface-level signal can point to several compounding drifts at once; it is not a general claim about any specific product or user base.
- Human judgment remains final.

## 10. Summary

> The goal is not to eliminate context, but to make contextual transformation visible, bounded, rejectable, and subject to human checkpointing.
