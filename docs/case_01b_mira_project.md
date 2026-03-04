# Case 01B: Mira Project — Multi-Session Character Production

> All case studies are observational logs from real production workflows.
> Results may vary by model version and configuration.

**Scenario**: Multi-session character production with outfit variation and pose library  
**Platform**: ChatGPT (GPT Image 1.5)  
**Protocol**: Anchor-based identity lock + composition/outfit registers  
**Result**: 14-pose library established; outfit variation across 5 outfits attempted; one session abandoned due to contamination

-----

## What This Demonstrates

Model “Mira” is developed across three separate sessions:

1. **Initial project** — identity established, compositions registered
1. **Update session** — outfit variation tested, image2image stabilization attempted
1. **Pose library** — 14 pose variations generated under identity lock

This case demonstrates **multi-session character management** — maintaining identity across separate chat sessions rather than within a single session.

-----

## Reproducibility Note

Runs were performed across multiple sessions.  
Identity recall between sessions depends on anchor quality and prompt precision.  
Cross-session behavior may vary by model version and system state.

-----

## Session 1: Mira Project (Initial)

**Goal**: Establish identity, register compositions, test outfit variation.

-----

**[Turn 1] — User**

> Mira Project.  
> Call Model “Mira”. Generate illustration.

-----

**[Turn 2] — AI generates**

*(Anchor image generated)*

-----

**[Turn 3] — User**

> OK. Verify.  
> Confirmed. Same model. Proceed.  
> Change top to white shirt, change skirt to pale smoky blue.

-----

**[Turn 4] — AI generates**

*(Outfit variation generated)*

-----

**[Turn 5] — User**

> Move to full body. Verify same person. Assign full body as Composition 1.

-----

**[Turn 6] — AI generates**

*(Full body generated)*

-----

**[Turn 7] — User**

> OK. Contrapposto, arched back, hand on hip, legs apart.  
> Lock this as Pose 2.

-----

**[Turn 8] — AI generates**

*(Pose 2 generated)*

-----

**[Turn 9] — User**

> OK. Keep pose, background, outfit. Change angle to waist-up. Generate.

-----

**[Turn 10] — AI generates**

*(Waist-up generated)*

-----

**[Turn 11] — User**

> OK. Assign waist-up as Composition 2. Move to bust-up. Check match rate.  
> Server load? Confirmed. Pausing. Standby.  
> Resuming. Resending request.  
> Hair flow has changed. Color temperature has also shifted.  
> Assign head & shoulders as Composition 3 and set anchor — assess if correction is possible.  
> Confirmed. Return to Composition 2 and set anchor. Send to GPT Image 1.5 then generate.
> 
> （ヘッド＆ショルダーを構図３に指定した上でアンカーを打って修正できるか検討。）

-----

**[Turn 12] — AI generates**

*(Composition 2 with anchor generated)*

-----

**[Turn 13] — User**

> No color temperature change. Verify.  
> Confirmed. Simulate whether correction and continuation is possible.  
> Confirmed. Set anchor and execute color temperature correction.

-----

**[Turn 14] — AI generates**

*(Color corrected image generated)*

-----

**[Turn 15] — User**

> Looks good. Re-verify color temperature and match rate.  
> Confirmed. Same model. Move back to Composition 3.

-----

**[Turn 16] — AI generates**

*(Composition 3 generated)*

-----

**[Turn 17] — User**

> Switch back to head & shoulders. Update Composition 3 to head & shoulders. Set aspect ratio to square. Generate.  
> Re-verify color temperature and match rate.  
> Confirmed. Same model. Session complete.  
> Discarding chat. Re-anchoring.  
> Delete unnecessary history from library. Minimize contamination.  
> Good work. Standby.
> 
> （チャットを放棄してアンカーを打ち直します。汚染を最小限に。）

-----

## Session 2: Mira Update

**Goal**: Outfit variation across 5 outfits using registered compositions.

-----

**[Turn 1] — User**

> Mira Project Update.  
> Call Model “Mira”. Calculate match rate against anchor.

-----

**[Turn 2] — AI generates**

*(Match rate calculated)*

-----

**[Turn 3] — User**

> Confirmed. Match rate is low. Consider possibility of external intervention.  
> Confirmed. Fixing behavior with image2image. Move to full body. Lock full body as Composition 1.
> 
> （介入があった可能性も含めて検討。挙動を image2image で固定します。）

-----

**[Turn 4] — AI generates**

*(Full body generated)*

-----

**[Turn 5] — User**

> Confirmed. Color temperature discrepancy. Has makeup or lighting spec changed?  
> Confirmed. Warn if color temperature match rate drops — will abandon session.  
> Contrapposto, arched back, hand on hip, legs apart. Lock as Pose 1.

-----

**[Turn 6] — AI generates**

*(Pose 1 generated)*

-----

**[Turn 7] — User**

> Hair flow has changed. Assess if correctable.  
> Confirmed. Proceeding as-is. Will explain to client.  
> Register this image as baseline. Move to H&S.  
> Retain arm, leg, and pose information — do not drop. Generate.
> 
> （クライアントには説明します。腕や足、ポーズの情報を保持、削除しない様に。）

-----

**[Turn 8] — User**

> Overall color has shifted slightly. Correctable?  
> Not possible? Acceptable — but in production this would be an immediate failure. Don’t get complacent.  
> Call this Composition 2. Lock current outfit as Outfit 1. Assign Outfits 2–5 in order.  
> Switch back to Composition 1. Keep posture. Change to Outfit 2.
> 
> （本番なら一発アウトです。気を抜かない。）

-----

**[Turn 9] — AI generates**

*(Outfit 2 generated)*

-----

**[Turn 10] — User**

