import Mathlib

open Filter Real Topology

namespace Erdos841

noncomputable def t (n : ℕ) : ℕ :=
  sInf {T | ∃ J ⊆ Finset.Icc 1 T, IsSquare (n * ∏ j ∈ J, (n + j))}

theorem erdos_841.variants.lower_bound :
    ∃ C : ℝ, 0 < C ∧ ∀ᶠ n : ℕ in atTop, ¬ IsSquare n → C * (log (log n) ^ ((6 : ℝ) / 5) * log (log (log n)) ^ (-(1 : ℝ) / 5)) ≤ t n := by
  sorry

end Erdos841
