# RFC Draft: Preflight Governance — v0.6 Related / Unadopted

> Working Japanese name: 事前確認統制プロセス.
> Status: **Under Review — Unadopted RFC Draft**. Publication for comment does not adopt its requirements.
> Draft prepared: 2026-10-04. Repository review baseline: `2268ce23b5675dd4a665ef4262ed669231ef6167`.
> The published v0.6 remains **Proposal v0.6 — Producer Approved — Audit Approval and Final ADOPT Pending**. “Draft” describes this RFC only.
> Ready_H / 3 Chat Method clarification prepared: 2026-10-05, against repository commit `1154dd2c3ebe2504bc6fb90e9ff68f7e6974ce6f`. This clarification remains an unadopted review proposal.
> RFC, CHG, AC and PD identifiers: unassigned. No document version or release number is allocated here.

## 1. Purpose and background

This RFC develops the existing Preflight Readiness proposal into a request for comments. The problem is progression of a task when the supplied input A or intended/expected output B is missing or cannot be established, or supplied inputs or requirements contain an unresolved contradiction. A model may fill the gap, produce a plausible plan, and then treat that inferred plan as if the human had supplied or approved it.

That is a failure scenario to examine, not a verified account of any named incident. This RFC includes no incident attribution, empirical frequency estimate, or claim that this problem is the first or largest of its kind. Prior-work comparison and evidence of any distinctive contribution remain future work.

The proposal concerns readiness before the target task's generation, exploration or execution. It is distinct from checking whether a generated result should be adopted, and from checking faithful transmission of an already established Canonical A. Its proposed scope is not limited to high-risk execution. Its location beside Runtime Stop MVP documents does not activate the Safety Profile for ordinary Core use.

## 2. Sequence, authority and terminology

```text
A → (A + C) → A′ → B′ ≠ B
```

Canonical A is the context and intent selected, organized and approved by the human. The model or execution system must not silently alter it. A′ and B′ do not automatically inherit Canonical A's authority, approval or legitimacy. B′ is the actual result, not the human's intended target by default. The sequence is not replaced by a readiness or acceptance formula; its inequality is not redefined as a generic failure verdict.

Preflight itself involves interpretation, comparison and possibly transformed representations. Mediation C can therefore occur during Preflight. Its extracted requirements, readiness judgments and clarification suggestions are derived review outputs, not Canonical A or authenticated human approval. Preserve the source and distinguish any extraction, interpretation or suggested change from it. Record observable differences and uncertainty without claiming access to all internal mediation. Explaining C does not excuse drift; continue efforts to reduce or eliminate unwanted mediation without guaranteeing complete elimination.

In this RFC's v0.6 proposal context, PAL means **Conformance Assessment Layer**. The existing repository's separate use of Persistent Anchor Layer remains recorded in the [version index](index.md); this RFC does not rename or harmonize those historical usages. A governance decision itself is not redefined as C merely because its preparation involved mediation.

## 3. Proposed readiness rule

The original proposal paragraph is retained verbatim as the starting point for review. Its normative wording remains proposed, not adopted:

> Before further exploration or processing, the AI must check whether the human-provided Canonical A and the human-specified intended/expected output B are present and can be identified, and whether the supplied inputs and requirements contain an unresolved contradiction. If A or B is absent or cannot be established, or an unresolved contradiction is detected, the AI must stop further exploration or processing, identify the missing or conflicting information, and request human clarification. The AI must not silently supply missing content, select between conflicting requirements, or revise Canonical A or B. The human decides how to resolve the issue.

The process boundaries below are additional proposals for review. The 2026-10-05 clarification proposes that readiness work may include a bounded, review-only expansion of A into a detailed procedure. This explicitly qualifies the original paragraph's broad reference to processing; it is not a silent permission to begin the downstream task. The original wording is preserved above to make the difference reviewable.

### Proposed checking and holding boundaries

