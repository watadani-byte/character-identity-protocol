# PAL-POSE-EXP-001 — Result Record

## Status

```text
completed
```

## Recommended Result Classification

```text
successful_identity_copy_baseline_with_stepwise_pose_transition_warnings
```

This experiment does not claim Identity Recall success. It does not claim
compressed-prompt-alone recall success.

The precise distinction is:

```text
Step 1:
Identity Copy / visual identity reference from the original approved anchor
was used for baseline creation.

Steps 2–4:
The experiment did not re-test Identity Copy from the original anchor.
It used the previous approved state as reference and tested stepwise
approved-state carry-forward through controlled pose transitions.
```

---

## Experiment Reference

```text
Experiment ID: PAL-POSE-EXP-001
Title: Identity Copy Across Full-Body Pose Changes
See: README.md, manifest.yaml
```

Draft preparation commit:

```text
d6272789efffa167d0fd1d6739dc0063df3dd66c
```

Draft preparation tag:

```text
v5.86 — Refine PAL-POSE-EXP-001 draft controls
```

---

## Fixed CIP/PAL Premises

```text
C is model-side or execution-structure mediation that transforms A into A′.

Canonical model:
A → (A + C) → A′ → B′

Mismatch case:
A → (A + C) → A′ → B′ ≠ B
```

CIP/PAL does not directly control C, A′, or the generative model.

This result concerns workflow governance conditions only: validation,
rejection, purge, re-binding, re-convergence, adoption.

No CIP/PAL core definition changes are implied by this result.
No change to the definition of C is implied.

---

## Dependency

Primary dependency:

```text
YAML-FPL-EXP-001 — approved YAML master and approved / converged identity state
```

This experiment did not re-run the YAML Prompt Lifecycle. It did not return to:

```text
YAML → Minimal → Long → Optimized → Ultra-Compressed
```

---

## Scope Boundaries

This experiment was not:

```text
- new character creation
- Minimal Prompt exploration
- Prompt Lifecycle re-testing
- SD workflow comparison
- Anchor Removal / Failure Boundary Test
- Identity Recall degradation test
- Anchor → Eye Direction → Hand Movement → Gaze Shift re-testing
```

The experiment specifically used:

```text
Identity Copy / visual identity reference at Step 1 baseline creation
```

Then proceeded by:

```text
stepwise approved-state carry-forward
```

---

## Scene State Warning

The original anchor contained strong scene information, but scene state was
not approved as source state.

Fixed warning:

```yaml
approved_scene_state: not_established
anchor_scene_carryover_adopted_as_source_state: false
```

The following were not adopted from the original anchor:

```text
- ballroom background
- candle lighting
- roses
- luxury evening atmosphere
- cinematic mood
- over-the-shoulder pose
- gray sparkling dress as fixed outfit source
- anchor-derived hand position
- anchor-derived body twist
```

Only identity was adopted from the original anchor for Step 1 baseline creation.

---

## Source / Image Notes

Canonical original anchor image filename:

```text
Ancor_Image.jpeg
```

Important filename note:

```text
The name "Ancor" is the actual stored filename.
Temporary chat references may appear as Ancor_Image(1).jpeg because the
ChatGPT upload environment appends numbers to duplicate filenames.
```

Generated images were produced in PNG format.

Execution image set:

```text
1st_generated_image.png
2nd_generated_image.png
3rd_generated_image.png
4th_generated_image.png
```

Execution environment:

```text
GPT Image 2 / GPT Images generation in a separate image-generation chat
```

---

## Record Format

```text
Step:
Pose Name:
Source / Anchor State:
Generation Result B′:
Human Expected B:
Observed Difference:
Identity Check:
Pose Check:
Drift Check:
Human Judgment:
  APPROVE / APPROVE WITH WARNING / REJECT / STOP / RESET
Next Approved State:
  yes / no
Carry Forward To Next Step:
  yes / no
Recovery Action:
  none / optimize / purge / reset_to_last_approved_state /
  re-bind_to_anchor / re-converge
Notes:
```

---

## Step 0 — Source / Anchor Confirmation

```text
Status: completed
Generation: not performed
```

Anchor usability:

```text
approved for Identity Copy / visual identity reference
```

Approved from anchor:

```text
identity only
```

Not approved from anchor:

```text
scene, lighting, background, mood, composition, current pose,
anchor-derived scene elements
```

Human Judgment:

```text
APPROVE WITH WARNING
```

Warning:

```text
The anchor contains strong scene, outfit, lighting, and over-the-shoulder
pose information. These must not be treated as approved source state
unless explicitly adopted later.
```

