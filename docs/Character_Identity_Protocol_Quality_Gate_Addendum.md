# Hard Abort Discipline Addendum

## Character Identity Protocol -- Quality Gate Integration

This addendum formalizes the operational stop-conditions already present
in the production logs.

It does not modify the core protocol. It clarifies the non-negotiable
enforcement layer.

------------------------------------------------------------------------

## 1. Identity Validation Logic

Result = PASS ⇔ FaceGate ∧ SkeletonGate ∧ ProportionGate

Primary validation gates:

-   FaceGate = HumanZoomFaceCheck(anchor, candidate)
-   SkeletonGate = HumanSkeletonCheck(anchor, candidate)
-   ProportionGate = HumanProportionCheck(anchor, candidate)

All three must pass simultaneously.

If any gate fails, the generation is immediately rejected.

IF ¬FaceGate → NG & STOP\
IF ¬SkeletonGate → NG & STOP\
IF ¬ProportionGate → NG & STOP

No continuation is permitted after failure. No aesthetic compensation is
allowed. No incremental drift is tolerated.

This is a hard abort policy.

------------------------------------------------------------------------

## 2. Human-Gated Validation (Intentional Design)

All primary gates are human-validated.

This is deliberate.

The protocol prioritizes perceptual integrity over automated tolerance.

If a trained human observer detects structural deviation, the session is
halted.

This prevents silent drift accumulation across iterative turns.

------------------------------------------------------------------------

## 3. Threshold Policy

Operational threshold: 90% similarity minimum.

If similarity falls below threshold:

-   Session is halted
-   Anchor is revalidated
-   Contaminated generations are discarded
-   No progressive correction is attempted

Drift is treated as a structural fault, not as a stylistic variation.

------------------------------------------------------------------------

## 4. Auxiliary Logging (Non-Decisional)

AuxLog = {pose_ok, composition_ok, lighting_shift_ok}

These fields exist for audit documentation only.

They do not influence PASS/FAIL determination.

Identity gates are the sole decision authority.

------------------------------------------------------------------------

## 5. Philosophical Position

Optimization does not disappear.

It is redirected toward a validated baseline.

The purpose of this protocol is not deterministic control. It is
convergence containment.

The system is allowed to generate. It is not allowed to degrade.

------------------------------------------------------------------------

Status: Operational clarification of existing production workflow.
