import Mathlib

open scoped Topology

namespace Erdos242

theorem erdos_242.variants.schinzel_generalization (a : ℕ) (ha : 0 < a) :
    ∀ᶠ (n : ℕ) in Filter.atTop, ∃ x y z : ℕ, 1 ≤ x ∧ x < y ∧ y < z ∧ (a / n : ℚ) = 1 / x + 1 / y + 1 / z := by
  sorry

end Erdos242
