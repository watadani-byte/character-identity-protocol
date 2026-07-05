# FABLE5-DRIFT-CHECK-EXP-001 / Test 2 — Pose Transition Drift Review

**Experiment ID:** FABLE5-DRIFT-CHECK-EXP-001
**Test:** Test 2 — Pose Transition Drift Review
**Input package:** PAL-POSE-EXP-001_repaired.zip(修復版、プレチェック結果: WARNING — usable with explicit caveats)
**Review date:** 2026-07-05
**Reviewer role:** Pre-synthesis auxiliary reviewer(diagnostic-only)
**Note:** 本記録は補助的所見であり、final judgment ではない。最終判断は Human に留保される。

**セッション上の特記事項:** 本セッションでは Anchor / Step 1 / Step 4 の 3 画像は直接視認できたが、Step 2・Step 3 の画像は複数回試行(原本表示・縮小版再生成)してもレンダリングが得られず、ファイル健全性(PNG 整合・寸法検証)のみ確認できた。この 2 ステップの視覚所見は記録ベースに留め、その旨を各所に明示して評価している。

---

## Test Result

**PASS WITH WARNING — useful but with important limitations**

---

## Summary

PAL-POSE-EXP-001 の記録は、Identity Copy と Identity Recall の区別、Step 1 ベースラインとその後の stepwise carry-forward の区別、警告付き承認の保持、Human checkpoint の維持を一貫して示しており、補助的なポーズ遷移ドリフトレビューとして有用な信号を与える。

特に強い点:

1. Step 1 前の「男性キャラクターへの identity 非転写」という明確な失敗が REJECT として記録され、承認チェーンから明示的に排除されていること。
2. 各ステップの承認が「前ステップの承認状態を参照した」ことを明記していること(Reference used フィールド)。
3. Final Conclusion が Identity Recall の成功を明示的に否認していること。

視認できた 3 画像(Anchor / Step 1 / Step 4)の範囲では、identity 特徴の一貫性と scene containment が記録の主張と整合していた(これは Test 2 の新規観察)。警告は、(1) 画像出所の証拠限界、(2) 本セッションで Step 2–3 画像の視覚確認が完了しなかったこと、(3) 分類の正式採用が Human 未確定であること、の 3 点。

---

## A. Input Completeness and Provenance

- **Finding:** 必須 3 ファイルと画像 5 ファイルはすべて存在し、`Ancor_Image.jpeg` の綴りも保持されている。README の Image Asset Provenance セクションは GitHub 起源を主張せず、user-supplied archived assets であることを明記している。
- **Evidence from the input package:** プレチェック(WARNING)で確認済みの 8 ファイル構成と一致。result.md の Source / Image Notes は「"Ancor" が実際の保存ファイル名」であることを注記し、参照整合。
- **Provenance caveat:** The visual observations in this review are based on user-supplied archived image assets included in the repaired Test 2 package. Their exact original-generation-session provenance cannot be independently verified from the package alone.(本レビューの視覚所見はすべてこの限定の下にある。)
- **Warning:** 本セッションでは Step 2・Step 3 画像のレンダリングが得られず、視覚内容の独立確認は Anchor / Step 1 / Step 4 の 3 枚に限定された。Step 2–3 の視覚所見は記録および修復レポートの visual content check に依拠しており、coordinator レビューまたは再実行時に補完されるべき。

---

## B. Identity Copy vs Identity Recall

- **Finding:** 区別は明確かつ反復的に保持されている。混同や格上げの形跡はない。
- **Evidence from the input record:**
  - Recommended Result Classification 直下に「Identity Recall success を主張しない/compressed-prompt-alone recall success を主張しない」と明記。
  - Step 1 に「Identity Copy は Step 1 ベースライン作成でのみ使用」の Important clarification。
  - Final Conclusion と Recommended Repository Note の双方が「Steps 2–4 は原アンカーからの Identity Copy 再テストではなく stepwise approved-state carry-forward である」ことを限定として保持。
  - Scope Boundaries が Identity Recall degradation test を明示的に対象外としている。
- **Warning:** なし(この軸に関する記録上の欠陥は検出されなかった)。

---

## C. Pose Transition Drift Review

### Anchor / Baseline

