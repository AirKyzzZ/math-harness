import Mathlib

open Filter Asymptotics

namespace Erdos682

noncomputable abbrev p (n : ℕ) : ℕ := Nat.nth Nat.Prime n

theorem erdos_682.variants.exceptional_count :
    (fun X : ℕ ↦ ({n | p n ∈ Set.Icc X (2 * X) ∧ ∀ m ∈ Set.Ioo (p n) (p (n + 1)), m.minFac < p (n + 1) - p n}.ncard : ℝ)) =O[atTop] fun X : ℕ ↦ (X : ℝ) / Real.log X ^ 2 := by
  sorry

end Erdos682
