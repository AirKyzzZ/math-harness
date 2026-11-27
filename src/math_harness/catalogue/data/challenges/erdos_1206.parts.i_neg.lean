import Mathlib

namespace Erdos1206

theorem erdos_1206.parts.i_neg :
    ¬ (∃ c : ℝ, 0 < c ∧ ∀ᶠ N in Filter.atTop, ∃ S : Finset ℕ, S ⊆ (Finset.Icc 1 N).image (fun n => n ^ 3) ∧ IsSidon (S : Set ℕ) ∧ c * (N : ℝ) ≤ (S.card : ℝ)) := by
  sorry

end Erdos1206
