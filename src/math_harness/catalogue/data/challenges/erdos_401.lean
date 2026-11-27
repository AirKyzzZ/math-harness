import Mathlib

open Filter

namespace Erdos401

theorem erdos_401 :
    ∃ f : ℕ → ℝ, Tendsto f atTop atTop ∧ ∀ (r : ℕ) (hr : 1 ≤ r), {n : ℕ | ∃ a₁ a₂ : ℕ, 0 < a₁ ∧ 0 < a₂ ∧ (a₁ : ℝ) + a₂ > n + f r * Real.log n ∧ a₁.factorial * a₂.factorial ∣ n.factorial * (∏ i ∈ Finset.range r, Nat.nth Nat.Prime i) ^ n}.Infinite := by
  sorry

end Erdos401
