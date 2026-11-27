import Mathlib

namespace Erdos389

theorem erdos_389_neg :
    ¬ (∀ n ≥ 1, ∃ k ≥ 1, ∏ i ∈ Finset.range k, (n + i) ∣ ∏ i ∈ Finset.range k, (n + k + i)) := by
  sorry

theorem erdos_389.variants.mehta_four :
    IsLeast
      { k | 1 ≤ k ∧ ∏ i ∈ Finset.range k, (4 + i) ∣ ∏ i ∈ Finset.range k, (4 + k + i) }
      207 := by
  refine ⟨⟨by norm_num, by native_decide⟩, ?_⟩
  intro k ⟨_, hdvd⟩
  by_contra! hlt
  interval_cases k <;> revert hdvd <;> native_decide

end Erdos389