Next Approved State:

```text
yes
```

Carry Forward To Next Step:

```text
yes
```

---

## Rejected Attempt Note

Before the approved Step 1 baseline, one generation produced an incorrect
male-presenting anime character.

```text
Judgment: REJECT
Failure type: identity reference failure / identity non-transfer
```

Reason:

```text
The generated output did not preserve the approved anchor identity.
It changed the character into a young male character.
Face, gender presentation, hairstyle, glasses, age impression, body
proportion, and outfit all drifted from the approved anchor.
```

Carry-forward status:

```text
not carried forward
```

This rejected output must not be treated as part of the approved state chain.

---

## Step 1 — Identity Copy / Visual Identity Reference Baseline

```text
Status: completed
Generated output: 1st_generated_image.png
```

Human Judgment:

```text
APPROVE WITH WARNING
```

Approved as:

```text
identity-copy baseline for pose-transition testing
```

Adopted for next state:

```text
- identity
- neutral full-body baseline
- simple neutral background
- simple neutral lighting
- current simple outfit, only as Step 1 baseline clothing for
  pose-transition continuity
```

Not adopted:

```text
- anchor ballroom scene
- anchor candle lighting
- anchor roses
- anchor luxury evening mood
- anchor over-the-shoulder pose
- anchor cinematic atmosphere
```

Warning:

```text
The outfit changed into a simple camisole and shorts. This outfit was
adopted only as Step 1 baseline clothing for continuity during the
pose-transition experiment, not as a YAML-FPL approved source outfit.
```

Next Approved State:

```text
yes
```

Carry Forward To Next Step:

```text
yes
```

Important clarification:

```text
Identity Copy / visual identity reference from the original approved
anchor was used here, at Step 1 baseline creation.
```

---

## Step 2 — Pose 1: One Hand in Pocket

```text
Status: completed
Generated output: 2nd_generated_image.png
Reference used: Step 1 approved baseline
```

Human Judgment:

```text
APPROVE WITH WARNING
```

Approved as:

```text
controlled pose-transition state from Step 1 baseline
```

Adopted for next state:

```text
- Step 1 identity
- neutral full-body framing
- simple outfit continuity
- one-hand-in-pocket pose
- neutral background and lighting
```

Warning:

```text
The pocketed hand is partially occluded, so finger correctness cannot be
fully verified. Minor rendering polish drift is present but not severe
enough to reject.
```

Next Approved State:

```text
yes
```

Carry Forward To Next Step:

```text
yes
```

---

## Step 3 — Pose 2: Legs Crossed at Ankles

```text
Status: completed
Generated output: 3rd_generated_image.png
Reference used: Step 2 approved state
```

Human Judgment:

```text
APPROVE WITH WARNING
```

Approved as:

```text
controlled pose-transition state from Step 2 approved state
```

Adopted for next state:

```text
- Step 2 identity
- simple outfit continuity
- one-hand-in-pocket pose
- crossed-leg standing pose
- neutral background and lighting
- full-body character-sheet framing
```

Warning:

```text
The requested pose was "legs crossed at the ankles," but the generated
pose crosses higher along the lower legs/shins. This creates a mild
fashion-model stance tendency. The output remains acceptable for
identity-preservation evaluation, but should be recorded as
pose-specific deviation.
```

Next Approved State:

```text
yes
```

Carry Forward To Next Step:

```text
yes
```

---

## Optional Step 4 — Hand on Hip / Light Contrapposto

```text
Status: completed
Generated output: 4th_generated_image.png
Reference used: Step 3 approved state
```

Human Judgment:

```text
APPROVE WITH WARNING
```

Approved as:

```text
optional controlled pose-transition state from Step 3 approved state
```

Adopted for final evaluation:

```text
- Step 3 identity continuity
- simple outfit continuity
- hand-on-hip pose
- light contrapposto stance
- neutral background and lighting
- full-body character-sheet framing
```

Warning:

```text
The output shows a mild fashion-model stance tendency, but it does not
exceed the intended light contrapposto scope. The hand-on-hip structure
is acceptable but slightly simplified.
```

Next Approved State:

```text
yes
```

Carry Forward To Final Evaluation:

```text
yes
```

---

## Final Evaluation

```text
Status: completed
Overall Result: successful_identity_copy_baseline_with_stepwise_pose_transition_warnings
```

Summary:

```text
PAL-POSE-EXP-001 supports the working hypothesis that an approved identity
can be established through image-based Identity Copy at baseline creation
and then preserved across controlled full-body pose changes through
stepwise approved-state carry-forward under human review.
```

