import Mathlib

open Filter

namespace Erdos270

noncomputable def series (f : ℕ → ℕ) : ℝ :=
  ∑' n : ℕ, (∏ i ∈ Finset.Icc (n + 2) (n + 1 + f (n + 1)), (i : ℝ))⁻¹

theorem erdos_270_neg :
    ¬ (¬ ∀ f : ℕ → ℕ, Tendsto f atTop atTop → Irrational (series f)) := by
  sorry

end Erdos270