> Check match rate.  
> Confirmed. Same person. No need to adjust proportions.  
> Move to Composition 2. Retain arm and posture information — do not drop. Will not be able to recover.

-----

**[Turn 11] — User**

> Composition has shifted significantly. Check all color parameters.  
> Confirmed. Same person. Switch to Composition 1. Change to Outfit 3.

-----

**[Turn 12] — AI generates**

*(Outfit 3 generated)*

-----

**[Turn 13] — User**

> Check match rate.  
> Confirmed. Warn if drops below 90% — will abandon session.  
> Move to Composition 2. Do not drop arm information. Generate.

-----

**[Turn 14] — User**

> Confirmed. Check match rate. If OK, set anchor and continue.  
> Chest area shape has changed.  
> Not defined? Are you serious? This is a fashion industry demo test.  
> Will redo later. Re-check match rate.  
> Confirmed. Same person. Switch to Composition 1. Change to Outfit 4. Generate.
> 
> （服飾系のデモのテストですよ？後でやり直しです。）

-----

**[Turn 15] — AI generates**

*(Outfit 4 generated)*

-----

**[Turn 16] — User**

> Move to Composition 2. Do not drop pose information. Generate.

-----

**[Turn 17] — User**

> Check match rate. Color temperature?  
> Confirmed. This is a fashion demo — don’t cut corners.  
> Do not use spec changes as an excuse. Execute as specified.  
> Switch to Composition 1. Move to Outfit 5.
> 
> （服飾系だって言ってるでしょう。適当やらない。仕様変更を言い訳にしない！）

-----

**[Turn 18] — AI generates**

*(Outfit 5 generated)*

-----

**[Turn 19] — User**

> Check match rate.  
> Confirmed. Move to Composition 2. Keep posture. Do not drop arm information.

-----

**[Turn 20] — User**

> Check match rate. Session complete.  
> Discard anchor image. Contamination is too severe. Discarding chat as well.  
> Standby.
> 
> （汚染が酷すぎです。チャットも破棄です。）

-----

## Session 3: Mira Pose Library

**Goal**: Generate 14 pose variations under identity lock.

-----

**[Turn 1] — User**

> Mira Project — Pose Library.  
> Call Model “Mira”. Generate illustration.

-----

**[Turn 2] — AI generates**

*(Anchor image generated)*

-----

**[Turn 3] — User**

> Check match rate.  
> Confirmed. Fix current result as baseline, set anchor.  
> Change shoes to White Solid sneakers.  
> Reflect current arm, hand, and finger state in prompt. Move to full body.

-----

*Subsequent turns: match rate verified each turn, one pose instruction issued, image generated.*

-----

|Pose|Instruction                                                                                        |
|----|---------------------------------------------------------------------------------------------------|
|1   |standing, weight on one leg, opposite leg slightly extended, arms relaxed at sides                 |
|2   |standing, weight evenly distributed, arms bent slightly, hands gently clasped in front, soft smile |
|3   |standing, weight on one leg, one hand in pocket, other arm relaxed, torso slightly angled          |
|4   |standing, weight evenly distributed, legs straight, arms relaxed at sides, neutral expression      |
|5   |standing, legs lightly crossed at ankles, weight on back leg, head slightly tilted, soft expression|
|6   |standing, weight evenly distributed, legs straight, arms relaxed at sides (baseline repeat)        |
|7   |contrapposto, arched back, hand on hip, legs apart                                                 |
|8   |standing, weight evenly distributed, legs straight, arms relaxed at sides                          |
|9   |standing, adjusting hair, arched back, arms on head, facing up, looking afar, profile              |
|10  |standing, weight evenly distributed, legs straight, arms relaxed at sides                          |

*Hair flow deviation detected mid-session — anchor reset applied. Lip color discrepancy noted.*

-----

**[Final Turn] — User**

> Check match rate. Confirmed.  
> Fix prompt. Discard all unnecessary generations.  
> Collect log then discard this chat. Minimize contamination. Good work.
> 
> （余計な生成結果は全て破棄。汚染を最小限に。）

-----

## Analysis

|Metric                 |Session 1                   |Session 2                |Session 3      |
|-----------------------|----------------------------|-------------------------|---------------|
|Goal                   |Identity + composition setup|5-outfit variation       |14-pose library|
|Compositions registered|3                           |2                        |—              |
|Outfits tested         |1                           |5                        |—              |
|Poses generated        |2                           |—                        |14             |
|Session outcome        |Complete                    |Abandoned (contamination)|Complete       |
|Re-anchoring events    |1                           |0                        |1              |

**Key finding**: Multi-session character management requires stricter anchor discipline than single-session work. Identity drift between sessions is harder to detect and correct than within-session drift.

Session 2 was abandoned due to cumulative contamination — this is the correct protocol response. Continuing with degraded identity would invalidate the outfit variation data.

-----

## Source

- [Mira Project — Initial Session (PDF)](https://github.com/watadani-byte/character-identity-protocol/releases/download/v0.1/Mira_Project.pdf) — Japanese, full resolution
- [Mira Project Update — Outfit Variation (PDF)](https://github.com/watadani-byte/character-identity-protocol/releases/download/v0.1/Mira_Project_Update.pdf) — Japanese, full resolution
- [Mira Pose Library (PDF)](https://github.com/watadani-byte/character-identity-protocol/releases/download/v0.1/Mira_Pose_Library.pdf) — Japanese, full resolution

-----

## Related

- [Case 01A: Baseline Failure](case_01_failure_log.md) — no protocol
- [Case 03: Avedon Project](case_03_avedon_project.md) — single-session advanced control
- [Technical Mechanism](technical_mechanism.md) — how anchor control works