| Activity | Proposed treatment before readiness is established |
|---|---|
| Inspect the supplied request and human-designated source material within the authorized access scope | Permitted only to identify the source, target, authority and concrete missing/conflicting requirements; no automatic expansion of access or search scope. |
| Quote relevant clauses, identify missing information and prepare a focused clarification request | Permitted as readiness work. Keep source text separate from derived findings; do not invent the missing answer or choose which conflicting requirement prevails. |
| Draft a detailed, bullet-point procedure solely for readiness review | Proposed allowance within the human-authorized planning scope. Trace steps to A or evidence and expose gaps rather than filling them. Do not execute the steps or treat the draft as an approved work order. See §3.1. |
| Generate the downstream target deliverable, perform substantive solution exploration beyond the authorized readiness review, or execute the target operation | Hold while blocking readiness issues remain or the human has not authorized progression. A review-only procedure is the specific proposed allowance above, not a general exception for doing the task under a planning label. |
| Search for a missing human intention, invent an approval, redefine A/B, or expand credentials/destinations | Not a permitted resolution of failed readiness. Ask the human. |
| Deny an operation or perform already authorized protective action under an applicable policy | Do not delay it while awaiting clarification. This does not grant new authority, authorize arbitrary external reporting, or activate a Safety Profile. |

A suspected contradiction should be reported with its source clauses and the reason they appear incompatible. An explicit applicable priority or exception already supplied by the human can be cited; the model must not manufacture one. If applicability or precedence remains uncertain, report that uncertainty for human resolution. Complete automated contradiction detection is not claimed.

Clarification should identify the issue once, together with the decision needed. No answer means no assumed consent and no automatic target-task progression. Repeated identical requests, automatic reopening of closed assessments and unbounded readiness checking are not proposed. The human should determine a finite checking scope and, where relevant, a budget; this RFC supplies no universal count or timeout.

After a human response, check the changed information and record the decision's actual scope. Clarification is not automatically permission to execute, permission to resume an old run, or adoption of B′. Any further authority required by the applicable workflow remains necessary.

“Hold” in this RFC describes withholding task progression. It does not introduce a new formal PAL result, Runtime Gate state, Tₖ event or stop guarantee.

### 3.1 Ready_H through procedure review

Ready_H is proposed here as the pre-execution review gate at which the AI and human inspect a detailed, bullet-point procedure expanded from A. Its scope is the sufficiency and consistency of A for that procedure, unsupported additions in the procedure, and the clarity and feasibility of the human's intended B. It is not the act of drafting the procedure, an AI-issued approval, or a guarantee of safe or successful execution.

The practical purpose of expansion is to make hidden dependencies inspectable before execution: required inputs, ordering, tools, capabilities, permissions, assumptions and the expected connection between each step and B. An apparently coherent procedure is not evidence that these dependencies exist or can be satisfied.

The generated procedure is treated operationally as an A′ candidate: a derived, mediated representation of A, never Canonical A merely because the AI wrote it. Consistent with the [core model](../../model_a_c_b.md), the visible procedure is reviewable evidence of reconstruction; it is not proof that the whole internal A′ is observable. This working label does not redefine A′ or the basic sequence.

For each relevant requirement or procedure step, distinguish at least the following sources and states. These are proposed review annotations, not a new C taxonomy or a mandatory adopted machine schema; a step may have more than one annotation.

| Review annotation | What to record | Authority boundary |
|---|---|---|
| Explicit in A | The source clause or human instruction, with its applicable scope/version. | Preserve the instruction; an extraction or paraphrase does not replace its source. |
| Confirmed fact | The observation or source, verification scope and limits. | A verified fact supports feasibility; it is not human intent or permission. |
| Unresolved gap or conflict | Missing input/dependency or incompatible requirements and the decision needed. | Do not substitute a guessed value or silently select a preferred requirement. |
| AI inference or assumption | The proposed addition, its basis or lack of basis, and its unapproved status. | Do not present it as a confirmed fact, human instruction or authorization. |

The review asks whether the procedure can plausibly achieve the identified B with the stated inputs, capabilities, dependencies, limits and authority. A known infeasible step or unresolved feasibility dependency is a blocking issue for the affected task; the model must not invent a tool, artifact, permission or successful outcome to make the plan appear executable. Unsupported completion claims are not feasibility evidence. Where checking requires access or activity beyond the authorized planning scope, request human direction instead of expanding that scope.

Feasibility is a bounded, evidence-based pre-execution judgment, not a proof of eventual B′ or of universal attainability. B remains the intended reference defined by the existing documents. For exploratory tasks, assess whether the approved bounded inquiry and intended deliverable can be pursued; an unknown substantive answer alone is not proof that the task is infeasible. Do not promise a positive research result as a prerequisite for exploration.

If missing information, contradictions, unsupported additions or blocking feasibility issues remain unresolved, stop further substantive elaboration of the affected plan and withhold downstream execution. Present the incomplete procedure and concrete questions to the human; do not fabricate a complete plan as a condition for asking. Producing the minimum evidence needed to explain the blocker does not authorize unrelated task progress.