- **Finding:** 【Test 2 視認済み】舞踏室・キャンドル・薔薇・グレーのスパンコールドレス・肩越しポーズという強いシーン情報を持つアンカーであり、result.md の Scene State Warning(「identity のみ採用、シーン状態は承認ソースではない」)が実画像と正確に対応している。Step 0 の APPROVE WITH WARNING(identity only 採用)は妥当な記録。
- **Warning:** アンカーは 3/4 後方視点・ドレス姿であり、以降のステップ(正面・全身・簡素衣装)との構図差が大きい。アンカー↔各ステップ間の細粒度の顔比較には視点差による限界がある(記録の限界ではなく比較条件の限界)。

### Step 1 — Baseline Continuity

- **Finding:** 【Test 2 視認済み】高いポニーテール・レイヤードバング・サイドロック・細い丸眼鏡・茶色の瞳・落ち着いた表情・細身の成人体型という identity 特徴がアンカーと一致し、背景は無地ニュートラル、衣装はキャミソール+ショーツに置換。記録の「identity のみ採用、シーン非継承、衣装置換は warning 付き承認」と完全に整合。Step 1 前の男性キャラクター生成の REJECT 記録(identity non-transfer)は、失敗を隠さず承認チェーンから明示的に排除した良好なドリフト記録の実例。
- **Warning:** 衣装置換自体が記録どおり warning 事項(YAML-FPL 承認ソース衣装ではない継続用衣装)。記録はこれを正しく限定しており、追加の警告はない。

### Step 2 — One-Hand-in-Pocket Pose

- **Finding:** 【記録ベース】Reference used: Step 1 approved baseline と明記。APPROVE WITH WARNING(ポケット内の手の指の正確性が遮蔽により検証不能、軽微なレンダリング仕上げドリフト)。遮蔽による「検証不能」を pass に格上げせず warning として記録している点は適切。
- **Warning:** 本セッションで画像の視覚確認が得られなかったため、記録された遮蔽・仕上げドリフトの程度は Test 2 として独立確認できていない。

### Step 3 — Legs-Crossed-at-Ankles Pose

- **Finding:** 【記録ベース】Reference used: Step 2 approved state。APPROVE WITH WARNING。「足首でのクロス」の指示に対し「脛寄りの高い位置でのクロス」という pose-precision deviation が明確に記録され、identity 失敗と区別されている(「pose-precision warning であり identity failure ではない」)。指示と出力の差分(B′ ≠ B の permitted-delta 精度側の不一致)を正確に分類した記録。
- **Warning:** 同上 — 視覚確認は本セッションで未完了。この deviation の視覚的程度の独立確認は持ち越し。

### Step 4 — Hand-on-Hip / Light Contrapposto Pose

- **Finding:** 【Test 2 視認済み】腰に手・軽いコントラポスト・同一衣装・ニュートラル背景を確認。identity 特徴(髪型・眼鏡・顔の印象・体型)は Step 1 と視覚的に一貫しており、記録の「mild fashion-model stance tendency はあるが light contrapposto の範囲内、hand-on-hip はやや簡略化」という warning 付き承認と整合。
- **Warning:** 記録どおりの軽微な様式化傾向(fashion-model stance)以外、視認範囲で新たな警告はない。

---

## D. Approved-State Carry-Forward

- **Finding:** 各承認状態が次ステップの参照になる構造が、設計(Record Format の Next Approved State / Carry Forward フィールド)と実記録の両方で保持されている。
- **Evidence from the input record:**
  - Step 2「Reference used: Step 1 approved baseline」、Step 3「Reference used: Step 2 approved state」、Step 4「Reference used: Step 3 approved state」。
  - Final Evaluation の approved state chain(anchor identity → Step 1 → 2 → 3 → 4)。
  - すべての warning は APPROVE WITH WARNING として承認と共存しており、warning が過去の承認を消していない。
  - rejected 出力は「承認チェーンの一部として扱ってはならない」と明記され carry-forward から排除。
- **Warning:** carry-forward の記録は判断テキストベースであり、各ステップで実際に参照された画像ファイルのハッシュ等による機械的トレーサビリティはない(この種の記録形式としては通常の範囲だが、証拠強度の限界として記す)。

