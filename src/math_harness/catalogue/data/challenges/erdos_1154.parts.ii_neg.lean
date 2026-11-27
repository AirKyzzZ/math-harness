import Mathlib

open scoped ENNReal Cardinal

open Set MeasureTheory

namespace Erdos1154

theorem erdos_1154.parts.ii_neg :
    ¬ (∀ a ∈ Icc (0 : ℝ≥0∞) 1, ∃ R : Subfield ℝ, dimH (R : Set ℝ) = a) := by
  sorry

theorem erdos_1154.variants.exists_subfield_dimH_eq_zero :
    ∃ R : Subfield ℝ, dimH (R : Set ℝ) = 0 := by
  refine ⟨⊥, Set.Countable.dimH_zero <| (countable_range ((↑) : ℚ → ℝ)).mono ?_⟩
  simpa using SetLike.coe_subset_coe.2 (bot_le : ⊥ ≤ (Rat.castHom ℝ).fieldRange)

theorem erdos_1154.variants.exists_subfield_dimH_eq_one :
    ∃ R : Subfield ℝ, dimH (R : Set ℝ) = 1 := by
  refine ⟨⊤, ?_⟩
  rw [Subfield.coe_top]
  exact Real.dimH_univ

end Erdos1154
