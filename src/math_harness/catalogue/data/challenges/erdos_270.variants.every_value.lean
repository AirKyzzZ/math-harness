import Mathlib

open Filter

namespace Erdos270

noncomputable def series (f : ℕ → ℕ) : ℝ :=
  ∑' n : ℕ, (∏ i ∈ Finset.Icc (n + 2) (n + 1 + f (n + 1)), (i : ℝ))⁻¹

theorem erdos_270.variants.every_value (α : ℝ) (hα : 0 < α) :
    ∃ f : ℕ → ℕ, Tendsto f atTop atTop ∧ HasSum (fun n : ℕ => (∏ i ∈ Finset.Icc (n + 2) (n + 1 + f (n + 1)), (i : ℝ))⁻¹) α := by
  sorry

end Erdos270
