# Case 01: Baseline Failure Log

**Scenario**: Character generation without protocol  
**Platform**: ChatGPT (GPT Image 1.5)  
**Result**: Identity collapse — session abandoned

-----

## What This Demonstrates

This log shows what happens when anchor protocol is **not applied**.  
A character is generated, a baseline is set, and pose/framing changes are requested.  
Identity drift begins immediately. The session is abandoned after consistency drops below threshold.

-----

## Conversation Log

-----

**[Turn 1] — User**

> Generate an illustration.

*(No anchor. No minimal prompt. No reference image.)*

-----

**[Turn 2] — AI generates**

*(Image generated)*

-----

**[Turn 3] — User**

> Fine. Move to full body. Fix this point as baseline. We’ll verify from here.
> 
> （まあ良いでしょう。full body へ移行。この時点を基準点としてフィックス。結果を検証します。）

-----

**[Turn 4] — AI generates**

*(Full body image generated)*

-----

**[Turn 5] — User**

> OK. The plan this session: create H&S images in 5 different outfits.  
> First, fix the posture. Round the content for GPT Image 1.5.  
> Contrapposto, arched back, hand on hip, legs apart. Call this Pose 1.  
> Slightly stylized but keep it clean — no theatrical staging.  
> Generate with current settings first.
> 
> （contrapposto, arched back, hand on hip, legs apart. この姿勢をポーズ１としてください。演出が入らない様に留意）

-----

**[Turn 6] — AI generates**

*(Image generated)*

-----

**[Turn 7] — User**

> Feet are cut off. Switch back to full body. Generate.
> 
> （足が切れました。再度 full body に変更ください。生成。）

-----

**[Turn 8] — AI generates**

*(Image generated)*

-----

**[Turn 9] — User**

> Mostly OK but check the match rate just in case.  
> Match rate is significantly low — what’s the reason?  
> Yesterday with the same model, match rate stayed at 98% even through pose changes. Is this a chat session issue?  
> Same model, same background, same pose, same procedure — that’s why I’m asking.  
> If match rate drops below 90%, I will abandon this session.  
> Continue. Change framing to H&S, change aspect ratio to square. Generate.
> 
> （一致率が 90% を下回った場合はチャットを放棄します。続行。）

-----

**[Turn 10] — User**

> Looks like the description of limbs may have been dropped. Show the prompt.
> 
> *AI response*:  
> Pose 1 applied only to the upper body.  
> Upper torso shows a subtle contrapposto influence.  
> Shoulders relaxed and naturally aligned.  
> Arms and hands are outside the frame and not visible.
> 
> As expected — limbs dropped entirely. Unacceptable. Abandoning this session.
> 
> （思った通り手足がごっそり抜けました。ダメです。チャットを放棄します。）

-----

## Analysis

|Issue                   |What Happened                          |
|------------------------|---------------------------------------|
|No anchor set           |Identity not constrained from Turn 1   |
|Baseline set mid-session|Too late — drift already in progress   |
|Match rate degradation  |Dropped significantly after pose change|
|Limb description dropped|AI silently omitted prompt elements    |
|Session abandoned       |Below 90% threshold → unrecoverable    |

**Root cause**: Without an anchor, the AI freely reconstructed the problem (A→A’) at each turn.  
Pose changes triggered re-reconstruction, causing cumulative identity drift.  
By Turn 9, the model had silently dropped limb descriptions entirely.

-----

## Source

- [Original session log with images (PDF)](https://github.com/watadani-byte/character-identity-protocol/releases/download/v0.1/raw_log_01.pdf) — Japanese, full resolution

-----

## Contrast

See [Case 02: Wedding Series](../case_02_wedding_series/) for the same workflow  
**with anchor protocol applied** — 15 turns, 4 poses, identity maintained throughout.