import Mathlib

namespace Erdos212

theorem erdos_212_neg :
    ¬ (∃ u : Set ℂ, Dense u ∧ u.Pairwise fun c₁ c₂ => dist c₁ c₂ ∈ Set.range Rat.cast) := by
  sorry

end Erdos212