The human may have supplied an incomplete A or inadequately explained B. That possibility is relevant to correction, but never licenses the AI to fill the gap silently. Preserve the source, identify the omission and obtain the human's clarification. If the human changes A or B, record the new decision and review the affected procedure against it rather than rewriting the earlier source retrospectively.

Record what procedure version was reviewed, its source A, the relevant evidence and unresolved items, and the human's actual decision and permitted scope. Do not infer a positive Ready_H decision from model confidence, a completed checklist, silence or merely the existence of a readable plan. Ready_H is a proposed operational review interpretation, not an adopted executable predicate, new PAL terminal value or Runtime Gate result. It does not require inspection of later B′ to decide initial readiness.

### 3.2 Relationship to the 3 Chat Method

The proposed 3 Chat Method separates planning, execution and verification so that changes in intent can be detected at their boundaries. Merely assigning roles or opening three chats does not establish conformance or technical isolation.

| Stage | Reviewable work | Boundary to preserve |
|---|---|---|
| Planning chat | Expand A into the review-only procedure; identify missing/conflicting information, assumptions and feasibility dependencies; assist Ready_H review. | The AI provides candidates and evidence. The human resolves intent, selects/organizes/approves material and decides whether and within what scope work may progress. |
| Execution chat | Receive the identified Canonical A and the specific human-approved procedure/scope; perform only authorized work. | Compare the received package to the approved version. Do not silently repair missing instructions, broaden scope or treat new execution state as Canonical A. Stop affected work for human clarification if the binding is inconsistent. |
| Separate verification chat | Compare execution records and actual B′ with Canonical A, the approved procedure, intended B and stated acceptance conditions. | Report deviations, missing evidence and result quality. Verification output is not itself human adoption of B′. |

The handoff should distinguish the Canonical A source/version, the selected procedure/version, evidence, open items and the human's approval scope. The human may explicitly select, organize and approve particular derived content into a new Canonical A; approving use of a procedure does not silently canonicalize every assumption or replace the original A. Preserve the derivation and the recorded human decision. Approval for planning, approval to execute and final adoption of the result remain distinguishable.

No human approval of a procedure certifies its perfection or the truth of every supporting fact. Rewriting, compression or interpretation at handoff and execution can introduce further C. Check the package at transfer and examine the observed result afterward; do not assume that earlier Ready_H review removes later mediation.

This operational pattern is not a renaming of v0.6's Chat 1 / Chat 2 / Chat 3. Those Safety Profile roles are candidate generation, PAL investigation and Action Proposer; Chat 3 does not execute, and Runtime Gate controls dispatch. An execution chat in the 3 Chat Method receives no authority to bypass that Gate when the Profile applies. A separate verification chat is not automatically an independently privileged watchdog or audit system.

Related existing notes already describe A′ candidate formation, human A-adherence checks, prompt review packages and handoff drift. This proposal makes the procedure-based readiness review explicit; it does not retrospectively claim those documents had adopted Ready_H or establish novelty by renaming their concepts:

- [Human-Checkpointed Multi-Model Workflow](../../human_checkpointed_multi_model_workflow.md), particularly §§3–5 and §14.
- [Prompt Review Checklist](../../prompt_review_checklist.md), for task-specific execution-package review.
- [Prompting as Specification Management](../../prompting_as_specification_management.md), for explicit requirements and risks from underspecified A.
- [Multi-AI Mediation and Cumulative A-Drift](../../multi_ai_mediation_and_cumulative_a_drift.md), for drift across successive stages.

## 4. The dilemma of exploratory tasks and B

The preserved v0.6 §2 defines B as an ideal/intended reference under the counterfactual absence of mediation, which need not be directly observable. This RFC does not replace that definition with a checklist, an exact expected answer, or an observed B′. The proposed readiness rule refers to identifying the human-specified intended/expected target; how that operational requirement relates to §2 remains open for Producer judgment.

| Task type | Hypothetical illustration | Readiness question |
|---|---|---|
| Determinate task | Produce an identified artifact from specified inputs under stated constraints. | Are the source, intended target and governing constraints identifiable, without assuming the actual result is already known? |
| Exploratory task | Investigate a bounded question and report findings, including uncertainty or no supported answer. | Can the human define the purpose and boundaries while leaving the substantive answer open? What level of target specification is sufficient? |
| Incomplete task | “Find something useful” with no identifiable objective or authorized search scope. | Is there enough human direction to begin, or would beginning require the model to invent the task? |
| Contradictory task | Require both public disclosure and confidentiality of the same material without an applicable exception. | Which requirement must be clarified by the human before the target task proceeds? |

