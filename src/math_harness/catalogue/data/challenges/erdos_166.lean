import Mathlib

open Filter

namespace Erdos166

theorem erdos_166 :
    ∃ (c C : ℝ), 0 < c ∧ 0 < C ∧ ∀ᶠ (k : ℕ) in atTop, (SimpleGraph.classicalRamsey 4 k : ℝ) ≥ C * (k : ℝ) ^ 3 / (Real.log k) ^ c := by
  sorry

theorem erdos_166.variants.mattheus_verstraete_implies :
    type_of% erdos_166.variants.mattheus_verstraete → type_of% erdos_166 := by
  rintro ⟨C, hC, h⟩
  refine ⟨4, C, by norm_num, hC, h.mono fun k hk ↦ ?_⟩
  simpa using hk

end Erdos166