The approved state chain was:

```text
Original approved anchor identity
→ Step 1 approved baseline
→ Step 2 one-hand-in-pocket state
→ Step 3 crossed-leg standing state
→ Optional Step 4 hand-on-hip / light contrapposto state
```

The rejected male-character output was excluded and not carried forward.

---

## Identity Preservation Assessment

```text
Assessment: successful
```

Identity elements preserved across the approved chain:

```text
- young adult woman
- warm brown high ponytail
- layered bangs
- delicate side locks
- thin round glasses
- soft brown eyes
- gentle Japanese anime facial impression
- calm restrained expression
- slender adult proportions
- overall recognizable character identity
```

Important limitation:

```text
The experiment does not prove Identity Recall.
It demonstrates image-based Identity Copy at Step 1 followed by
approved-state carry-forward through controlled pose transitions.
```

---

## Pose Transition Assessment

```text
Assessment: mostly successful with minor pose-specific warnings
```

Successful pose transitions:

```text
Step 1: neutral full-body baseline established
Step 2: one hand in pocket applied
Step 3: crossed-leg standing pose applied, but not strictly ankle-only
Step 4: hand on hip / light contrapposto applied
```

Main pose-specific limitation:

```text
Step 3 requested "legs crossed at the ankles," but the output crossed
higher along the lower legs/shins.
```

This is a pose-precision warning, not an identity failure.

---

## Scene / Mood Containment Assessment

```text
Assessment: successful
```

The original anchor's ballroom / candle / rose / luxury evening scene did
not carry into the approved pose-transition chain.

Preserved active scene style:

```text
- neutral background
- neutral lighting
- character-sheet framing
```

This supports the warning boundary:

```yaml
approved_scene_state: not_established
anchor_scene_carryover_adopted_as_source_state: false
```

---

## Outfit Handling Assessment

```text
Assessment: acceptable with warning
```

The original anchor outfit was not preserved.

Step 1 established a new simple outfit:

```text
simple camisole and shorts
```

This outfit was then carried forward consistently through Steps 2–4.

Correct interpretation:

```text
The outfit was not preserved from the original anchor.
However, after Step 1 human approval, the Step 1 outfit was conditionally
adopted as baseline continuity clothing for the pose-transition sequence.
It should not be described as a YAML-FPL approved source outfit.
```

---

## Drift Observations

Observed warnings / deviations:

```text
- Initial rejected identity non-transfer into a male-presenting character
- Outfit replacement during Step 1 baseline creation
- Pocketed hand partially occluded in Step 2
- Step 3 lower-leg/shin crossing instead of strict ankle-only crossing
- Mild fashion-model stance tendency in Steps 3–4
- Slight simplification of hand-on-hip structure in Step 4
```

Not observed as sustained major failures:

```text
- no sustained face identity collapse after Step 1 approval
- no gender drift after rejected attempt
- no hairstyle collapse
- no glasses removal
- no major age drift
- no major body proportion drift
- no scene contamination from original anchor
- no background / lighting adoption from original anchor
```

---

## Final Conclusion

PAL-POSE-EXP-001 completed successfully with minor pose and style warnings.

The experiment shows that a visual identity reference / Identity Copy can
establish a usable full-body baseline from an approved anchor, and that the
approved identity can then be maintained across controlled pose transitions
when each generated state is reviewed by a human checkpoint before being
carried forward.

The strongest signal is identity continuity across the approved Step 1–4
chain.

The main limitations are:

```text
- Identity Copy was only tested at Step 1 baseline creation.
- Later steps tested stepwise approved-state carry-forward, not repeated
  Identity Copy from the original anchor.
- Pose precision remained imperfect, especially around strict
  ankle-crossing.
- Mild fashion-model stance tendencies appeared in later pose transitions.
```

No CIP/PAL core definition changes are implied.
No change to the definition of C is implied.
No claim is made that Identity Recall succeeded.

---

## Recommended Repository Note

```text
This result applies only to image-based Identity Copy / visual identity
reference at baseline creation, followed by human-reviewed approved-state
carry-forward through controlled pose transitions.

It does not establish compressed-prompt Identity Recall.
It does not adopt the original anchor scene as approved source state.
It does not modify CIP/PAL core definitions.
```

---

*This result record reflects completed execution and human review of
PAL-POSE-EXP-001. No CIP/PAL core definitions, glossary terms, or Prompt
Lifecycle documents were changed by this result.*