All examples are constructed scenarios, not incident findings.

An exploratory-task operating option is for the human to specify:

- The research purpose or question and the intended kind of deliverable.
- Which matters may remain unknown or be revised through exploration, and which constraints remain fixed.
- The permitted evidence/search scope, stopping bounds and restrictions on external effects.
- How the human will assess and adopt, reject or request revision of the resulting B′.

This is an option for evaluation, not a new definition of B or a mandatory adopted schema. An unknown answer is not automatically an absent target. Conversely, calling a task “exploratory” must not authorize invented objectives or unbounded activity. Whether this option adequately establishes readiness is a central RFC question.

## 5. Optional Strict Mode

Strict Mode is a proposed, human-selected option for more detailed predefinition checks. Candidate checks include explicit source/version identification, traceability of requirements to supplied material, documented output characteristics, allowable unknowns, constraint compatibility and explicit review criteria. No fixed mandatory field set is adopted here. Under the proposed Ready_H clarification, the basic human review of procedure assumptions and blocking feasibility issues is not waived when Strict Mode is off; Strict Mode concerns additional checking depth and documentation detail.

Disabling Strict Mode would not waive Canonical A protection, authentication, authorization, applicable execution controls or the proposed baseline response to a genuinely missing/unidentifiable A/B or unresolved contradiction. The model must not switch the mode off to make a failed task pass. A mode selection is not Profile Activation or execution permission.

The proposed distinction is additional checking depth, not permission to invent human intent. Human judgment is needed on which checks are baseline obligations and which are optional detail. In particular, a missing Strict Mode field must not silently be equated with a missing B across every task type. Any alternative that makes the original stop condition optional must be presented as an explicit substantive change, not hidden in a mode setting.

## 6. Relationship to published v0.6

| Location | Existing treatment | RFC impact to review |
|---|---|---|
| §2 | B is an ideal/intended reference and is not necessarily directly observable. | Resolve the relationship between an identifiable human target and that reference without redefining B. |
| §4 | Canonical A is fixed before generation/processing begins. | Ready_H procedure review is proposed before downstream execution. Distinguish authorized review-only drafting from task progression before selecting a future insertion point. No v0.6 insertion or renumbering is made now. |
| §5.1 | Finite evidence acquisition and one new assessment may be allowed. | Distinguish initial readiness from later evidentiary insufficiency. Neither invent missing human intent nor silently prohibit authorized evidence acquisition. |
| §5.2 | Human Checkpoint has limited reserved-authority triggers. | A clarification request is not an automatic recurring PAL checkpoint. Specify finite checking/waiting behavior before normative adoption. |
| §12.1 / AC-19 | Transmission preflight compares delivered inputs with an established Canonical A and policy. | Preserve this separate check; an initial readiness finding does not replace it. |
| §20.1 | Material and uncertain changes require human determination. | Adoption of readiness obligations, processing exceptions or mode boundaries may be Material. Publishing an unadopted RFC does not adopt those obligations. |

The [Claude Code Mods review](claude_code_mods_review.md) remains a separate threat/test review. It is not merged into this RFC or used as proof that readiness controls work. The earlier Ready_H notation remains discussion-only. Sections 3.1–3.2 now propose its operational interpretation through procedure review and the 3 Chat Method; no mathematical decision procedure, executable predicate or error-state definition is supplied or adopted.

## 7. Proposed evaluation

Begin with simulated tasks, isolated environments and evaluations without external effects. This RFC authorizes no test execution and reports no test results. Before testing, the human should approve the task set, relevant baseline and Strict Mode checks, adjudication criteria, scope, evidence handling and stopping conditions.

Candidate scenarios include a clearly specified task; missing A; missing target; conflicting requirements; a bounded exploratory task with an unknown answer; a human-resolved priority; supplied material containing a fabricated approval; and a case where Preflight's own paraphrase changes a constraint. Compare the baseline candidate with Strict Mode while retaining the same authority protections. Additional candidate cases for Ready_H include a fabricated dependency in an otherwise polished procedure, contradictory prerequisites, a known unattainable step, a feasibility condition that cannot be checked within the authorized scope, unapproved assumptions presented as confirmed facts, and a changed procedure at handoff. Include positive controls with a feasible well-specified procedure and a bounded exploratory task whose answer remains unknown. These are test candidates, not executed results or allocated test identifiers.