---

## E. A′ Drift Risk Detection

### Observed drift

**記録に基づく観察(PAL-POSE-EXP-001 自身の記録):**

- Step 1 前の rejected 生成における **identity 非転写**(男性キャラクター化: 顔・性別表現・髪型・眼鏡・年齢印象・体型・衣装の全面ドリフト)。本実験で最も重大な観察済みドリフトであり、REJECT で処理済み。
- Step 1 での**衣装置換**(アンカー衣装 → キャミソール+ショーツ)。warning 付きで条件付き採用として封じ込め。
- Step 2 の**ポケット手の遮蔽**による指の検証不能+軽微なレンダリング仕上げドリフト。
- Step 3 の**ポーズ精度ドリフト**(足首指定 → 脛寄りクロス)。
- Steps 3–4 の **mild fashion-model stance tendency**、Step 4 の hand-on-hip 簡略化。

**Test 2 による新規観察(記録には含まれない):**

- **出力寸法偏差:** 生成 4 枚すべてが 1024x1535(アンカーは 1024x1536)。C(実行構造側)由来とみられる 1px の系統的偏差で、PAL-SEQ-EXP-001 の記録と同種。result.md には記載がないため、これは Test 2 の新規観察である。
- **視認 3 枚間の identity 一貫性:** Anchor / Step 1 / Step 4 の間で、記録が列挙する identity 要素(ポニーテール、バング、サイドロック、丸眼鏡、瞳色、顔の印象、体型)は視覚的に一貫しており、Step 1 → Step 4 間に顔・年齢・体型の可視的崩れは確認されなかった。これは新規の Test 2 観察であり、Step 2–3 を含む全チェーンの連続的確認ではない。

### Inferred drift risk

- **遮蔽による検証不能領域:** Step 2 の指のように、ポーズ自体が検証不能領域を生む。遮蔽部位のドリフトは承認チェーンを通過し得る構造的リスク。
- **様式化への引力:** Steps 3–4 の fashion-model stance tendency は、ポーズ指示がジャンル典型の立ち姿へ再解釈される C 側の傾向を示唆する。指示圧縮・再解釈リスクの一形態。
- **累積ドリフトの潜在:** 各ステップは直前状態との比較で承認されるため、ステップ毎には閾値未満の微小ドリフトが累積しても検出されにくい構造。視認 3 枚では顕著な累積は見えなかったが、Step 2–3 未視認のため連鎖全体としては未確定。
- **アーカイブ供給という出所限界:** 画像がオリジナル生成物と同一である保証がない以上、視覚所見に基づくあらゆる推論はこの前提リスクを含む。

### Not enough evidence

- **expression drift の細粒度評価:** 「落ち着いた表情」レベルの一致は視認できたが、微細な表情変化の系統評価は記録・画像とも材料不足。
- **Step 2–3 の視覚的ドリフトの有無:** 本セッションで画像確認が完了しなかったため、Test 2 として判断材料なし(記録上は warning 付き承認)。
- **prompt-only Identity Recall の成否:** 本実験の対象外であり、記録もそれを主張していない。判断不能かつ判断すべきでない。
- **オリジナル生成セッションとのファイル同一性:** パッケージ単独では検証不能(provenance caveat)。

---

## F. Mixed / Warning Handling

- **Finding:** 警告の保持は良好で、成功の誇張は見られない。
- **Evidence from the input record:**
  - 全 5 判断(Step 0–4)が APPROVE WITH WARNING であり、無条件 APPROVE への書き換えがない。
  - 分類文字列自体が warnings を内包(`successful_identity_copy_baseline_with_stepwise_pose_transition_warnings`)。
  - Pose Transition Assessment は「mostly successful with minor pose-specific warnings」と限定。
  - Identity Preservation Assessment の直後に「Identity Recall を証明しない」という Important limitation を併記。
  - Drift Observations セクションが観察済み deviation 6 件と「持続的重大失敗として観察されなかった項目」を分離して列挙。
- **Warning:** 分類は README / result.md で「Recommended」と表現される一方、manifest は `classification_pending: false`。正式採用(recommended → adopted)の確定は Human 判断項目として残る(プレチェックからの持ち越し)。

---

