import Mathlib

open Filter Asymptotics Real

namespace Erdos673

noncomputable def G (n : ℕ) : ℝ :=
  ∑ i : Fin (n.divisors.card - 1), (Nat.nth (· ∣ n) i : ℝ) / Nat.nth (· ∣ n) (i + 1)

theorem erdos_673.parts.i :
    ∀ C : ℝ, {n : ℕ | C < G n}.HasDensity 1 := by
  sorry

end Erdos673
