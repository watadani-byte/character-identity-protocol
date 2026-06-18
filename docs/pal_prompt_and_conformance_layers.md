## Identity Establishment and Sequence Continuation as Distinct Execution Tasks

Identity establishment and sequence continuation are distinct execution tasks. A Primary Identity Anchor establishes who the subject is; a Current Approved Sequence Reference establishes the state from which the next permitted change proceeds.

The PAL Prompt Layer does not require every approved condition to be fully re-disclosed during every generation step. In sequence continuation, the Current Approved Sequence Reference may carry much of the existing state, while the model-facing execution representation specifies only the permitted delta and the minimum conditions judged necessary to address observed or anticipated drift.

More complete condition disclosure should not be assumed to produce better continuity. In some sequence workflows, full re-disclosure may increase reconstruction pressure and cause the model to rebuild the scene rather than preserve the current approved state. This is recorded as an experimentally testable operational hypothesis and a design consideration, not as a definitive causal claim.

The PAL Prompt Layer may be used for:

- base-state establishment
- audit and pre-generation review
- delta derivation
- selective re-injection of drifted conditions

Reduced delta-only execution is also an inspectable and traceable task-specific execution representation. When used, it must be recorded as such. It is not defined as a new Layer.

The following distinctions must be preserved:

```text
Primary Identity Anchor
≠ Current Approved Sequence Reference
≠ Validated Identity Anchor
```

Using a human-approved generated candidate as the Current Approved Sequence Reference does not automatically promote that candidate to a Validated Identity Anchor or incorporate it permanently into the approved source identity.

This operational design consideration is not a redefinition of C. C remains model-side or execution-structure mediation that transforms A into A′. The question of which conditions to include in the model-facing representation is an execution-structure design decision within the existing architecture, not a change to C, CIP, or PAL.
