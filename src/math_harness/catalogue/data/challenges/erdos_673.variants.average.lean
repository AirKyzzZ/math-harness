import Mathlib

open Filter Asymptotics Real

namespace Erdos673

noncomputable def G (n : ℕ) : ℝ :=
  ∑ i : Fin (n.divisors.card - 1), (Nat.nth (· ∣ n) i : ℝ) / Nat.nth (· ∣ n) (i + 1)

theorem erdos_673.variants.average :
    Tendsto (fun X : ℕ ↦ (∑ n ∈ Finset.Icc 1 X, G n) / X) atTop atTop := by
  sorry

end Erdos673
