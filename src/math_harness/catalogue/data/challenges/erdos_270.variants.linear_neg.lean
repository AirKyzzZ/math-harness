import Mathlib

open Filter

namespace Erdos270

noncomputable def series (f : ℕ → ℕ) : ℝ :=
  ∑' n : ℕ, (∏ i ∈ Finset.Icc (n + 2) (n + 1 + f (n + 1)), (i : ℝ))⁻¹

theorem erdos_270.variants.linear_neg :
    ¬ (Irrational (series id)) := by
  sorry

end Erdos270
