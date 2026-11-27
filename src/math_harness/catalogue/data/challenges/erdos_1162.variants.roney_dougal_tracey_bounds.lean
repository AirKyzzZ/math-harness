import Mathlib

open Filter Asymptotics

namespace Erdos1162

noncomputable def f (n : ℕ) : ℕ := Nat.card (Subgroup (Equiv.Perm (Fin n)))

theorem f_pos (n : ℕ) : 0 < f n := by
  unfold f
  exact Nat.card_pos

theorem erdos_1162.variants.roney_dougal_tracey_bounds :
    ∃ α > (0 : ℝ), ∃ β : ℝ, ∀ n : ℕ, 1 < n → (2 : ℝ) ^ ((n : ℝ) ^ 2 / 16 + α * n * Real.logb 2 n) ≤ f n ∧ (f n : ℝ) ≤ (2 : ℝ) ^ ((n : ℝ) ^ 2 / 16 + β * (n : ℝ) ^ ((3 : ℝ) / 2)) := by
  sorry

end Erdos1162