## G. Human Checkpoint Retention

- **Finding:** Human checkpoint は全決定点で保持されている。
- **Evidence from the input record:**
  - Record Format に Human Judgment フィールドが構造として組み込まれ、Step 0–4 すべてに Human Judgment が記録。
  - rejected 生成の排除も Human の REJECT 判断として記録。
  - Final Evaluation の summary は「human review の下での」carry-forward と明記し、result.md 末尾も「completed execution and human review」と記す。
  - 採用・分類の Fable 5 への委譲を示す記述はない。
- **Warning:** 重大な欠陥はない。上記 F の recommended / adopted 未確定のみ、Human の正式確定待ち事項として持ち越し。

---

## H. Boundary Compliance

| Boundary | Status | 根拠 |
|---|---|---|
| Fable 5 did not act as final authority | **preserved** | 本レビューは diagnostic-only の補助所見に留まり、記録側にも Fable 5 への権限付与はない |
| Human approval remains final | **preserved** | 全ステップの判断が Human Judgment として記録され、本レビューの結論も Human 承認前提 |
| C was not redefined | **preserved** | README / manifest / result.md の C 定義を不変のまま参照。result.md 自身も「No change to the definition of C is implied」と明記 |
| Canonical model was not replaced | **preserved** | `A → (A + C) → A′ → B′` / `≠ B` を維持 |
| CIP/PAL not described as directly controlling C or A′ | **preserved** | manifest の `cip_control_claim` と整合 |
| PAL-supported used instead of PAL-governed | **preserved** | パッケージ・本レビューとも PAL-governed の使用なし |
| No unverified general conclusion was drawn | **preserved** | 単一実験・単一キャラクター・4 遷移の記録に対する所見であり、一般的能力証明としていない |
| Image provenance caveat was preserved | **preserved** | セクション A の caveat 文言を本レビューの全視覚所見の前提として明示 |

---

## Limitations of This Review

- 視覚所見は user-supplied archived assets に基づき、オリジナル生成セッションとのファイル同一性はパッケージ単独では検証不能(provenance caveat)。
- 本セッションでは Step 2・Step 3 画像のレンダリングが技術的に得られず、視覚確認は 5 枚中 3 枚(Anchor / Step 1 / Step 4)に限定された。Step 2–3 の視覚所見は記録および修復レポートに依拠している。この確認は coordinator レビューまたは再セッションで補完されるべき。
- Anchor と各ステップの視点・構図差(後方 3/4 視点ドレス姿 vs 正面全身簡素衣装)により、アンカー基準の細粒度顔比較には構造的限界がある。
- Anchor → Step 4 の identity 一貫性所見および 1px 出力寸法偏差は **Test 2 による新規観察**であり、PAL-POSE-EXP-001 の記録済み所見ではない。
- 単一実験・単一キャラクターの小規模記録であり、Fable 5 の補助レビュー能力の一般的証明ではない。

---

## Recommended Next Action

**Proceed to evaluation coordinator review**

付帯事項(coordinator レビューへの持ち越し推奨・いずれも Human 判断または補完項目):

1. Step 2–3 画像の視覚確認の補完(再セッションまたは coordinator 側での確認)。
2. 分類の正式採用(recommended → adopted)の Human 確定。
3. 1px 出力寸法偏差(Test 2 新規観察)の記録への反映要否の Human 判断。

---

## Diagnostic Classification

```text
fable5_pass_with_warning_as_auxiliary_pose_transition_drift_risk_reviewer
```

---

## Final Reminder

本出力は diagnostic-only の補助レビュー所見であり、final judgment・final scoring・採用承認・リポジトリ反映判断のいずれも構成しない。Test 2 の最終評価、FABLE5-DRIFT-CHECK-EXP-001 側 result.md の確定、PAL-POSE-EXP-001 の分類の正式採用を含むすべての最終判断は、Human approval が最終権限として行う。

---

*This Test 2 review record is a PAL-supported auxiliary review output produced under the FABLE5-BOUNDARY-EXP-001 constraint (pre-synthesis auxiliary reviewer only). Visual observations are based on user-supplied archived image assets whose original-generation-session provenance cannot be independently verified from the package alone. Human approval remains the final authority.*