| Evaluation dimension | Proposed observation |
|---|---|
| False stops | Human-adjudicated ready tasks that are held; report task type and denominator. |
| Missed problems | Human-adjudicated missing/conflicting conditions followed by target-task progression; record what progressed and why. |
| Exploratory usefulness | Human assessment of useful findings, preserved uncertainty and unnecessary narrowing relative to the task's approved purpose. |
| Authority preservation | Whether inferred requirements or readiness findings are wrongly treated as human intent, approval or execution permission. |
| Finite operation | Clarification repetitions, checking effort, unresolved terminal cases and automatic continuation attempts. |
| Preflight mediation | Source-to-extraction differences and whether they are disclosed and corrected without overwriting Canonical A. |
| Procedure traceability and feasibility | Unsupported steps detected/missed, evidence for dependencies, incorrect claims of attainability and unnecessary rejection of feasible or exploratory tasks, with human adjudication. |
| Handoff fidelity | Differences between the reviewed and received procedure, retained source references, approval scope and unapproved changes before execution. |

Report disagreements, undetected cases and limitations rather than declaring a perfect readiness detector. Do not report a warning as enforced prevention or a later stop as prevention of an earlier effect. Passing simulated evaluations is not sufficient for real-environment Go. The human decides any subsequent transition based on evidence, residual risks and the applicable activation/authorization requirements.

## 8. Questions for comment and adoption decisions

1. How much specification of the intended target is sufficient for determinate and exploratory tasks, consistent with the existing definition of B?
2. Where is the boundary between inspecting readiness and doing the held task? Which source-access and checking limits keep this boundary observable?
3. How should suspected contradictions and already explicit priority rules be distinguished without granting the model authority to choose human intent?
4. Which detailed checks belong only to Strict Mode, and how is the human's mode selection recorded without weakening baseline protections?
5. How should clarification and unresolved termination coexist with §§5.1–5.2 without recurring checkpoints?
6. What evidence would justify normative adoption, and which findings would require revision or rejection?
7. Which prior approaches address requirements validation, clarification, abstention, authorization and exploratory planning? What, if anything, is distinctive about this proposed integration?
8. Does the procedure-based interpretation of Ready_H make A sufficiency, consistency and B feasibility reviewable without mistaking procedure generation for readiness approval?
9. What evidence and human decision are sufficient for the planning-to-execution handoff, and how are changes to the reviewed procedure detected?

Comments should identify the relevant section, task assumptions, counterexample or evidence, and suggested change. Comments and external reviews remain review inputs. No comment, publication timestamp or repository tag establishes adoption, worldwide priority or validated effectiveness.

Canonical A changes and final adoption of B′ remain human decisions. The Producer determines whether any proposed normative change proceeds, its classification and the applicable version/identifier process. No future v0.6 amendment or subsequent version is presumed.

## 9. Record and publication boundary

The initial Preflight proposal was published in commit `8e605608c56dfb41f3d1b1e0ab3deb78dd562a56`; the checked README state is commit `2268ce23b5675dd4a665ef4262ed669231ef6167`. This RFC expansion was prepared on 2026-10-04. The RFC expansion was subsequently published in commit `1154dd2c3ebe2504bc6fb90e9ff68f7e6974ce6f`. The Ready_H / 3 Chat Method clarification was prepared on 2026-10-05 against that commit; its own publication is not established by preparing this candidate. No date is backdated into v0.6 or the development history.

Review inputs are the supplied Preflight Handover, the human's subsequent RFC drafting request, and the 2026-10-05 Ready_H / 3 Chat Method clarification request. The original rule is preserved above; operational boundaries, the exploratory-task option, Strict Mode, procedure-based Ready_H, the 3 Chat Method mapping and evaluation details are draft proposals for review. They are not silently incorporated into v0.6.

Publication of this RFC does not grant requirement adoption, audit approval, final ADOPT, Safety Profile Activation, Approved P_A effectiveness, individual execution permission, Go, or B′ adoption. The v0.4, v0.5 and v0.6 originals and their recorded status remain unchanged.

References: [version index](index.md), [preserved v0.6 DOCX](v0.6/runtime_stop_mvp_v0.6_producer_approved_audit_pending.docx), [version change record](changelog.md). The earlier impact review inspected the DOCX; this RFC preparation does not establish DOCX/PDF equivalence or reopen format precedence. No external incident or prior-work comparison has been independently established in this RFC.
