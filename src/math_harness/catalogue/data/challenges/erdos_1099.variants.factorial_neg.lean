import Mathlib

open Filter

namespace Erdos1099

noncomputable def h (α : ℝ) (n : ℕ) : ℝ :=
  ∑ i : Fin (n.divisors.card - 1),
    ((Nat.nth (· ∣ n) (i + 1) : ℝ) / Nat.nth (· ∣ n) i - 1) ^ α

theorem erdos_1099.variants.factorial_neg :
    ¬ (∀ α : ℝ, 1 < α → ∃ C : ℝ, ∀ n : ℕ, h α n.factorial ≤ C) := by
  sorry

end Erdos1099
