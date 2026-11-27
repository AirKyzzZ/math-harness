import Mathlib

open Filter

namespace Erdos1099

noncomputable def h (α : ℝ) (n : ℕ) : ℝ :=
  ∑ i : Fin (n.divisors.card - 1),
    ((Nat.nth (· ∣ n) (i + 1) : ℝ) / Nat.nth (· ∣ n) i - 1) ^ α

theorem erdos_1099.variants.ratio_sum :
    ∃ C : ℝ, ∃ᶠ n : ℕ in atTop, ∑ i : Fin (n.divisors.card - 1), ((Nat.nth (· ∣ n) (i + 1) : ℝ) / Nat.nth (· ∣ n) i) - n.divisors.card - Real.log n ≤ C := by
  sorry

end Erdos1099
